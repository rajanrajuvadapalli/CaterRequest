package com.cater.service;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cater.Helper;
import com.cater.constants.Roles;
import com.cater.dao.AddressDAO;
import com.cater.dao.CustomerDAO;
import com.cater.dao.LoginDAO;
import com.cater.dao.RestaurantBranchDAO;
import com.cater.model.Address;
import com.cater.model.Customer;
import com.cater.model.Login;
import com.cater.model.Restaurant;
import com.cater.model.RestaurantBranch;
import com.cater.ui.data.RegistrationData;

/**
 * Description: I save the registration data entered on the signup form to the database.
 * @since Nov 23, 2014
 *  
 */
@Component
public class RegisterService {
	/** The login dao. */
	@Autowired
	private LoginDAO loginDAO;
	/** The address dao. */
	@Autowired
	private AddressDAO addressDAO;
	/** The customer dao. */
	@Autowired
	private CustomerDAO customerDAO;
	/** The restaurant branch dao. */
	@Autowired
	private RestaurantBranchDAO restaurantBranchDAO;

	/**
	 * Determine user role.
	 *
	 * @param data the data
	 * @return the roles
	 */
	private Roles determineUserRole(RegistrationData data) {
		if (StringUtils.isNotBlank(data.getRestaurantName())) {
			return Roles.RESTAURANT;
		}
		return Roles.CUSTOMER;
	}

	/**
	 * Register.
	 *
	 * @param data the data
	 * @return the login
	 */
	public Login register(RegistrationData data) {
		Roles role = determineUserRole(data);
		Login login = saveLoginData(data, role);
		Address address = saveAddressData(data);
		saveUserData(data, role, login, address);
		return login;
	}

	/**
	 * Save address data.
	 *
	 * @param data the data
	 * @return the address
	 */
	private Address saveAddressData(RegistrationData data) {
		Address address = new Address();
		address.setStreet1(data.getStreet1());
		address.setStreet2(data.getStreet2());
		address.setCity(data.getCity());
		address.setState(data.getState());
		String zip = StringUtils.remove(
				StringUtils.defaultString(data.getZip()), "-");
		address.setZip(zip);
		addressDAO.saveOrUpdate(address);
		return address;
	}

	/**
	 * Save login data.
	 *
	 * @param data the data
	 * @param role the role
	 * @return the login
	 */
	public Login saveLoginData(RegistrationData data, Roles role) {
		Login login = new Login();
		login.setUsername(data.getEmail());
		login.setPassword(data.getPassword());
		login.setRole(role.toString());
		login.setActive(false);//deafult is inactive. User has to confirm his/her email to be active.
		loginDAO.saveOrUpdate(login);
		return login;
	}

	/**
	 * Save user data.
	 *
	 * @param data the data
	 * @param role the role
	 * @param login the login
	 * @param address the address
	 */
	private void saveUserData(RegistrationData data, Roles role, Login login,
			Address address) {
		if (Roles.CUSTOMER == role) {
			Customer customer = new Customer();
			customer.setLogin(login);
			customer.setAddress(address);
			customer.setName(data.getName());
			customer.setContactNumber(data.getPhone());
			customer.setSmsOk(data.isSmsOk());
			customer.setContactEmail(data.getEmail());
			customerDAO.saveOrUpdate(customer);
		}
		else if (Roles.RESTAURANT == role) {
			Restaurant restaurant = new Restaurant();
			restaurant.setName(data.getRestaurantName());
			restaurant.setLogin(login);
			restaurant.setCuisineType(data.getCuisineType());
			restaurant.setWebsiteUrl(data.getUrl());
			restaurant.setAboutUs(data.getAboutUs());
			RestaurantBranch branch = new RestaurantBranch();
			branch.setAddress(address);
			branch.setContactNumber(data.getPhone());
			branch.setContactEmail(data.getEmail());
			branch.setDeliverMiles(Helper.stringToInteger(data
					.getDeliverMiles()));
			branch.setSalesTax(data.getSalesTax());
			branch.setRestaurant(restaurant);
			restaurantBranchDAO.saveOrUpdateBranch(branch);
		}
	}

	/**
	 * Save new restaurant branch.
	 *
	 * @param data the data
	 * @param restaurant the restaurant
	 * @return true, if successful
	 */
	public boolean saveNewRestaurantBranch(RegistrationData data,
			Restaurant restaurant) {
		Address address = saveAddressData(data);
		RestaurantBranch branch = new RestaurantBranch();
		branch.setAddress(address);
		branch.setContactNumber(data.getPhone());
		branch.setContactEmail(data.getEmail());
		branch.setDeliverMiles(Helper.stringToInteger(data.getDeliverMiles()));
		branch.setSalesTax(data.getSalesTax());
		branch.setRestaurant(restaurant);
		return restaurantBranchDAO.saveOrUpdateBranch(branch);
	}

	/**
	 * Activate user.
	 *
	 * @param login the login
	 */
	public void activateUser(Login login) {
		login.setActive(true);
		loginDAO.update(Login.class, login);
	}
}
