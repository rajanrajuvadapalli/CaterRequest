package com.cater.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cater.model.Customer;
import com.cater.model.CustomerSearch;
import com.cater.model.Event;
import com.cater.model.Menu;
import com.cater.model.Quote;
import com.cater.model.Restaurant;
import com.google.common.collect.Maps;

/**
 * Description:.
 *
 * @since Nov 22, 2014
 * 
 */
@Component
public class CustomerDAO extends DataAccessObject {
	/** The Constant logger. */
	private static final Logger logger = Logger.getLogger(CustomerDAO.class);
	/** The login dao. */
	@Autowired
	private LoginDAO loginDAO;
	/** The address dao. */
	@Autowired
	private AddressDAO addressDAO;

	/**
	 * Save or update.
	 *
	 * @param customer the customer
	 * @return true, if successful
	 */
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

	/**
	 * Find by id.
	 *
	 * @param id the id
	 * @return the customer
	 */
	public Customer findById(Integer id) {
		return super.findById(Customer.class, id);
	}

	/**
	 * Find by login id.
	 *
	 * @param loginID the login id
	 * @return the customer
	 */
	public Customer findByLoginID(Integer loginID) {
		if (loginID == null) {
			return null;
		}
		Customer customer = null;
		logger.debug("Finding Customer with login ID: " + loginID);
		try {
			Session session = getSessionFactory().getCurrentSession();
			List <?> list = session
					.createCriteria(Customer.class, "cus")
					.createAlias("cus.login", "login", JoinType.LEFT_OUTER_JOIN)
					.add(Restrictions.eq("login.id", loginID)).list();
			if (CollectionUtils.isNotEmpty(list)) {
				customer = (Customer) list.iterator().next();
				logger.debug("Found Customer with login ID: " + loginID);
			}
			return customer;
		}
		catch (HibernateException he) {
			logger.error(
					"Exception occurred while Finding Customer with login ID: "
							+ loginID, he);
			throw he;
		}
	}

	/**
	 * Fetch all customers.
	 *
	 * @return the list
	 */
	public List <Customer> fetchAllCustomers() {
		return super.fetchAll(Customer.class);
	}

	/**
	 * Gets the number of customers.
	 *
	 * @return the number of customers
	 */
	public int getNumberOfCustomers() {
		logger.debug("Finding number of customers.");
		try {
			Session session = getSessionFactory().getCurrentSession();
			Query q = session.createQuery("select count(*) from Customer");
			return ((Long) q.uniqueResult()).intValue();
		}
		catch (HibernateException he) {
			logger.error(
					"Exception occurred while Finding number of customers.", he);
			return 0;
		}
	}
	
	

	@SuppressWarnings("unchecked")
	public Map <Integer, String> sparseDownloadMyEvents(Integer customerID) {
		logger.debug("Downloading sparse event details for customer with ID "
				+ customerID);
		Map <Integer, String> result = Maps.newHashMap();
		try {
			Session session = getSessionFactory().getCurrentSession();
			List <SparseEvent> list = session
					.createCriteria(Event.class, "e")
					.createAlias("e.customer", "c", JoinType.RIGHT_OUTER_JOIN)
					.add(Restrictions.eq("c.id", customerID))
					.setProjection(
							Projections
									.projectionList()
									.add(Projections.property("e.id"), "id")
									.add(Projections.property("e.name"), "name"))
					.setResultTransformer(
							Transformers.aliasToBean(SparseEvent.class)).list();
			for (SparseEvent se : list) {
				result.put(se.id, se.name);
			}
			//Following code also works.
			/*List <Object[]> list = session
					.createCriteria(Event.class, "e")
					.createAlias("e.customer", "c", JoinType.RIGHT_OUTER_JOIN)
					.add(Restrictions.eq("c.id", customerID))
					.setProjection(
							Projections.projectionList()
									.add(Projections.property("e.id"))
									.add(Projections.property("e.name")))
					.list();
			for (Object[] o : list) {
				result.put((Integer) o[0], (String) o[1]);
			}*/
		}
		catch (HibernateException he) {
			logger.error(
					"Exception occurred while downloading sparse event details for customer.",
					he);
		}
		return result;
	}

