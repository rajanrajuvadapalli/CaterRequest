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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cater.Helper;
import com.cater.maps.MapsHelper;
import com.cater.maps.RestaurantDTO;
import com.cater.model.Restaurant;
import com.cater.service.RestaurantService;
import com.cater.yelp.YelpAPIHelper;
import com.google.common.collect.Sets;

@Controller
public class SearchController {
	private static final Logger logger = Logger.getLogger(SearchController.class);
	@Autowired
	private RestaurantService restaurantService;
	@Autowired
	private YelpAPIHelper yelpHelper;

	/*
	 * search for list of restaurants
	 * 
	 * @author sandeep appikonda
	 */
	@RequestMapping(value = { "search" }, method = RequestMethod.GET)
	public String searchRestaurants(ModelMap modelMap, HttpServletRequest request, HttpSession session)
			throws Exception {
		String zipCode = StringUtils.defaultString(request.getParameter("zip_code"));
		String cuisineType = StringUtils.defaultString(request.getParameter("cuisineType"));
		Set <Restaurant> allRestaurants = null;
		if (StringUtils.isBlank(cuisineType)) {
			allRestaurants = Sets.newHashSet(restaurantService.fetchAllRestaurants());
		}
		else {
			allRestaurants = restaurantService.fetchRestaurantsOfType(cuisineType);
			modelMap.put("cuisine", cuisineType);
		}
		if (CollectionUtils.isNotEmpty(allRestaurants)) {
			MapsHelper mapsHelper = new MapsHelper();
			List <RestaurantDTO> nearByRestaurants = mapsHelper.getDistance(zipCode, allRestaurants);
			if (CollectionUtils.isNotEmpty(nearByRestaurants)) {
				for (RestaurantDTO restaurantDTO : nearByRestaurants) {
					Map <?, ?> yelpReviews = yelpHelper.getRatings(restaurantDTO.getRestaurant().getName(), zipCode);
					if (MapUtils.isNotEmpty(yelpReviews)) {
						restaurantDTO.setNumberOfReviews(Helper.stringToInt(yelpReviews.get("noOfReviews").toString()));
						restaurantDTO.setReviewImage(yelpReviews.get("ratings"));
						logger.debug(String.format("Restaurant %s has %s yelp ratings.",
								restaurantDTO.getRestaurant().getName(), yelpReviews.get("ratings")));
					}
				}
				modelMap.put("restaurants", nearByRestaurants);
			}
		}
		modelMap.put("eventLocation", zipCode);
		return "t_search";
	}
}