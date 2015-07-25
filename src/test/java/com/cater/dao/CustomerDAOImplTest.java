package com.cater.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.Calendar;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.hibernate.PropertyValueException;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cater.constants.Roles;
import com.cater.model.Address;
import com.cater.model.Customer;
import com.cater.model.Event;
import com.cater.model.Login;
import com.google.common.collect.Lists;

/**
 * Description: 
 * @since Nov 22, 2014
 *  
 */
@Component
public class CustomerDAOImplTest extends AbstractDAOImplTest {
	@Autowired
	private CustomerDAO fixture;
	@Autowired
	private EventDAO eventDAO;

	private Customer createSampleCustomer() {
		Customer customer = new Customer();
		customer.setName("Customer Victoria");
		customer.setSmsOk(true);
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

	private Event createSampleEvent() {
		Event e = new Event();
		e.setName("Test Event One");
		Calendar calendar = Calendar.getInstance(Locale.US);
		calendar.set(2015, 1, 1);
		e.setDate_time(calendar.getTime());
		e.setLocation(createSampleAddress());
		return e;
	}

	@Test
	public void testConstructor() {
		assertNotNull(fixture);
	}

	@Test
	public void testSave_nullObject() {
		Customer customer = null;
		assertFalse(fixture.saveOrUpdate(customer));
	}

	@Test(expected = PropertyValueException.class)
	public void testSave_nullProperty() {
		Customer customer = createSampleCustomer();
		customer.setName(null);
		fixture.saveOrUpdate(customer);
	}

	@Test
	public void testSave_valid() throws InterruptedException {
		Customer customer = createSampleCustomer();
		assertTrue(fixture.saveOrUpdate(customer));
		customer.setName("Updated Victoria");
		customer.getAddress().setStreet1("Updated Customer street1");
		Thread.sleep(1000);
		assertTrue(fixture.saveOrUpdate(customer));
	}

	@Test
	public void testFindById() throws InterruptedException {
		Customer customer = createSampleCustomer();
		assertTrue(fixture.saveOrUpdate(customer));
		Customer persistedCustomer = fixture.findById(customer.getId());
		assertNotNull(persistedCustomer);
		assertTrue(persistedCustomer.isSmsOk());
		assertFalse(persistedCustomer.isNumberVerified());
		assertEquals(persistedCustomer.getName(), customer.getName());
		assertEquals(persistedCustomer.getContactNumber(),
				customer.getContactNumber());
		assertEquals(persistedCustomer.getContactEmail(),
				customer.getContactEmail());
		assertNotNull(persistedCustomer.getLogin());
		assertEquals(persistedCustomer.getLogin().getUsername(), "a");
		assertEquals(persistedCustomer.getLogin().getPassword(), "p");
		assertEquals(persistedCustomer.getLogin().getRole(), "CUSTOMER");
		assertNotNull(persistedCustomer.getAddress());
		assertEquals(persistedCustomer.getAddress().getStreet1(),
				"customer test street1");
		assertEquals(persistedCustomer.getAddress().getStreet2(),
				"customer test street2");
		assertEquals(persistedCustomer.getAddress().getCity(), "Sacramento");
		assertEquals(persistedCustomer.getAddress().getState(), "CA");
		assertEquals(persistedCustomer.getAddress().getZip(), "958300000");
	}

	@Test
	public void testSparseDownloadMyEvents_1() {
		Customer customer = createSampleCustomer();
		assertTrue(fixture.saveOrUpdate(customer));
		Event e1 = createSampleEvent();
		e1.setCustomer(customer);
		List <Event> events = Lists.newArrayList();
		events.add(e1);
		customer.setEvents(events);
		eventDAO.saveOrUpdate(e1);
		Map <Integer, String> result = fixture.sparseDownloadMyEvents(customer
				.getId());
		assertEquals(1, result.size());
		assertEquals("Test Event One", result.values().iterator().next());
	}
}
