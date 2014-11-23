package com.cater.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * Description: 
 * Created: Nov 23, 2014
 * @author Hari 
 */
@Component
public class DAOTestHelper {
	@Autowired
	private AddressDAOImplTest addressDAOImplTest;
	@Autowired
	private LoginDAOImplTest loginDAOImplTest;
	@Autowired
	private CustomerDAOImplTest customerDAOImplTest;

	public void clearTables() {
		customerDAOImplTest.clearCustomerTable();
		addressDAOImplTest.clearAddressTable();
		loginDAOImplTest.clearLoginTable();
	}
}
