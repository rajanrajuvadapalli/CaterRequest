package com.cater.dao;

import com.cater.model.Address;

/**
 * Description: 
 * Created: Nov 22, 2014
 * @author Hari 
 */
public interface AddressDAO {
	boolean save(Address address);

	Address findById(int id);
}
