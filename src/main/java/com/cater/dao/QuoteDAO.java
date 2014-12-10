package com.cater.dao;

import java.util.List;

import com.cater.model.Quote;

public interface QuoteDAO {
	boolean save(Quote quote);

	Quote findById(int id);

	Quote findByEventID(int eventID);

	Quote findByRestaurantID(int restaurantID);

	List<Quote> fetchAllQuotes();
}
