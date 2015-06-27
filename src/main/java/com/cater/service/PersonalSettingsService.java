/*
 * 
 */
package com.cater.service;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cater.Helper;
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
	 * @return the update result
	 */
	public UpdateResult updateDataFor(Roles role, Integer customerID,
			Integer restaurantID, RegistrationData data) {
		if (Roles.CUSTOMER == role) {
			return updateDataForCustomer(customerID, data);
		}
		else if (Roles.RESTAURANT == role) {
			return updateDataForRestaurant(restaurantID, data);
		}
		return null;
	}

	/**
	 * Update data for customer.
	 *
	 * @param customerID the customer id
	 * @param data the data
	 * @return the update result
	 */
	private UpdateResult updateDataForCustomer(Integer customerID,
			RegistrationData data) {
		UpdateResult result = null;
		if (data != null) {
			result = new UpdateResult();
			Customer customer = customerDAO.findById(customerID);
			if (customer != null) {
				customer.setName(data.getName());
				//If the phone number is changed, the customer has to re-verify the number.
				String oldNumber = customer.getContactNumber();
				String newNumber = data.getPhone();
				if (StringUtils.isNotBlank(oldNumber)
						&& !StringUtils.equals(
								Helper.extractJust10digitNumber(oldNumber),
								Helper.extractJust10digitNumber(newNumber))) {
					result.setPhoneNumberUpdated(true);
					customer.setNumberVerified(false);
				}
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
				result.setUpdateSuccess(true);
			}
		}
		return result;
	}

	/**
	 * Update data for restaurant.
	 *
	 * @param restaurantID the restaurant id
	 * @param data the data
	 * @return the update result
	 */
	private UpdateResult updateDataForRestaurant(Integer restaurantID,
			RegistrationData data) {
		UpdateResult result = null;
		if (data != null) {
			result = new UpdateResult();
			Restaurant restaurant = restaurantDAO.findById(restaurantID);
			if (restaurant != null) {
				restaurant.setName(data.getRestaurantName());
				restaurant.setCuisineType(data.getCuisineType());
				restaurant.setWebsiteUrl(data.getUrl());
				restaurant.setAboutUs(data.getAboutUs());
				//If the phone number is changed, the restaurant has to re-verify the number.
				String oldNumber = restaurant.getContactNumber();
				String newNumber = data.getPhone();
				if (StringUtils.isNotBlank(oldNumber)
						&& !StringUtils.equals(
								Helper.extractJust10digitNumber(oldNumber),
								Helper.extractJust10digitNumber(newNumber))) {
					result.setPhoneNumberUpdated(true);
					restaurant.setNumberVerified(false);
				}
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
				result.setUpdateSuccess(true);
			}
		}
		return result;
	}
}
