package com.cater.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
import com.fasterxml.jackson.core.JsonParseException;
import com.google.common.collect.Lists;
import com.google.common.collect.Sets;

@Controller
@RequestMapping(value = { "menu" })
public class MenuController {
	private static final Logger logger = Logger.getLogger(MenuController.class);
	@Autowired
	private CustomerService customerService;
	@Autowired
	private RestaurantService restaurantService;
	@Autowired
	private MenuSerializer menuSerializer;
	@Autowired
	private MenuDeserializer menuDeserializer;
	@Autowired
	private MenuDAO menuDAO;

	/**
	 * Select menu form.
	 *
	 * @param httpSession the http session
	 * @param modelMap the model map
	 * @param request the request
	 * @param cuisines the cuisines
	 * @return the string
	 */
	@RequestMapping(value = { "selectMenu" }, method = RequestMethod.POST)
	public String selectMenuForm(HttpSession httpSession, ModelMap modelMap,
			HttpServletRequest request,
			@RequestParam(value = "cuisine", required = true) String cuisine) {
		User user = (User) httpSession.getAttribute("user");
		if (user == null) {
			return "t_home";
		}
		String eventId = request.getParameter("eventId");
		httpSession.setAttribute("eventId", eventId);
		//First check the DB if a menu is selected earlier for this cuisine
		Event e = customerService.findEventWithId(Integer.valueOf(eventId));
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
			//TODO: Dynamically pull the menu after we start supporting more cuisines.
			//Temporarily hard coded to "indian" menu.
			try {
				File f = new File(MenuController.class.getResource(
						"/menus/indian.json").getFile());
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
	 * @return the string
	 */
	@RequestMapping(value = { "saveMenu" }, method = RequestMethod.POST)
	public String saveMenu(
			HttpSession httpSession,
			ModelMap modelMap,
			HttpServletRequest request,
			@RequestParam(value = "itemName", required = true) String[] itemNames) {
		User user = (User) httpSession.getAttribute("user");
		if (user == null) {
			return "t_home";
		}
		String cuisineType = request.getParameter("cuisine");
		String eventId = (String) httpSession.getAttribute("eventId");
		//TODO: Dynamically pull the menu after we start supporting more cuisines.
		//Temporarily hard coded to "indian" menu.
		try {
			String menuJson = "/menus/indian.json";
			if (StringUtils.equalsIgnoreCase("indian", cuisineType)) {
				menuJson = "/menus/indian.json";
			}
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
			Event e = customerService.findEventWithId(Integer.valueOf(eventId));
			//Create or update menu in database
			com.cater.model.Menu menuModel;
			Integer menuId = (Integer) httpSession.getAttribute("menuId");
			if (menuId != null) {
				menuModel = customerService.findMenuWithId(menuId);
			}
			else {
				menuModel = new com.cater.model.Menu();
			}
			menuModel.setEvent(e);
			String data = menuSerializer.serialize(menu);
			logger.debug("Json menu (" + data.length() + ") " + data);
			data = Base64.encodeBase64String(data.getBytes());
			logger.debug("Encoded Json menu (" + data.length() + ")" + data);
			menuModel.setData(data);
			menuModel.setCuisineType(cuisineType);
			customerService.saveOrUpdateMenu(menuModel);
			menuId = menuModel.getId();
			httpSession.setAttribute("menuId", menuId);
			Set <Restaurant> restaurants = restaurantService
					.fetchRestaurantsOfType(cuisineType);
			modelMap.put("restaurants", restaurants);
			Set <Integer> previouslySelectedRestaurants = Sets.newHashSet();
			for (Restaurant r : restaurants) {
				Quote q = restaurantService.findQuoteWithRestaurantIdAndMenuId(
						r.getId(), menuId);
				if (q != null) {
					previouslySelectedRestaurants.add(r.getId());
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
	 * Request quote.
	 *
	 * @param httpSession the http session
	 * @param modelMap the model map
	 * @param request the request
	 * @param rNames the r names
	 * @return the string
	 */
	@RequestMapping(value = { "requestQuote" }, method = RequestMethod.POST)
	public String requestQuote(
			HttpSession httpSession,
			ModelMap modelMap,
			HttpServletRequest request,
			@RequestParam(value = "restaurantId", required = true) String[] restaurantIds) {
		User user = (User) httpSession.getAttribute("user");
		if (user == null) {
			return "t_home";
		}
		com.cater.model.Menu menuModel = null;
		Integer menuId = (Integer) httpSession.getAttribute("menuId");
		if (menuId != null) {
			menuModel = customerService.findMenuWithId(menuId);
		}
		for (String restaurantId : restaurantIds) {
			//Find if a quote already exists.
			Quote q = restaurantService.findQuoteWithRestaurantIdAndMenuId(
					Integer.parseInt(restaurantId), menuId);
			if (q == null) {
				q = new Quote();
				q.setStatus(QuoteStatus.CREATED.toString());
				q.setMenu(menuModel);
				Restaurant restaurant = restaurantService
						.findRestaurantWithId(Integer.parseInt(restaurantId));
				q.setRestaurant(restaurant);
			}
			else {
				q.setStatus(QuoteStatus.UPDATED_MENU.toString());
			}
			restaurantService.saveOrUpdateQuote(q);
		}
		//TODO: Send emails to restaurants, requesting to submit quotes.
		String eventId = (String) httpSession.getAttribute("eventId");
		Event e = customerService.findEventWithId(Integer.valueOf(eventId));
		List <String> successMessages = Lists.newArrayList();
		successMessages
				.add("Your request for quotes is successfully submitted for '"
						+ e.getName() + "'.");
		modelMap.addAttribute("successMessages", successMessages);
		httpSession.removeAttribute("eventId");
		httpSession.removeAttribute("menuId");
		return "t_dashboardCustomer";
	}

	/**
	 * View.
	 *
	 * @param httpSession the http session
	 * @param modelMap the model map
	 * @param request the request
	 * @param menuId the menu id
	 * @return the string
	 * @throws IOException 
	 * @throws JsonParseException 
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
					modelMap.put("price", quote.getPrice());
				}
				httpSession.setAttribute("menuId", menuId);
			}
		}
		catch (Exception ex) {
			logger.error(ex);
		}
		return "menus/t__cateringMenuReadOnly";
	}
}
