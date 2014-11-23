package com.cater.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 * Description: 
 * Created: Nov 23, 2014
 * @author Hari 
 */
public final class DAOTestHelper {
	public static void clearTables(SessionFactory sessionFactory) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.createQuery("delete from Customer").executeUpdate();
		session.createQuery("delete from Restaurant").executeUpdate();
		session.createQuery("delete from Address").executeUpdate();
		session.createQuery("delete from Login").executeUpdate();
		tx.commit();
		session.close();
	}

	public static void clearTablesOneByOne(SessionFactory sessionFactory) {
		clearCustomerTable(sessionFactory);
		clearRestaurantTable(sessionFactory);
		clearAddressTable(sessionFactory);
		clearLoginTable(sessionFactory);
	}

	public static void clearCustomerTable(SessionFactory sessionFactory) {
		//delete all entries from Customer table
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.createQuery("delete from Customer").executeUpdate();
		tx.commit();
		session.close();
	}

	public static void clearRestaurantTable(SessionFactory sessionFactory) {
		//delete all entries from Restaurant table
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.createQuery("delete from Restaurant").executeUpdate();
		tx.commit();
		session.close();
	}

	public static void clearAddressTable(SessionFactory sessionFactory) {
		//delete all entries from Address table
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.createQuery("delete from Address").executeUpdate();
		tx.commit();
		session.close();
	}

	public static void clearLoginTable(SessionFactory sessionFactory) {
		//delete all entries from Login table
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.createQuery("delete from Login").executeUpdate();
		tx.commit();
		session.close();
	}
}
