package com.cater.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cater.dao.CustomerDAO;
import com.cater.dao.EventDAO;
import com.cater.dao.MenuDAO;
import com.cater.model.Customer;
import com.cater.model.Event;
import com.cater.model.Menu;

@Component
public class CustomerService {
	@Autowired
	private CustomerDAO customerDAO;
	@Autowired
	private EventDAO eventDAO;
	@Autowired
	private MenuDAO menuDAO;

	public List<Customer> fetchAllCustomers() {
		return customerDAO.fetchAllCustomers();
	}

	public Customer findCustomerWithLoginId(int loginID) {
		return customerDAO.findByLoginID(loginID);
	}

	public boolean saveOrUpdateEvent(Event e) {
		return eventDAO.saveOrUpdate(e);
	}

	public List<Event> fetchAllEvents() {
		return eventDAO.fetchAllEvents();
	}

	public Event findEventWithId(int eventId) {
		return eventDAO.findById(eventId);
	}

	public Menu findMenuWithId(int menuId) {
		return menuDAO.findById(menuId);
	}

	public boolean saveOrUpdateMenu(Menu m) {
		return menuDAO.saveOrUpdate(m);
	}

	public List<Menu> findMenusWithEventId(int eventId) {
		return menuDAO.findMenusWithEventId(eventId);
	}
}
