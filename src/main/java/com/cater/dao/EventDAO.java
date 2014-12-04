package com.cater.dao;

import java.util.List;

import com.cater.model.Event;

public interface EventDAO {
	boolean save(Event event);

	Event findById(int id);

	Event findByCustomerID(int customerID);

	List<Event> fetchAllEvents();
}
