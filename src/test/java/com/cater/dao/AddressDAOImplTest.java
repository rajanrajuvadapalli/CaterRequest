package com.cater.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import org.hibernate.PropertyValueException;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cater.model.Address;

/**
 * Description: 
 * Created: Nov 22, 2014
 * @author Hari 
 */
@Component
public class AddressDAOImplTest extends AbstractDAOImplTest {
	@Autowired
	private AddressDAOImpl fixture;

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
