package com.cater.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import com.cater.model.Quote;

@Component
public class QuoteDAOImpl extends AbstractDAOImpl implements QuoteDAO {
	private static final Logger logger = Logger.getLogger(QuoteDAOImpl.class);

	@Override
	public boolean save(Quote quote) {
		return super.save(Quote.class, quote);
	}

	@Override
	public Quote findById(int id) {
		return super.findById(Quote.class, id);
	}

	@Override
	public Quote findByEventID(int eventID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Quote findByRestaurantID(int restaurantID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Quote> fetchAllQuotes() {
		// TODO Auto-generated method stub
		return null;
	}
}
