package com.cater.dao;

import java.util.List;

import com.cater.model.Restaurant;

/**
 * Description: 
 * @since Nov 23, 2014
 * @author Hari 
 */
public interface RestaurantDAO {
	boolean save(Restaurant restaurant);

	Restaurant findById(int id);

	Restaurant findByLoginID(int loginID);

	List<Restaurant> fetchAllRestaurants();

	List<Restaurant> fetchRestaurantsOfType(String cuisine);
}
