package com.cater.dao;

import java.util.List;

import com.cater.model.Quote;

public interface QuoteDAO {
	boolean save(Quote quote);

	Quote findById(int id);

	List<Quote> findQuotesWithEventId(int eventID);
}
