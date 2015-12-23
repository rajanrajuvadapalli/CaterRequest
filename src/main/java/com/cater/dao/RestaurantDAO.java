package com.cater.dao;

import java.util.List;
import java.util.Set;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cater.model.Restaurant;
import com.google.common.collect.Sets;

/**
 * Description:.
 *
 * @since Nov 23, 2014
 * 
 */
@Component
public class RestaurantDAO extends DataAccessObject {
	/** The Constant logger. */
	private static final Logger logger = Logger.getLogger(RestaurantDAO.class);
	/** The login dao. */
	@Autowired
	private LoginDAO loginDAO;
	/** The address dao. */
	@Autowired
	private AddressDAO addressDAO;

	/**
	 * Save or update.
	 *
	 * @param restaurant the restaurant
	 * @return true, if successful
	 */
	public boolean saveOrUpdate(Restaurant restaurant) {
		if (restaurant == null) {
			logger.error("Cannot save null value for Restaurant.");
		}
		else {
			loginDAO.saveOrUpdate(restaurant.getLogin());
			if (restaurant.getId() == null) {
				return super.save(Restaurant.class, restaurant);
			}
			else {
				return super.update(Restaurant.class, restaurant);
			}
		}
		return false;
	}

	/**
	 * Find by id.
	 *
	 * @param id the id
	 * @return the restaurant
	 */
	public Restaurant findById(Integer id) {
		return super.findById(Restaurant.class, id);
	}

	/**
	 * Find by login id.
	 *
	 * @param loginID the login id
	 * @return the restaurant
	 */
	public Restaurant findByLoginID(Integer loginID) {
		if (loginID == null) {
			return null;
		}
		Restaurant restaurant = null;
		logger.debug("Finding Restaurant with login ID: " + loginID);
		try {
			Session session = getSessionFactory().getCurrentSession();
			List <?> list = session
					.createCriteria(Restaurant.class, "res")
					.createAlias("res.login", "login", JoinType.LEFT_OUTER_JOIN)
					.add(Restrictions.eq("login.id", loginID)).list();
			if (CollectionUtils.isNotEmpty(list)) {
				restaurant = (Restaurant) list.iterator().next();
				logger.debug("Found Restaurant with login ID: " + loginID);
			}
			return restaurant;
		}
		catch (HibernateException he) {
			logger.error(
					"Exception occurred while Finding Restaurant with login ID: "
							+ loginID, he);
			throw he;
		}
	}

	/**
	 * Fetch all restaurants.
	 *
	 * @return the list
	 */
	public List <Restaurant> fetchAllRestaurants() {
		return super.fetchAll(Restaurant.class);
	}

	/**
	 * Fetch restaurants of type.
	 *
	 * @param cuisine the cuisine
	 * @return the sets the
	 */
	@SuppressWarnings("unchecked")
	public Set <Restaurant> fetchRestaurantsOfType(String cuisine) {
		logger.debug("Finding Restaurants of type : " + cuisine);
		if (StringUtils.isNotBlank(cuisine)) {
			try {
				Session session = getSessionFactory().getCurrentSession();
				List <Restaurant> list = session
						.createCriteria(Restaurant.class, "res")
						.createAlias("res.branches", "b",
								JoinType.LEFT_OUTER_JOIN)
						.add(Restrictions.eq("res.cuisineType", cuisine))
						.add(Restrictions.eq("b.isNumberVerified", true))
						.list();
				Set <Restaurant> restaurants = Sets.newHashSet();
				for (Restaurant r : list) {
					restaurants.add(r);
				}
				return restaurants;
			}
			catch (HibernateException he) {
				logger.error("Finding Restaurants of type : " + cuisine, he);
				throw he;
			}
		}
		return null;
	}

	/**
	 * Gets the number of restaurants.
	 *
	 * @return the number of restaurants
	 */
	public int getNumberOfRestaurants() {
		logger.debug("Finding number of restaurants.");
		try {
			Session session = getSessionFactory().getCurrentSession();
			Query q = session.createQuery("select count(*) from Restaurant");
			return ((Long) q.uniqueResult()).intValue();
		}
		catch (HibernateException he) {
			logger.error(
					"Exception occurred while Finding number of restaurants.",
					he);
			return 0;
		}
	}
}
