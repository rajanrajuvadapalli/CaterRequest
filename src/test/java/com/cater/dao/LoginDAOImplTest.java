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
import com.cater.model.Login;

@Component
public class LoginDAOImplTest extends AbstractDAOImplTest {
	@Autowired
	private LoginDAOImpl fixture;

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
