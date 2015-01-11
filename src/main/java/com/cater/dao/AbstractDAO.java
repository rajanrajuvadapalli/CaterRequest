package com.cater.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cater.model.AbstractTimestampEntity;

/**
 * Description: 
 * @since Nov 22, 2014
 * @author Hari 
 */
@Component
public abstract class AbstractDAO {
	private static final Logger logger = Logger.getLogger(AbstractDAO.class);
	@Autowired
	private SessionFactory sessionFactory;

	protected SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	/**
	 * Save.
	 *
	 * @param object the object
	 * @return true, if successful
	 */
	public boolean save(Class <? extends AbstractTimestampEntity> clazz,
			Object object) {
		if (object == null) {
			logger.error("Cannot save or update null value for " + clazz);
		}
		else {
			logger.debug("Saving or updating object of " + clazz);
			Session session = null;
			Transaction tx = null;
			try {
				session = getSessionFactory().openSession();
				tx = session.beginTransaction();
				session.saveOrUpdate(object);
				tx.commit();
				logger.debug("Successfully saved object of " + clazz);
				return true;
			}
			catch (HibernateException he) {
				logger.error(
						"Exception occurred while performing saveOrUpdate() operation on object of "
								+ clazz, he);
				throw he;
			}
			finally {
				if (session != null) {
					session.close();
				}
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
	public boolean update(Class <? extends AbstractTimestampEntity> clazz,
			Object object) {
		if (object == null) {
			logger.error("Cannot update null value for " + clazz);
		}
		else {
			logger.debug("Updating object of " + clazz);
			Session session = null;
			Transaction tx = null;
			try {
				session = getSessionFactory().openSession();
				tx = session.beginTransaction();
				session.update(object);
				tx.commit();
				logger.debug("Successfully updated object of " + clazz);
				return true;
			}
			catch (HibernateException he) {
				logger.error(
						"Exception occurred while performing update() operation on object of "
								+ clazz, he);
				throw he;
			}
			finally {
				if (session != null) {
					session.close();
				}
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
	public <T extends AbstractTimestampEntity> T findById(Class <T> clazz,
			Integer id) {
		if (id == null) {
			return null;
		}
		logger.debug("Finding object of " + clazz + " for ID: " + id);
		Session session = null;
		Transaction tx = null;
		try {
			session = getSessionFactory().openSession();
			tx = session.beginTransaction();
			T object = (T) session.get(clazz, id);
			logger.debug("Found object of " + clazz + " for ID: " + id);
			tx.rollback();
			return object;
		}
		catch (HibernateException he) {
			logger.error(
					"Exception occurred while performing search() for object of "
							+ clazz, he);
			throw he;
		}
		finally {
			if (session != null) {
				session.close();
			}
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
	protected <T extends AbstractTimestampEntity> List <T> fetchAll(
			Class <T> clazz) {
		logger.debug("Fetching all objects of type " + clazz);
		Session session = null;
		try {
			session = getSessionFactory().openSession();
			return session.createCriteria(clazz).list();
		}
		catch (HibernateException he) {
			logger.error(
					"Exception occurred while fetching all objects of type "
							+ clazz, he);
			throw he;
		}
		finally {
			if (session != null) {
				session.close();
			}
		}
	}
}
