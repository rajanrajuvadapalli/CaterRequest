package com.cater.dao;

import com.cater.model.Customer;

/**
 * Description: 
 * Created: Nov 22, 2014
 * @author Hari 
 */
public interface CustomerDAO {
	boolean save(Customer customer);

	Customer findById(int id);

	Customer findByLoginID(int loginID);
}
