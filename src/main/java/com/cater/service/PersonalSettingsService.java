package com.cater.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cater.constants.Roles;
import com.cater.dao.AddressDAO;
import com.cater.dao.CustomerDAO;
import com.cater.dao.RestaurantDAO;

@Component
public class PersonalSettingsService {
	@Autowired
	private CustomerDAO customerDAO;
	@Autowired
	private RestaurantDAO restaurantDAO;
	@Autowired
	private AddressDAO addressDAO;

	/**
	 * Gets the user with login id.
	 *
	 * @param loginID the login id
	 * @param role the role
	 * @return the user with login id
	 */
	public Object getUserWithLoginID(int loginID, Roles role) {
		if (Roles.CUSTOMER == role) {
			return customerDAO.findByLoginID(loginID);
		}
		else if (Roles.RESTAURANT == role) {
			return restaurantDAO.findByLoginID(loginID);
		}
		return null;
	}
}
