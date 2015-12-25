package com.cater.dao;

import java.util.Date;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
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

import com.cater.model.Quote;
import com.cater.model.RestaurantBranch;
import com.cater.model.RestaurantBranchSearchDTO;
import com.cater.model.RestaurantSearch;
import com.google.common.collect.Sets;

/**
 * The Class RestaurantBranchDAO.
 */
@Component
public class RestaurantBranchDAO extends DataAccessObject {
	/** The Constant logger. */
	private static final Logger logger = Logger
			.getLogger(RestaurantBranchDAO.class);
	/** The address dao. */
	@Autowired
	private AddressDAO addressDAO;
	/** The restaurant dao. */
	@Autowired
	private RestaurantDAO restaurantDAO;

	/**
	 * Save or update branch.
	 *
	 * @param branch the branch
	 * @return true, if successful
	 */
	public boolean saveOrUpdateBranch(RestaurantBranch branch) {
		if (branch == null) {
			logger.error("Cannot save null value for RestaurantBranch.");
		}
		else {
			restaurantDAO.saveOrUpdate(branch.getRestaurant());
			addressDAO.saveOrUpdate(branch.getAddress());
			if (branch.getId() == null) {
				return super.save(RestaurantBranch.class, branch);
			}
			else {
				return super.update(RestaurantBranch.class, branch);
			}
		}
		return false;
	}

	/**
	 * Delete restaurant branch.
	 *
	 * @param branch the branch
	 */
	public void deleteRestaurantBranch(RestaurantBranch branch) {
		logger.debug("Deleting restaurant branch with id: " + branch.getId());
		super.delete(RestaurantBranch.class, branch.getId());
	}

	/**
	 * Find by id.
	 *
	 * @param id the id
	 * @return the restaurant branch
	 */
	public RestaurantBranch findById(Integer id) {
		return super.findById(RestaurantBranch.class, id);
	}

	/**
	 * Fetch all restaurant branches.
	 *
	 * @return the list
	 */
	public List <RestaurantBranch> fetchAllRestaurantBranches() {
		return super.fetchAll(RestaurantBranch.class);
	}

	/**
	 * Fetch restaurant branches of type.
	 *
	 * @param cuisine the cuisine
	 * @return the sets the
	 */
	@SuppressWarnings("unchecked")
	public Set <RestaurantBranch> fetchRestaurantBranchesOfType(String cuisine) {
		logger.debug("Finding Restaurant Branches of type : " + cuisine);
		if (StringUtils.isNotBlank(cuisine)) {
			try {
				Session session = getSessionFactory().getCurrentSession();
				List <RestaurantBranch> list = session
						.createCriteria(RestaurantBranch.class, "b")
						.createAlias("b.restaurant", "r",
								JoinType.RIGHT_OUTER_JOIN)
						.add(Restrictions.eq("r.cuisineType", cuisine))
						.add(Restrictions.eq("b.isNumberVerified", true))
						.list();
				Set <RestaurantBranch> branches = Sets.newHashSet();
				for (RestaurantBranch b : list) {
					branches.add(b);
				}
				return branches;
			}
			catch (HibernateException he) {
				logger.error(
						"Finding Restaurant Branches of type : " + cuisine, he);
				throw he;
			}
		}
		return null;
	}

	/**
	 * Gets the number of restaurant branches.
	 *
	 * @return the number of restaurant branches
	 */
	public int getNumberOfRestaurantBranches() {
		logger.debug("Finding number of restaurant branches.");
		try {
			Session session = getSessionFactory().getCurrentSession();
			Query q = session
					.createQuery("select count(*) from Restaurant_branch");
			return ((Long) q.uniqueResult()).intValue();
		}
		catch (HibernateException he) {
			logger.error(
					"Exception occurred while Finding number of restaurant branches.",
					he);
			return 0;
		}
	}

