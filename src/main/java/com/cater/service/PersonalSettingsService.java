/*
 * 
 */
package com.cater.service;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cater.Helper;
import com.cater.constants.Roles;
import com.cater.dao.CustomerDAO;
import com.cater.dao.RestaurantBranchDAO;
import com.cater.dao.RestaurantDAO;
import com.cater.model.Address;
import com.cater.model.Customer;
import com.cater.model.Restaurant;
import com.cater.model.RestaurantBranch;
import com.cater.ui.data.RegistrationData;

/**
 * The Class PersonalSettingsService.
 */
@Component
public class PersonalSettingsService {
	private static final Logger logger = Logger
			.getLogger(PersonalSettingsService.class);
	/** The customer dao. */
	@Autowired
	private CustomerDAO customerDAO;
	/** The restaurant dao. */
	@Autowired
	private RestaurantDAO restaurantDAO;
	/** The restaurant branch dao. */
	@Autowired
	private RestaurantBranchDAO restaurantBranchDAO;

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
	 * Update data for customer.
	 *
	 * @param customerID the customer id
	 * @param data the data
	 * @return the update result
	 */
	public UpdateResult updateDataForCustomer(Integer customerID,
			RegistrationData data) {
		UpdateResult result = null;
		if (data != null) {
			logger.debug("Updating data for customer with ID: " + customerID);
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
	public UpdateResult updateDataForRestaurant(Integer restaurantID,
			RegistrationData data) {
		UpdateResult result = null;
		if (data != null) {
			logger.debug("Updating data for restaurant with ID: "
					+ restaurantID);
			result = new UpdateResult();
			Restaurant restaurant = restaurantDAO.findById(restaurantID);
			if (restaurant != null) {
				restaurant.setName(data.getRestaurantName());
				restaurant.setCuisineType(data.getCuisineType());
				restaurant.setWebsiteUrl(data.getUrl());
				restaurant.setAboutUs(data.getAboutUs());
				restaurantDAO.saveOrUpdate(restaurant);
				result.setUpdateSuccess(true);
			}
		}
		return result;
	}

	/**
	 * Update data for restaurant branch.
	 *
	 * @param restaurantBranchID the restaurant branch id
	 * @param data the data
	 * @return the update result
	 */
	public UpdateResult updateDataForRestaurantBranch(
			Integer restaurantBranchID, RegistrationData data) {
		UpdateResult result = null;
		RestaurantBranch branch = null;
		if (data != null) {
			logger.debug("Updating data for branch with ID: "
					+ restaurantBranchID);
			result = new UpdateResult();
			if (restaurantBranchID != null
					&& (branch = restaurantBranchDAO
							.findById(restaurantBranchID)) != null) {
				branch.setSalesTax(data.getSalesTax());
				branch.setDeliverMiles(Helper.stringToInteger(data
						.getDeliverMiles()));
				//If the phone number is changed, the restaurant has to re-verify the number.
				String oldNumber = branch.getContactNumber();
				String newNumber = data.getPhone();
				if (StringUtils.isNotBlank(oldNumber)
						&& !StringUtils.equals(
								Helper.extractJust10digitNumber(oldNumber),
								Helper.extractJust10digitNumber(newNumber))) {
					result.setPhoneNumberUpdated(true);
					branch.setNumberVerified(false);
				}
				branch.setContactNumber(data.getPhone());
				Address address = branch.getAddress();
				if (address == null) {
					address = new Address();
					branch.setAddress(address);
				}
				address.setStreet1(data.getStreet1());
				address.setStreet2(data.getStreet2());
				address.setCity(data.getCity());
				address.setState(data.getState());
				address.setZip(data.getZip());
				restaurantBranchDAO.saveOrUpdateBranch(branch);
				result.setUpdateSuccess(true);
			}
		}
		return result;
	}
}
