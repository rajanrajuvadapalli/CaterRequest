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

	@Override
	public void save(Login login) {
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
	}
}
