package com.cater.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import org.hibernate.PropertyValueException;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cater.constants.Roles;
import com.cater.model.Address;
import com.cater.model.Customer;
import com.cater.model.Event;
import com.cater.model.Login;

@Component
public class EventDAOImplTest extends AbstractDAOImplTest {
	@Autowired
	private EventDAO fixture;
	private static final SimpleDateFormat df = new SimpleDateFormat(
			"yyyy-MM-dd hh:mm:ss", Locale.US);
	private static final Date DATE_1;
	static {
		Calendar calendar = Calendar.getInstance(Locale.US);
		calendar.set(2015, 1, 1);
		DATE_1 = calendar.getTime();
	}

	private Event createSampleEvent() {
		Event event = new Event();
		event.setName("Sample Event");
		event.setCustomer(createSampleCustomer());
		event.setLocation(createSampleAddress());
		event.setDate_time(DATE_1);
		return event;
	}

	private Customer createSampleCustomer() {
		Customer customer = new Customer();
		customer.setName("Event Sandra");
		customer.setLogin(createSampleLogin());
		customer.setContactNumber("123-456-7890");
		customer.setContactEmail("test@gmail.com");
		customer.setAddress(createSampleAddress());
		return customer;
	}

	private Address createSampleAddress() {
		Address address = new Address();
		address.setStreet1("Event test street1");
		address.setStreet2("Event test street2");
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
		Event event = null;
		assertFalse(fixture.save(event));
	}

	@Test(expected = PropertyValueException.class)
	public void testSave_nullProperty() {
		Event event = createSampleEvent();
		event.setName(null);
		fixture.save(event);
	}

	@Test
	public void testSave_valid() throws InterruptedException {
		Event event = createSampleEvent();
		assertTrue(fixture.save(event));
		event.setName("Updated Sample Event");
		event.getLocation().setStreet1("Updated Event street1");
		Thread.sleep(1000);
		assertTrue(fixture.save(event));
	}

	@Test
	public void testFindById() throws InterruptedException {
		Event event = createSampleEvent();
		assertTrue(fixture.save(event));
		Event persistedEvent = fixture.findById(event.getId());
		assertNotNull(persistedEvent);
		assertEquals(persistedEvent.getName(), "Sample Event");
		assertEquals(df.format(persistedEvent.getDate_time()),
				df.format(DATE_1));
		assertNotNull(persistedEvent.getCustomer());
		assertEquals(persistedEvent.getCustomer().getName(), "Event Sandra");
		assertNotNull(persistedEvent.getLocation());
		assertEquals(persistedEvent.getLocation().getStreet1(),
				"Event test street1");
		assertEquals(persistedEvent.getLocation().getStreet2(),
				"Event test street2");
		assertEquals(persistedEvent.getLocation().getCity(), "Sacramento");
		assertEquals(persistedEvent.getLocation().getState(), "CA");
		assertEquals(persistedEvent.getLocation().getZip(), "958300000");
	}
}
