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

import com.cater.model.Event;

@Component
public class EventDAOImpl extends AbstractDAOImpl implements EventDAO {
	private static final Logger logger = Logger.getLogger(EventDAOImpl.class);
	@Autowired
	private CustomerDAO customerDAO;
	@Autowired
	private AddressDAO addressDAO;

	@Override
	public boolean save(Event event) {
		if (event == null) {
			logger.error("Cannot save null value for Customer.");
		}
		else {
			customerDAO.save(event.getCustomer());
			addressDAO.save(event.getLocation());
			return super.save(Event.class, event);
		}
		return false;
	}

	@Override
	public Event findById(int id) {
		return super.findById(Event.class, id);
	}

	@Override
	public Event findByCustomerID(int customerID) {
		Event event = null;
		logger.debug("Finding Event with customer ID: " + customerID);
		Session session = null;
		Transaction tx = null;
		try {
			session = getSessionFactory().openSession();
			tx = session.beginTransaction();
			List<?> list = session
					.createCriteria(Event.class, "event")
					.createAlias("event.customer", "customer",
							JoinType.LEFT_OUTER_JOIN)
					.add(Restrictions
							.eq("customer.id", new Integer(customerID))).list();
			if (CollectionUtils.isNotEmpty(list)) {
				event = (Event) list.iterator().next();
				logger.debug("Found Event with customer ID: " + customerID);
			}
			tx.rollback();
			return event;
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

	@Override
	public List<Event> fetchAllEvents() {
		return super.fetchAll(Event.class);
	}
}
