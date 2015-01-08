package com.cater.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import org.hibernate.PropertyValueException;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cater.constants.Cuisines;
import com.cater.constants.Roles;
import com.cater.model.Address;
import com.cater.model.Login;
import com.cater.model.Restaurant;

/**
 * Description: 
 * @since Nov 23, 2014
 * @author Hari 
 */
@Component
public class RestaurantDAOImplTest extends AbstractDAOImplTest {
	@Autowired
	private RestaurantDAO fixture;

	private Restaurant createSampleRestaurant() {
		Restaurant restaurant = new Restaurant();
		restaurant.setName("Chipotle");
		restaurant.setAddress(createSampleAddress());
		restaurant.setLogin(createSampleLogin());
		restaurant.setContactNumber("9996663333");
		restaurant.setContactEmail("manager@gmail.com");
		restaurant.setCuisineType(Cuisines.MEXICAN.toString());
		restaurant.setWebsiteUrl("http://chipotle.com");
		return restaurant;
	}

	private Address createSampleAddress() {
		Address address = new Address();
		address.setStreet1("rest test street1");
		address.setStreet2("rest test street2");
		address.setCity("Rancho");
		address.setState("CA");
		address.setZip("958250000");
		return address;
	}

	private Login createSampleLogin() {
		Login login = new Login();
		login.setUsername("rest a");
		login.setPassword("rest p");
		login.setRole(Roles.RESTAURANT.toString());
		login.setActive(true);
		return login;
	}

	@Test
	public void testConstructor() {
		assertNotNull(fixture);
	}

	@Test
	public void testSave_nullObject() {
		Restaurant restaurant = null;
		assertFalse(fixture.saveOrUpdate(restaurant));
	}

	@Test(expected = PropertyValueException.class)
	public void testSave_nullProperty() {
		Restaurant restaurant = createSampleRestaurant();
		restaurant.setName(null);
		fixture.saveOrUpdate(restaurant);
	}

	@Test
	public void testSave_valid() throws InterruptedException {
		Restaurant restaurant = createSampleRestaurant();
		fixture.saveOrUpdate(restaurant);
		restaurant.setName("Updated Chipotle");
		restaurant.getAddress().setStreet1("Updated Restaurant street1");
		Thread.sleep(1000);
		assertTrue(fixture.saveOrUpdate(restaurant));
	}

	@Test
	public void testFindById() throws InterruptedException {
		Restaurant restaurant = createSampleRestaurant();
		fixture.saveOrUpdate(restaurant);
		Restaurant persistedRestaurant = fixture.findById(restaurant.getId());
		assertNotNull(persistedRestaurant);
		assertEquals(persistedRestaurant.getName(), "Chipotle");
		assertEquals(persistedRestaurant.getContactNumber(), "9996663333");
		assertEquals(persistedRestaurant.getContactEmail(), "manager@gmail.com");
		assertEquals(persistedRestaurant.getCuisineType(), "MEXICAN");
		assertEquals(persistedRestaurant.getWebsiteUrl(), "http://chipotle.com");
		assertNotNull(persistedRestaurant.getLogin());
		assertEquals(persistedRestaurant.getLogin().getUsername(), "rest a");
		assertEquals(persistedRestaurant.getLogin().getPassword(), "rest p");
		assertEquals(persistedRestaurant.getLogin().getRole(), "RESTAURANT");
		assertNotNull(persistedRestaurant.getAddress());
		assertEquals(persistedRestaurant.getAddress().getStreet1(),
				"rest test street1");
		assertEquals(persistedRestaurant.getAddress().getStreet2(),
				"rest test street2");
		assertEquals(persistedRestaurant.getAddress().getCity(), "Rancho");
		assertEquals(persistedRestaurant.getAddress().getState(), "CA");
		assertEquals(persistedRestaurant.getAddress().getZip(), "958250000");
	}
}
