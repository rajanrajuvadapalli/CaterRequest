package com.cater.service;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cater.Helper;
import com.cater.constants.Roles;
import com.cater.dao.AddressDAO;
import com.cater.dao.CustomerDAO;
import com.cater.dao.LoginDAO;
import com.cater.dao.RestaurantDAO;
import com.cater.model.Address;
import com.cater.model.Customer;
import com.cater.model.Login;
import com.cater.model.Restaurant;
import com.cater.ui.data.RegistrationData;

/**
 * Description: I save the registration data entered on the signup form to the database.
 * @since Nov 23, 2014
 *  
 */
@Component
public class RegisterService {
	@Autowired
	private LoginDAO loginDAO;
	@Autowired
	private AddressDAO addressDAO;
	@Autowired
	private CustomerDAO customerDAO;
	@Autowired
	private RestaurantDAO restaurantDAO;

	private Roles determineUserRole(RegistrationData data) {
		if (StringUtils.isNotBlank(data.getRestaurantName())) {
			return Roles.RESTAURANT;
		}
		return Roles.CUSTOMER;
	}

	public Login register(RegistrationData data) {
		Roles role = determineUserRole(data);
		Login login = saveLoginData(data, role);
		Address address = saveAddressData(data);
		saveUserData(data, role, login, address);
		return login;
	}

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

	public Login saveLoginData(RegistrationData data, Roles role) {
		Login login = new Login();
		login.setUsername(data.getEmail());
		login.setPassword(data.getPassword());
		login.setRole(role.toString());
		login.setActive(false);//deafult is inactive. User has to confirm his/her email to be active.
		loginDAO.saveOrUpdate(login);
		return login;
	}

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
			restaurant.setAddress(address);
			restaurant.setLogin(login);
			restaurant.setContactNumber(data.getPhone());
			restaurant.setContactEmail(data.getEmail());
			restaurant.setCuisineType(data.getCuisineType());
			restaurant.setWebsiteUrl(data.getUrl());
			restaurant.setDeliverMiles(Helper.stringToInteger(data
					.getDeliverMiles()));
			restaurant.setAboutUs(data.getAboutUs());
			restaurant.setSalesTax(data.getSalesTax());
			restaurant.setNumberVerified(data.isNumberVerified());
			restaurantDAO.saveOrUpdate(restaurant);
		}
	}

	public void activateUser(Login login) {
		login.setActive(true);
		loginDAO.update(Login.class, login);
	}

	public void saveNewRestaurantBranch(RegistrationData data, Login login) {
		Address address = saveAddressData(data);
		saveUserData(data, Roles.RESTAURANT, login, address);
	}
}
