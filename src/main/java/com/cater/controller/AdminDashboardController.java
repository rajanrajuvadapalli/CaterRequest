package com.cater.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cater.service.CustomerService;
import com.cater.service.RestaurantService;
import com.cater.ui.data.User;

/**
 * Description:.
 *
 * @since Jan 27, 2015
 * 
 */
@Controller
@RequestMapping(value = { "admin" })
public class AdminDashboardController {
	/** The customer service. */
	@Autowired
	private CustomerService customerService;
	/** The restaurant service. */
	@Autowired
	private RestaurantService restaurantService;

	/**
	 * Gets the dashboard.
	 *
	 * @param session the session
	 * @return the dashboard
	 */
	@RequestMapping(value = { "dashboard" })
	public String getDashboard(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "t_home";
		}
		user.setName("ADMIN");
		refreshCounts(session);
		return "redirect:listCustomers";
	}

	/**
	 * List customers.
	 *
	 * @param modelMap the model map
	 * @param session the session
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
	 * @param modelMap the model map
	 * @param session the session
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
	 * @param modelMap the model map
	 * @param session the session
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
	 * @param session the session
	 */
	public void refreshCounts(HttpSession session) {
		session.setAttribute("nCustomers",
				customerService.getNumberOfCustomers());
		session.setAttribute("nRestaurants",
				restaurantService.getNumberOfRestaurants());
		session.setAttribute("nEvents", customerService.getNumberOfEvents());
	}
}
