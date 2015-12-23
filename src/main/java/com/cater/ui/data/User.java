package com.cater.ui.data;

import com.cater.constants.Roles;
import com.cater.model.Customer;
import com.cater.model.Restaurant;

/**
 * The Class User. I store session data for the current user.
 */
public class User {
	private int loginID;
	private int customerID;
	private int restaurantID;
	private String username;
	private String name;
	private Roles role;
	private RegistrationData data;
	private Customer customer;
	private Restaurant restaurant;
	private boolean isGuest = false;

	public int getLoginID() {
		return loginID;
	}

	public void setLoginID(int loginID) {
		this.loginID = loginID;
	}

	public int getCustomerID() {
		return customerID;
	}

	public void setCustomerID(int customerID) {
		this.customerID = customerID;
	}

	public int getRestaurantID() {
		return restaurantID;
	}

	public void setRestaurantID(int restaurantID) {
		this.restaurantID = restaurantID;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Roles getRole() {
		return role;
	}

	public void setRole(Roles role) {
		this.role = role;
	}

	public RegistrationData getData() {
		return data;
	}

	public void setData(RegistrationData data) {
		this.data = data;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Restaurant getRestaurant() {
		return restaurant;
	}

	public void setRestaurant(Restaurant restaurant) {
		this.restaurant = restaurant;
	}

	public boolean isGuest() {
		return isGuest;
	}

	public void setGuest(boolean isGuest) {
		this.isGuest = isGuest;
	}
}
