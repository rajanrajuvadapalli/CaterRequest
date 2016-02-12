package com.cater.controller;

import static com.cater.menu.MenuHelper.MENU_DELIMITER;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cater.Helper;
import com.cater.dao.MenuDAO;
import com.cater.maps.MapsHelper;
import com.cater.maps.RestaurantDTO;
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
	/** The maps helper. */
	@Autowired
	private MapsHelper mapsHelper;

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
	public String selectMenuForm(
			HttpSession httpSession,
			ModelMap modelMap,
			HttpServletRequest request,
			@RequestParam(value = "cuisineType", required = true) String cuisine,
			RedirectAttributes redirectAttributes) {
		User user = (User) httpSession.getAttribute("user");
		if (user == null) {
			return "t_home";
		}
		String eventId = request.getParameter("eventId");
		httpSession.setAttribute("eventId", eventId);
		httpSession.setAttribute("cuisineType", cuisine);
		Event e = null;
		String customerCreatedMenuData = null;
		String customerCreatedMenuComments = null;
		com.cater.model.Menu customerCreatedMenuModel = null;
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
			//Reset before searching.
			httpSession.setAttribute("menuId", null);
			httpSession.setAttribute("menu", null);
			if (CollectionUtils.isNotEmpty(availableMenus)) {
				// Get the quote for the cuisine.
				for (com.cater.model.Menu menuModel : availableMenus) {
					if (StringUtils.equalsIgnoreCase(cuisine,
							menuModel.getCuisineType())) {
						httpSession.setAttribute("menuId", menuModel.getId());
						customerCreatedMenuModel = menuModel;
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
		if (customerCreatedMenuModel != null
				&& customerCreatedMenuModel.isFullMenu()) {
			return getFullMenuView(customerCreatedMenuModel, redirectAttributes);
		}
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
				else if ("MEXICAN".equalsIgnoreCase(menu.getCuisine())) {
					Map <String, String> mexican_items = Maps
							.newLinkedHashMap();
					modelMap.put("mexican_items", mexican_items);
					for (String item : previouslySelectedMenuItemCodes) {
						if (StringUtils.isNotBlank(item)) {
							String description = StringUtils.replace(
									StringUtils.substringAfter(item, "+"), "+",
									" ");
							String mexicanName = StringUtils.substringBefore(
									item, "+");
							mexican_items.put(mexicanName, description);
						}
					}
				}
				else if ("THAI".equalsIgnoreCase(menu.getCuisine())) {
					Map <String, String> thai_items = Maps.newLinkedHashMap();
					modelMap.put("thai_items", thai_items);
					for (String item : previouslySelectedMenuItemCodes) {
						if (StringUtils.isNotBlank(item)) {
							String description = StringUtils.replace(
									StringUtils.substringAfter(item, "+"), "+",
									" ");
							String thaiName = StringUtils.substringBefore(item,
									"+");
							thai_items.put(thaiName, description);
						}
					}
				}
				else if ("SANDWICH".equalsIgnoreCase(menu.getCuisine())) {
					Map <String, String> sandwich_items = Maps
							.newLinkedHashMap();
					modelMap.put("sandwich_items", sandwich_items);
					for (String item : previouslySelectedMenuItemCodes) {
						if (StringUtils.isNotBlank(item)) {
							String description = StringUtils.replace(
									StringUtils.substringAfter(item, "+"), "+",
									" ");
							String sandwichName = StringUtils.substringBefore(
									item, "+");
							sandwich_items.put(sandwichName, description);
						}
					}
				}
				else if ("MIDDLE_EASTERN".equalsIgnoreCase(menu.getCuisine())) {
					Map <String, String> middle_eastern_items = Maps
							.newLinkedHashMap();
					modelMap.put("middle_eastern_items", middle_eastern_items);
					for (String item : previouslySelectedMenuItemCodes) {
						if (StringUtils.isNotBlank(item)) {
							String description = StringUtils.replace(
									StringUtils.substringAfter(item, "+"), "+",
									" ");
							String name = StringUtils
									.substringBefore(item, "+");
							middle_eastern_items.put(name, description);
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
		if ("MEXICAN".equalsIgnoreCase(cuisine)) {
			return "menus/t__cateringMenu_mexican";
		}
		if ("THAI".equalsIgnoreCase(cuisine)) {
			return "menus/t__cateringMenu_thai";
		}
		if ("SANDWICH".equalsIgnoreCase(cuisine)) {
			return "menus/t__cateringMenu_sandwich";
		}
		if ("MIDDLE_EASTERN".equalsIgnoreCase(cuisine)) {
			return "menus/t__cateringMenu_middle_eastern";
		}
		return "menus/t__cateringMenu";
	}

	/**
	 * Gets the full menu view.
	 *
	 * @param customerCreatedMenuModel the customer created menu model
	 * @param redirectAttributes the redirect attributes
	 * @return the full menu view
	 */
	private String getFullMenuView(
			com.cater.model.Menu customerCreatedMenuModel,
			RedirectAttributes redirectAttributes) {
		//There will be only 1 quote for full menu flow
		Restaurant r = customerCreatedMenuModel.getQuotes().get(0)
				.getRestaurant();
		redirectAttributes.addAttribute("rName", r.getName());
		redirectAttributes.addAttribute("rId", r.getId());
		redirectAttributes.addAttribute("rZip", r.getAddress().getZip());
		redirectAttributes.addAttribute("menuId",
				customerCreatedMenuModel.getId());
		return "redirect:/menu/view/complete";
	}

	/**
	 * Gets the categories list.
	 *
	 * @param menu the menu
	 * @return the categories list
	 */
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
	 * @param httpSession            the http session
	 * @param modelMap            the model map
	 * @param request            the request
	 * @param itemCodesJson the item codes json
	 * @param pizzaItemsJson the pizza items json
	 * @param mexicanItemsJson the mexican items json
	 * @param thaiItemsJson the thai items json
	 * @param sandwichItemsJson the sandwich items json
	 * @param cuisine            the cuisine
	 * @param comments the comments
	 * @return the string
	 */
	@RequestMapping(value = { "saveMenu" }, method = RequestMethod.POST)
	public String saveMenu(
			HttpSession httpSession,
			ModelMap modelMap,
			HttpServletRequest request,
			RedirectAttributes redirectAttributes,
			@RequestParam(value = "menu_item_codes", required = false) String itemCodesJson,
			@RequestParam(value = "pizza_menu_items", required = false) String pizzaItemsJson,
			@RequestParam(value = "mexican_menu_items", required = false) String mexicanItemsJson,
			@RequestParam(value = "thai_menu_items", required = false) String thaiItemsJson,
			@RequestParam(value = "sandwich_menu_items", required = false) String sandwichItemsJson,
			@RequestParam(value = "middle_eastern_menu_items", required = false) String middleEasternItemsJson,
			@RequestParam(value = "full_menu_items", required = false) String fullmenuItemsJson,
			@RequestParam(value = "cuisineType", required = true) String cuisine,
			@RequestParam(value = "comments") String comments) {
		User user = (User) httpSession.getAttribute("user");
		if (user == null) {
			return "t_home";
		}
		String eventId = (String) httpSession.getAttribute("eventId");
		modelMap.put("cuisineType", cuisine);
		Boolean fmf = (Boolean) httpSession.getAttribute("full_menu_flow");
		Integer rId = null;
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
			else if (mexicanItemsJson != null) {
				List <String> mexicanItems = new ObjectMapper().readValue(
						mexicanItemsJson, new TypeReference <List <String>>() {
						});
				for (String selectedItemCode : mexicanItems) {
					stringBuilder.append(selectedItemCode).append(
							MENU_DELIMITER);
				}
			}
			else if (thaiItemsJson != null) {
				List <String> thaiItems = new ObjectMapper().readValue(
						thaiItemsJson, new TypeReference <List <String>>() {
						});
				for (String selectedItemCode : thaiItems) {
					stringBuilder.append(selectedItemCode).append(
							MENU_DELIMITER);
				}
			}
			else if (sandwichItemsJson != null) {
				List <String> sandwichItems = new ObjectMapper().readValue(
						sandwichItemsJson, new TypeReference <List <String>>() {
						});
				for (String selectedItemCode : sandwichItems) {
					stringBuilder.append(selectedItemCode).append(
							MENU_DELIMITER);
				}
			}
			else if (middleEasternItemsJson != null) {
				List <String> middleEasternItems = new ObjectMapper()
						.readValue(middleEasternItemsJson,
								new TypeReference <List <String>>() {
								});
				for (String selectedItemCode : middleEasternItems) {
					stringBuilder.append(selectedItemCode).append(
							MENU_DELIMITER);
				}
			}
			else if (fullmenuItemsJson != null) {
				List <String> items = new ObjectMapper().readValue(
						fullmenuItemsJson, new TypeReference <List <String>>() {
						});
				for (String selectedItemCode : items) {
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
			Set <Integer> previouslySelectedRestaurants = Sets.newHashSet();
			if (user.isGuest()) {
				httpSession.setAttribute("menuId", 1);
				menuModel.setId(1);
				if (Boolean.TRUE.equals(fmf)) {
					menuModel.setFullMenu(true);
				}
			}
			else {
				Set <Restaurant> restaurants = restaurantService
						.fetchRestaurantsOfTypePrimary(cuisine);
				customerService.saveOrUpdateMenu(menuModel);
				menuId = menuModel.getId();
				httpSession.setAttribute("menuId", menuId);
				for (Restaurant r : restaurants) {
					Quote quote = restaurantService
							.findQuoteWithRestaurantIdAndMenuId(r.getId(),
									menuId);
					rId = r.getId();
					if (quote != null) {
						previouslySelectedRestaurants.add(r.getId());
						if (isMenuChanged) {
							httpSession.setAttribute("isMenuChanged",
									isMenuChanged);
						}
					}
				}
				modelMap.put("prevR", previouslySelectedRestaurants);
				if (Boolean.FALSE.equals(fmf)) {
					com.cater.model.Address eventLocation = e.getLocation();
					modelMap.put("eventLocation", eventLocation);
					//modelMap.put("restaurants", restaurants);
					List <RestaurantDTO> nearByRestaurants = restaurantService
							.getNearbyYelpReviews(eventLocation, restaurants);
					if (CollectionUtils.isNotEmpty(nearByRestaurants)) {
						modelMap.put("restaurants", nearByRestaurants);
					}
				}
			}
			httpSession.setAttribute("menu", menuModel);
			httpSession.setAttribute("cuisineType", cuisine);
		}
		catch (IOException e) {
			logger.error(
					"Exception occurred while reading menu and saving quote.",
					e);
			return "t_500";
		}
		if (user.isGuest()) {
			//Send the user to create event page
			return "customer/t_createEvent";
		}
		else if (Boolean.TRUE.equals(fmf)) {
			redirectAttributes.addAttribute("rId", rId);
			return "redirect:/customer/event/requestQuote";
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
			File f = new File(MenuController.class.getResource(
					"/menus/"
							+ StringUtils.lowerCase(menuModel.getCuisineType(),
									Locale.US) + ".json").getFile());
			Menu baseMenu = new MenuDeserializer().readJSON(f);
			if (menuModel != null && baseMenu != null) {
				Menu newMenu = convertModelToMenu(menuModel, baseMenu, modelMap);
				modelMap.put("menu", newMenu);
				Restaurant restaurant = restaurantService
						.findRestaurantWithId(user.getRestaurantID());
				if (restaurant != null) {
					// If a restaurant is requesting to see the menu,
					// it can also see the price it quoted before.
					Quote quote = restaurantService
							.findQuoteWithRestaurantIdAndMenuId(
									restaurant.getId(), menuId);
					modelMap.put("quote", quote);
					//If a restaurant views a menu, we want to show the distance from the restaurant to the event location
					//so that the restaurant can better estimate the delivery.
					RestaurantDTO restaurantDTO = mapsHelper.getDistance(
							menuModel.getEvent().getLocation(), restaurant);
					modelMap.put("eventDistance", restaurantDTO.getDistance());
				}
				modelMap.put("event", menuModel.getEvent());
				//Set the deadline = menu's last updated time + 24 hrs
				Date lupd = menuModel.getUpdated();
				Calendar calendar = Calendar.getInstance(Locale.US);
				calendar.setTime(lupd);
				calendar.add(Calendar.HOUR, 24);
				logger.debug("LUPD+24=" + calendar.getTime());
				modelMap.put("lupdplus24", calendar.getTime());
			}
		}
		catch (Exception ex) {
			logger.error(ex);
		}
		return "menus/t__cateringMenuReadOnly";
	}

	/**
	 * View all menus.
	 *
	 * @param httpSession the http session
	 * @param modelMap the model map
	 * @param request the request
	 * @param eventId the event id
	 * @return the string
	 */
	@RequestMapping(value = { "view/all" }, method = RequestMethod.GET)
	public String viewAllMenus(HttpSession httpSession, ModelMap modelMap,
			HttpServletRequest request,
			@RequestParam(value = "eventId", required = true) Integer eventId) {
		User user = (User) httpSession.getAttribute("user");
		if (user == null) {
			return "t_home";
		}
		try {
			modelMap.put("event", customerService.findEventWithId(eventId));
			List <com.cater.model.Menu> menuModels = customerService
					.findMenusWithEventId(eventId);
			Map <String, Menu> menus = Maps.newTreeMap();
			if (CollectionUtils.isNotEmpty(menuModels)) {
				for (com.cater.model.Menu mm : menuModels) {
					File f = new File(MenuController.class.getResource(
							"/menus/"
									+ StringUtils.lowerCase(
											mm.getCuisineType(), Locale.US)
									+ ".json").getFile());
					Menu baseMenu = new MenuDeserializer().readJSON(f);
					Menu newMenu = convertModelToMenu(mm, baseMenu, modelMap);
					menus.put(mm.getCuisineType(), newMenu);
				}
			}
			modelMap.addAttribute("menus", menus.values());
			List <Quote> quotes = restaurantService
					.findQuotesWithEventId(eventId);
			Map <String, List <Quote>> groupedQuotes = groupQuotesPerCuisine(quotes);
			modelMap.addAttribute("groupedQuotes", groupedQuotes);
		}
		catch (Exception ex) {
			logger.error(ex);
		}
		return "event/t_eventDetails";
	}

	/**
	 * View complete menu.
	 *
	 * @param httpSession the http session
	 * @param modelMap the model map
	 * @param request the request
	 * @param menuId the menu id
	 * @param restaurantName the restaurant name
	 * @param restaurantZipCode the restaurant zip code
	 * @return the string
	 */
	@RequestMapping(value = { "view/complete" }, method = RequestMethod.GET)
	public String viewCompleteMenu(HttpSession httpSession, ModelMap modelMap,
			HttpServletRequest request,
			@RequestParam("rName") String restaurantName,
			@RequestParam("rId") String restaurantId,
			@RequestParam("rZip") String restaurantZipCode,
			@RequestParam(value = "menuId", required = false) Integer menuId) {
		User user = (User) httpSession.getAttribute("user");
		if (user == null) {
			return "t_home";
		}
		List <String> keys = Lists.newArrayList(StringUtils.split(
				restaurantName, " "));
		keys.add(restaurantZipCode);
		String fileName = StringUtils.join(keys, "_");
		try {
			File f = new File(MenuController.class.getResource(
					"/menus/full/" + fileName + ".json").getFile());
			Menu baseMenu = new MenuDeserializer().readJSON(f);
			modelMap.put("menu", baseMenu);
		}
		catch (Exception ex) {
			logger.error(ex);
		}
		httpSession.setAttribute("full_menu_flow", true);
		httpSession.setAttribute("full_menu_flow_rname", restaurantName);
		httpSession.setAttribute("full_menu_flow_rid",
				Helper.stringToInt(restaurantId));
		//If the menu ID is present, the load the menu items
		if (menuId != null) {
			Map <String, String> items = Maps.newLinkedHashMap();
			modelMap.put("items", items);
			com.cater.model.Menu menuModel = customerService
					.findMenuWithId(menuId);
			List <String> previouslySelectedMenuItemCodes = Lists
					.newArrayList(StringUtils.split(menuModel.getData(),
							MENU_DELIMITER));
			for (String item : previouslySelectedMenuItemCodes) {
				if (StringUtils.isNotBlank(item)) {
					String description = StringUtils.replace(
							StringUtils.substringAfter(item, "+"), "+", " ");
					String name = StringUtils.substringBefore(item, "+");
					items.put(name, description);
				}
			}
		}
		return "menus/full/t_" + fileName;
	}

	/**
	 * Group quotes per cuisine.
	 *
	 * @param quotes the quotes
	 * @return the map
	 */
	private Map <String, List <Quote>> groupQuotesPerCuisine(List <Quote> quotes) {
		Map <String, List <Quote>> groupedQuotes = Maps.newTreeMap();
		for (Quote q : quotes) {
			com.cater.model.Menu m = q.getMenu();
			if (m != null) {
				String cuisine = m.getCuisineType();
				List <Quote> q2 = groupedQuotes.get(cuisine);
				if (q2 == null) {
					q2 = Lists.newArrayList();
					groupedQuotes.put(cuisine, q2);
				}
				q2.add(q);
			}
		}
		return groupedQuotes;
	}

	/**
	 * Convert model to menu.
	 *
	 * @param menuModel the menu model
	 * @param baseMenu the base menu
	 * @param modelMap the model map
	 * @return the menu
	 */
	private Menu convertModelToMenu(com.cater.model.Menu menuModel,
			Menu baseMenu, ModelMap modelMap) {
		Menu newMenu = new Menu();
		newMenu.setCuisine(baseMenu.getCuisine());
		List <String> previouslySelectedMenuItemCodes = Lists
				.newArrayList(StringUtils.split(menuModel.getData(),
						MENU_DELIMITER));
		if ("PIZZA".equalsIgnoreCase(baseMenu.getCuisine())) {
			Map <String, String> pizza_items = Maps.newLinkedHashMap();
			Map <String, Integer> pizzaTypes = Maps.newHashMap();
			modelMap.put("pizza_items", pizza_items);
			for (String item : previouslySelectedMenuItemCodes) {
				if (StringUtils.isNotBlank(item)) {
					String description = StringUtils.replace(
							StringUtils.substringAfter(item, "+"), "+", " ");
					String pizzaName = StringUtils.substringBefore(item, "+");
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
		else if ("MEXICAN".equalsIgnoreCase(baseMenu.getCuisine())) {
			Map <String, String> mexican_items = Maps.newLinkedHashMap();
			modelMap.put("mexican_items", mexican_items);
			for (String item : previouslySelectedMenuItemCodes) {
				if (StringUtils.isNotBlank(item)) {
					String description = StringUtils.replace(
							StringUtils.substringAfter(item, "+"), "+", " ");
					String mexicanName = StringUtils.substringBefore(item, "+");
					mexican_items.put(mexicanName, description);
				}
			}
		}
		else if ("THAI".equalsIgnoreCase(baseMenu.getCuisine())) {
			Map <String, String> thai_items = Maps.newLinkedHashMap();
			modelMap.put("thai_items", thai_items);
			for (String item : previouslySelectedMenuItemCodes) {
				if (StringUtils.isNotBlank(item)) {
					String description = StringUtils.replace(
							StringUtils.substringAfter(item, "+"), "+", " ");
					String thaiName = StringUtils.substringBefore(item, "+");
					thai_items.put(thaiName, description);
				}
			}
		}
		else if ("SANDWICH".equalsIgnoreCase(baseMenu.getCuisine())) {
			Map <String, String> sandwich_items = Maps.newLinkedHashMap();
			modelMap.put("sandwich_items", sandwich_items);
			for (String item : previouslySelectedMenuItemCodes) {
				if (StringUtils.isNotBlank(item)) {
					String description = StringUtils.replace(
							StringUtils.substringAfter(item, "+"), "+", " ");
					String sandwichName = StringUtils
							.substringBefore(item, "+");
					sandwich_items.put(sandwichName, description);
				}
			}
		}
		else if ("MIDDLE_EASTERN".equalsIgnoreCase(baseMenu.getCuisine())) {
			Map <String, String> middle_eastern_items = Maps.newLinkedHashMap();
			modelMap.put("middle_eastern_items", middle_eastern_items);
			for (String item : previouslySelectedMenuItemCodes) {
				if (StringUtils.isNotBlank(item)) {
					String description = StringUtils.replace(
							StringUtils.substringAfter(item, "+"), "+", " ");
					String name = StringUtils.substringBefore(item, "+");
					middle_eastern_items.put(name, description);
				}
			}
		}
		else {
			List <MenuCategory> categories = Lists.newArrayList();
			for (MenuCategory mc : baseMenu.getCategories()) {
				List <MenuItem> items = Lists.newArrayList();
				for (MenuItem menuItem : mc.getItems()) {
					if (previouslySelectedMenuItemCodes.contains(menuItem
							.getCode())) {
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
		return newMenu;
	}
}
