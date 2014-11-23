package com.cater.dao;

import org.springframework.stereotype.Component;

import com.cater.model.Address;

/**
 * Description: 
 * Created: Nov 22, 2014
 * @author Hari 
 */
@Component
public class AddressDAOImpl extends AbstractDAOImpl implements AddressDAO {
	//private static final Logger logger = Logger.getLogger(AddressDAOImpl.class);
	@Override
	public boolean save(Address address) {
		return super.save(Address.class, address);
	}

	@Override
	public Address findById(int id) {
		return super.findById(Address.class, id);
	}
}
