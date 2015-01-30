package com.cater.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cater.service.CustomerService;
import com.cater.service.RestaurantService;

/** 
 * Description: 
 * @since Jan 27, 2015
 * @author Hari Samala
 */
@Controller
@RequestMapping(value = { "admin" })
public class AdminDashboardController {
	/*private static final Logger logger = Logger
			.getLogger(AdminDashboardController.class);*/
	@Autowired
	private CustomerService customerService;
	@Autowired
	private RestaurantService restaurantService;

	@RequestMapping(value = { "dashboard" }, method = RequestMethod.GET)
	public String getDashboard(HttpSession session) {
		refreshCounts(session);
		return "admin/t_dashboard";
	}

	@RequestMapping(value = { "listCustomers" }, method = RequestMethod.GET)
	public String listCustomers(ModelMap modelMap, HttpSession session) {
		modelMap.put("customers", customerService.fetchAllCustomers());
		refreshCounts(session);
		return "admin/t_listCustomers";
	}

	@RequestMapping(value = { "listEvents" }, method = RequestMethod.GET)
	public String listEvents(ModelMap modelMap, HttpSession session) {
		modelMap.put("events", customerService.fetchAllEvents());
		refreshCounts(session);
		return "admin/t_listEvents";
	}

	@RequestMapping(value = { "listRestaurants" }, method = RequestMethod.GET)
	public String listRestaurants(ModelMap modelMap, HttpSession session) {
		modelMap.put("restaurants", restaurantService.fetchAllRestaurants());
		refreshCounts(session);
		return "admin/t_listRestaurants";
	}

	public void refreshCounts(HttpSession session) {
		session.setAttribute("nCustomers",
				customerService.getNumberOfCustomers());
		session.setAttribute("nRestaurants",
				restaurantService.getNumberOfRestaurants());
		session.setAttribute("nEvents", customerService.getNumberOfEvents());
	}
}
