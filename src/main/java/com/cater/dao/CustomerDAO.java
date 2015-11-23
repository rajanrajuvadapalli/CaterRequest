package com.cater.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cater.model.Customer;
import com.cater.model.CustomerSearch;
import com.cater.model.Event;
import com.cater.model.Quote;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

/**
 * The Class CustomerDAO.
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
	 * @param customer
	 *            the customer
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
	 * @param id
	 *            the id
	 * @return the customer
	 */
	public Customer findById(Integer id) {
		return super.findById(Customer.class, id);
	}

	/**
	 * Find by login id.
	 * 
	 * @param loginID
	 *            the login id
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
	 * Find by customer by contact email.
	 *
	 * @param customerEmail the customer email
	 * @return the customer
	 */
	public Customer findByCustomerByContactEmail(String customerEmail) {
		if (StringUtils.isBlank(customerEmail)) {
			return null;
		}
		Customer customer = null;
		try {
			Session session = getSessionFactory().getCurrentSession();
			List <?> list = session.createCriteria(Customer.class, "cus")
					.add(Restrictions.eq("cus.contactEmail", customerEmail))
					.list();
			if (CollectionUtils.isNotEmpty(list)) {
				customer = (Customer) list.iterator().next();
				logger.debug("Found Customer with email Id: " + customerEmail);
			}
			return customer;
		}
		catch (HibernateException he) {
			logger.error(
					"Exception occurred while Finding Customer with email Id: "
							+ customerEmail, he);
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

	/**
	 * Sparse download my events.
	 *
	 * @param customerID the customer id
	 * @return the map
	 */
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
			// Following code also works.
			/*
			 * List <Object[]> list = session .createCriteria(Event.class, "e")
			 * .createAlias("e.customer", "c", JoinType.RIGHT_OUTER_JOIN)
			 * .add(Restrictions.eq("c.id", customerID)) .setProjection(
			 * Projections.projectionList() .add(Projections.property("e.id"))
			 * .add(Projections.property("e.name"))) .list(); for (Object[] o :
			 * list) { result.put((Integer) o[0], (String) o[1]); }
			 */
		}
		catch (HibernateException he) {
			logger.error(
					"Exception occurred while downloading sparse event details for customer.",
					he);
		}
		return result;
	}

	/**
	 * The Class SparseEvent.
	 */
	public static class SparseEvent {
		/** The id. */
		private Integer id;
		/** The name. */
		private String name;
	}

	/*
	 * public static class CustomerSearch { private Integer userId; public
	 * Integer getUserId() { return userId; } public void setUserId(Integer
	 * userId) { this.userId = userId; } private String customerName; private
	 * String contactNumber; private boolean smsIndicator; private String
	 * eventName;
	 * 
	 * 
	 * }
	 */
	/**
	 * Gets the customer info.
	 *
	 * @param customerName the customer name
	 * @return the customer info
	 */
	/* for customer search */
	@SuppressWarnings("unchecked")
	public List <CustomerSearch> getCustomerInfo(String customerName) {
		logger.debug("Getting customer info by name.");
		Session session = getSessionFactory().getCurrentSession();
		Criteria c = session
				.createCriteria(Quote.class, "q")
				.createAlias("q.restaurant", "r")
				.createAlias("q.menu", "m")
				.createAlias("m.event", "e")
				.createAlias("e.location", "l")
				.createAlias("e.customer", "c")
				.createAlias("c.login", "login")
				.add(Restrictions.eq("login.username", customerName))
				.setProjection(
						Projections
								.projectionList()
								.add(Projections.property("c.id"), "userId")
								.add(Projections.property("c.name"),
										"customerName")
								.add(Projections.property("c.contactNumber"),
										"contactNumber")
								.add(Projections.property("c.smsOk"),
										"smsIndicator")
								.add(Projections.property("c.contactEmail"),
										"customerEmail")
								.add(Projections.property("e.name"),
										"eventName")
								.add(Projections.property("e.id"), "eventId")
								.add(Projections.property("l.street1"),
										"eventStreet1")
								.add(Projections.property("l.street2"),
										"eventStreet2")
								.add(Projections.property("l.city"),
										"eventCity")
								.add(Projections.property("l.state"),
										"eventState")
								.add(Projections.property("l.zip"), "eventZip")
								.add(Projections.property("q.price"), "price")
								.add(Projections.property("e.date_time"),
										"date_time"))
				.setResultTransformer(
						Transformers.aliasToBean(CustomerSearch.class));
		List <CustomerSearch> customerList = c.list();
		return customerList;
		// return customerList;
	}

	/**
	 * Gets the customer info by date range.
	 *
	 * @param fromDate the from date
	 * @param toDate the to date
	 * @return the customer info by date range
	 */
	/* for customer search */
	@SuppressWarnings("unchecked")
	public List <CustomerSearch> getCustomerInfoByDateRange(Date fromDate,
			Date toDate) {
		logger.debug("Getting customer info by date range.");
		Session session = getSessionFactory().getCurrentSession();
		Criteria c = session
				.createCriteria(Quote.class, "q")
				.createAlias("q.restaurant", "r")
				.createAlias("q.menu", "m")
				.createAlias("m.event", "e")
				.createAlias("e.location", "l")
				.createAlias("e.customer", "c")
				.createAlias("c.login", "login")
				.add(Restrictions.between("e.date_time", fromDate, toDate))
				.setProjection(
						Projections
								.projectionList()
								.add(Projections.property("c.id"), "userId")
								.add(Projections.property("c.name"),
										"customerName")
								.add(Projections.property("c.contactNumber"),
										"contactNumber")
								.add(Projections.property("c.smsOk"),
										"smsIndicator")
								.add(Projections.property("c.contactEmail"),
										"customerEmail")
								.add(Projections.property("e.name"),
										"eventName")
								.add(Projections.property("r.name"),
										"restaurantName")
								.add(Projections.property("l.street1"),
										"eventStreet1")
								.add(Projections.property("l.street2"),
										"eventStreet2")
								.add(Projections.property("l.city"),
										"eventCity")
								.add(Projections.property("l.state"),
										"eventState")
								.add(Projections.property("l.zip"), "eventZip")
								.add(Projections.property("q.price"), "price")
								.add(Projections.property("e.date_time"),
										"date_time"))
				.setResultTransformer(
						Transformers.aliasToBean(CustomerSearch.class));
		List <CustomerSearch> customerList = c.list();
		return customerList;
	}

	/**
	 * Fetch upcoming events.
	 *
	 * @param customerId the customer id
	 * @return the list
	 */
	@SuppressWarnings("unchecked")
	public List <Event> fetchUpcomingEvents(Integer customerId) {
		logger.debug("Fetching upcoming events for customer with ID: "
				+ customerId);
		try {
			Session session = getSessionFactory().getCurrentSession();
			List <?> list = session
					.createCriteria(Event.class, "e")
					.createAlias("e.customer", "customer",
							JoinType.LEFT_OUTER_JOIN)
					.add(Restrictions.eq("customer.id", customerId))
					.add(Restrictions.ge("e.date_time", new Date()))
					.addOrder(Order.asc("e.date_time")).list();
			logger.debug("Found " + list.size() + " upcoming events");
			return (List <Event>) list;
		}
		catch (HibernateException he) {
			logger.error(
					"Exception occurred while Fetching upcoming events for customer with ID: "
							+ customerId, he);
		}
		return Lists.newArrayList();
	}

	@SuppressWarnings("unchecked")
	public List <Event> fetchPastEvents(Integer customerId) {
		logger.debug("Fetching past events for customer with ID: "
				+ customerId);
		try {
			Session session = getSessionFactory().getCurrentSession();
			List <?> list = session
					.createCriteria(Event.class, "e")
					.createAlias("e.customer", "customer",
							JoinType.LEFT_OUTER_JOIN)
					.add(Restrictions.eq("customer.id", customerId))
					.add(Restrictions.lt("e.date_time", new Date()))
					.addOrder(Order.desc("e.date_time")).list();
			logger.debug("Found " + list.size() + " past events");
			return (List <Event>) list;
		}
		catch (HibernateException he) {
			logger.error(
					"Exception occurred while Fetching past events for customer with ID: "
							+ customerId, he);
		}
		return Lists.newArrayList();
	}
}
