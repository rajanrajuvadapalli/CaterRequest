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
import com.cater.model.Address;
import com.cater.model.RestaurantBranch;
import com.cater.service.RestaurantService;
import com.cater.yelp.YelpAPIHelper;
import com.google.common.collect.Sets;

/**
 * The Class SearchController.
 */
@Controller
public class SearchController {
	/** The Constant logger. */
	private static final Logger logger = Logger
			.getLogger(SearchController.class);
	/** The restaurant service. */
	@Autowired
	private RestaurantService restaurantService;

	/**
	 * Search restaurants.
	 *
	 * @param modelMap the model map
	 * @param request the request
	 * @param session the session
	 * @return the string
	 * @throws Exception the exception
	 */
	/*
	 * search for list of restaurants
	 * 
	 * @author sandeep appikonda
	 */
	@RequestMapping(value = { "search" }, method = RequestMethod.GET)
	public String searchRestaurants(ModelMap modelMap,
			HttpServletRequest request, HttpSession session) throws Exception {
		String zipCode = StringUtils.defaultString(request
				.getParameter("zip_code"));
		String cuisineType = StringUtils.defaultString(request
				.getParameter("cuisineType"));
		if (StringUtils.isNotBlank(zipCode)
				&& StringUtils.isNotBlank(cuisineType)) {
			Set <RestaurantBranch> allRestaurantBranches = null;
			if (StringUtils.isBlank(cuisineType)) {
				allRestaurantBranches = Sets.newHashSet(restaurantService
						.fetchAllRestaurantBranches());
			}
			else {
				allRestaurantBranches = restaurantService
						.fetchRestaurantBranchesOfType(cuisineType);
				modelMap.put("cuisine", cuisineType);
			}
			if (CollectionUtils.isNotEmpty(allRestaurantBranches)) {
				MapsHelper mapsHelper = new MapsHelper();
				Address address = new Address();
				address.setZip(zipCode);
				List <RestaurantDTO> nearByRestaurantBranches = mapsHelper
						.getDistance(address, allRestaurantBranches);
				if (CollectionUtils.isNotEmpty(nearByRestaurantBranches)) {
					for (RestaurantDTO restaurantDTO : nearByRestaurantBranches) {
						Map <?, ?> yelpReviews = YelpAPIHelper.getRatings(
								restaurantDTO, zipCode);
						if (MapUtils.isNotEmpty(yelpReviews)) {
							restaurantDTO.setNumberOfReviews(Helper
									.stringToInt(yelpReviews.get("noOfReviews")
											.toString()));
							restaurantDTO.setReviewImage(yelpReviews
									.get("ratings"));
							logger.debug(String.format(
									"Restaurant %s has %s yelp ratings.",
									restaurantDTO.getBranch().getRestaurant()
											.getName(),
									yelpReviews.get("ratings")));
						}
					}
					modelMap.put("restaurants", nearByRestaurantBranches);
				}
			}
			modelMap.put("eventLocation", zipCode);
		}
		return "t_search";
	}
}