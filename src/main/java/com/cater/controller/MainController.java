package com.cater.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import com.cater.constants.Roles;
import com.cater.model.Customer;
import com.cater.model.Restaurant;
import com.cater.service.CustomerService;
import com.cater.service.RegisterService;
import com.cater.service.RestaurantService;
import com.cater.ui.data.RegistrationData;
import com.cater.ui.data.User;

/**
 * The Class MainController.
 */
@Controller
public class MainController {
	private static final Logger logger = Logger.getLogger(MainController.class);
	@Autowired
	private RegisterService registerService;
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

	/**
	 * Register.
	 *
	 * @param modelMap the model map
	 * @param request the request
	 * @return the string
	 */
	@RequestMapping(value = { "register" }, method = RequestMethod.POST)
	public String register(ModelMap modelMap, HttpServletRequest request,
			HttpSession session) {
		try {
			RegistrationData data = new RegistrationData();
			data.setName(StringUtils.defaultString(request.getParameter("name")));
			data.setRestaurantName(StringUtils.defaultString(request
					.getParameter("restaurantName")));
			data.setCuisineType(StringUtils.defaultString(request
					.getParameter("cuisineType")));
			data.setUrl(StringUtils.defaultString(request.getParameter("url")));
			data.setEmail(StringUtils.defaultString(request
					.getParameter("email")));
			data.setPassword(StringUtils.defaultString(request
					.getParameter("pwd1")));
			data.setPhone(StringUtils.defaultString(request
					.getParameter("phone")));
			data.setStreet1(StringUtils.defaultString(request
					.getParameter("street1")));
			data.setStreet2(StringUtils.defaultString(request
					.getParameter("street2")));
			data.setCity(StringUtils.defaultString(request.getParameter("city")));
			data.setState(StringUtils.defaultString(request
					.getParameter("state")));
			data.setZip(StringUtils.defaultString(request.getParameter("zip")));
			logger.debug("Form data: " + data.toString());
			registerService.register(data);
			modelMap.put("name", data.getName());
			//When one signs up, logout the current user from session.
			session.removeAttribute("user");
			return "t_registerSuccess";
		}
		catch (Exception e) {
			return "t_500";
		}
	}
}
