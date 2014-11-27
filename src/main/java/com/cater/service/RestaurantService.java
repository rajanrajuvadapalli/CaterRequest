package com.cater.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cater.dao.RestaurantDAO;
import com.cater.model.Restaurant;

@Component
public class RestaurantService {
	@Autowired
	private RestaurantDAO restaurantDAO;

	public List<Restaurant> fetchAllRestaurants() {
		return restaurantDAO.fetchAllRestaurants();
	}
}
