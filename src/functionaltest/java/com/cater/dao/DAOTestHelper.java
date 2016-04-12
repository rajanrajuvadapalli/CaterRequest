package com.cater.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 * Description: 
 * @since Nov 23, 2014
 *  
 */
public final class DAOTestHelper {
	public static void clearTables(SessionFactory sessionFactory) {
		try {
			Session session = sessionFactory.openSession();
			Transaction tx = session.beginTransaction();
			session.createQuery("delete from Quote").executeUpdate();
			session.createQuery("delete from Menu").executeUpdate();
			session.createQuery("delete from Event").executeUpdate();
			session.createQuery("delete from Customer").executeUpdate();
			session.createQuery("delete from Restaurant").executeUpdate();
			session.createQuery("delete from Address").executeUpdate();
			session.createQuery("delete from Login").executeUpdate();
			tx.commit();
			session.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void clearTablesOneByOne(SessionFactory sessionFactory) {
		clearCustomerTable(sessionFactory);
		clearRestaurantTable(sessionFactory);
		clearAddressTable(sessionFactory);
		clearLoginTable(sessionFactory);
		clearEventTable(sessionFactory);
		clearMenuTable(sessionFactory);
		clearQuoteTable(sessionFactory);
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

	public static void clearEventTable(SessionFactory sessionFactory) {
		//delete all entries from Event table
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.createQuery("delete from Event").executeUpdate();
		tx.commit();
		session.close();
	}

	public static void clearMenuTable(SessionFactory sessionFactory) {
		//delete all entries from Menu table
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.createQuery("delete from Menu").executeUpdate();
		tx.commit();
		session.close();
	}

	public static void clearQuoteTable(SessionFactory sessionFactory) {
		//delete all entries from Quote table
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.createQuery("delete from Quote").executeUpdate();
		tx.commit();
		session.close();
	}
}
