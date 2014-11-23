package com.cater.dao;

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
 * Created: Nov 22, 2014
 * @author Hari 
 */
@Component
public abstract class AbstractDAOImpl {
	private static final Logger logger = Logger
			.getLogger(AbstractDAOImpl.class);
	//	private final Class <T> type;
	@Autowired
	private SessionFactory sessionFactory;

	//	protected AbstractDAOImpl(Class <T> type) {
	//		this.type = type;
	//	}
	protected SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	//	protected Class <T> getType() {
	//		return type;
	//	}
	/**
	 * Save.
	 *
	 * @param object the object
	 * @return true, if successful
	 */
	public boolean save(Class <? extends AbstractTimestampEntity> clazz,
			Object object) {
		if (object == null) {
			logger.error("Cannot save null value for " + clazz);
		}
		else {
			logger.debug("Saving object of " + clazz);
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
	 * Find by id.
	 *
	 * @param <T> the generic type
	 * @param clazz the clazz
	 * @param id the id
	 * @return the t
	 */
	@SuppressWarnings("unchecked")
	public <T extends AbstractTimestampEntity> T findById(Class <T> clazz,
			int id) {
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
}
