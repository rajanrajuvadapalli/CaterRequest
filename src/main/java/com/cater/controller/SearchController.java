package com.cater.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
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

	/* search for list of restaurants*/
	@RequestMapping(value = { "search" }, method = RequestMethod.GET)
	public String searchRestaurants(ModelMap modelMap, HttpServletRequest request,
			HttpSession session) {
		String zipCode = StringUtils.defaultString(request
				.getParameter("zip_code"));
		modelMap.put("restaurants", restaurantService.fetchAllRestaurants());
		modelMap.put("eventLocation", zipCode);

		return "t_search";
	}
}