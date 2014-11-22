package com.cater.dao;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cater.model.Login;

@Component
public class LoginDAOImpl implements LoginDAO {
	private static final Logger logger = Logger.getLogger(LoginDAOImpl.class);
	@Autowired
	private SessionFactory sessionFactory;

	/* (non-Javadoc)
	 * @see com.cater.dao.LoginDAO#save(com.cater.model.Login)
	 */
	@Override
	public boolean save(Login login) {
		if (login == null) {
			logger.error("Cannot save null value [Login.class]");
		}
		else {
			logger.debug("Saving login information for " + login.getUsername());
			Session session = null;
			Transaction tx = null;
			try {
				session = sessionFactory.openSession();
				tx = session.beginTransaction();
				session.saveOrUpdate(login);
				tx.commit();
				logger.debug("Successfully saved login info for "
						+ login.getUsername());
				return true;
			}
			catch (HibernateException he) {
				logger.error(
						"Exception occurred while performing saveOrUpdate() operation on Login.class",
						he);
			}
			finally {
				if (session != null) {
					session.close();
				}
			}
		}
		return false;
	}

	/* (non-Javadoc)
	 * @see com.cater.dao.LoginDAO#findById(int)
	 */
	@Override
	public Login findById(int id) {
		logger.debug("Finding login for ID: " + id);
		Session session = null;
		Transaction tx = null;
		try {
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			Login login = (Login) session.get(Login.class, id);
			logger.debug("Found login info for ID: " + id);
			tx.rollback();
			return login;
		}
		catch (HibernateException he) {
			logger.error(
					"Exception occurred while performing saveOrUpdate() operation on Login.class",
					he);
		}
		finally {
			if (session != null) {
				session.close();
			}
		}
		return null;
	}
}
