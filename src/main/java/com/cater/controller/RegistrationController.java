package com.cater.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cater.Helper;
import com.cater.email.EmailHelper;
import com.cater.model.Login;
import com.cater.service.CustomerService;
import com.cater.service.LoginService;
import com.cater.service.RegisterService;
import com.cater.ui.data.RegistrationData;
import com.google.common.collect.Lists;

/**
 * The Class RegistrationController.
 * @author Hari 
 */
@Controller
public class RegistrationController {
	private static final Logger logger = Logger
			.getLogger(RegistrationController.class);
	@Autowired
	private RegisterService registerService;
	@Autowired
	private LoginService loginService;
	@Autowired
	private CustomerService customerService;
	@Autowired
	private EmailHelper emailHelper;
	//TODO:
	//After we request for PROD access we can send to any email.
	private static final String TO = "hari2139@gmail.com";

	/**
	 * Gets the register form.
	 *
	 * @param modelMap the model map
	 * @param request the request
	 * @param session the session
	 * @return the register form
	 */
	@RequestMapping(value = { "register" }, method = RequestMethod.GET)
	public String getRegisterForm(ModelMap modelMap,
			HttpServletRequest request, HttpSession session) {
		return "t_signUp";
	}

	/**
	 * Register.
	 *
	 * @param modelMap the model map
	 * @param request the request
	 * @return the string
	 */
	@RequestMapping(value = { "register" }, method = RequestMethod.POST)
	public String register(ModelMap modelMap, HttpServletRequest request,
			HttpSession session) {
		try {
			RegistrationData data = new RegistrationData();
			data.setName(StringUtils.defaultString(request.getParameter("name")));
			data.setRestaurantName(StringUtils.defaultString(request
					.getParameter("restaurantName")));
			data.setCuisineType(StringUtils.defaultString(request
					.getParameter("cuisineType")));
			data.setUrl(StringUtils.defaultString(request.getParameter("url")));
			data.setEmail(StringUtils.defaultString(request
					.getParameter("email")));
			data.setPassword(StringUtils.defaultString(request
					.getParameter("pwd1")));
			data.setPhone(Helper.formatPhone(StringUtils.defaultString(request
					.getParameter("phone"))));
			data.setStreet1(StringUtils.defaultString(request
					.getParameter("street1")));
			data.setStreet2(StringUtils.defaultString(request
					.getParameter("street2")));
			data.setCity(StringUtils.defaultString(request.getParameter("city")));
			data.setState(StringUtils.defaultString(request
					.getParameter("state")));
			data.setZip(StringUtils.defaultString(request.getParameter("zip")));
			logger.debug("Form data: " + data.toString());
			Login login = registerService.register(data);
			modelMap.put("name", data.getName());
			//When one signs up, logout the current user from session.
			session.removeAttribute("user");
			String[] username_domain = StringUtils.split(login.getUsername(),
					"@");
			String confirmationToken = StringUtils.join(username_domain[0],
					"@", login.getPassword(), "@", username_domain[1]);
			String confirmationToken_URLSafe = Base64
					.encodeBase64URLSafeString(confirmationToken.getBytes());
			logger.debug("Confirmation token for " + login.getUsername() + ": "
					+ confirmationToken + "(" + confirmationToken_URLSafe + ")");
			boolean sendEmailStatus = emailHelper
					.sendRegistrationConfirmationEmail(customerService
							.findCustomerWithLoginId(login.getId()).getName(),
							confirmationToken_URLSafe, TO);
			if (sendEmailStatus) {
				return "t_registerSuccess";
			}
			else {
				List<String> errors = Lists.newArrayList();
				errors.add("Ouch! Something went wrong. Please contact technical support at 1-(800)xxx-xxxx");
				modelMap.addAttribute("errors", errors);
				return "t_register";
			}
		}
		catch (Exception e) {
			return "t_500";
		}
	}

	/**
	 * Registration confirmation.
	 *
	 * @param modelMap the model map
	 * @param request the request
	 * @param session the session
	 * @param confirmationToken_URLSafe the confirmation token_ url safe
	 * @return the string
	 */
	@RequestMapping(value = { "confirmation" })
	public String registrationConfirmation(ModelMap modelMap,
			HttpServletRequest request, HttpSession session,
			@RequestParam("confirmation_token") String confirmationToken_URLSafe) {
		String confirmationToken = new String(
				Base64.decodeBase64(confirmationToken_URLSafe));
		logger.info("Received request for confirmation: " + confirmationToken);
		String[] tokens = StringUtils.split(confirmationToken, "@");
		if (tokens == null || tokens.length != 3) {
			List<String> errors = Lists.newArrayList();
			errors.add("Invalid confirmation link used. Please register again.");
			modelMap.addAttribute("errors", errors);
			return "t_home";
		}
		String username = tokens[0] + "@" + tokens[2];
		String pwd = tokens[1];
		Login login = loginService.retrieveLoginFor(username, pwd);
		if (login == null) {
			List<String> errors = Lists.newArrayList();
			errors.add("Invalid confirmation link used. Please register again.");
			modelMap.addAttribute("errors", errors);
			return "t_home";
		}
		//If the account is already active, display warning message.
		//Otherwise, make the account active and display confirmation message.
		if (login.isActive()) {
			List<String> warnings = Lists.newArrayList();
			warnings.add("Your account has already been activated. Please login to continue.");
			modelMap.addAttribute("warnings", warnings);
		}
		else {
			registerService.activateUser(login);
			List<String> successMessages = Lists.newArrayList();
			successMessages
					.add("Your account has been successfully activated. Please login to continue.");
			modelMap.addAttribute("successMessages", successMessages);
		}
		return "t_home";
	}
}
