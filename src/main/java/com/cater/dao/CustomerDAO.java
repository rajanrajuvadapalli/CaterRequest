package com.cater.dao;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cater.model.Customer;

/**
 * Description: 
 * @since Nov 22, 2014
 * @author Hari 
 */
@Component
public class CustomerDAO extends DataAccessObject {
	private static final Logger logger = Logger.getLogger(CustomerDAO.class);
	@Autowired
	private LoginDAO loginDAO;
	@Autowired
	private AddressDAO addressDAO;

	public boolean saveOrUpdate(Customer customer) {
		if (customer == null) {
			logger.error("Cannot save null value for Customer.");
		}
		else {
			loginDAO.saveOrUpdate(customer.getLogin());
			addressDAO.saveOrUpdate(customer.getAddress());
			if (customer.getId() == null) {
				return super.save(Customer.class, customer);
			}
			else {
				return super.update(Customer.class, customer);
			}
		}
		return false;
	}

	public Customer findById(Integer id) {
		return super.findById(Customer.class, id);
	}

	public Customer findByLoginID(Integer loginID) {
		if (loginID == null) {
			return null;
		}
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
					.add(Restrictions.eq("login.id", loginID)).list();
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

	/**
	 * Fetch all customers.
	 *
	 * @return the list
	 */
	public List<Customer> fetchAllCustomers() {
		return super.fetchAll(Customer.class);
	}

	/**
	 * Gets the number of customers.
	 *
	 * @return the number of customers
	 */
	public int getNumberOfCustomers() {
		logger.debug("Finding number of customers.");
		Session session = null;
		try {
			session = getSessionFactory().openSession();
			Query q = session.createQuery("select count(*) from Customer");
			return ((Long) q.uniqueResult()).intValue();
		}
		catch (HibernateException he) {
			logger.error(
					"Exception occurred while Finding number of customers.", he);
			return 0;
		}
		finally {
			if (session != null) {
				session.close();
			}
		}
	}
}
