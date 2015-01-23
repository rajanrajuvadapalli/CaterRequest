package com.cater.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cater.model.Event;

@Component
public class EventDAO extends DataAccessObject {
	private static final Logger logger = Logger.getLogger(EventDAO.class);
	@Autowired
	private AddressDAO addressDAO;

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

	public Event findById(Integer id) {
		return super.findById(Event.class, id);
	}

	@SuppressWarnings("unchecked")
	public List <Event> findByCustomerID(Integer customerID) {
		if (customerID == null) {
			return null;
		}
		logger.debug("Finding Event with customer ID: " + customerID);
		Session session = null;
		Transaction tx = null;
		try {
			session = getSessionFactory().openSession();
			tx = session.beginTransaction();
			List <Event> list = (List <Event>) session
					.createCriteria(Event.class, "event")
					.createAlias("event.customer", "customer",
							JoinType.LEFT_OUTER_JOIN)
					.add(Restrictions
							.eq("customer.id", new Integer(customerID))).list();
			tx.rollback();
			return list;
		}
		catch (HibernateException he) {
			logger.error(
					"Exception occurred while Finding Event with customer ID: "
							+ customerID, he);
			throw he;
		}
		finally {
			if (session != null) {
				session.close();
			}
		}
	}

	public List <Event> fetchAllEvents() {
		return super.fetchAll(Event.class);
	}
}
