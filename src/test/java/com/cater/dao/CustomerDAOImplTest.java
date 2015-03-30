package com.cater.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import org.hibernate.PropertyValueException;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cater.constants.Roles;
import com.cater.model.Address;
import com.cater.model.Customer;
import com.cater.model.Login;

/**
 * Description: 
 * @since Nov 22, 2014
 * @author Hari 
 */
@Component
public class CustomerDAOImplTest extends AbstractDAOImplTest {
	@Autowired
	private CustomerDAO fixture;

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
}
