package com.cater.dao;

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Component;

import com.cater.model.Login;

/**
 * The Class LoginDAO.
 */
@Component
public class LoginDAO extends DataAccessObject {
	/** The Constant logger. */
	private static final Logger logger = Logger.getLogger(LoginDAO.class);

	/**
	 * Save or update.
	 *
	 * @param login the login
	 * @return true, if successful
	 */
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

	/**
	 * Find by id.
	 *
	 * @param id the id
	 * @return the login
	 */
	public Login findById(Integer id) {
		return super.findById(Login.class, id);
	}

	/**
	 * Find by credentials.
	 *
	 * @param username the username
	 * @param password the password
	 * @return the login
	 */
	public Login findByCredentials(String username, String password) {
		if (StringUtils.isNotBlank(username)
				|| StringUtils.isNotBlank(password)) {
			Login login = null;
			try {
				Session session = getSessionFactory().getCurrentSession();
				Criteria criteria = session.createCriteria(Login.class);
				if (StringUtils.isNotBlank(username)) {
					criteria = criteria.add(Restrictions.eq("username",
							username));
				}
				if (StringUtils.isNotBlank(password)) {
					criteria = criteria.add(Restrictions.eq("password",
							password));
				}
				List<?> results = criteria.list();
				if (CollectionUtils.isNotEmpty(results)) {
					login = (Login) results.iterator().next();
				}
				return login;
			}
			catch (HibernateException he) {
				logger.error(
						"Exception occurred while finding login credentials for "
								+ username + "/" + password, he);
				throw he;
			}
		}
		return null;
	}
}
