package com.cater.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cater.Helper;
import com.cater.constants.QuoteStatus;
import com.cater.dao.MenuDAO;
import com.cater.menu.Menu;
import com.cater.menu.MenuCategory;
import com.cater.menu.MenuDeserializer;
import com.cater.menu.MenuItem;
import com.cater.menu.MenuSerializer;
import com.cater.model.Event;
import com.cater.model.Quote;
import com.cater.model.Restaurant;
import com.cater.service.CustomerService;
import com.cater.service.RestaurantService;
import com.cater.ui.data.User;
import com.google.common.collect.Lists;
import com.google.common.collect.Sets;

/**
 * The Class MenuController.
 */
@Controller
@RequestMapping(value = { "menu" })
public class MenuController {
	/** The Constant logger. */
	private static final Logger logger = Logger.getLogger(MenuController.class);
	/** The customer service. */
	@Autowired
	private CustomerService customerService;
	/** The restaurant service. */
	@Autowired
	private RestaurantService restaurantService;
	/** The menu serializer. */
	@Autowired
	private MenuSerializer menuSerializer;
	/** The menu deserializer. */
	@Autowired
	private MenuDeserializer menuDeserializer;
	/** The menu dao. */
	@Autowired
	private MenuDAO menuDAO;

	/**
	 * Select menu form.
	 *
	 * @param httpSession the http session
	 * @param modelMap the model map
	 * @param request the request
	 * @param cuisine the cuisine
	 * @return the string
	 */
	@RequestMapping(value = { "selectMenu" }, method = RequestMethod.GET)
	public String selectMenuForm(HttpSession httpSession, ModelMap modelMap,
			HttpServletRequest request,
			@RequestParam(value = "cuisineType", required = true) String cuisine) {
		User user = (User) httpSession.getAttribute("user");
		if (user == null) {
			return "t_home";
		}
		String eventId = request.getParameter("eventId");
		httpSession.setAttribute("eventId", eventId);
		//First check the DB if a menu is selected earlier for this cuisine
		Event e = customerService.findEventWithId(Helper
				.stringToInteger(eventId));
		httpSession.setAttribute("eventName", e.getName());
		List <com.cater.model.Menu> availableMenus = customerService
				.findMenusWithEventId(e.getId());
		String customerCreatedMenuData = null;
		if (CollectionUtils.isNotEmpty(availableMenus)) {
			//Get the quote for the cuisine.
			for (com.cater.model.Menu menuModel : availableMenus) {
				if (StringUtils.equalsIgnoreCase(cuisine,
						menuModel.getCuisineType())) {
					httpSession.setAttribute("menuId", menuModel.getId());
					customerCreatedMenuData = menuModel.getData();
					break;
				}
			}
		}
		if (customerCreatedMenuData == null) {
			httpSession.setAttribute("menuId", null);
			try {
				File f = new File(MenuController.class.getResource(
						"/menus/" + StringUtils.lowerCase(cuisine, Locale.US)
								+ ".json").getFile());
				Menu menu = new MenuDeserializer().readJSON(f);
				modelMap.put("menu", menu);
			}
			catch (IOException ex) {
				logger.error("Failed to read indian menu.", ex);
			}
		}
		else {
			logger.debug("Customer already created menu for event "
					+ e.getName() + " of type " + cuisine);
			try {
				String menuJson = new String(
						Base64.decodeBase64(customerCreatedMenuData));
				Menu menu = menuDeserializer.readJSON(menuJson);
				modelMap.put("menu", menu);
			}
			catch (IOException ex) {
				logger.error("Failed to read indian menu.", ex);
			}
		}
		return "menus/t__cateringMenu";
	}

