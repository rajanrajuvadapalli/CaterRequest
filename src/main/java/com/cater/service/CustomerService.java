package com.cater.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cater.dao.CustomerDAO;
import com.cater.dao.EventDAO;
import com.cater.dao.QuoteDAO;
import com.cater.model.Customer;
import com.cater.model.Event;
import com.cater.model.Quote;

@Component
public class CustomerService {
	@Autowired
	private CustomerDAO customerDAO;
	@Autowired
	private EventDAO eventDAO;
	@Autowired
	private QuoteDAO quoteDAO;

	public List<Customer> fetchAllCustomers() {
		return customerDAO.fetchAllCustomers();
	}

	public Customer fetchCustomerWithLoginId(int loginID) {
		return customerDAO.findByLoginID(loginID);
	}

	public boolean saveEvent(Event e) {
		return eventDAO.save(e);
	}

	public boolean saveQuote(Quote q) {
		return quoteDAO.save(q);
	}

	public Event fetchEventWithId(int eventId) {
		return eventDAO.findById(eventId);
	}
}
