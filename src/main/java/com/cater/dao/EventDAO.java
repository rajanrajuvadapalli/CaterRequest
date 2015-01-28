package com.cater.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cater.model.Event;

/**
 * The Class EventDAO.
 */
@Component
public class EventDAO extends DataAccessObject {
	/** The Constant logger. */
	private static final Logger logger = Logger.getLogger(EventDAO.class);
	/** The address dao. */
	@Autowired
	private AddressDAO addressDAO;

	/**
	 * Save or update.
	 *
	 * @param event the event
	 * @return true, if successful
	 */
	public boolean saveOrUpdate(Event event) {
		if (event == null) {
			logger.error("Cannot save null value for Event.");
		}
		else if (event.getLocation() == null) {
			logger.error("Location address cannot be empty for Event.");
		}
		else {
			addressDAO.saveOrUpdate(event.getLocation());
			if (event.getId() == null) {
				return super.save(Event.class, event);
			}
			else {
				return super.update(Event.class, event);
			}
		}
		return false;
	}

	/**
	 * Find by id.
	 *
	 * @param id the id
	 * @return the event
	 */
	public Event findById(Integer id) {
		return super.findById(Event.class, id);
	}

	/**
	 * Find by customer id.
	 *
	 * @param customerID the customer id
	 * @return the list
	 */
	@SuppressWarnings("unchecked")
	public List<Event> findByCustomerID(Integer customerID) {
		if (customerID == null) {
			return null;
		}
		logger.debug("Finding Event with customer ID: " + customerID);
		try {
			Session session = getSessionFactory().getCurrentSession();
			List<Event> list = (List<Event>) session
					.createCriteria(Event.class, "event")
					.createAlias("event.customer", "customer",
							JoinType.LEFT_OUTER_JOIN)
					.add(Restrictions
							.eq("customer.id", new Integer(customerID))).list();
			return list;
		}
		catch (HibernateException he) {
			logger.error(
					"Exception occurred while Finding Event with customer ID: "
							+ customerID, he);
			throw he;
		}
	}

	/**
	 * Fetch all events.
	 *
	 * @return the list
	 */
	public List<Event> fetchAllEvents() {
		return super.fetchAll(Event.class);
	}

	/**
	 * Gets the number of events.
	 *
	 * @return the number of events
	 */
	public int getNumberOfEvents() {
		logger.debug("Finding number of events.");
		try {
			Session session = getSessionFactory().getCurrentSession();
			Query q = session.createQuery("select count(*) from Event");
			return ((Long) q.uniqueResult()).intValue();
		}
		catch (HibernateException he) {
			logger.error("Exception occurred while Finding number of events.",
					he);
			return 0;
		}
	}
}
