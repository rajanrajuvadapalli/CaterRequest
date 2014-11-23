package com.cater.dao;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cater.model.Customer;

/**
 * Description: 
 * Created: Nov 22, 2014
 * @author Hari 
 */
@Component
public class CustomerDAOImpl extends AbstractDAOImpl implements CustomerDAO {
	private static final Logger logger = Logger
			.getLogger(CustomerDAOImpl.class);
	@Autowired
	private LoginDAO loginDAO;
	@Autowired
	private AddressDAO addressDAO;

	@Override
	public boolean save(Customer customer) {
		if (customer == null) {
			logger.error("Cannot save null value for Customer.");
		}
		else {
			loginDAO.save(customer.getLogin());
			addressDAO.save(customer.getAddress());
			return super.save(Customer.class, customer);
		}
		return false;
	}

	@Override
	public Customer findById(int id) {
		return super.findById(Customer.class, id);
	}
}
