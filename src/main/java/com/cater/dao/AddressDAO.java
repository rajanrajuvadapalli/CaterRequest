package com.cater.dao;

import org.springframework.stereotype.Component;

import com.cater.model.Address;

/**
 * Description: 
 * Created: Nov 22, 2014
 * @author Hari 
 */
@Component
public class AddressDAO extends AbstractDAO {
	//private static final Logger logger = Logger.getLogger(AddressDAOImpl.class);
	public boolean save(Address address) {
		return super.save(Address.class, address);
	}

	public Address findById(int id) {
		return super.findById(Address.class, id);
	}
}