	public static class SparseEvent {
		private Integer id;
		private String name;
	}
/*	public static class CustomerSearch {
		private Integer userId;
		public Integer getUserId() {
			return userId;
		}
		public void setUserId(Integer userId) {
			this.userId = userId;
		}
		private String  customerName;
		private String  contactNumber;
		private boolean smsIndicator;
		private String eventName;
		
		
	}*/
	
	/* for customer search*/
	@SuppressWarnings("unchecked")
	public List getCustomerInfo(String customerName){
		
	
		logger.debug("Finding number of customers.");
		
		Session session = getSessionFactory().getCurrentSession();
	
		Criteria c = session.createCriteria(Quote.class,"q")
				.createAlias("q.restaurant", "r")
				.createAlias("q.menu","m")
				.createAlias("m.event","e")
				.createAlias("e.location", "l")
				.createAlias("e.customer","c")
				.createAlias("c.login", "login")
				.add(Restrictions.eq("login.username",customerName))
				.setProjection(
						Projections
								.projectionList()
								.add(Projections.property("c.id"), "userId")
								.add(Projections.property("c.name"), "customerName")
								.add(Projections.property("c.contactNumber"), "contactNumber")
								.add(Projections.property("c.smsOk"), "smsIndicator")
								.add(Projections.property("c.contactEmail"), "customerEmail")
								.add(Projections.property("e.name"), "eventName")
								.add(Projections.property("r.name"), "restaurantName")
								.add(Projections.property("l.street1"), "eventStreet1")
								.add(Projections.property("l.street2"), "eventStreet2")
								.add(Projections.property("l.city"), "eventCity")
								.add(Projections.property("l.state"), "eventState")
								.add(Projections.property("l.zip"), "eventZip")
								.add(Projections.property("q.price"), "price")
					       	.add(Projections.property("e.date_time"), "date_time")).
					       	setResultTransformer(
						Transformers.aliasToBean(CustomerSearch.class));
		List<CustomerSearch>  customerList =c.list();
	
			
			return customerList;
		
		//return customerList;
	}
	/* for customer search*/
	@SuppressWarnings("unchecked")
	public List getCustomerInfoByDateRange(Date fromDate, Date toDate){
		
	
		logger.debug("Finding number of customers.");
		
		Session session = getSessionFactory().getCurrentSession();
	
		Criteria c = session.createCriteria(Quote.class,"q")
				.createAlias("q.restaurant", "r")
				.createAlias("q.menu","m")
				.createAlias("m.event","e")
				.createAlias("e.location", "l")
				.createAlias("e.customer","c")
				.createAlias("c.login", "login")
				.add(Restrictions.between("e.date_time",fromDate, toDate))
				.setProjection(
						Projections
								.projectionList()
								.add(Projections.property("c.id"), "userId")
								.add(Projections.property("c.name"), "customerName")
								.add(Projections.property("c.contactNumber"), "contactNumber")
								.add(Projections.property("c.smsOk"), "smsIndicator")
								.add(Projections.property("c.contactEmail"), "customerEmail")
								.add(Projections.property("e.name"), "eventName")
								.add(Projections.property("r.name"), "restaurantName")
								.add(Projections.property("l.street1"), "eventStreet1")
								.add(Projections.property("l.street2"), "eventStreet2")
								.add(Projections.property("l.city"), "eventCity")
								.add(Projections.property("l.state"), "eventState")
								.add(Projections.property("l.zip"), "eventZip")
								.add(Projections.property("q.price"), "price")
					       	.add(Projections.property("e.date_time"), "date_time")).
					       	setResultTransformer(
						Transformers.aliasToBean(CustomerSearch.class));
		List<CustomerSearch>  customerList =c.list();
	 
		return customerList;
		
	}
}
