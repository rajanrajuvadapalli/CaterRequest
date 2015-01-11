package com.cater.dao;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Component;

import com.cater.model.Login;

@Component
public class LoginDAO extends AbstractDAO {
	private static final Logger logger = Logger.getLogger(LoginDAO.class);

	public boolean saveOrUpdate(Login login) {
		if (login == null) {
			logger.error("Cannot save null value for Login.");
			return false;
		}
		else {
			if (login.getId() == null) {
				return super.save(Login.class, login);
			}
			else {
				return super.update(Login.class, login);
			}
		}
	}

	public Login findById(Integer id) {
		return super.findById(Login.class, id);
	}

	public Login findByCredentials(String username, String password) {
		if (StringUtils.isNotBlank(username)
				&& StringUtils.isNotBlank(password)) {
			Session session = null;
			Transaction tx = null;
			Login login = null;
			try {
				session = getSessionFactory().openSession();
				tx = session.beginTransaction();
				List <?> results = session.createCriteria(Login.class)
						.add(Restrictions.eq("username", username))
						.add(Restrictions.eq("password", password)).list();
				if (CollectionUtils.isNotEmpty(results)) {
					login = (Login) results.iterator().next();
				}
				tx.rollback();
				return login;
			}
			catch (HibernateException he) {
				logger.error(
						"Exception occurred while finding login credentials for "
								+ username + "/" + password, he);
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
