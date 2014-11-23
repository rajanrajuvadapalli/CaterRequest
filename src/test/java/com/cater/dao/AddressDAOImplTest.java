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

import com.cater.model.Address;

/**
 * Description: 
 * Created: Nov 22, 2014
 * @author Hari 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:test-applicationContext-hibernate.xml" })
public class AddressDAOImplTest {
	@Autowired
	private AddressDAOImpl fixture;
	@Autowired
	private SessionFactory sessionFactory;

	@Before
	public void setUp() throws Exception {
		//delete all entries from Login table
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.createQuery("delete from Address").executeUpdate();
		tx.commit();
		session.close();
	}

	private Address createSampleAddress() {
		Address address = new Address();
		address.setStreet1("abc");
		address.setStreet2("def");
		address.setCity("Sacramento");
		address.setState("CA");
		address.setZip("958300000");
		return address;
	}

	@Test
	public void testConstructor() {
		assertNotNull(fixture);
	}

	@Test
	public void testSave_nullObject() {
		Address address = null;
		assertFalse(fixture.save(address));
	}

	@Test(expected = PropertyValueException.class)
	public void testSave_nullProperty() {
		Address address = createSampleAddress();
		address.setStreet1(null);
		fixture.save(address);
	}

	@Test
	public void testSave_valid() throws InterruptedException {
		Address address = createSampleAddress();
		assertTrue(fixture.save(address));
		address.setStreet1("new abc");
		Thread.sleep(1000);
		assertTrue(fixture.save(address));
	}

	@Test
	public void testFindById() throws InterruptedException {
		Address address = createSampleAddress();
		assertTrue(fixture.save(address));
		Address persistedAddress = fixture.findById(address.getId());
		assertNotNull(persistedAddress);
		assertEquals(address.getStreet1(), persistedAddress.getStreet1());
		assertEquals(address.getCity(), persistedAddress.getCity());
		assertEquals(address.getState(), persistedAddress.getState());
		assertEquals(address.getZip(), persistedAddress.getZip());
	}
}
