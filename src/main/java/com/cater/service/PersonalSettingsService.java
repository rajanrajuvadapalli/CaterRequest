package com.cater.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cater.constants.Roles;
import com.cater.dao.CustomerDAO;
import com.cater.dao.RestaurantDAO;
import com.cater.model.Address;
import com.cater.model.Customer;
import com.cater.model.Restaurant;
import com.cater.ui.data.RegistrationData;

/**
 * The Class PersonalSettingsService.
 */
@Component
public class PersonalSettingsService {
	/** The customer dao. */
	@Autowired
	private CustomerDAO customerDAO;
	/** The restaurant dao. */
	@Autowired
	private RestaurantDAO restaurantDAO;

	/** The address dao. */
	/*@Autowired
	private AddressDAO addressDAO;*/
	/**
	 * Gets the user with login id.
	 *
	 * @param loginID the login id
	 * @param role the role
	 * @return the user with login id
	 */
	public Object getUserWithLoginID(Integer loginID, Roles role) {
		if (Roles.CUSTOMER == role) {
			return customerDAO.findByLoginID(loginID);
		}
		else if (Roles.RESTAURANT == role) {
			return restaurantDAO.findByLoginID(loginID);
		}
		return null;
	}

	/**
	 * Update data for.
	 *
	 * @param role the role
	 * @param customerID the customer id
	 * @param restaurantID the restaurant id
	 * @param data the data
	 * @return true, if successful
	 */
	public boolean updateDataFor(Roles role, Integer customerID,
			Integer restaurantID, RegistrationData data) {
		if (Roles.CUSTOMER == role) {
			return updateDataForCustomer(customerID, data);
		}
		else if (Roles.RESTAURANT == role) {
			return updateDataForRestaurant(restaurantID, data);
		}
		return true;
	}

	/**
	 * Update data for customer.
	 *
	 * @param customerID the customer id
	 * @param data the data
	 * @return true, if successful
	 */
	private boolean updateDataForCustomer(Integer customerID,
			RegistrationData data) {
		if (data != null) {
			Customer customer = customerDAO.findById(customerID);
			if (customer != null) {
				customer.setName(data.getName());
				customer.setContactNumber(data.getPhone());
				customer.setSmsOk(data.isSmsOk());
				Address address = customer.getAddress();
				if (address == null) {
					address = new Address();
					customer.setAddress(address);
				}
				address.setStreet1(data.getStreet1());
				address.setStreet2(data.getStreet2());
				address.setCity(data.getCity());
				address.setState(data.getState());
				address.setZip(data.getZip());
				customerDAO.saveOrUpdate(customer);
				return true;
			}
		}
		return false;
	}

	/**
	 * Update data for restaurant.
	 *
	 * @param restaurantID the restaurant id
	 * @param data the data
	 * @return true, if successful
	 */
	private boolean updateDataForRestaurant(Integer restaurantID,
			RegistrationData data) {
		if (data != null) {
			Restaurant restaurant = restaurantDAO.findById(restaurantID);
			if (restaurant != null) {
				restaurant.setName(data.getRestaurantName());
				restaurant.setCuisineType(data.getCuisineType());
				restaurant.setWebsiteUrl(data.getUrl());
				restaurant.setContactNumber(data.getPhone());
				Address address = restaurant.getAddress();
				if (address == null) {
					address = new Address();
					restaurant.setAddress(address);
				}
				address.setStreet1(data.getStreet1());
				address.setStreet2(data.getStreet2());
				address.setCity(data.getCity());
				address.setState(data.getState());
				address.setZip(data.getZip());
				restaurantDAO.saveOrUpdate(restaurant);
				return true;
			}
		}
		return false;
	}
}
