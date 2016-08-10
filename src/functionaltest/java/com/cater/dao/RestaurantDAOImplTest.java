package com.cater.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.List;
import java.util.Set;

import org.apache.commons.collections.CollectionUtils;
import org.hibernate.PropertyValueException;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.beust.jcommander.internal.Lists;
import com.cater.constants.Cuisines;
import com.cater.constants.Roles;
import com.cater.model.Address;
import com.cater.model.Discount;
import com.cater.model.Login;
import com.cater.model.Restaurant;

/**
 * Description: 
 * @since Nov 23, 2014
 *  
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
		restaurant.setDeliverMiles(100);
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
		assertFalse(persistedRestaurant.isNumberVerified());
		assertEquals(persistedRestaurant.getContactEmail(), "manager@gmail.com");
		assertEquals(persistedRestaurant.getCuisineType(), "MEXICAN");
		assertEquals(persistedRestaurant.getWebsiteUrl(), "http://chipotle.com");
		assertEquals(persistedRestaurant.getDeliverMiles(), new Integer(100));
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

	@Test
	@Ignore
	public void testFindById_DiscountStrategy() throws InterruptedException {
		Restaurant restaurant = createSampleRestaurant();
		List <Discount> discountStrategy = Lists.newArrayList();
		Discount d1 = new Discount();
		d1.setLower(new Double(10));
		d1.setUpper(new Double(200));
		d1.setPercent(new Double(20.10));
		d1.setRestaurant(restaurant);
		discountStrategy.add(d1);
		restaurant.setDiscountStrategy(discountStrategy);
		fixture.saveOrUpdate(restaurant);
		Restaurant persistedRestaurant = fixture.findById(restaurant.getId());
		assertNotNull(persistedRestaurant);
		assertNotNull(persistedRestaurant.getDiscountStrategy());
		Discount d1_persisted = persistedRestaurant.getDiscountStrategy()
				.get(0);
		assertEquals(d1_persisted.getLower(), new Integer(10));
		assertEquals(d1_persisted.getUpper(), new Integer(200));
		assertEquals(d1_persisted.getPercent(), new Double(20.10));
	}

	@Test
	public void testFetchRestaurantsOfType_numberNotVerified() {
		Restaurant restaurant = createSampleRestaurant();
		restaurant.setNumberVerified(false);
		fixture.saveOrUpdate(restaurant);
		String cuisine = "MEXICAN";
		Set <Restaurant> restaurants = fixture.fetchRestaurantsOfType(cuisine);
		//we should not get any, since the restaurant is not verified
		assertTrue(CollectionUtils.isEmpty(restaurants));
	}

	@Test
	public void testFetchRestaurantsOfType_numberVerified() {
		Restaurant restaurant = createSampleRestaurant();
		restaurant.setNumberVerified(true);
		fixture.saveOrUpdate(restaurant);
		String cuisine = "MEXICAN";
		Set <Restaurant> restaurants = fixture.fetchRestaurantsOfType(cuisine);
		//we should not get any, since the restaurant is not verified
		assertTrue(CollectionUtils.isNotEmpty(restaurants));
		assertEquals(1, restaurants.size());
	}
}
