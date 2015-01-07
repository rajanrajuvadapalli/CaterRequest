package com.cater.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cater.dao.QuoteDAO;
import com.cater.dao.RestaurantDAO;
import com.cater.model.Quote;
import com.cater.model.Restaurant;

@Component
public class RestaurantService {
	@Autowired
	private RestaurantDAO restaurantDAO;
	@Autowired
	private QuoteDAO quoteDAO;

	public List<Restaurant> fetchAllRestaurants() {
		return restaurantDAO.fetchAllRestaurants();
	}

	public List<Restaurant> fetchRestaurantsOfType(String cuisine) {
		return restaurantDAO.fetchRestaurantsOfType(cuisine);
	}

	public Restaurant findRestaurantWithId(int restaurantId) {
		return restaurantDAO.findById(restaurantId);
	}

	public Restaurant findRestaurantWithLoginId(int loginID) {
		return restaurantDAO.findByLoginID(loginID);
	}

	public Quote findQuoteWithId(int quoteId) {
		return quoteDAO.findById(quoteId);
	}

	public boolean saveQuote(Quote q) {
		return quoteDAO.save(q);
	}
}
