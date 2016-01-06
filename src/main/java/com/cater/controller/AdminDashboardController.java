package com.cater.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cater.model.Customer;
import com.cater.model.Event;
import com.cater.model.Quote;
import com.cater.service.CustomerService;
import com.cater.service.RestaurantService;
import com.cater.ui.data.User;
import com.google.common.collect.Maps;

/**
 * The Class AdminDashboardController.
 *
 * @since Jan 27, 2015
 */
@Controller
@RequestMapping(value = { "admin" })
public class AdminDashboardController {
	/** The Constant logger. */
	private static final Logger logger = Logger
			.getLogger(AdminDashboardController.class);
	/** The customer service. */
	@Autowired
	private CustomerService customerService;
	/** The restaurant service. */
	@Autowired
	private RestaurantService restaurantService;
	/** The Constant SDF. */
	private static final SimpleDateFormat SDF = new SimpleDateFormat(
			"yyyy/MM/dd HH:mm", Locale.US);

	/**
	 * Gets the dashboard.
	 * 
	 * @param session
	 *            the session
	 * @return the dashboard
	 */
	@RequestMapping(value = { "dashboard" })
	public String getDashboard(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "t_home";
		}
		user.setName("ADMIN");
		// refreshCounts(session);
		return "admin/t_dashboard";
	}

	/**
	 * List customers.
	 *
	 * @param modelMap            the model map
	 * @param request the request
	 * @param session            the session
	 * @return the string
	 * @throws ParseException the parse exception
	 */
	@RequestMapping(value = { "customerSearch" }, method = RequestMethod.GET)
	public String listCustomers(ModelMap modelMap, HttpServletRequest request,
			HttpSession session) throws ParseException {
		String customerEmail = StringUtils.defaultString(request
				.getParameter("customer_email"));
		Customer customer = null;
		if (StringUtils.isNotBlank(customerEmail)) {
			customer = customerService
					.findByCustomerByContactEmail(customerEmail);
			if (customer != null) {
				List <Event> events = customer.getEvents();
				modelMap.put("events", events);
				Map <Integer, List <Quote>> e2q = Maps.newHashMap();
				for (Event e : events) {
					List <Quote> quotes = restaurantService
							.findQuotesWithEventId(e.getId());
					e2q.put(e.getId(), quotes);
				}
				modelMap.put("e2q", e2q);
			}
		}
		else {
			java.util.Date today = new java.util.Date();
			Date toDate = new java.sql.Timestamp(today.getTime());
			if (StringUtils.isNotBlank(request.getParameter("toDate"))) {
				toDate = SDF.parse(StringUtils.defaultString(request
						.getParameter("toDate")));
			}
			Date fromDate = SDF.parse("2001/01/01 12:00");
			if (StringUtils.isNotBlank(request.getParameter("fromDate"))) {
				fromDate = SDF.parse(StringUtils.defaultString(request
						.getParameter("fromDate")));
			}
			logger.debug("Searching customer from " + fromDate + " to "
					+ toDate);
			List <Event> events = customerService.findEventsByDateRange(
					fromDate, toDate);
			modelMap.put("events", events);
			Map <Integer, List <Quote>> e2q = Maps.newHashMap();
			for (Event e : events) {
				List <Quote> quotes = restaurantService.findQuotesWithEventId(e
						.getId());
				e2q.put(e.getId(), quotes);
			}
			modelMap.put("e2q", e2q);
		}
		return "admin/t_customerSearch";
	}

	/**
	 * List restaurants.
	 *
	 * @param modelMap the model map
	 * @param request the request
	 * @param session the session
	 * @return the string
	 * @throws ParseException the parse exception
	 */
	@RequestMapping(value = { "restaurantSearch" }, method = RequestMethod.GET)
	public String listRestaurants(ModelMap modelMap,
			HttpServletRequest request, HttpSession session)
			throws ParseException {
		String restaurantEmail = StringUtils.defaultString(request
				.getParameter("rest_email"));
		if (StringUtils.isNotBlank(restaurantEmail)) {
			modelMap.put("restaurants", restaurantService
					.searchForRestaurantsByUserName(restaurantEmail));
		}
		else {
			java.util.Date today = new java.util.Date();
			Date toDate = new java.sql.Timestamp(today.getTime());
			if (StringUtils.isNotBlank(request.getParameter("toDate"))) {
				toDate = SDF.parse(StringUtils.defaultString(request
						.getParameter("toDate")));
			}
			Date fromDate = SDF.parse("2001/01/01 12:00");
			if (StringUtils.isNotBlank(request.getParameter("fromDate"))) {
				fromDate = SDF.parse(StringUtils.defaultString(request
						.getParameter("fromDate")));
			}
			modelMap.put("restaurants", restaurantService
					.searchForRestaurantsByDateRange(fromDate, toDate));
			logger.debug("Searching restaurants from " + fromDate + " to "
					+ toDate);
		}
		refreshCounts(session);
		return "admin/t_restaurantSearch";
	}

	/**
	 * List customers.
	 * 
	 * @param modelMap
	 *            the model map
	 * @param session
	 *            the session
	 * @return the string
	 */
	@RequestMapping(value = { "listCustomers" }, method = RequestMethod.GET)
	public String listCustomers(ModelMap modelMap, HttpSession session) {
		modelMap.put("customers", customerService.fetchAllCustomers());
		refreshCounts(session);
		return "admin/t_listCustomers";
	}

	/**
	 * List events.
	 * 
	 * @param modelMap
	 *            the model map
	 * @param session
	 *            the session
	 * @return the string
	 */
	@RequestMapping(value = { "listEvents" }, method = RequestMethod.GET)
	public String listEvents(ModelMap modelMap, HttpSession session) {
		modelMap.put("events", customerService.fetchAllEvents());
		refreshCounts(session);
		return "admin/t_listEvents";
	}

	/**
	 * List restaurants.
	 * 
	 * @param modelMap
	 *            the model map
	 * @param session
	 *            the session
	 * @return the string
	 */
	@RequestMapping(value = { "listRestaurants" }, method = RequestMethod.GET)
	public String listRestaurants(ModelMap modelMap, HttpSession session) {
		modelMap.put("restaurants", restaurantService.fetchAllRestaurants());
		refreshCounts(session);
		return "admin/t_listRestaurants";
	}

	/**
	 * Refresh counts.
	 * 
	 * @param session
	 *            the session
	 */
	public void refreshCounts(HttpSession session) {
		session.setAttribute("nCustomers",
				customerService.getNumberOfCustomers());
		session.setAttribute("nRestaurants",
				restaurantService.getNumberOfRestaurants());
		session.setAttribute("nEvents", customerService.getNumberOfEvents());
	}
}
