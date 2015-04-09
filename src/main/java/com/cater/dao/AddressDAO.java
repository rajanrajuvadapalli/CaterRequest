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
public class AddressDAO extends DataAccessObject {
	private static final Logger logger = Logger.getLogger(AddressDAO.class);

	/**
	 * Save or update.
	 *
	 * @param address the address
	 * @return true, if successful
	 */
	public boolean saveOrUpdate(Address address) {
		if (address == null) {
			logger.error("Cannot save null value for Address.");
			return false;
		}
		else {
			if (address.getId() == null) {
				return super.save(Address.class, address);
			}
			else {
				return super.update(Address.class, address);
			}
		}
	}

	public Address findById(Integer id) {
		return super.findById(Address.class, id);
	}
}
