package com.cater.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cater.model.TimestampEntity;

/**
 * Description:.
 *
 * @since Nov 22, 2014
 * 
 */
@Component
public class DataAccessObject {
	/** The Constant logger. */
	private static final Logger logger = Logger
			.getLogger(DataAccessObject.class);
	/** The session factory. */
	@Autowired
	private SessionFactory sessionFactory;

	/**
	 * Gets the session factory.
	 *
	 * @return the session factory
	 */
	protected SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	/**
	 * Save.
	 *
	 * @param clazz the clazz
	 * @param object the object
	 * @return true, if successful
	 */
	public boolean save(Class <? extends TimestampEntity> clazz, Object object) {
		if (object == null) {
			logger.error("Cannot save or update null value for " + clazz);
		}
		else {
			logger.debug("Saving or updating object of " + clazz);
			try {
				Session session = getSessionFactory().getCurrentSession();
				session.saveOrUpdate(object);
				logger.debug("Successfully saved object of " + clazz);
				return true;
			}
			catch (HibernateException he) {
				logger.error(
						"Exception occurred while performing saveOrUpdate() operation on object of "
								+ clazz, he);
				throw he;
			}
		}
		return false;
	}

	/**
	 * Update.
	 *
	 * @param clazz the clazz
	 * @param object the object
	 * @return true, if successful
	 */
	public boolean update(Class <? extends TimestampEntity> clazz, Object object) {
		if (object == null) {
			logger.error("Cannot update null value for " + clazz);
		}
		else {
			logger.debug("Updating object of " + clazz);
			try {
				Session session = getSessionFactory().getCurrentSession();
				session.update(object);
				logger.debug("Successfully updated object of " + clazz);
				return true;
			}
			catch (HibernateException he) {
				logger.error(
						"Exception occurred while performing update() operation on object of "
								+ clazz, he);
				throw he;
			}
		}
		return false;
	}

	/**
	 * Find by id.
	 *
	 * @param <T> the generic type
	 * @param clazz the clazz
	 * @param id the id
	 * @return the t
	 */
	@SuppressWarnings("unchecked")
	public <T extends TimestampEntity> T findById(Class <T> clazz, Integer id) {
		if (id == null) {
			return null;
		}
		logger.debug("Finding object of " + clazz + " for ID: " + id);
		try {
			Session session = getSessionFactory().getCurrentSession();
			T object = (T) session.get(clazz, id);
			logger.debug("Found object of " + clazz + " for ID: " + id);
			return object;
		}
		catch (HibernateException he) {
			logger.error(
					"Exception occurred while performing search() for object of "
							+ clazz, he);
			throw he;
		}
	}

	/**
	 * Fetch all.
	 *
	 * @param <T> the generic type
	 * @param clazz the clazz
	 * @return the list
	 */
	@SuppressWarnings("unchecked")
	protected <T extends TimestampEntity> List <T> fetchAll(Class <T> clazz) {
		logger.debug("Fetching all objects of type " + clazz);
		try {
			Session session = getSessionFactory().getCurrentSession();
			return session.createCriteria(clazz).list();
		}
		catch (HibernateException he) {
			logger.error(
					"Exception occurred while fetching all objects of type "
							+ clazz, he);
			throw he;
		}
	}

	/**
	 * Delete.
	 *
	 * @param <T> the generic type
	 * @param clazz the clazz
	 * @param id the id
	 */
	protected <T extends TimestampEntity> void delete(Class <T> clazz,
			Integer id) {
		Session session = getSessionFactory().getCurrentSession();
		Query q = session.createQuery("delete " + clazz.getSimpleName()
				+ " where id = " + id);
		q.executeUpdate();
	}
}
