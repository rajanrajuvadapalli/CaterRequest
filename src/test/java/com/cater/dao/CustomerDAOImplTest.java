package com.cater.dao;

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
import com.cater.model.Address;
import com.cater.model.Customer;
import com.cater.model.Login;

/**
 * Description: 
 * Created: Nov 22, 2014
 * @author Hari 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:test-applicationContext-hibernate.xml" })
public class CustomerDAOImplTest {
	@Autowired
	private CustomerDAOImpl fixture;
	@Autowired
	private AddressDAOImplTest addressDAOImplTest;
	@Autowired
	private LoginDAOImplTest loginDAOImplTest;
	@Autowired
	private SessionFactory sessionFactory;

	@Before
	public void setUp() throws Exception {
		//delete all entries from Customer table
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.createQuery("delete from Customer").executeUpdate();
		tx.commit();
		session.close();
		addressDAOImplTest.clearAddressTable();
		loginDAOImplTest.clearLoginTable();
	}

	private Customer createSampleCustomer() {
		Customer customer = new Customer();
		customer.setName("Customer Victoria");
		customer.setLogin(createSampleLogin());
		customer.setContactNumber("123-456-7890");
		customer.setContactEmail("test@gmail.com");
		customer.setAddress(createSampleAddress());
		return customer;
	}

	private Address createSampleAddress() {
		Address address = new Address();
		address.setStreet1("customer test street1");
		address.setStreet2("customer test street2");
		address.setCity("Sacramento");
		address.setState("CA");
		address.setZip("958300000");
		return address;
	}

	private Login createSampleLogin() {
		Login login = new Login();
		login.setUsername("a");
		login.setPassword("p");
		login.setRole(Roles.CUSTOMER.toString());
		login.setActive(true);
		return login;
	}

	@Test
	public void testConstructor() {
		assertNotNull(fixture);
	}

	@Test
	public void testSave_nullObject() {
		Customer customer = null;
		assertFalse(fixture.save(customer));
	}

	@Test(expected = PropertyValueException.class)
	public void testSave_nullProperty() {
		Customer customer = createSampleCustomer();
		customer.setName(null);
		fixture.save(customer);
	}

	@Test
	public void testSave_valid() throws InterruptedException {
		Customer customer = createSampleCustomer();
		assertTrue(fixture.save(customer));
		customer.setName("Updated Victoria");
		customer.getAddress().setStreet1("Updated Customer street1");
		Thread.sleep(1000);
		assertTrue(fixture.save(customer));
	}
}
