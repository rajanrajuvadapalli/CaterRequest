package com.cater.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cater.constants.Roles;
import com.cater.model.Login;
import com.cater.service.CustomerService;
import com.cater.service.LoginService;
import com.cater.service.RestaurantService;
import com.cater.ui.data.User;
import com.google.common.collect.Lists;

@Controller
public class LoginController {
	@Autowired
	private LoginService loginService;
	@Autowired
	private CustomerService customerService;
	@Autowired
	private RestaurantService restaurantService;

	/**
	 * Logout.
	 *
	 * @param modelMap the model map
	 * @param request the request
	 * @param session the session
	 * @return the string
	 */
	@RequestMapping(value = { "logout" })
	public String logout(ModelMap modelMap, HttpServletRequest request,
			HttpSession session) {
		session.removeAttribute("user");
		return "redirect:home";
	}

	/**
	 * Gets the login page.
	 *
	 * @param modelMap the model map
	 * @param request the request
	 * @param session the session
	 * @return the login page
	 */
	@RequestMapping(value = { "login" }, method = RequestMethod.GET)
	public String getLoginPage(ModelMap modelMap, HttpServletRequest request,
			HttpSession session) {
		return "t_login";
	}

	/**
	 * Login.
	 *
	 * @param modelMap the model map
	 * @param request the request
	 * @return the string
	 */
	@RequestMapping(value = { "login" }, method = RequestMethod.POST)
	public String login(ModelMap modelMap, HttpServletRequest request,
			HttpSession session) {
		String username = StringUtils.defaultString(request
				.getParameter("username"));
		String password = StringUtils
				.defaultString(request.getParameter("pwd"));
		List<String> errors = Lists.newArrayList();
		modelMap.addAttribute("errors", errors);
		List<String> warnings = Lists.newArrayList();
		modelMap.addAttribute("warnings", warnings);
		try {
			Login login = loginService.retrieveLoginFor(username, password);
			if (login == null) {
				errors.add("Invalid Username and password combination.");
				return "t_login";
			}
			else if (!login.isActive()) {
				warnings.add("Your account is not active. If you have recently registered with us, "
						+ "please click on the confirmation link in your email.");
				return "t_login";
			}
			User user = new User();
			user.setLoginID(login.getId());
			user.setUsername(username);
			Roles role = Roles.get(login.getRole());
			user.setRole(role);
			session.setAttribute("user", user);
			return "redirect:dashboard";
		}
		catch (Exception ex) {
			errors.add("An unknown exception occured while logging you in. Please try later.");
		}
		return "t_login";
	}
}
