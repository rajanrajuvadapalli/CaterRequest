package com.cater.controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cater.model.Restaurant;
import com.cater.service.RestaurantService;

@Controller
@RequestMapping(value = { "restaurant" })
public class RestaurantController {
	private static final Logger logger = Logger
			.getLogger(RestaurantController.class);
	@Autowired
	private RestaurantService restaurantService;

	@RequestMapping(value = { "info/{id}" })
	public String getRestaurantInfo(ModelMap modelMap, HttpSession session,
			@PathVariable Integer id) {
		logger.debug("Getting info for restaurant with ID: " + id);
		Restaurant restaurant = restaurantService.findRestaurantWithId(id);
		modelMap.put("r", restaurant);
		return "restaurant/info";
	}

}
