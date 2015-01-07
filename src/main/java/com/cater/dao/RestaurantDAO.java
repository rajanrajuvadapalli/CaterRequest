package com.cater.dao;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cater.model.Restaurant;

/**
 * Description: 
 * @since Nov 23, 2014
 * @author Hari 
 */
@Component
public class RestaurantDAO extends AbstractDAO {
	private static final Logger logger = Logger.getLogger(RestaurantDAO.class);
	@Autowired
	private LoginDAO loginDAO;
	@Autowired
	private AddressDAO addressDAO;

	public boolean save(Restaurant restaurant) {
		if (restaurant == null) {
			logger.error("Cannot save null value for Restaurant.");
		}
		else {
			loginDAO.save(restaurant.getLogin());
			addressDAO.save(restaurant.getAddress());
			return super.save(Restaurant.class, restaurant);
		}
		return false;
	}

	public Restaurant findById(int id) {
		return super.findById(Restaurant.class, id);
	}

	public Restaurant findByLoginID(int loginID) {
		Restaurant restaurant = null;
		logger.debug("Finding Restaurant with login ID: " + loginID);
		Session session = null;
		Transaction tx = null;
		try {
			session = getSessionFactory().openSession();
			tx = session.beginTransaction();
			List<?> list = session
					.createCriteria(Restaurant.class, "res")
					.createAlias("res.login", "login", JoinType.LEFT_OUTER_JOIN)
					.add(Restrictions.eq("login.id", new Integer(loginID)))
					.list();
			if (CollectionUtils.isNotEmpty(list)) {
				restaurant = (Restaurant) list.iterator().next();
				logger.debug("Found Restaurant with login ID: " + loginID);
			}
			tx.rollback();
			return restaurant;
		}
		catch (HibernateException he) {
			logger.error(
					"Exception occurred while Finding Restaurant with login ID: "
							+ loginID, he);
			throw he;
		}
		finally {
			if (session != null) {
				session.close();
			}
		}
	}

	public List<Restaurant> fetchAllRestaurants() {
		return super.fetchAll(Restaurant.class);
	}

	@SuppressWarnings("unchecked")
	public List<Restaurant> fetchRestaurantsOfType(String cuisine) {
		logger.debug("Finding Restaurants of type : " + cuisine);
		if (StringUtils.isNotBlank(cuisine)) {
			Session session = null;
			Transaction tx = null;
			try {
				session = getSessionFactory().openSession();
				tx = session.beginTransaction();
				List<Restaurant> list = session
						.createCriteria(Restaurant.class, "res")
						.add(Restrictions.eq("res.cuisineType", cuisine))
						.list();
				tx.rollback();
				return list;
			}
			catch (HibernateException he) {
				logger.error("Finding Restaurants of type : " + cuisine, he);
				throw he;
			}
			finally {
				if (session != null) {
					session.close();
				}
			}
		}
		return null;
	}
}
