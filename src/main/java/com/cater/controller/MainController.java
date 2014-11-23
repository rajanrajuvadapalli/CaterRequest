package com.cater.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import com.cater.service.RegisterService;
import com.cater.ui.data.RegistrationData;

/**
 * The Class MainController.
 */
@Controller
public class MainController {
	private static final Logger logger = Logger.getLogger(MainController.class);
	@Autowired
	private RegisterService registerService;

	/**
	 * Home.
	 *
	 * @param modelMap the model map
	 * @return the string
	 */
	@RequestMapping(value = { "" })
	public String home(ModelMap modelMap) {
		return "home";
	}

	/**
	 * All other mappings.
	 *
	 * @param modelMap the model map
	 * @param page the page
	 * @return the string
	 */
	@RequestMapping(value = { "{page}" })
	public String allOtherMappings(ModelMap modelMap, @PathVariable String page) {
		//If the page does not exist, display page 404
		Resource webpage = null;
		WebApplicationContext webApplicationContext = ContextLoader
				.getCurrentWebApplicationContext();
		if (webApplicationContext != null) {
			webpage = webApplicationContext.getResource("WEB-INF/layouts/"
					+ page + ".jsp");
			if (webpage == null || !webpage.exists()) {
				return "404";
			}
		}
		return page;
	}

	/**
	 * Register.
	 *
	 * @param modelMap the model map
	 * @param request the request
	 * @return the string
	 */
	@RequestMapping(value = { "register" }, method = RequestMethod.POST)
	public String register(ModelMap modelMap, HttpServletRequest request) {
		RegistrationData data = new RegistrationData();
		data.setName(StringUtils.defaultString(request.getParameter("name")));
		data.setRestaurantName(StringUtils.defaultString(request
				.getParameter("restaurantName")));
		data.setCuisineType(StringUtils.defaultString(request
				.getParameter("cuisineType")));
		data.setUrl(StringUtils.defaultString(request.getParameter("url")));
		data.setEmail(StringUtils.defaultString(request.getParameter("email")));
		data.setPassword(StringUtils.defaultString(request.getParameter("pwd1")));
		data.setPhone(StringUtils.defaultString(request.getParameter("phone")));
		data.setStreet1(StringUtils.defaultString(request
				.getParameter("street1")));
		data.setStreet2(StringUtils.defaultString(request
				.getParameter("street2")));
		data.setCity(StringUtils.defaultString(request.getParameter("city")));
		data.setState(StringUtils.defaultString(request.getParameter("state")));
		data.setZip(StringUtils.defaultString(request.getParameter("zip")));
		logger.debug("Form data: " + data.toString());
		registerService.register(data);
		modelMap.put("name", data.getName());
		return "registerSuccess";
	}
}
