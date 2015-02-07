package com.cater.controller;

import javax.servlet.http.HttpSession;

import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import com.cater.constants.Roles;
import com.cater.ui.data.User;

/**
 * The Class MainController.
 */
@Controller
public class MainController {
	/**
	 * Home.
	 *
	 * @param modelMap the model map
	 * @return the string
	 */
	@RequestMapping(value = { "", "home" })
	public String home(ModelMap modelMap) {
		return "t_home";
	}

	@RequestMapping(value = { "dashboard" })
	public String dashboard(ModelMap modelMap, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "t_home";
		}
		if (Roles.CUSTOMER == user.getRole()) {
			return "redirect:customer/dashboard";
		}
		else if (Roles.RESTAURANT == user.getRole()) {
			return "redirect:restaurant/dashboard";
		}
		else if (Roles.ADMIN == user.getRole()) {
			return "redirect:admin/dashboard";
		}
		return "t_home";
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
				return "t_404";
			}
		}
		return "t_" + page;
	}
}
