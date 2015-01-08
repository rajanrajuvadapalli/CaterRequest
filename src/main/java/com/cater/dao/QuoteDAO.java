package com.cater.dao;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import com.cater.model.Quote;

@Component
public class QuoteDAO extends AbstractDAO {
	private static final Logger logger = Logger.getLogger(QuoteDAO.class);

	public boolean saveOrUpdate(Quote quote) {
		if (quote == null) {
			logger.error("Cannot save null value for Quote.");
			return false;
		}
		else {
			Quote existingObject = findById(quote.getId());
			if (existingObject == null) {
				return super.save(Quote.class, quote);
			}
			else {
				return super.update(Quote.class, quote);
			}
		}
	}

	public Quote findById(int id) {
		return super.findById(Quote.class, id);
	}
	/*@SuppressWarnings("unchecked")
	public List<Quote> findQuotesWithEventId(int eventID) {
		logger.debug("Finding Quote with event ID: " + eventID);
		Session session = null;
		Transaction tx = null;
		try {
			session = getSessionFactory().openSession();
			tx = session.beginTransaction();
			List<Quote> list = (List<Quote>) session
					.createCriteria(Quote.class, "quote")
					.createAlias("quote.event", "event",
							JoinType.LEFT_OUTER_JOIN)
					.add(Restrictions.eq("event.id", new Integer(eventID)))
					.list();
			tx.rollback();
			return list;
		}
		catch (HibernateException he) {
			logger.error(
					"Exception occurred while Finding Quote with event ID: "
							+ eventID, he);
			throw he;
		}
		finally {
			if (session != null) {
				session.close();
			}
		}
	}*/
}