	/**
	 * Save menu.
	 *
	 * @param httpSession the http session
	 * @param modelMap the model map
	 * @param request the request
	 * @param itemNames the item names
	 * @param cuisine the cuisine
	 * @return the string
	 */
	@RequestMapping(value = { "saveMenu" }, method = RequestMethod.POST)
	public String saveMenu(
			HttpSession httpSession,
			ModelMap modelMap,
			HttpServletRequest request,
			@RequestParam(value = "itemName", required = true) String[] itemNames,
			@RequestParam(value = "cuisineType", required = true) String cuisine) {
		User user = (User) httpSession.getAttribute("user");
		if (user == null) {
			return "t_home";
		}
		String eventId = (String) httpSession.getAttribute("eventId");
		modelMap.put("cuisineType", cuisine);
		try {
			String menuJson = "/menus/"
					+ StringUtils.lowerCase(cuisine, Locale.US) + ".json";
			File f = new File(MenuController.class.getResource(menuJson)
					.getFile());
			Menu menu = new MenuDeserializer().readJSON(f);
			for (String selectedItem : itemNames) {
				logger.debug("Selected item: " + selectedItem);
				for (MenuCategory cat : menu.getCategories()) {
					for (MenuItem menuItem : cat.getItems()) {
						if (StringUtils
								.equals(selectedItem, menuItem.getName())) {
							menuItem.setSelected(true);
						}
					}
				}
			}
			Event e = customerService.findEventWithId(Helper
					.stringToInteger(eventId));
			//Create or update menu in database
			com.cater.model.Menu menuModel;
			Integer menuId = (Integer) httpSession.getAttribute("menuId");
			if (menuId == null) {
				menuModel = new com.cater.model.Menu();
			}
			else {
				menuModel = customerService.findMenuWithId(menuId);
			}
			menuModel.setEvent(e);
			String data = menuSerializer.serialize(menu);
			logger.debug("Json menu (" + data.length() + ") ");
			logger.debug(data);
			data = Base64.encodeBase64String(data.getBytes());
			logger.debug("Encoded Json menu (" + data.length() + ")");
			logger.debug(data);
			boolean isMenuChanged = !StringUtils.equalsIgnoreCase(data,
					menuModel.getData());
			menuModel.setData(data);
			menuModel.setCuisineType(cuisine);
			customerService.saveOrUpdateMenu(menuModel);
			menuId = menuModel.getId();
			httpSession.setAttribute("menuId", menuId);
			Set <Restaurant> restaurants = restaurantService
					.fetchRestaurantsOfType(cuisine);
			modelMap.put("restaurants", restaurants);
			Set <Integer> previouslySelectedRestaurants = Sets.newHashSet();
			for (Restaurant r : restaurants) {
				Quote quote = restaurantService
						.findQuoteWithRestaurantIdAndMenuId(r.getId(), menuId);
				if (quote != null) {
					previouslySelectedRestaurants.add(r.getId());
					if (isMenuChanged) {
						quote.setStatus(QuoteStatus.CUSTOMER_UPDATED_MENU
								.toString());
						restaurantService.saveOrUpdateQuote(quote);
						restaurantService.sendNotification(quote);
					}
				}
			}
			modelMap.put("prevR", previouslySelectedRestaurants);
		}
		catch (IOException e) {
			logger.error(
					"Exception occurred while reading menu and saving quote.",
					e);
			return "t_500";
		}
		return "menus/t__cateringRestaurants";
	}

	/**
	 * View.
	 *
	 * @param httpSession the http session
	 * @param modelMap the model map
	 * @param request the request
	 * @param menuId the menu id
	 * @return the string
	 */
	@RequestMapping(value = { "view/{menuId}" }, method = RequestMethod.GET)
	public String view(HttpSession httpSession, ModelMap modelMap,
			HttpServletRequest request, @PathVariable Integer menuId) {
		User user = (User) httpSession.getAttribute("user");
		if (user == null) {
			return "t_home";
		}
		try {
			com.cater.model.Menu menuModel = menuDAO.findById(menuId);
			String menuDataJsonFromDb = new String(
					Base64.decodeBase64(menuModel.getData()));
			logger.debug(menuDataJsonFromDb);
			Menu menu = new MenuDeserializer().readJSON(menuDataJsonFromDb);
			Menu newMenu = new Menu();
			newMenu.setCuisine(menu.getCuisine());
			if (menu != null) {
				List <MenuCategory> categories = Lists.newArrayList();
				for (MenuCategory mc : menu.getCategories()) {
					List <MenuItem> items = Lists.newArrayList();
					for (MenuItem menuItem : mc.getItems()) {
						if (menuItem.isSelected()) {
							items.add(menuItem);
						}
					}
					if (CollectionUtils.isNotEmpty(items)) {
						MenuCategory newMenuCategory = new MenuCategory();
						newMenuCategory.setItems(items);
						newMenuCategory.setName(mc.getName());
						categories.add(newMenuCategory);
					}
				}
				newMenu.setCategories(categories);
				modelMap.put("menu", newMenu);
				Restaurant restaurant = restaurantService
						.findRestaurantWithLoginId(user.getLoginID());
				if (restaurant != null) {
					//If a restaurant is requesting to see the menu, 
					//it can also see the price it quoted before.
					Quote quote = restaurantService
							.findQuoteWithRestaurantIdAndMenuId(
									restaurant.getId(), menuId);
					modelMap.put("quote", quote);
				}
				modelMap.put("eventName", menuModel.getEvent().getName());
			}
		}
		catch (Exception ex) {
			logger.error(ex);
		}
		return "menus/t__cateringMenuReadOnly";
	}
}
