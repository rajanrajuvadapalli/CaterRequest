package com.cater.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import com.cater.constants.Roles;
import com.cater.model.Customer;
import com.cater.model.Restaurant;
import com.cater.service.CustomerService;
import com.cater.service.RestaurantService;
import com.cater.ui.data.User;

/**
 * The Class MainController.
 */
@Controller
public class MainController {
	@Autowired
	private CustomerService customerService;
	@Autowired
	private RestaurantService restaurantService;

	/**
	 * Home.
	 *
	 * @param modelMap the model map
	 * @return the string
	 */
	@RequestMapping(value = { "" })
	public String home(ModelMap modelMap) {
		return "t_home";
	}

	/**
	 * All other mappings.
	 *
	 * @param modelMap the model map
	 * @param page the page
	 * @return the string
	 */
	@RequestMapping(value = { "{page}" })
	public String allOtherMappings(ModelMap modelMap, @PathVariable String page) {
		//If the page does not exist, display page 404
		Resource webpage = null;
		WebApplicationContext webApplicationContext = ContextLoader
				.getCurrentWebApplicationContext();
		if (webApplicationContext != null) {
			webpage = webApplicationContext.getResource("WEB-INF/layouts/"
					+ page + ".jsp");
			if (webpage == null || !webpage.exists()) {
				return "t_404";
			}
		}
		return "t_" + page;
	}

	/**
	 * Home.
	 *
	 * @param session the session
	 * @return the string
	 */
	@RequestMapping(value = { "home" })
	public String home(ModelMap modelMap, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			if (Roles.CUSTOMER == user.getRole()) {
				Customer customer = customerService
						.findCustomerWithLoginId(user.getLoginID());
				modelMap.put("customer", customer);
				return "t_dashboardCustomer";
			}
			else if (Roles.RESTAURANT == user.getRole()) {
				Restaurant restaurant = restaurantService
						.findRestaurantWithLoginId(user.getLoginID());
				modelMap.put("restaurant", restaurant);
				return "t_dashboardRestaurant";
			}
			else if (Roles.ADMIN == user.getRole()) {
				modelMap.put("customers", customerService.fetchAllCustomers());
				modelMap.put("restaurants",
						restaurantService.fetchAllRestaurants());
				modelMap.put("events", customerService.fetchAllEvents());
				return "t_dashboardAdmin";
			}
		}
		return "t_home";
	}
}
