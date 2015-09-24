package com.cater.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.google.common.collect.Sets;

/**
 * The Class MenuController.
 */
@Controller
@RequestMapping(value = { "menu" })
public class MenuController {
	/** The Constant logger. */
	private static final Logger logger = Logger.getLogger(MenuController.class);
	private static final String MENU_DELIMITER = "|";
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
	 * @param httpSession
	 *            the http session
	 * @param modelMap
	 *            the model map
	 * @param request
	 *            the request
	 * @param cuisine
	 *            the cuisine
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
		Event e = null;
		String customerCreatedMenuData = null;
		String customerCreatedMenuComments = null;
		if (user.isGuest()) {
			e = (Event) httpSession.getAttribute("event");
			//If the guest user selects the browser's back button to see the menu
			//show the selected items.
			Object m = httpSession.getAttribute("menu");
			if (m != null) {
				com.cater.model.Menu menuModel = (com.cater.model.Menu) m;
				customerCreatedMenuData = menuModel.getData();
				customerCreatedMenuComments = StringUtils.defaultString(
						StringUtils.trim(menuModel.getComments()), null);
			}
		}
		else {
			// First check the DB if a menu is selected earlier for this cuisine.
			e = customerService
					.findEventWithId(Helper.stringToInteger(eventId));
			List <com.cater.model.Menu> availableMenus = customerService
					.findMenusWithEventId(e.getId());
			if (CollectionUtils.isNotEmpty(availableMenus)) {
				// Get the quote for the cuisine.
				for (com.cater.model.Menu menuModel : availableMenus) {
					if (StringUtils.equalsIgnoreCase(cuisine,
							menuModel.getCuisineType())) {
						httpSession.setAttribute("menuId", menuModel.getId());
						customerCreatedMenuData = menuModel.getData();
						customerCreatedMenuComments = StringUtils
								.defaultString(StringUtils.trim(menuModel
										.getComments()), null);
						break;
					}
				}
			}
		}
		httpSession.setAttribute("eventName", e.getName());
		Menu menu = null;
		try {
			File f = new File(MenuController.class.getResource(
					"/menus/" + StringUtils.lowerCase(cuisine, Locale.US)
							+ ".json").getFile());
			menu = new MenuDeserializer().readJSON(f);
			modelMap.put("menu", menu);
			modelMap.put("categoryNames", getCategoriesList(menu));
			if (customerCreatedMenuData == null) {
				httpSession.setAttribute("menuId", null);
			}
			else {
				logger.debug("Customer already created menu for event "
						+ e.getName() + " of type " + cuisine);
				List <String> previouslySelectedMenuItemCodes = Lists
						.newArrayList(StringUtils.split(
								customerCreatedMenuData, MENU_DELIMITER));
				if ("PIZZA".equalsIgnoreCase(menu.getCuisine())) {
					Map <String, String> pizza_items = Maps.newLinkedHashMap();
					Map <String, Integer> pizzaTypes = Maps.newHashMap();
					modelMap.put("pizza_items", pizza_items);
					for (String item : previouslySelectedMenuItemCodes) {
						if (StringUtils.isNotBlank(item)) {
							String description = StringUtils.replace(
									StringUtils.substringAfter(item, "+"), "+",
									" ");
							String pizzaName = StringUtils.substringBefore(
									item, "+");
							int count = 0;
							if (pizzaTypes.containsKey(pizzaName)) {
								count = pizzaTypes.get(pizzaName);
								pizzaName = pizzaName + " #" + (count + 1);
							}
							pizzaTypes.put(pizzaName, count + 1);
							pizza_items.put(pizzaName, description);
						}
					}
				}
				else {
					for (String previouslySelectedItemCode : previouslySelectedMenuItemCodes) {
						for (MenuCategory cat : menu.getCategories()) {
							for (MenuItem menuItem : cat.getItems()) {
								if (StringUtils.equals(
										previouslySelectedItemCode,
										menuItem.getCode())) {
									menuItem.setSelected(true);
								}
							}
						}
					}
				}
				menu.setComments(customerCreatedMenuComments);
			}
		}
		catch (IOException ex) {
			logger.error("Failed to read menu.", ex);
		}
		if ("PIZZA".equalsIgnoreCase(cuisine)) {
			return "menus/t__cateringMenu_pizza";
		}
		return "menus/t__cateringMenu";
	}

	private List <String> getCategoriesList(Menu menu) {
		List <String> categoryNames = Lists.newArrayList();
		if (menu != null) {
			for (MenuCategory mc : menu.getCategories()) {
				categoryNames.add(mc.getName());
			}
		}
		return categoryNames;
	}

	/**
	 * Save menu.
	 *
	 * @param httpSession
	 *            the http session
	 * @param modelMap
	 *            the model map
	 * @param request
	 *            the request
	 * @param itemNames
	 *            the item names
	 * @param cuisine
	 *            the cuisine
	 * @return the string
	 */
	@RequestMapping(value = { "saveMenu" }, method = RequestMethod.POST)
	public String saveMenu(
			HttpSession httpSession,
			ModelMap modelMap,
			HttpServletRequest request,
			@RequestParam(value = "menu_item_codes", required = false) String itemCodesJson,
			@RequestParam(value = "pizza_menu_items", required = false) String pizzaItemsJson,
			@RequestParam(value = "cuisineType", required = true) String cuisine,
			@RequestParam(value = "comments") String comments) {
		User user = (User) httpSession.getAttribute("user");
		if (user == null) {
			return "t_home";
		}
		String eventId = (String) httpSession.getAttribute("eventId");
		modelMap.put("cuisineType", cuisine);
		try {
			StringBuilder stringBuilder = new StringBuilder();
			if (itemCodesJson != null) {
				List <String> itemCodes = new ObjectMapper().readValue(
						itemCodesJson, new TypeReference <List <String>>() {
						});
				for (String selectedItemCode : itemCodes) {
					stringBuilder.append(selectedItemCode).append(
							MENU_DELIMITER);
				}
			}
			else if (pizzaItemsJson != null) {
				List <String> pizzaItems = new ObjectMapper().readValue(
						pizzaItemsJson, new TypeReference <List <String>>() {
						});
				for (String selectedItemCode : pizzaItems) {
					stringBuilder.append(selectedItemCode).append(
							MENU_DELIMITER);
				}
			}
			String newData = stringBuilder.toString();
			Event e = null;
			if (user.isGuest()) {
				e = (Event) httpSession.getAttribute("event");
			}
			else {
				e = customerService.findEventWithId(Helper
						.stringToInteger(eventId));
			}
			// Create or update menu in database
			com.cater.model.Menu menuModel = null;
			Integer menuId = (Integer) httpSession.getAttribute("menuId");
			if (menuId != null) {
				menuModel = customerService.findMenuWithId(menuId);
			}
			if (menuModel == null) {
				menuModel = (com.cater.model.Menu) httpSession
						.getAttribute("menu");
			}
			if (menuModel == null) {
				menuModel = new com.cater.model.Menu();
			}
			menuModel.setEvent(e);
			logger.debug("New menu:" + newData);
			boolean isMenuChanged = !StringUtils.equalsIgnoreCase(newData,
					menuModel.getData());
			menuModel.setData(newData);
			menuModel.setCuisineType(cuisine);
			menuModel.setComments(comments);
			Set <Restaurant> restaurants = restaurantService
					.fetchRestaurantsOfType(cuisine);
			modelMap.put("restaurants", restaurants);
			modelMap.put("eventLocation", e.getLocation());
			Set <Integer> previouslySelectedRestaurants = Sets.newHashSet();
			if (user.isGuest()) {
				httpSession.setAttribute("menuId", 1);
				menuModel.setId(1);
			}
			else {
				customerService.saveOrUpdateMenu(menuModel);
				menuId = menuModel.getId();
				httpSession.setAttribute("menuId", menuId);
				for (Restaurant r : restaurants) {
					Quote quote = restaurantService
							.findQuoteWithRestaurantIdAndMenuId(r.getId(),
									menuId);
					if (quote != null) {
						previouslySelectedRestaurants.add(r.getId());
						if (isMenuChanged) {
							quote.setStatus(QuoteStatus.CUSTOMER_UPDATED_MENU
									.toString());
							restaurantService.saveOrUpdateQuote(quote);
							restaurantService.sendNotification(quote, null);
						}
					}
				}
			}
			httpSession.setAttribute("menu", menuModel);
			httpSession.setAttribute("cuisineType", cuisine);
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
	 * @param httpSession
	 *            the http session
	 * @param modelMap
	 *            the model map
	 * @param request
	 *            the request
	 * @param menuId
	 *            the menu id
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
			//String menuDataJsonFromDb = new String(
			//		Base64.decodeBase64(menuModel.getData()));
			//logger.debug(menuDataJsonFromDb);
			//Menu menu = new MenuDeserializer().readJSON(menuDataJsonFromDb);
			File f = new File(MenuController.class.getResource(
					"/menus/"
							+ StringUtils.lowerCase(menuModel.getCuisineType(),
									Locale.US) + ".json").getFile());
			Menu menu = new MenuDeserializer().readJSON(f);
			Menu newMenu = new Menu();
			newMenu.setCuisine(menu.getCuisine());
			if (menuModel != null && menu != null) {
				List <String> previouslySelectedMenuItemCodes = Lists
						.newArrayList(StringUtils.split(menuModel.getData(),
								MENU_DELIMITER));
				if ("PIZZA".equalsIgnoreCase(menu.getCuisine())) {
					Map <String, String> pizza_items = Maps.newLinkedHashMap();
					Map <String, Integer> pizzaTypes = Maps.newHashMap();
					modelMap.put("pizza_items", pizza_items);
					for (String item : previouslySelectedMenuItemCodes) {
						if (StringUtils.isNotBlank(item)) {
							String description = StringUtils.replace(
									StringUtils.substringAfter(item, "+"), "+",
									" ");
							String pizzaName = StringUtils.substringBefore(
									item, "+");
							int count = 0;
							if (pizzaTypes.containsKey(pizzaName)) {
								count = pizzaTypes.get(pizzaName);
								pizzaName = pizzaName + " #" + (count + 1);
							}
							pizzaTypes.put(pizzaName, count + 1);
							pizza_items.put(pizzaName, description);
						}
					}
				}
				else {
					List <MenuCategory> categories = Lists.newArrayList();
					for (MenuCategory mc : menu.getCategories()) {
						List <MenuItem> items = Lists.newArrayList();
						for (MenuItem menuItem : mc.getItems()) {
							if (previouslySelectedMenuItemCodes
									.contains(menuItem.getCode())) {
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
				}
				newMenu.setComments(menuModel.getComments());
				modelMap.put("menu", newMenu);
				Restaurant restaurant = restaurantService
						.findRestaurantWithLoginId(user.getLoginID());
				if (restaurant != null) {
					// If a restaurant is requesting to see the menu,
					// it can also see the price it quoted before.
					Quote quote = restaurantService
							.findQuoteWithRestaurantIdAndMenuId(
									restaurant.getId(), menuId);
					modelMap.put("quote", quote);
				}
				modelMap.put("event", menuModel.getEvent());
			}
		}
		catch (Exception ex) {
			logger.error(ex);
		}
		return "menus/t__cateringMenuReadOnly";
	}
}
