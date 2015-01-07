package com.cater.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = { "restaurant" })
public class RestaurantDashboardController {
	private static final Logger logger = Logger
			.getLogger(RestaurantDashboardController.class);
}
