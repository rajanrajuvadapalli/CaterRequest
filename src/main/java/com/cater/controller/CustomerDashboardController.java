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
import org.springframework.web.bind.annotation.PathVariable;
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
	/** The Constant logger. */
	private static final Logger logger = Logger
			.getLogger(CustomerDashboardController.class);
	/** The Constant SDF. */
	private static final SimpleDateFormat SDF = new SimpleDateFormat(
			"yyyy/MM/dd HH:mm", Locale.US);
	/** The Constant NUMERIC. */
	private static final Pattern NUMERIC = Pattern.compile("[0-9]+");
	/** The customer service. */
	@Autowired
	private CustomerService customerService;
	/** The restaurant service. */
	@Autowired
	private RestaurantService restaurantService;

	/**
	 * Gets the dashboard.
	 *
	 * @param modelMap the model map
	 * @param session the session
	 * @return the dashboard
	 */
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
		Map <Integer, Map <String, List <Quote>>> e2q = Maps.newHashMap();
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
			Map <String, List <Quote>> groupedQuotes = groupQuotesPerCuisine(quotes);
			e2q.put(e.getId(), groupedQuotes);
		}
		modelMap.put("e2m", e2m);
		modelMap.put("e2q", e2q);
		((User) session.getAttribute("user")).setName(customer.getName());
		return "customer/t_dashboard";
	}

	/**
	 * Group quotes per cuisine.
	 *
	 * @param quotes the quotes
	 * @return the map
	 */
	private Map <String, List <Quote>> groupQuotesPerCuisine(List <Quote> quotes) {
		Map <String, List <Quote>> groupedQuotes = Maps.newHashMap();
		for (Quote q : quotes) {
			Restaurant r = q.getRestaurant();
			if (r != null) {
				String cuisine = r.getCuisineType();
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
	 * @param httpSession
	 *            the http session
	 * @param modelMap
	 *            the model map
	 * @param request
	 *            the request
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
	 * Edits the event.
	 *
	 * @param httpSession the http session
	 * @param modelMap the model map
	 * @param request the request
	 * @param eventId the event id
	 * @return the string
	 */
	@RequestMapping(value = { "event/edit/{eventId}" }, method = RequestMethod.GET)
	public String editEvent(HttpSession httpSession, ModelMap modelMap,
			HttpServletRequest request,
			@PathVariable(value = "eventId") Integer eventId) {
		User user = (User) httpSession.getAttribute("user");
		if (user == null) {
			return "t_home";
		}
		Event event = customerService.findEventWithId(eventId);
		modelMap.put("event", event);
		return "customer/t_editEvent";
	}

	/**
	 * Update event.
	 *
	 * @param httpSession the http session
	 * @param modelMap the model map
	 * @param request the request
	 * @param eventId the event id
	 * @param redirectAttributes the redirect attributes
	 * @return the string
	 */
	@RequestMapping(value = { "event/update/{eventId}" }, method = RequestMethod.POST)
	public String updateEvent(HttpSession httpSession, ModelMap modelMap,
			HttpServletRequest request,
			@PathVariable(value = "eventId") Integer eventId,
			RedirectAttributes redirectAttributes) {
		User user = (User) httpSession.getAttribute("user");
		if (user == null) {
			return "t_home";
		}
		Event e = customerService.findEventWithId(eventId);
		if (e != null) {
			e.setName(StringUtils.defaultString(request.getParameter("name")));
			Address a = e.getLocation();
			a.setStreet1(StringUtils.defaultString(request
					.getParameter("street1")));
			a.setStreet2(StringUtils.defaultString(request
					.getParameter("street2")));
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
			String personCountParameter = request.getParameter("person_count");
			if (StringUtils.isNotBlank(personCountParameter)
					&& NUMERIC.matcher(personCountParameter).matches()) {
				Integer newPersonCount = Integer.valueOf(personCountParameter);
				updateQuoteStatuses(e, newPersonCount);
				e.setPersonCount(Integer.parseInt(personCountParameter));
			}
			customerService.saveOrUpdateEvent(e);
			List <String> successMessages = Lists.newArrayList();
			successMessages.add("Successfully updated event: '" + e.getName()
					+ "'.");
			redirectAttributes.addFlashAttribute("successMessages",
					successMessages);
		}
		return "redirect:/customer/dashboard";
	}

	/**
	 * Update quote statuses.
	 *
	 * @param e the e
	 * @param newPersonCount the new person count
	 */
	private void updateQuoteStatuses(Event e, Integer newPersonCount) {
		if (!e.getPersonCount().equals(newPersonCount)) {
			String message = "Old count: " + e.getPersonCount()
					+ ", New count: " + newPersonCount;
			List <Quote> quotes = restaurantService.findQuotesWithEventId(e
					.getId());
			if (CollectionUtils.isNotEmpty(quotes)) {
				for (Quote q : quotes) {
					q.setStatus(QuoteStatus.CUSTOMER_UPDATED_COUNT.toString());
					restaurantService.sendNotification(q, message);
				}
			}
		}
	}

	/**
	 * Request quote.
	 *
	 * @param httpSession the http session
	 * @param modelMap the model map
	 * @param request the request
	 * @param restaurantIds the restaurant ids
	 * @param redirectAttributes the redirect attributes
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
			// Find if a quote already exists.
			Quote quote = restaurantService.findQuoteWithRestaurantIdAndMenuId(
					Helper.stringToInteger(restaurantId), menuId);
			Restaurant restaurant = restaurantService
					.findRestaurantWithId(Helper.stringToInteger(restaurantId));
			selectedRestaurantNames.add(restaurant.getName());
			if (quote == null) {
				quote = new Quote();
				quote.setStatus(QuoteStatus.CREATED.toString());
				quote.setMenu(menuModel);
				quote.setRestaurant(restaurant);
				restaurantService.saveOrUpdateQuote(quote);
				restaurantService.sendNotification(quote, null);
			}
		}
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

	/**
	 * Confirm order.
	 *
	 * @param httpSession the http session
	 * @param modelMap the model map
	 * @param request the request
	 * @param restaurantId the restaurant id
	 * @param eventId the event id
	 * @param quoteId the quote id
	 * @return the string
	 */
	@RequestMapping(value = { "orderConfirmation" }, method = RequestMethod.POST)
	public String confirmOrder(
			HttpSession httpSession,
			ModelMap modelMap,
			HttpServletRequest request,
			@RequestParam(value = "restaurantName", required = true) Integer restaurantId,
			@RequestParam(value = "xeventId", required = true) Integer eventId,
			@RequestParam(value = "xquoteId", required = true) Integer quoteId) {
		User user = (User) httpSession.getAttribute("user");
		if (user == null) {
			return "t_home";
		}
		//Customer c = customerService.findCustomerWithLoginId(user.getLoginID());
		Restaurant restaurant = restaurantService
				.findRestaurantWithId(restaurantId);
		if (quoteId != null) {
			Quote quote = restaurantService.findQuoteWithId(quoteId);
			quote.setStatus(QuoteStatus.APPROVED.toString());
			Event event = customerService.findEventWithId(eventId);
			quote.setRestaurant(restaurant);
			event.setStatus(Event.STATUS_CONFIRMED);
			customerService.saveOrUpdateEvent(event);
			restaurantService.saveOrUpdateQuote(quote);
			restaurantService.sendNotification(quote, null);
			customerService.sendNotification(quote);
		}
		return "redirect:/customer/orderConfirmation";
	}

	/**
	 * Gets the order confirmation.
	 *
	 * @return the order confirmation
	 */
	@RequestMapping(value = { "orderConfirmation" }, method = RequestMethod.GET)
	public String getOrderConfirmation() {
		return "customer/orderConfirmation";
	}
}
