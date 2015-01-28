package com.cater.dao;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;
import org.springframework.stereotype.Component;

import com.cater.model.Quote;

/**
 * The Class QuoteDAO.
 */
@Component
public class QuoteDAO extends DataAccessObject {
	/** The Constant logger. */
	private static final Logger logger = Logger.getLogger(QuoteDAO.class);

	/**
	 * Save or update.
	 *
	 * @param quote the quote
	 * @return true, if successful
	 */
	public boolean saveOrUpdate(Quote quote) {
		if (quote == null) {
			logger.error("Cannot save null value for Quote.");
			return false;
		}
		else {
			if (quote.getId() == null) {
				return super.save(Quote.class, quote);
			}
			else {
				return super.update(Quote.class, quote);
			}
		}
	}

	/**
	 * Find by id.
	 *
	 * @param id the id
	 * @return the quote
	 */
	public Quote findById(Integer id) {
		return super.findById(Quote.class, id);
	}

	/*@SuppressWarnings("unchecked")
	public List<Quote> findQuotesWithEventId(int eventID) {
		logger.debug("Finding Quote with event ID: " + eventID);
		Session session = null;
		Transaction tx = null;
		try {
			session = getSessionFactory().getCurrentSession();
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
				//session.close();
			}
		}
	}*/
	/**
	 * Find by restaurant id and menu id.
	 *
	 * @param restaurantId the restaurant id
	 * @param menuId the menu id
	 * @return the quote
	 */
	@SuppressWarnings("unchecked")
	public Quote findByRestaurantIdAndMenuId(Integer restaurantId,
			Integer menuId) {
		if (restaurantId == null || menuId == null) {
			return null;
		}
		logger.debug("Finding Quote with restaurant ID: " + restaurantId
				+ ", menu ID: " + menuId);
		try {
			Session session = getSessionFactory().getCurrentSession();
			List<Quote> list = (List<Quote>) session
					.createCriteria(Quote.class, "quote")
					.createAlias("quote.restaurant", "restaurant",
							JoinType.LEFT_OUTER_JOIN)
					.createAlias("quote.menu", "menu", JoinType.LEFT_OUTER_JOIN)
					.add(Restrictions.eq("restaurant.id", restaurantId))
					.add(Restrictions.eq("menu.id", menuId)).list();
			if (CollectionUtils.isNotEmpty(list)) {
				return list.iterator().next();
			}
		}
		catch (HibernateException he) {
			logger.error(
					"Exception occurred while Finding Quote with restaurnat and menu ID.",
					he);
			throw he;
		}
		return null;
	}
}
