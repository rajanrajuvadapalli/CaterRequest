package com.cater.controller;

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

import com.beust.jcommander.internal.Maps;
import com.cater.model.Restaurant;
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
			HttpServletRequest request, HttpSession session) {
		String zipCode = StringUtils.defaultString(request
				.getParameter("zip_code"));
		String cuisineType = StringUtils.defaultString(request
				.getParameter("cuisineType"));
		if (cuisineType != null && !cuisineType.equals("")) {
			// YelpAPIHelper yelpHelper = new YelpAPIHelper();
			Set<Restaurant> rests = restaurantService
					.fetchRestaurantsOfType(cuisineType);
			
			Map<Integer, String> r2r = Maps.newHashMap();

			for (Restaurant temp : rests) {
				String review = yelpHelper.getRatings(temp.getName(), zipCode);
				r2r.put(temp.getId(), review);
			}
			modelMap.put("ratings", r2r);
			modelMap.put("restaurants", rests);

			modelMap.put("cuisine", cuisineType);
		} else {
			modelMap.put("restaurants", restaurantService.fetchAllRestaurants());
		}
		modelMap.put("eventLocation", zipCode);
		return "t_search";
	}
}