	/**
	 * Search restaurants by user name.
	 *
	 * @param userName the user name
	 * @return User Id, Restaurant name, Phone Number, Location, Event Name, Location, Date & time, Menu,
	 *  Restaurant Quote (Sort by Alphabet), Confirmed Restaurant, total payment.
	 */
	@SuppressWarnings("unchecked")
	public List <RestaurantBranchSearchDTO> searchRestaurantBranchesByUserName(
			String userName) {
		logger.debug("Searching restaurant branches with user name " + userName);
		Session session = getSessionFactory().getCurrentSession();
		Criteria c = session
				.createCriteria(Quote.class, "q")
				.createAlias("q.restaurantBranch", "rb")
				.createAlias("rb.restaurant", "r")
				.createAlias("rb.address", "rbadd")
				.createAlias("q.menu", "m")
				.createAlias("m.event", "e")
				.createAlias("e.location", "el")
				.createAlias("r.login", "login")
				.add(Restrictions.eq("login.username", userName))
				.setProjection(
						Projections
								.projectionList()
								.add(Projections.property("login.username"),
										"emailId")
								.add(Projections.property("r.name"),
										"restaurantName")
								.add(Projections.property("rb.contactNumber"),
										"contactNumber")
								.add(Projections.property("rbadd.street1"),
										"rStreet1")
								.add(Projections.property("rbadd.street2"),
										"rStreet2")
								.add(Projections.property("rbadd.city"),
										"rCity")
								.add(Projections.property("rbadd.state"),
										"rState")
								.add(Projections.property("rbadd.zip"), "rZip")
								.add(Projections.property("e.name"),
										"eventName")
								.add(Projections.property("el.street1"),
										"eventStreet1")
								.add(Projections.property("el.street2"),
										"eventStreet2")
								.add(Projections.property("el.city"),
										"eventCity")
								.add(Projections.property("el.state"),
										"eventState")
								.add(Projections.property("el.zip"), "eventZip")
								.add(Projections.property("q.price"), "price")
								.add(Projections.property("e.status"), "status")
								.add(Projections.property("e.date_time"),
										"date_time"))
				.setResultTransformer(
						Transformers
								.aliasToBean(RestaurantBranchSearchDTO.class));
		List <RestaurantBranchSearchDTO> branches = c.list();
		return branches;
	}

	/**
	 * Search restaurant branches by date range.
	 *
	 * @param fromDate the from date
	 * @param toDate the to date
	 * @return the list
	 */
	@SuppressWarnings("unchecked")
	public List <RestaurantBranchSearchDTO> searchRestaurantBranchesByDateRange(
			Date fromDate, Date toDate) {
		logger.debug("Searching restaurant branches by date range.");
		Session session = getSessionFactory().getCurrentSession();
		Criteria c = session
				.createCriteria(Quote.class, "q")
				.createAlias("q.restaurantBranch", "rb")
				.createAlias("rb.restaurant", "r")
				.createAlias("rb.address", "rbadd")
				.createAlias("q.menu", "m")
				.createAlias("m.event", "e")
				.createAlias("e.location", "el")
				.createAlias("r.login", "login")
				.add(Restrictions.between("e.date_time", fromDate, toDate))
				.setProjection(
						Projections
								.projectionList()
								.add(Projections.property("login.username"),
										"emailId")
								.add(Projections.property("r.name"),
										"restaurantName")
								.add(Projections.property("rb.contactNumber"),
										"restaurantNumber")
								.add(Projections.property("rbadd.street1"),
										"rStreet1")
								.add(Projections.property("rbadd.street2"),
										"rStreet2")
								.add(Projections.property("rbadd.city"),
										"rCity")
								.add(Projections.property("rbadd.state"),
										"rState")
								.add(Projections.property("rbadd.zip"), "rZip")
								.add(Projections.property("e.name"),
										"eventName")
								.add(Projections.property("el.street1"),
										"eventStreet1")
								.add(Projections.property("el.street2"),
										"eventStreet2")
								.add(Projections.property("el.city"),
										"eventCity")
								.add(Projections.property("el.state"),
										"eventState")
								.add(Projections.property("el.zip"), "eventZip")
								.add(Projections.property("q.price"), "price")
								.add(Projections.property("e.status"), "status")
								.add(Projections.property("e.date_time"),
										"date_time"))
				.setResultTransformer(
						Transformers.aliasToBean(RestaurantSearch.class));
		List <RestaurantBranchSearchDTO> branches = c.list();
		return branches;
	}
}
