package com.cater.controller;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cater.Helper;
import com.cater.maps.MapsHelper;
import com.cater.maps.RestaurantDTO;
import com.cater.model.Address;
import com.cater.model.Restaurant;
import com.cater.service.RestaurantService;
import com.cater.yelp.YelpAPIHelper;
import com.google.common.collect.Sets;

@Controller
public class SearchController {
	private static final Logger logger = Logger
			.getLogger(SearchController.class);
	@Autowired
	private RestaurantService restaurantService;

	/*
	 * search for list of restaurants
	 * 
	 * @author sandeep appikonda
	 */
	@RequestMapping(value = { "search" }, method = RequestMethod.GET)
	public String searchRestaurants(ModelMap modelMap,
			HttpServletRequest request, HttpSession session) throws Exception {
		/*String zipCode = StringUtils.defaultString((String) request
				.getAttribute("zip_code"));*/
		String zipCode = "95825"; //FIXME: Use the alternate google API call to get the zip code during auto populate
		String cuisineType = StringUtils.defaultString(request
				.getParameter("cuisineType"));
		logger.debug("CuisineType: " + cuisineType);
		if (StringUtils.isNotBlank(zipCode)
				&& StringUtils.isNotBlank(cuisineType)) {
			Set <Restaurant> primaryRestaurants = null;
			Set <Restaurant> secondaryRestaurants = null;
			if (StringUtils.isBlank(cuisineType)) {
				primaryRestaurants = Sets.newHashSet(restaurantService
						.fetchAllRestaurants());
			}
			else {
				modelMap.put("cuisineType", cuisineType);
				primaryRestaurants = restaurantService
						.fetchRestaurantsOfTypePrimary(cuisineType);
				secondaryRestaurants = restaurantService
						.fetchRestaurantsOfTypeSecondary(cuisineType);
			}
			if (CollectionUtils.isNotEmpty(primaryRestaurants)) {
				List <RestaurantDTO> nearByPrimaryRestaurants = getRestaurantDTOs(
						primaryRestaurants, zipCode);
				modelMap.put("restaurants", nearByPrimaryRestaurants);
			}
			if (CollectionUtils.isNotEmpty(secondaryRestaurants)) {
				List <RestaurantDTO> nearBySecondaryRestaurants = getRestaurantDTOs(
						secondaryRestaurants, zipCode);
				modelMap.put("restaurants_sec", nearBySecondaryRestaurants);
			}
			modelMap.put("eventLocation", zipCode);
		}
		return "t_search";
	}

	private List <RestaurantDTO> getRestaurantDTOs(
			Set <Restaurant> restaurants, String zipCode) throws ParseException {
		if (CollectionUtils.isNotEmpty(restaurants)) {
			MapsHelper mapsHelper = new MapsHelper();
			Address address = new Address();
			address.setZip(zipCode);
			List <RestaurantDTO> nearByRestaurants = mapsHelper.getDistance(
					address, restaurants);
			if (CollectionUtils.isNotEmpty(nearByRestaurants)) {
				for (RestaurantDTO restaurantDTO : nearByRestaurants) {
					Map <?, ?> yelpReviews = YelpAPIHelper
							.getRatings(restaurantDTO);
					if (MapUtils.isNotEmpty(yelpReviews)) {
						restaurantDTO.setNumberOfReviews(Helper
								.stringToInt(yelpReviews.get("noOfReviews")
										.toString()));
						restaurantDTO
								.setReviewImage(yelpReviews.get("ratings"));
						logger.debug(String.format(
								"Restaurant %s has %s yelp ratings.",
								restaurantDTO.getRestaurant().getName(),
								yelpReviews.get("ratings")));
					}
				}
			}
			return nearByRestaurants;
		}
		return null;
	}
}