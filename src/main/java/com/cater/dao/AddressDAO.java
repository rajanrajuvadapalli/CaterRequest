package com.cater.dao;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import com.cater.model.Address;

/**
 * Description: 
 * @since Nov 22, 2014
 * @author Hari 
 */
@Component
public class AddressDAO extends AbstractDAO {
	private static final Logger logger = Logger.getLogger(AddressDAO.class);

	public boolean saveOrUpdate(Address address) {
		if (address == null) {
			logger.error("Cannot save null value for Address.");
			return false;
		}
		else {
			Address existingObject = findById(address.getId());
			if (existingObject == null) {
				return super.save(Address.class, address);
			}
			else {
				return super.update(Address.class, address);
			}
		}
	}

	public Address findById(int id) {
		return super.findById(Address.class, id);
	}
}
