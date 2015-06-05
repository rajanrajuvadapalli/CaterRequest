package com.cater.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cater.service.RestaurantService;

@Controller
public class SearchController {
	@Autowired
	private RestaurantService restaurantService;

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
				.getParameter("cuisine_type"));
		if (cuisineType != null && !cuisineType.equals("")) {
			modelMap.put("restaurants",
					restaurantService.fetchRestaurantsOfType(cuisineType));
			modelMap.put("cuisine", cuisineType);
		} 
		else {
			modelMap.put("restaurants", restaurantService.fetchAllRestaurants());
		}
		modelMap.put("eventLocation", zipCode);
        return "t_search";
	}
}