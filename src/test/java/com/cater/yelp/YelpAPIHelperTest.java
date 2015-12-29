package com.cater.yelp;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import java.util.Map;

import org.json.simple.parser.ParseException;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import com.cater.maps.RestaurantDTO;
import com.cater.model.Address;
import com.cater.model.Restaurant;

/**
 * Description: 
 * Created: Dec 15, 2015
 * @author Hari 
 */
public class YelpAPIHelperTest {
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testGetRatings() throws ParseException {
		String zipCode = "95630";
		RestaurantDTO restaurantDTO = new RestaurantDTO();
		Restaurant restaurant = new Restaurant();
		restaurant.setName("Ruchi Indian Cuisine");
		restaurant.setCuisineType("INDIAN_SOUTH");
		Address address = new Address();
		address.setZip(zipCode);
		restaurant.setAddress(address);
		restaurantDTO.setRestaurant(restaurant);
		Map <Object, Object> response = YelpAPIHelper.getRatings(restaurantDTO, zipCode);
		assertNotNull(response);
		assertEquals(
				"http://www.yelp.com/biz/ruchi-indian-cuisine-folsom?utm_campaign=yelp_api&utm_medium=api_v2_business&utm_source=PQQCi-HgeDwHiTmLWD9xRA",
				response.get("websiteUrl"));
	}
}
