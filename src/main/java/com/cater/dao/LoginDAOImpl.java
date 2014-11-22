package com.cater.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cater.model.Login;

@Component
public class LoginDAOImpl implements LoginDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void save(Login login) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.saveOrUpdate(login);
		tx.commit();
		session.close();
	}
}
