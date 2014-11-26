package com.cater.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cater.constants.Roles;
import com.cater.model.Address;
import com.cater.model.Customer;
import com.cater.model.Restaurant;
import com.cater.service.PersonalSettingsService;
import com.cater.ui.data.RegistrationData;
import com.cater.ui.data.User;

@Controller
public class SettingsController {
	@Autowired
	private PersonalSettingsService personalSettingsService;

	/**
	 * Settings.
	 *
	 * @param session the session
	 * @return the string
	 */
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
					data.setPhone(restaurant.getContactNumber());
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
}
