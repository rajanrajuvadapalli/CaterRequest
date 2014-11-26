package com.cater.dao;

import com.cater.model.Restaurant;

/**
 * Description: 
 * Created: Nov 23, 2014
 * @author Hari 
 */
public interface RestaurantDAO {
	boolean save(Restaurant restaurant);

	Restaurant findById(int id);

	Restaurant findByLoginID(int loginID);
}
