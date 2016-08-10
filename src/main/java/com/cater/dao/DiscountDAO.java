package com.cater.dao;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import com.cater.model.Discount;

/**
 * The Class DiscountDAO.
 */
@Component
public class DiscountDAO extends DataAccessObject {
	/** The Constant logger. */
	private static final Logger logger = Logger.getLogger(DiscountDAO.class);

	/**
	 * Save or update.
	 *
	 * @param discount the discount
	 * @return true, if successful
	 */
	public boolean saveOrUpdate(Discount discount) {
		if (discount == null) {
			logger.error("Cannot save null value for discount.");
			return false;
		}
		else {
			if (discount.getId() == null) {
				return super.save(Discount.class, discount);
			}
			else {
				return super.update(Discount.class, discount);
			}
		}
	}

	/**
	 * Find by id.
	 *
	 * @param id the id
	 * @return the discount
	 */
	public Discount findById(Integer id) {
		return super.findById(Discount.class, id);
	}

	/**
	 * Delete discount.
	 *
	 * @param discount the discount
	 */
	public void deleteDiscount(Discount discount) {
		logger.debug("Deleting discount with id: " + discount.getId());
		super.delete(Discount.class, discount.getId());
	}
}
