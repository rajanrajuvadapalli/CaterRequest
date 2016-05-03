package com.cater.controller;

import static com.cater.constants.QuoteStatus.CUSTOMER_UPDATED_COUNT;
import static com.cater.constants.QuoteStatus.CUSTOMER_UPDATED_DATE;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
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

import com.cater.Environment;
import com.cater.Helper;
import com.cater.constants.EventStatus;
import com.cater.constants.QuoteStatus;
import com.cater.constants.Roles;
import com.cater.maps.RestaurantDTO;
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
import com.google.common.collect.Sets;

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
	/** The Constant SDF_1. */
	private static final SimpleDateFormat SDF_1 = new SimpleDateFormat(
			"EEE, d MMM yyyy hh:mm aaa z", Locale.US);
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
	 * @param modelMap
	 *            the model map
	 * @param session
	 *            the session
	 * @return the dashboard
	 */
	@RequestMapping(value = { "dashboard" })
	public String getDashboard(ModelMap modelMap, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "t_home";
		}
		Customer customer = null;
		if (user.isGuest()) {
			customer = (Customer) session.getAttribute("customer");
		}
		else {
			customer = customerService.findCustomerWithLoginId(user
					.getLoginID());
			user.setCustomerID(customer.getId());
		}
		modelMap.put("customer", customer);
		// List <Event> events = customer.getEvents();
		// modelMap.put("events", events);
		List <Event> upcomingEvents = customerService
				.fetchUpcomingEvents(customer.getId());
		modelMap.put("upcomingEvents", upcomingEvents);
		List <Event> pastEvents = customerService.fetchPastEvents(customer
				.getId());
		modelMap.put("pastEvents", pastEvents);
		Map <Integer, Set <String>> e2m = Maps.newHashMap();
		Map <Integer, Map <String, List <Quote>>> e2q = Maps.newHashMap();
		if (!user.isGuest()) {
			for (Event e : upcomingEvents) {
				List <Menu> menus = customerService.findMenusWithEventId(e
						.getId());
				Set <String> selectedMenuCusines = Sets.newTreeSet();
				List <Integer> selectedMenuCusineIds = Lists.newLinkedList();
				if (CollectionUtils.isNotEmpty(menus)) {
					for (Menu m : menus) {
						selectedMenuCusines.add(m.getCuisineType());
						selectedMenuCusineIds.add(m.getId());
					}
				}
				e2m.put(e.getId(), selectedMenuCusines);
				List <Quote> quotes = restaurantService.findQuotesWithEventId(e
						.getId());
				Map <String, List <Quote>> groupedQuotes = groupQuotesPerCuisine(quotes);
				e2q.put(e.getId(), groupedQuotes);
			}
			((User) session.getAttribute("user")).setName(customer.getName());
		}
		modelMap.put("e2m", e2m);
		modelMap.put("e2q", e2q);
		return "customer/t_dashboard";
	}

	/**
	 * Group quotes per cuisine.
	 * 
	 * @param quotes
	 *            the quotes
	 * @return the map
	 */
	private Map <String, List <Quote>> groupQuotesPerCuisine(List <Quote> quotes) {
		Map <String, List <Quote>> groupedQuotes = Maps.newTreeMap();
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
	 * @param httpSession            the http session
	 * @param modelMap            the model map
	 * @param request            the request
	 * @param redirectAttributes the redirect attributes
	 * @return the string
	 */
	@RequestMapping(value = { "createEvent" }, method = RequestMethod.POST)
	public String createEvent(HttpSession httpSession, ModelMap modelMap,
			HttpServletRequest request, RedirectAttributes redirectAttributes) {
		User user = (User) httpSession.getAttribute("user");
		Boolean fmf = (Boolean) httpSession.getAttribute("full_menu_flow");
		Customer c = new Customer();
		if (user == null) {
			// return "t_home";
			// If the user is not in session, create a dummy user and continue.
			// Do not save anything, until last step (which will be
			// registration).
			user = new User();
			user.setGuest(true);
			user.setRole(Roles.CUSTOMER);
			user.setUsername("Guest");
			httpSession.setAttribute("user", user);
		}
		else if (!user.isGuest()) {
			c = customerService.findCustomerWithLoginId(user.getLoginID());
			logger.debug("Creating event for " + c.getName());
		}
		Event e = new Event();
		e.setStatus(EventStatus.ACTIVE.toString());
		e.setName(StringUtils.defaultString(request.getParameter("name")));
		e.setPickUp(StringUtils.equals("1", StringUtils.defaultString(request
				.getParameter("deliveryOption"))));
		Address a = new Address();
		String street1 = StringUtils
				.defaultString(request.getParameter("street_number"))
				.concat(" ")
				.concat(StringUtils.defaultString(
						request.getParameter("street_name")).trim());
		a.setStreet1(street1);
		String apt_classifier = StringUtils.defaultString(
				request.getParameter("apt_classifier")).trim();
		String street2 = StringUtils.defaultString(
				request.getParameter("street2")).trim();
		if (StringUtils.isNotBlank(street2)) {
			a.setStreet2(apt_classifier + " " + street2);
		}
		a.setCity(StringUtils.defaultString(request.getParameter("city"))
				.trim());
		a.setState(StringUtils.defaultString(request.getParameter("state"))
				.trim());
		a.setZip(StringUtils.defaultString(request.getParameter("zip")).trim());
		e.setLocation(a);
		Date dateTime;
		try {
			synchronized (this) {
				dateTime = SDF.parse(StringUtils.defaultString(request
						.getParameter("datetimepicker_date"))
						+ " "
						+ StringUtils.defaultString(request
								.getParameter("datetimepicker_time")));
				logger.debug("Event date/time:" + dateTime);
				e.setDate_time(dateTime);
			}
		}
		catch (ParseException e1) {
			logger.error(e1);
		}
		String personCountParameter = request.getParameter("person_count");
		if (StringUtils.isNotBlank(personCountParameter)
				&& NUMERIC.matcher(personCountParameter).matches()) {
			e.setPersonCount(Integer.parseInt(personCountParameter));
		}
		String kidsCountParameter = request.getParameter("kids_count");
		if (StringUtils.isNotBlank(kidsCountParameter)
				&& NUMERIC.matcher(kidsCountParameter).matches()) {
			e.setKidsCount(Integer.parseInt(kidsCountParameter));
		}
		String budgetTotalParameter = request.getParameter("budget_total");
		if (StringUtils.isNotBlank(budgetTotalParameter)
				&& NUMERIC.matcher(budgetTotalParameter).matches()) {
			e.setBudgetTotal(Integer.parseInt(budgetTotalParameter));
		}
		if (user.isGuest()) {
			// For guest user, save data in session
			e.setId(1);
			a.setId(1);
			c.setId(1);
			List <Event> events = Lists.newArrayList();
			events.add(e);
			c.setEvents(events);
			httpSession.setAttribute("event", e);
			httpSession.setAttribute("customer", c);
		}
		else {
			e.setCustomer(c);
			if (Boolean.TRUE.equals(fmf)) {
				Menu m = (Menu) httpSession.getAttribute("menu");
				m.setEvent(e);
				customerService.saveOrUpdateMenu(m);
				httpSession.setAttribute("menuId", m.getId());
			}
			else {
				customerService.saveOrUpdateEvent(e);
			}
		}
		String cuisineType = request.getParameter("cuisineType");
		if (user.isGuest()) {
			httpSession.setAttribute("eventName", e.getName());
			//If placing direct order to restaurant
			if (fmf != null && Boolean.TRUE.equals((Boolean) fmf)) {
				//redirectAttributes.addFlashAttribute("as", "customer");
				List <String> warnings = Lists.newArrayList();
				warnings.add("You must register before continuing to place a request for quote.");
				redirectAttributes.addFlashAttribute("warnings", warnings);
				return "t_signUp_customer";
			}
			else if (StringUtils.isNotBlank(cuisineType)) {
				com.cater.model.Address eventLocation = e.getLocation();
				modelMap.put("eventLocation", eventLocation);
				Set <Integer> previouslySelectedRestaurants = Sets.newHashSet();
				modelMap.put("prevR", previouslySelectedRestaurants);
				Set <Restaurant> restaurants = restaurantService
						.fetchRestaurantsOfTypePrimary(cuisineType);
				Collection <RestaurantDTO> nearByRestaurants = restaurantService
						.getNearbyYelpReviews(eventLocation, restaurants);
				if (CollectionUtils.isNotEmpty(nearByRestaurants)) {
					modelMap.put("restaurants", nearByRestaurants);
				}
				return "menus/t__cateringRestaurants";
			}
		}
		else if (fmf != null && Boolean.TRUE.equals((Boolean) fmf)) {
			redirectAttributes.addAttribute("eventId", e.getId());
			httpSession.setAttribute("eventName", e.getName());
			return "redirect:/menu/view/all";
		}
		else if (StringUtils.isNotBlank(cuisineType)) {
			logger.debug("Customer selected cuisine " + cuisineType
					+ ". Redirecting to the menu page...");
			redirectAttributes.addAttribute("cuisineType", cuisineType);
			redirectAttributes.addAttribute("eventId", e.getId());
			return "redirect:/menu/selectMenu";
		}
		return "redirect:/customer/dashboard";
	}

	/**
	 * Edits the event.
	 * 
	 * @param httpSession
	 *            the http session
	 * @param modelMap
	 *            the model map
	 * @param request
	 *            the request
	 * @param eventId
	 *            the event id
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
		if (user.isGuest()) {
			Event event = (Event) httpSession.getAttribute("event");
			modelMap.put("event", event);
		}
		else {
			Event event = customerService.findEventWithId(eventId);
			modelMap.put("event", event);
		}
		return "customer/t_editEvent";
	}

	/**
	 * Update event.
	 * 
	 * @param httpSession
	 *            the http session
	 * @param modelMap
	 *            the model map
	 * @param request
	 *            the request
	 * @param eventId
	 *            the event id
	 * @param redirectAttributes
	 *            the redirect attributes
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
		Event e = null;
		if (user.isGuest()) {
			e = (Event) httpSession.getAttribute("event");
		}
		else {
			e = customerService.findEventWithId(eventId);
		}
		if (e != null) {
			e.setName(StringUtils.defaultString(request.getParameter("name")));
			e.setPickUp(StringUtils.equals("1", StringUtils
					.defaultString(request.getParameter("deliveryOption"))));
			Address a = e.getLocation();
			a.setStreet1(StringUtils.defaultString(
					request.getParameter("street1")).trim());
			a.setStreet2(StringUtils.defaultString(
					request.getParameter("street2")).trim());
			a.setCity(StringUtils.defaultString(request.getParameter("city"))
					.trim());
			a.setState(StringUtils.defaultString(request.getParameter("state"))
					.trim());
			a.setZip(StringUtils.defaultString(request.getParameter("zip"))
					.trim());
			e.setLocation(a);
			StringBuilder message = new StringBuilder();
			boolean isDateChanged = false;
			boolean isPersonCountChanged = false;
			boolean isKidsCountChanged = false;
			Date dateTime;
			try {
				synchronized (this) {
					dateTime = SDF.parse(StringUtils.defaultString(request
							.getParameter("datetimepicker_date"))
							+ " "
							+ StringUtils.defaultString(request
									.getParameter("datetimepicker_time")));
					String oldDateTime = SDF_1.format(e.getDate_time());
					String newDateTime = SDF_1.format(dateTime);
					// If customer changes date, send notification
					if (!StringUtils.equalsIgnoreCase(oldDateTime, newDateTime)) {
						isDateChanged = true;
						message.append("Old date/time: ").append(oldDateTime)
								.append("\n");
						message.append("New date/time: ").append(newDateTime)
								.append("\n");
					}
					e.setDate_time(dateTime);
				}
			}
			catch (ParseException e1) {
				logger.error(e1);
			}
			String personCountParameter = request.getParameter("person_count");
			int newPersonCount = stringToInt(personCountParameter);
			if (e.getPersonCount() != newPersonCount) {
				isPersonCountChanged = true;
				message.append("Old adult count: ").append(e.getPersonCount())
						.append("\n");
				message.append("New adult count: ").append(newPersonCount)
						.append("\n");
				e.setPersonCount(Integer.parseInt(personCountParameter));
			}
			String kidsCountParameter = request.getParameter("kids_count");
			int newKidsCount = stringToInt(kidsCountParameter);
			if (e.getKidsCount() != null && (e.getKidsCount() != newKidsCount)) {
				isKidsCountChanged = true;
				message.append("Old kids count: ").append(e.getKidsCount())
						.append("\n");
				message.append("New kids count: ").append(newKidsCount)
						.append("\n");
				e.setKidsCount(Integer.parseInt(kidsCountParameter));
			}
			if (!user.isGuest()) {
				customerService.saveOrUpdateEvent(e);
				updateQuoteStatusAndSendNotifications(e, message,
						isDateChanged, isPersonCountChanged
								|| isKidsCountChanged);
			}
			List <String> successMessages = Lists.newArrayList();
			successMessages.add("Successfully updated event: '" + e.getName()
					+ "'.");
			redirectAttributes.addFlashAttribute("successMessages",
					successMessages);
		}
		return "redirect:/customer/dashboard";
	}

	/**
	 * Update quote status and send notifications.
	 *
	 * @param e
	 *            the e
	 * @param message
	 *            the message
	 * @param isDateChanged
	 *            the is date changed
	 * @param isCountChanged
	 *            the is count changed
	 */
	private void updateQuoteStatusAndSendNotifications(Event e,
			StringBuilder message, boolean isDateChanged, boolean isCountChanged) {
		if (!isDateChanged && !isCountChanged) {
			return;
		}
		StringBuilder message2 = new StringBuilder(
				"Customer has updated the following event details:\n");
		message2.append(message);
		List <Quote> quotes = restaurantService
				.findQuotesWithEventId(e.getId());
		QuoteStatus status = isCountChanged ? CUSTOMER_UPDATED_COUNT
				: CUSTOMER_UPDATED_DATE;
		if (CollectionUtils.isNotEmpty(quotes)) {
			for (Quote q : quotes) {
				q.setStatus(status.toString());
				restaurantService.sendNotification(q, message2);
			}
		}
	}

	/**
	 * String to int.
	 * 
	 * @param aString
	 *            the a string
	 * @return the int
	 */
	private int stringToInt(String aString) {
		if (StringUtils.isNotBlank(aString)
				&& NUMERIC.matcher(aString).matches()) {
			return Integer.valueOf(aString);
		}
		return 0;
	}

	/**
	 * Delete event.
	 * 
	 * @param httpSession
	 *            the http session
	 * @param modelMap
	 *            the model map
	 * @param request
	 *            the request
	 * @param eventId
	 *            the event id
	 * @param redirectAttributes
	 *            the redirect attributes
	 * @return the string
	 */
	@RequestMapping(value = { "event/delete/{eventId}" }, method = RequestMethod.POST)
	public String deleteEvent(HttpSession httpSession, ModelMap modelMap,
			HttpServletRequest request,
			@PathVariable(value = "eventId") Integer eventId,
			RedirectAttributes redirectAttributes) {
		User user = (User) httpSession.getAttribute("user");
		if (user == null) {
			return "t_home";
		}
		if (user.isGuest()) {
			Event e = (Event) httpSession.getAttribute("event");
			httpSession.removeAttribute("event");
			Customer customer = (Customer) httpSession.getAttribute("customer");
			List <Event> events = Lists.newArrayList();
			customer.setEvents(events);
			// httpSession.removeAttribute("user");
			List <String> successMessages = Lists.newArrayList();
			successMessages.add("Successfully deleted event: '" + e.getName()
					+ "'.");
			redirectAttributes.addFlashAttribute("successMessages",
					successMessages);
		}
		else {
			Event event = customerService.findEventWithId(eventId);
			if (event != null) {
				String eventName = event.getName();
				Address eventAddress = event.getLocation();
				List <Quote> quotes = restaurantService
						.findQuotesWithEventId(eventId);
				List <Menu> menus = customerService
						.findMenusWithEventId(eventId);
				for (Quote quote : quotes) {
					customerService.deleteQuote(quote);
				}
				for (Menu menu : menus) {
					customerService.deleteMenu(menu);
				}
				customerService.deleteEvent(event);
				customerService.deleteAddress(eventAddress);
				List <String> successMessages = Lists.newArrayList();
				successMessages.add("Successfully deleted event: '" + eventName
						+ "'.");
				redirectAttributes.addFlashAttribute("successMessages",
						successMessages);
			}
		}
		return "redirect:/customer/dashboard";
	}

	/**
	 * Request quote.
	 * 
	 * @param httpSession
	 *            the http session
	 * @param modelMap
	 *            the model map
	 * @param request
	 *            the request
	 * @param restaurantIds
	 *            the restaurant ids
	 * @param redirectAttributes
	 *            the redirect attributes
	 * @return the string
	 */
	@RequestMapping(value = { "event/requestQuote" })
	public String requestQuote(
			HttpSession httpSession,
			ModelMap modelMap,
			HttpServletRequest request,
			@RequestParam(value = "restaurantId", required = false) String[] restaurantIds,
			RedirectAttributes redirectAttributes) {
		User user = (User) httpSession.getAttribute("user");
		if (user == null) {
			return "t_home";
		}
		logger.info("Submitting request for quotes.");
		com.cater.model.Menu menuModel = null;
		List <String> selectedRestaurantNames = Lists.newArrayList();
		//For guest user full menu flow
		String rId = request.getParameter("rId");
		if (StringUtils.isNotBlank(rId)) {
			restaurantIds = new String[] { rId };
		}
		Integer menuId = (Integer) httpSession.getAttribute("menuId");
		if (restaurantIds != null && restaurantIds.length > 0) {
			if (menuId != null) {
				menuModel = customerService.findMenuWithId(menuId);
			}
			for (String restaurantId : restaurantIds) {
				// Find if a quote already exists.
				Quote quote = restaurantService
						.findQuoteWithRestaurantIdAndMenuId(
								Helper.stringToInteger(restaurantId), menuId);
				Restaurant restaurant = restaurantService
						.findRestaurantWithId(Helper
								.stringToInteger(restaurantId));
				selectedRestaurantNames.add(restaurant.getName());
				if (quote == null) {
					quote = new Quote();
					quote.setStatus(QuoteStatus.CREATED.toString());
					quote.setMenu(menuModel);
					quote.setRestaurant(restaurant);
					restaurantService.saveOrUpdateQuote(quote);
					restaurantService.sendNotification(quote, null);
				}
				else if (Boolean.TRUE.equals((Boolean) httpSession
						.getAttribute("isMenuChanged"))) {
					restaurantService.sendNotification(quote, null);
				}
			}
		}
		String eventName = (String) httpSession.getAttribute("eventName");
		List <String> successMessages = Lists.newArrayList();
		successMessages
				.add("Your request for quotes is successfully submitted for '"
						+ eventName + "'.");
		successMessages.add("To restaurant(s): "
				+ StringUtils.join(selectedRestaurantNames, ", "));
		successMessages
				.add("The above restaurants are going to reply with price quote in less than 24 hours.");
		redirectAttributes
				.addFlashAttribute("successMessages", successMessages);
		// Commented to support browser 'back' button.
		// httpSession.removeAttribute("eventId");
		// httpSession.removeAttribute("eventName");
		// httpSession.removeAttribute("menuId");
		return "redirect:/customer/dashboard";
	}

	/**
	 * Confirm order.
	 *
	 * @param httpSession
	 *            the http session
	 * @param modelMap
	 *            the model map
	 * @param request
	 *            the request
	 * @param redirectAttributes
	 *            the redirect attributes
	 * @param restaurantId
	 *            the restaurant id
	 * @param eventId
	 *            the event id
	 * @param quoteId
	 *            the quote id
	 * @return the string
	 */
	@RequestMapping(value = { "orderConfirmation" }, method = RequestMethod.POST)
	public String confirmOrder(
			HttpSession httpSession,
			ModelMap modelMap,
			HttpServletRequest request,
			RedirectAttributes redirectAttributes,
			@RequestParam(value = "restaurantName", required = true) Integer restaurantId,
			@RequestParam(value = "xeventId", required = true) Integer eventId,
			@RequestParam(value = "xquoteId", required = true) Integer quoteId) {
		String forward = "redirect:/customer/dashboard";
		User user = (User) httpSession.getAttribute("user");
		if (user == null) {
			return "t_home";
		}
		List <String> errors = Lists.newArrayList();
		redirectAttributes.addFlashAttribute("errors", errors);
		List <String> successMessages = Lists.newArrayList();
		redirectAttributes
				.addFlashAttribute("successMessages", successMessages);
		if (quoteId == null || eventId == null) {
			errors.add("Please choose a quote.");
		}
		else {
			Quote quote = restaurantService.findQuoteWithId(quoteId);
			Event event = customerService.findEventWithId(eventId);
			if (quote == null || quote.getPrice() == null
					|| quote.getPrice() == 0) {
				errors.add("Cannot confirm order with no quotes.");
			}
			else {
				BigDecimal taxInbigdecimal = new BigDecimal(
						(quote.getPrice() * quote.getRestaurant().getSalesTax()) / 100);
				taxInbigdecimal = taxInbigdecimal.setScale(2,
						BigDecimal.ROUND_HALF_UP);
				double amount = quote.getPrice()
						+ taxInbigdecimal.doubleValue();
				
				double totalAmountInCents = amount * 100;
				long mStrippedValue = new Double(totalAmountInCents).longValue();
				modelMap.put("quote", quote);
				modelMap.put("restuarant", quote.getRestaurant());
				modelMap.put("event", event);
				modelMap.put("tax", taxInbigdecimal.doubleValue());
				modelMap.put("amount", amount);
				modelMap.put("totalAmountInCents", mStrippedValue);
				forward = "t_payment";
			}
		}
		return forward;
	}

	/**
	 * Make payment.
	 *
	 * @param httpSession
	 *            the http session
	 * @param modelMap
	 *            the model map
	 * @param request
	 *            the request
	 * @param redirectAttributes
	 *            the redirect attributes
	 * @param quoteId
	 *            the quote id
	 * @return the string
	 */
	@RequestMapping(value = { "makePayment" }, method = RequestMethod.POST)
	public String makePayment(HttpSession httpSession, ModelMap modelMap,
			HttpServletRequest request, RedirectAttributes redirectAttributes,
			@RequestParam(value = "xquoteId", required = true) Integer quoteId) {
		/*
		 * Address address = new Address();
		 * address.setStreet1(StringUtils.defaultString
		 * (request.getParameter("street")));
		 * address.setCity(StringUtils.defaultString
		 * (request.getParameter("city")));
		 * address.setState(StringUtils.defaultString
		 * (request.getParameter("state")));
		 * address.setZip(StringUtils.defaultString
		 * (request.getParameter("zip")));
		 * 
		 * CreditCard creditCard = new CreditCard();
		 * creditCard.setNumber(StringUtils
		 * .defaultString(request.getParameter("creditNumber")));
		 * creditCard.setType
		 * (StringUtils.defaultString(request.getParameter("cardType"))); int
		 * month
		 * =Integer.parseInt(StringUtils.defaultString(request.getParameter
		 * ("month"))); int year
		 * =Integer.parseInt(StringUtils.defaultString(request
		 * .getParameter("year"))); creditCard.setExpireMonth(month);
		 * creditCard.setExpireYear(year);
		 * creditCard.setFirstName(StringUtils.defaultString
		 * (request.getParameter("firstName")));
		 * creditCard.setLastName(StringUtils
		 * .defaultString(request.getParameter("lastName")));
		 * 
		 * 
		 * ModelMap billingInfo = new ModelMap(); billingInfo.put("address",
		 * address);
		 * 
		 * PaymentHelper ph = new PaymentHelper(); try {
		 * ph.makePayment(billingInfo); } catch (PayPalRESTException e) { // }
		 */
		List <String> errors = Lists.newArrayList();
		redirectAttributes.addFlashAttribute("errors", errors);
		List <String> successMessages = Lists.newArrayList();
		redirectAttributes
				.addFlashAttribute("successMessages", successMessages);
		if (quoteId == null) {
			errors.add("Please choose a quote.");
		}
		else {
			Quote quote = restaurantService.findQuoteWithId(quoteId);
			if (quote == null || quote.getPrice() == null
					|| quote.getPrice() == 0) {
				errors.add("Cannot confirm order with no quotes.");
			}
			else {
				quote.setStatus(QuoteStatus.APPROVED.toString());
				// Reject all other quotes
				for (Quote q : quote.getMenu().getQuotes()) {
					if (!q.getId().equals(quote.getId())) {
						q.setStatus(QuoteStatus.DENIED.toString());
					}
				}
				quote.getMenu().getEvent()
						.setStatus(EventStatus.CONFIRMED.toString());
				restaurantService.sendNotification(quote, null);
				customerService.sendNotification(quote, null);
				successMessages
						.add("Congratulations, your order has been placed!");
			}
		}
		return "redirect:/customer/dashboard";
	}

	/**
	 * Guest page1.
	 *
	 * @param httpSession the http session
	 * @param modelMap the model map
	 * @param request the request
	 * @param redirectAttributes the redirect attributes
	 * @return the string
	 */
	@RequestMapping(value = { "guestPage1" }, method = RequestMethod.GET)
	public String guestPage1(HttpSession httpSession, ModelMap modelMap,
			HttpServletRequest request, RedirectAttributes redirectAttributes) {
		guestFlow(modelMap, httpSession, request, redirectAttributes);
		String cuisineType = request.getParameter("cuisineType");
		redirectAttributes.addAttribute("cuisineType", cuisineType);
		logger.debug("Customer selected cuisine " + cuisineType
				+ ". Redirecting to the menu page...");
		return "redirect:/menu/selectMenu";
	}

	/**
	 * Guest page2.
	 *
	 * @param httpSession the http session
	 * @param modelMap the model map
	 * @param request the request
	 * @param redirectAttributes the redirect attributes
	 * @return the string
	 */
	@RequestMapping(value = { "guestPage2" }, method = RequestMethod.GET)
	public String guestPage2(HttpSession httpSession, ModelMap modelMap,
			HttpServletRequest request, RedirectAttributes redirectAttributes) {
		httpSession.setAttribute("env", Environment.getInstance());
		guestFlow(modelMap, httpSession, request, redirectAttributes);
		String zip = request.getParameter("zip");
		redirectAttributes.addAttribute("zip", zip);
		logger.debug("Redirecting to the search page...");
		return "redirect:/search";
	}

	/**
	 * Guest flow.
	 *
	 * @param modelMap the model map
	 * @param httpSession the http session
	 * @param request the request
	 * @param redirectAttributes the redirect attributes
	 */
	private void guestFlow(ModelMap modelMap, HttpSession httpSession,
			HttpServletRequest request, RedirectAttributes redirectAttributes) {
		User user = (User) httpSession.getAttribute("user");
		Customer c = new Customer();
		if (user == null) {
			// return "t_home";
			// If the user is not in session, create a dummy user and continue.
			// Do not save anything, until last step (which will be
			// registration).
			user = new User();
			user.setGuest(true);
			user.setRole(Roles.CUSTOMER);
			user.setUsername("Guest");
			httpSession.setAttribute("user", user);
		}
		Event e = new Event();
		e.setStatus(EventStatus.ACTIVE.toString());
		String zip = request.getParameter("zip");
		httpSession.setAttribute("zip", zip);
		// For guest user, save data in session
		e.setId(1);
		// a.setId(1);
		c.setId(1);
		List <Event> events = Lists.newArrayList();
		events.add(e);
		c.setEvents(events);
		httpSession.setAttribute("event", e);
		httpSession.setAttribute("customer", c);
	}
}
