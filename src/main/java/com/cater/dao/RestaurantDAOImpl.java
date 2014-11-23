package com.cater.dao;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cater.model.Restaurant;

/**
 * Description: 
 * Created: Nov 23, 2014
 * @author Hari 
 */
@Component
public class RestaurantDAOImpl extends AbstractDAOImpl implements RestaurantDAO {
	private static final Logger logger = Logger
			.getLogger(RestaurantDAOImpl.class);
	@Autowired
	private LoginDAO loginDAO;
	@Autowired
	private AddressDAO addressDAO;

	@Override
	public boolean save(Restaurant restaurant) {
		if (restaurant == null) {
			logger.error("Cannot save null value for Restaurant.");
		}
		else {
			loginDAO.save(restaurant.getLogin());
			addressDAO.save(restaurant.getAddress());
			return super.save(Restaurant.class, restaurant);
		}
		return false;
	}

	@Override
	public Restaurant findById(int id) {
		return super.findById(Restaurant.class, id);
	}
}
