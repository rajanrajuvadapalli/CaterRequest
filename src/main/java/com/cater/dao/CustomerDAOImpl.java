package com.cater.dao;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;
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

	@Override
	public Customer findByLoginID(int loginID) {
		Customer customer = null;
		logger.debug("Finding Customer with login ID: " + loginID);
		Session session = null;
		Transaction tx = null;
		try {
			session = getSessionFactory().openSession();
			tx = session.beginTransaction();
			List<?> list = session
					.createCriteria(Customer.class, "cus")
					.createAlias("cus.login", "login", JoinType.LEFT_OUTER_JOIN)
					.add(Restrictions.eq("login.id", new Integer(loginID)))
					.list();
			if (CollectionUtils.isNotEmpty(list)) {
				customer = (Customer) list.iterator().next();
				logger.debug("Found Customer with login ID: " + loginID);
			}
			tx.rollback();
			return customer;
		}
		catch (HibernateException he) {
			logger.error(
					"Exception occurred while Finding Customer with login ID: "
							+ loginID, he);
			throw he;
		}
		finally {
			if (session != null) {
				session.close();
			}
		}
	}
}
