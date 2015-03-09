package com.cater.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cater.Helper;
import com.cater.constants.QuoteStatus;
import com.cater.model.Address;
import com.cater.model.Customer;
import com.cater.model.Event;
import com.cater.model.Menu;
import com.cater.model.Quote;
import com.cater.model.Restaurant;
import com.cater.service.CustomerService;
import com.cater.service.RestaurantService;
import com.cater.ui.data.User;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

/**
 * The Class CustomerDashboardController.
 */
@Controller
@RequestMapping(value = { "customer" })
public class CustomerDashboardController {
	private static final Logger logger = Logger
			.getLogger(CustomerDashboardController.class);
	private static final SimpleDateFormat SDF = new SimpleDateFormat(
			"MM/dd/yyyy HH:mm", Locale.US);
	private static final Pattern NUMERIC = Pattern.compile("[0-9]+");
	@Autowired
	private CustomerService customerService;
	@Autowired
	private RestaurantService restaurantService;

	/**
	 * List events.
	 *
	 * @param httpSession the http session
	 * @return the list
	 */
	/*@RequestMapping(value = { "listEvents" }, method = RequestMethod.GET)
	public String listEvents(HttpSession httpSession, ModelMap modelMap) {
		User user = (User) httpSession.getAttribute("user");
		if (user != null) {
			Customer c = customerService.findCustomerWithLoginId(user
					.getLoginID());
			if (c != null) {
				modelMap.addAttribute("events", c.getEvents());
			}
		}
		return "notiles/_eventsList";
	}*/
	@RequestMapping(value = { "dashboard" })
	public String getDashboard(ModelMap modelMap, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "t_home";
		}
		Customer customer = customerService.findCustomerWithLoginId(user
				.getLoginID());
		modelMap.put("customer", customer);
		List <Event> events = customer.getEvents();
		modelMap.put("events", events);
		Map <Integer, List <String>> e2m = Maps.newHashMap();
		Map <Integer, List <Quote>> e2q = Maps.newHashMap();
		for (Event e : events) {
			List <Menu> menus = customerService.findMenusWithEventId(e.getId());
			List <String> selectedCusines = Lists.newLinkedList();
			if (CollectionUtils.isNotEmpty(menus)) {
				for (Menu m : menus) {
					selectedCusines.add(m.getCuisineType());
				}
			}
			e2m.put(e.getId(), selectedCusines);
			List <Quote> quotes = restaurantService.findQuotesWithEventId(e
					.getId());
			e2q.put(e.getId(), quotes);
		}
		modelMap.put("e2m", e2m);
		modelMap.put("e2q", e2q);
		((User) session.getAttribute("user")).setName(customer.getName());
		return "customer/t_dashboard";
	}

	/**
	 * Gets the creates the event form.
	 *
	 * @return the creates the event form
	 */
	@RequestMapping(value = { "createEvent" }, method = RequestMethod.GET)
	public String getCreateEventForm() {
		return "customer/t_createEvent";
	}

	/**
	 * Creates the event.
	 *
	 * @param httpSession the http session
	 * @param modelMap the model map
	 * @param request the request
	 * @return the string
	 */
	@RequestMapping(value = { "createEvent" }, method = RequestMethod.POST)
	public String createEvent(HttpSession httpSession, ModelMap modelMap,
			HttpServletRequest request) {
		User user = (User) httpSession.getAttribute("user");
		if (user == null) {
			return "t_home";
		}
		Customer c = customerService.findCustomerWithLoginId(user.getLoginID());
		logger.debug("Creating event for " + c.getName());
		Event e = new Event();
		e.setName(StringUtils.defaultString(request.getParameter("name")));
		Address a = new Address();
		a.setStreet1(StringUtils.defaultString(request.getParameter("street1")));
		a.setStreet2(StringUtils.defaultString(request.getParameter("street2")));
		a.setCity(StringUtils.defaultString(request.getParameter("city")));
		a.setState(StringUtils.defaultString(request.getParameter("state")));
		a.setZip(StringUtils.defaultString(request.getParameter("zip")));
		e.setLocation(a);
		Date dateTime;
		try {
			synchronized (this) {
				dateTime = SDF.parse(StringUtils.defaultString(request
						.getParameter("datetimepicker")));
				e.setDate_time(dateTime);
			}
		}
		catch (ParseException e1) {
			logger.error(e1);
		}
		e.setCustomer(c);
		String personCountParameter = request.getParameter("person_count");
		if (StringUtils.isNotBlank(personCountParameter)
				&& NUMERIC.matcher(personCountParameter).matches()) {
			e.setPersonCount(Integer.parseInt(personCountParameter));
		}
		String budgetTotalParameter = request.getParameter("budget_total");
		if (StringUtils.isNotBlank(budgetTotalParameter)
				&& NUMERIC.matcher(budgetTotalParameter).matches()) {
			e.setBudgetTotal(Integer.parseInt(budgetTotalParameter));
		}
		customerService.saveOrUpdateEvent(e);
		return "redirect:/customer/dashboard";
	}

	/**
	 * Select restaurant.
	 *
	 * @param httpSession the http session
	 * @param modelMap the model map
	 * @param request the request
	 * @return the string
	 */
	/*@RequestMapping(value = { "event/selectRestaurant" }, method = RequestMethod.POST)
	public String selectRestaurant(HttpSession httpSession, ModelMap modelMap,
			HttpServletRequest request) {
		User user = (User) httpSession.getAttribute("user");
		if (user == null) {
			return "t_home";
		}
		String cuisine = request.getParameter("cuisine");
		httpSession.setAttribute("cuisine", cuisine);
		String eventId = request.getParameter("eventId");
		httpSession.setAttribute("eventId", eventId);
		//First check the DB if a menu is selected earlier for this cuisine
		Event e = customerService.findEventWithId(Integer.valueOf(eventId));
		List <com.cater.model.Menu> availableMenus = customerService
				.findMenusWithEventId(e.getId());
		com.cater.model.Menu existingMenu = null;
		if (CollectionUtils.isNotEmpty(availableMenus)) {
			//Get the quote for the cuisine.
			for (com.cater.model.Menu menuModel : availableMenus) {
				if (StringUtils.equalsIgnoreCase(cuisine,
						menuModel.getCuisineType())) {
					httpSession.setAttribute("menuId", menuModel.getId());
					existingMenu = menuModel;
					break;
				}
			}
		}
		if (existingMenu == null) {
			existingMenu = new com.cater.model.Menu();
			existingMenu.setCuisineType(cuisine);
			existingMenu.setEvent(e);
			customerService.saveOrUpdateMenu(existingMenu);
		}
		httpSession.setAttribute("menuId", existingMenu.getId());
		Set <Restaurant> restaurants = restaurantService
				.fetchRestaurantsOfType(cuisine);
		modelMap.put("restaurants", restaurants);
		Set <Integer> previouslySelectedRestaurants = Sets.newHashSet();
		for (Restaurant r : restaurants) {
			Quote q = restaurantService.findQuoteWithRestaurantIdAndMenuId(
					r.getId(), existingMenu.getId());
			if (q != null) {
				previouslySelectedRestaurants.add(r.getId());
			}
		}
		modelMap.put("prevR", previouslySelectedRestaurants);
		return "menus/t__cateringRestaurants";
	}*/
	/**
	 * Request quote.
	 *
	 * @param httpSession the http session
	 * @param modelMap the model map
	 * @param request the request
	 * @param restaurantIds the restaurant ids
	 * @return the string
	 */
	@RequestMapping(value = { "event/requestQuote" }, method = RequestMethod.POST)
	public String requestQuote(
			HttpSession httpSession,
			ModelMap modelMap,
			HttpServletRequest request,
			@RequestParam(value = "restaurantId", required = true) String[] restaurantIds,
			RedirectAttributes redirectAttributes) {
		User user = (User) httpSession.getAttribute("user");
		if (user == null) {
			return "t_home";
		}
		com.cater.model.Menu menuModel = null;
		Integer menuId = (Integer) httpSession.getAttribute("menuId");
		if (menuId != null) {
			menuModel = customerService.findMenuWithId(menuId);
		}
		List <String> selectedRestaurantNames = Lists.newArrayList();
		for (String restaurantId : restaurantIds) {
			//Find if a quote already exists.
			Quote q = restaurantService.findQuoteWithRestaurantIdAndMenuId(
					Helper.stringToInteger(restaurantId), menuId);
			Restaurant restaurant = restaurantService
					.findRestaurantWithId(Helper.stringToInteger(restaurantId));
			selectedRestaurantNames.add(restaurant.getName());
			if (q == null) {
				q = new Quote();
				q.setStatus(QuoteStatus.CREATED.toString());
				q.setMenu(menuModel);
				q.setRestaurant(restaurant);
				restaurantService.saveOrUpdateQuote(q);
			}
		}
		//TODO: Send emails to restaurants, requesting to submit quotes.
		String eventName = (String) httpSession.getAttribute("eventName");
		List <String> successMessages = Lists.newArrayList();
		successMessages
				.add("Your request for quotes is successfully submitted for '"
						+ eventName + "'.");
		successMessages.add("To restaurant(s): "
				+ StringUtils.join(selectedRestaurantNames, ", "));
		redirectAttributes
				.addFlashAttribute("successMessages", successMessages);
		httpSession.removeAttribute("eventId");
		httpSession.removeAttribute("eventName");
		httpSession.removeAttribute("menuId");
		return "redirect:/customer/dashboard";
	}
}
