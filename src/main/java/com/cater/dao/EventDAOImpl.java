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
public class EventDAOImpl extends AbstractDAOImpl implements EventDAO {
	private static final Logger logger = Logger.getLogger(EventDAOImpl.class);
	@Autowired
	private AddressDAO addressDAO;

	@Override
	public boolean save(Event event) {
		if (event == null) {
			logger.error("Cannot save null value for Event.");
		}
		else if (event.getLocation() == null) {
			logger.error("Location address cannot be empty for Event.");
		}
		else {
			addressDAO.save(event.getLocation());
			return super.save(Event.class, event);
		}
		return false;
	}

	@Override
	public Event findById(int id) {
		return super.findById(Event.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Event> findByCustomerID(int customerID) {
		//Event event = null;
		logger.debug("Finding Event with customer ID: " + customerID);
		Session session = null;
		Transaction tx = null;
		try {
			session = getSessionFactory().openSession();
			tx = session.beginTransaction();
			List<Event> list = (List<Event>) session
					.createCriteria(Event.class, "event")
					.createAlias("event.customer", "customer",
							JoinType.LEFT_OUTER_JOIN)
					.add(Restrictions
							.eq("customer.id", new Integer(customerID))).list();
			/*if (CollectionUtils.isNotEmpty(list)) {
				event = (Event) list.iterator().next();
				logger.debug("Found Event with customer ID: " + customerID);
			}*/
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

	@Override
	public List<Event> fetchAllEvents() {
		return super.fetchAll(Event.class);
	}
}
