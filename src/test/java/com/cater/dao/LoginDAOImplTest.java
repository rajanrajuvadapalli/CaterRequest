package com.cater.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import org.hibernate.PropertyValueException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cater.constants.Roles;
import com.cater.model.Login;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:test-applicationContext-hibernate.xml" })
public class LoginDAOImplTest {
	@Autowired
	private LoginDAOImpl fixture;
	@Autowired
	private SessionFactory sessionFactory;

	@Before
	public void setUp() throws Exception {
		//delete all entries from Login table
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.createQuery("delete from Login").executeUpdate();
		tx.commit();
		session.close();
	}

	@Test
	public void testConstructor() {
		assertNotNull(fixture);
	}

	@Test
	public void testSave_nullObject() {
		Login login = null;
		assertFalse(fixture.save(login));
	}

	@Test(expected = PropertyValueException.class)
	public void testSave_nullProperty() {
		Login login = new Login();
		login.setUsername(null);
		login.setPassword("p");
		login.setRole(Roles.CUSTOMER.toString());
		login.setActive(true);
		fixture.save(login);
	}

	@Test
	public void testSave_valid() throws InterruptedException {
		Login login = new Login();
		login.setUsername("a");
		login.setPassword("p");
		login.setRole(Roles.CUSTOMER.toString());
		login.setActive(true);
		assertTrue(fixture.save(login));
		login.setPassword("up");
		Thread.sleep(1000);
		assertTrue(fixture.save(login));
	}

	@Test
	public void testFindById() throws InterruptedException {
		Login login = new Login();
		login.setUsername("findById");
		login.setPassword("p");
		login.setRole(Roles.CUSTOMER.toString());
		login.setActive(true);
		assertTrue(fixture.save(login));
		Login persistedLogin = fixture.findById(login.getId());
		assertNotNull(persistedLogin);
		assertEquals(login.getUsername(), persistedLogin.getUsername());
		assertEquals(login.getPassword(), persistedLogin.getPassword());
		assertEquals(login.getRole(), persistedLogin.getRole());
		assertEquals(login.isActive(), persistedLogin.isActive());
	}
}
