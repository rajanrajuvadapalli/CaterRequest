package com.cater.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cater.dao.CustomerDAO;
import com.cater.model.Customer;

@Component
public class CustomerService {
	@Autowired
	private CustomerDAO customerDAO;

	public List<Customer> fetchAllCustomers() {
		return customerDAO.fetchAllCustomers();
	}
}
