package com.cater.dao;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.List;
import java.util.Set;

import org.apache.commons.collections.CollectionUtils;
import org.hibernate.PropertyValueException;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cater.constants.Cuisines;
import com.cater.constants.Roles;
import com.cater.model.Address;
import com.cater.model.Login;
import com.cater.model.Restaurant;
import com.cater.model.RestaurantBranch;

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
		//first branch
		RestaurantBranch branch1 = new RestaurantBranch();
		branch1.setAddress(createSampleAddress1());
		branch1.setContactNumber("9996663333");
		branch1.setContactEmail("manager_branch1@gmail.com");
		branch1.setDeliverMiles(100);
		restaurant.getBranches().add(branch1);
		//second branch
		RestaurantBranch branch2 = new RestaurantBranch();
		branch2.setAddress(createSampleAddress2());
		branch2.setContactNumber("1111111111");
		branch2.setContactEmail("manager_branch2@gmail.com");
		branch2.setDeliverMiles(100);
		restaurant.getBranches().add(branch2);
		//
		restaurant.setName("Chipotle");
		restaurant.setLogin(createSampleLogin());
		restaurant.setCuisineType(Cuisines.MEXICAN.toString());
		restaurant.setWebsiteUrl("http://chipotle.com");
		return restaurant;
	}

	private Address createSampleAddress1() {
		Address address = new Address();
		address.setStreet1("1 Main St");
		address.setStreet2("rest test street2");
		address.setCity("Rancho");
		address.setState("CA");
		address.setZip("958250000");
		return address;
	}

	private Address createSampleAddress2() {
		Address address = new Address();
		address.setStreet1("2 Main St");
		address.setStreet2("rest test street2");
		address.setCity("Folsom");
		address.setState("CA");
		address.setZip("956300000");
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
		restaurant.getBranches().get(0).getAddress()
				.setStreet1("Updated Restaurant street1");
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
		assertEquals(persistedRestaurant.getCuisineType(), "MEXICAN");
		assertEquals(persistedRestaurant.getWebsiteUrl(), "http://chipotle.com");
		assertNotNull(persistedRestaurant.getLogin());
		assertEquals(persistedRestaurant.getLogin().getUsername(), "rest a");
		assertEquals(persistedRestaurant.getLogin().getPassword(), "rest p");
		assertEquals(persistedRestaurant.getLogin().getRole(), "RESTAURANT");
		//branch 1
		RestaurantBranch branch1 = persistedRestaurant.getBranches().get(0);
		assertEquals(branch1.getContactNumber(), "9996663333");
		assertFalse(branch1.isNumberVerified());
		assertEquals(branch1.getContactEmail(), "manager@gmail.com");
		assertEquals(branch1.getDeliverMiles(), new Integer(100));
		assertNotNull(branch1.getAddress());
		assertEquals(branch1.getAddress().getStreet1(), "1 Main St");
		assertEquals(branch1.getAddress().getStreet2(), "rest test street2");
		assertEquals(branch1.getAddress().getCity(), "Rancho");
		assertEquals(branch1.getAddress().getState(), "CA");
		assertEquals(branch1.getAddress().getZip(), "958250000");
		//branch 2
		RestaurantBranch branch2 = persistedRestaurant.getBranches().get(0);
		assertEquals(branch2.getContactNumber(), "9996663333");
		assertFalse(branch2.isNumberVerified());
		assertEquals(branch2.getContactEmail(), "manager@gmail.com");
		assertEquals(branch2.getDeliverMiles(), new Integer(100));
		assertNotNull(branch2.getAddress());
		assertEquals(branch2.getAddress().getStreet1(), "2 Main St");
		assertEquals(branch2.getAddress().getStreet2(),
				"rest test street2");
		assertEquals(branch2.getAddress().getCity(), "Folsom");
		assertEquals(branch2.getAddress().getState(), "CA");
		assertEquals(branch2.getAddress().getZip(), "956300000");
	}

	@Test
	public void testFetchRestaurantsOfType_numberNotVerified() {
		Restaurant restaurant = createSampleRestaurant();
		List <RestaurantBranch> branches = restaurant.getBranches();
		branches.get(0).setNumberVerified(false);
		branches.get(1).setNumberVerified(false);
		fixture.saveOrUpdate(restaurant);
		String cuisine = "MEXICAN";
		Set <Restaurant> restaurants = fixture.fetchRestaurantsOfType(cuisine);
		//we should not get any, since the restaurant is not verified
		assertTrue(CollectionUtils.isEmpty(restaurants));
	}

	@Test
	public void testFetchRestaurantsOfType_numberVerified() {
		Restaurant restaurant = createSampleRestaurant();
		List <RestaurantBranch> branches = restaurant.getBranches();
		branches.get(0).setNumberVerified(true);
		branches.get(1).setNumberVerified(false);
		fixture.saveOrUpdate(restaurant);
		String cuisine = "MEXICAN";
		Set <Restaurant> restaurants = fixture.fetchRestaurantsOfType(cuisine);
		//we should get only 1, since only one branch is verified
		assertTrue(CollectionUtils.isNotEmpty(restaurants));
		assertEquals(1, restaurants.size());
	}
}
