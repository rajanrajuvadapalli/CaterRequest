package com.cater.controller;

import java.io.IOException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.cater.maps.MapsHelper;
import com.cater.maps.RestaurantDTO;

import com.cater.service.RestaurantService;
import com.cater.yelp.YelpAPIHelper;

@Controller
public class SearchController {
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
	public String searchRestaurants(ModelMap modelMap,
			HttpServletRequest request, HttpSession session) throws Exception {
		String zipCode = StringUtils.defaultString(request
				.getParameter("zip_code"));
		String cuisineType = StringUtils.defaultString(request
				.getParameter("cuisineType"));

		if (cuisineType != null && !cuisineType.equals("")) {

			Set allRestaurants = restaurantService
					.fetchRestaurantsOfType(cuisineType);
			MapsHelper mh = new MapsHelper();

			List nearByRestaurants = mh.getDistance(zipCode, allRestaurants);
			if (nearByRestaurants != null && !nearByRestaurants.isEmpty()) {
				for (Iterator iterator = nearByRestaurants.iterator(); iterator
						.hasNext();) {
					RestaurantDTO restaurantDTO = (RestaurantDTO) iterator
							.next();
					Map yelpReviews = yelpHelper.getRatings(restaurantDTO
							.getRestaurant().getName(), zipCode);
					if (!yelpReviews.isEmpty()) {
						restaurantDTO.setNumberOfReviews(Integer
								.parseInt(yelpReviews.get("noOfReviews")
										.toString()));
						restaurantDTO
								.setReviewImage(yelpReviews.get("ratings"));
						System.out.println(yelpReviews.get("ratings"));

					}

				}
				modelMap.put("restaurants", nearByRestaurants);
			}

			modelMap.put("cuisine", cuisineType);
		} else {
			modelMap.put("restaurants", restaurantService.fetchAllRestaurants());
		}

		modelMap.put("eventLocation", zipCode);
		return "t_search";
	}

}