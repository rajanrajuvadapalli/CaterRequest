package com.cater.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cater.Helper;
import com.cater.constants.Roles;
import com.cater.model.Address;
import com.cater.model.Customer;
import com.cater.model.Login;
import com.cater.model.Restaurant;
import com.cater.service.LoginService;
import com.cater.service.PersonalSettingsService;
import com.cater.ui.data.RegistrationData;
import com.cater.ui.data.User;
import com.google.common.collect.Lists;

@Controller
@RequestMapping(value = { "settings" })
public class SettingsController {
	@Autowired
	private PersonalSettingsService personalSettingsService;
	@Autowired
	private LoginService loginService;

	/**
	 * Settings.
	 *
	 * @param session the session
	 * @return the string
	 */
	@RequestMapping(value = { "" }, method = RequestMethod.GET)
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
					user.setCustomerID(customer.getId());
				}
				else if (Roles.RESTAURANT == user.getRole()) {
					Restaurant restaurant = (Restaurant) userFromDatabase;
					data.setRestaurantName(restaurant.getName());
					data.setCuisineType(restaurant.getCuisineType());
					data.setUrl(restaurant.getWebsiteUrl());
					data.setPhone(restaurant.getContactNumber());
					Address address = restaurant.getAddress();
					populateAddress(data, address);
					user.setRestaurantID(restaurant.getId());
				}
				user.setData(data);
				session.setAttribute("user", user);
				return "t_settings";
			}
		}
		return "t_home";
	}

	/**
	 * Populate address.
	 *
	 * @param data the data
	 * @param address the address
	 */
	private void populateAddress(RegistrationData data, Address address) {
		if (data != null && address != null) {
			data.setStreet1(address.getStreet1());
			data.setStreet2(address.getStreet2());
			data.setCity(address.getCity());
			data.setState(address.getState());
			data.setZip(address.getZip());
		}
	}

	/**
	 * Settings update.
	 *
	 * @param request the request
	 * @param session the session
	 * @return the string
	 */
	@RequestMapping(value = { "profile" }, method = RequestMethod.POST)
	public String profileSettingsUpdate(ModelMap modelMap,
			HttpServletRequest request, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			Integer customerID = user.getCustomerID();
			Integer restaurantID = user.getRestaurantID();
			RegistrationData data = new RegistrationData();
			data.setName(StringUtils.defaultString(request.getParameter("name")));
			data.setRestaurantName(StringUtils.defaultString(request
					.getParameter("restaurantName")));
			data.setCuisineType(StringUtils.defaultString(request
					.getParameter("cuisineType")));
			data.setUrl(StringUtils.defaultString(request.getParameter("url")));
			//data.setEmail(StringUtils.defaultString(request.getParameter("email")));
			//data.setPassword(StringUtils.defaultString(request.getParameter("pwd1")));
			data.setPhone(Helper.formatPhone(StringUtils.defaultString(request
					.getParameter("phone"))));
			data.setStreet1(StringUtils.defaultString(request
					.getParameter("street1")));
			data.setStreet2(StringUtils.defaultString(request
					.getParameter("street2")));
			data.setCity(StringUtils.defaultString(request.getParameter("city")));
			data.setState(StringUtils.defaultString(request
					.getParameter("state")));
			data.setZip(StringUtils.defaultString(request.getParameter("zip")));
			boolean updateResult = personalSettingsService.updateDataFor(
					user.getRole(), customerID, restaurantID, data);
			if (updateResult) {
				modelMap.addAttribute("status", "success");
				user.setData(data);
				session.setAttribute("user", user);
			}
			else {
				List<String> errors = Lists.newArrayList();
				errors.add("Failed to update profile information.");
				modelMap.addAttribute("errors", errors);
			}
		}
		return "t_settings";
	}

	/**
	 * Account settings update.
	 *
	 * @param modelMap the model map
	 * @param request the request
	 * @param session the session
	 * @return the string
	 */
	@RequestMapping(value = { "accountSettings" }, method = RequestMethod.POST)
	public String accountSettingsUpdate(ModelMap modelMap,
			HttpServletRequest request, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			String currentPassword = StringUtils.defaultString(request
					.getParameter("currPwd"));
			Login login = loginService.retrieveLoginFor(user.getUsername(),
					currentPassword);
			//If we cannot find a login, then the current password entered is incorrect.
			List<String> errors = Lists.newArrayList();
			modelMap.addAttribute("errors", errors);
			if (login == null) {
				errors.add("Current password you entered is incorrect. Please try again.");
			}
			else {
				String newPassword = StringUtils.defaultString(request
						.getParameter("newPwd1"));
				boolean updateResult = loginService.updatePassword(
						user.getLoginID(), newPassword);
				if (updateResult) {
					modelMap.addAttribute("status", "success");
				}
				else {
					errors.add("Failed to update profile information. Please try again.");
				}
			}
		}
		return "t_settings";
	}
}
