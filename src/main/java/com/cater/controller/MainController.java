package com.cater.controller;

import java.util.List;

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
import com.cater.model.Address;
import com.cater.model.Customer;
import com.cater.model.Login;
import com.cater.model.Restaurant;
import com.cater.service.LoginService;
import com.cater.service.PersonalSettingsService;
import com.cater.service.RegisterService;
import com.cater.ui.data.RegistrationData;
import com.cater.ui.data.User;
import com.google.common.collect.Lists;

/**
 * The Class MainController.
 */
@Controller
public class MainController {
	private static final Logger logger = Logger.getLogger(MainController.class);
	@Autowired
	private RegisterService registerService;
	@Autowired
	private LoginService loginService;
	@Autowired
	private PersonalSettingsService personalSettingsService;

	/**
	 * Home.
	 *
	 * @param modelMap the model map
	 * @return the string
	 */
	@RequestMapping(value = { "" })
	public String home(ModelMap modelMap) {
		return "home";
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
				return "404";
			}
		}
		return page;
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
		RegistrationData data = new RegistrationData();
		data.setName(StringUtils.defaultString(request.getParameter("name")));
		data.setRestaurantName(StringUtils.defaultString(request
				.getParameter("restaurantName")));
		data.setCuisineType(StringUtils.defaultString(request
				.getParameter("cuisineType")));
		data.setUrl(StringUtils.defaultString(request.getParameter("url")));
		data.setEmail(StringUtils.defaultString(request.getParameter("email")));
		data.setPassword(StringUtils.defaultString(request.getParameter("pwd1")));
		data.setPhone(StringUtils.defaultString(request.getParameter("phone")));
		data.setStreet1(StringUtils.defaultString(request
				.getParameter("street1")));
		data.setStreet2(StringUtils.defaultString(request
				.getParameter("street2")));
		data.setCity(StringUtils.defaultString(request.getParameter("city")));
		data.setState(StringUtils.defaultString(request.getParameter("state")));
		data.setZip(StringUtils.defaultString(request.getParameter("zip")));
		logger.debug("Form data: " + data.toString());
		registerService.register(data);
		modelMap.put("name", data.getName());
		//When one signs up, logout the current user from session.
		session.removeAttribute("user");
		return "registerSuccess";
	}

	/**
	 * Logout.
	 *
	 * @param modelMap the model map
	 * @param request the request
	 * @param session the session
	 * @return the string
	 */
	@RequestMapping(value = { "logout" })
	public String logout(ModelMap modelMap, HttpServletRequest request,
			HttpSession session) {
		session.removeAttribute("user");
		return "home";
	}

	/**
	 * Login.
	 *
	 * @param modelMap the model map
	 * @param request the request
	 * @return the string
	 */
	@RequestMapping(value = { "login" }, method = RequestMethod.POST)
	public String login(ModelMap modelMap, HttpServletRequest request,
			HttpSession session) {
		String username = StringUtils.defaultString(request
				.getParameter("username"));
		String password = StringUtils
				.defaultString(request.getParameter("pwd"));
		List<String> errors = Lists.newArrayList();
		modelMap.addAttribute("errors", errors);
		try {
			Login login = loginService.retrieveLoginFor(username, password);
			if (login == null) {
				errors.add("Invalid Username and password combination.");
				return "home";
			}
			User user = new User();
			user.setLoginID(login.getId());
			user.setUsername(username);
			Roles role = Roles.get(login.getRole());
			user.setRole(role);
			session.setAttribute("user", user);
			if (Roles.CUSTOMER == role) {
				return "dashboardCustomer";
			}
			else if (Roles.RESTAURANT == role) {
				return "dashboardRestaurant";
			}
			else if (Roles.ADMIN == role) {
				return "dashboardAdmin";
			}
		}
		catch (Exception ex) {
			errors.add("An unknown exception occured while logging you in. Please try later.");
		}
		return "home";
	}

	@RequestMapping(value = { "settings" }, method = RequestMethod.GET)
	public String settings(HttpSession session) {
		//If the user is not in session redirect to the home page.
		User user = (User) session.getAttribute("user");
		if (user != null) {
			//If the user is already in session, first retrieve all the fields from the database.
			Object userFromDatabase = personalSettingsService
					.getUserWithLoginID(user.getLoginID(), user.getRole());
			if (userFromDatabase != null) {
				RegistrationData data = new RegistrationData();
				if (Roles.CUSTOMER == user.getRole()) {
					Customer customer = (Customer) userFromDatabase;
					data.setName(customer.getName());
					data.setPhone(customer.getContactNumber());
					Address address = customer.getAddress();
					populateAddress(data, address);
				}
				else if (Roles.RESTAURANT == user.getRole()) {
					Restaurant restaurant = (Restaurant) userFromDatabase;
					data.setRestaurantName(restaurant.getName());
					data.setCuisineType(restaurant.getCuisineType());
					data.setUrl(restaurant.getWebsiteUrl());
					Address address = restaurant.getAddress();
					populateAddress(data, address);
				}
				user.setData(data);
				session.setAttribute("user", user);
				return "settings";
			}
		}
		return "home";
	}

	private void populateAddress(RegistrationData data, Address address) {
		if (data != null && address != null) {
			data.setStreet1(address.getStreet1());
			data.setStreet2(address.getStreet2());
			data.setCity(address.getCity());
			data.setState(address.getState());
			data.setZip(address.getZip());
		}
	}
}
