package com.cater.dao;

import static org.junit.Assert.assertNotNull;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.junit.After;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cater.constants.Roles;
import com.cater.model.Login;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:test-applicationContext-hibernate.xml" })
//@TransactionConfiguration
//@Transactional
public class LoginDAOImplTest {
	@Autowired
	private LoginDAOImpl fixture;
	@Autowired
	private SessionFactory sessionFactory;

	@BeforeClass
	public static void beforeClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
		//delete all entries from Login table
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.createQuery("delete from Login").executeUpdate();
		tx.commit();
		session.close();
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testConstructor() {
		assertNotNull(fixture);
	}

	@Test
	public void testSave() throws InterruptedException {
		Login login = new Login();
		login.setUsername("a");
		login.setPassword("p");
		login.setRole(Roles.CUSTOMER.toString());
		login.setActive(true);
		fixture.save(login);
		login.setPassword("up");
		Thread.sleep(1000);
		fixture.save(login);
	}
}
