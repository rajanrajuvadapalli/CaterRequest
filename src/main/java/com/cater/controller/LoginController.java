package com.cater.controller;

import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cater.Environment;
import com.cater.GuestHelper;
import com.cater.Helper;
import com.cater.constants.Roles;
import com.cater.email.EmailHelper;
import com.cater.maps.RestaurantDTO;
import com.cater.model.Customer;
import com.cater.model.Event;
import com.cater.model.Login;
import com.cater.model.Restaurant;
import com.cater.service.LoginService;
import com.cater.service.PersonalSettingsService;
import com.cater.service.RestaurantService;
import com.cater.ui.data.User;
import com.google.common.collect.Lists;
import com.google.common.collect.Sets;

/**
 * The Class LoginController.
 */
@Controller
public class LoginController {
	private static final Logger logger = Logger
			.getLogger(LoginController.class);
	/** The login service. */
	@Autowired
	private LoginService loginService;
	/** The email helper. */
	@Autowired
	private EmailHelper emailHelper;
	@Autowired
	private GuestHelper guestHelper;
	@Autowired
	private RestaurantService restaurantService;
	@Autowired
	private PersonalSettingsService personalSettingsService;

	/**
	 * Logout.
	 * 
	 * @param modelMap
	 *            the model map
	 * @param request
	 *            the request
	 * @param session
	 *            the session
	 * @return the string
	 */
	@RequestMapping(value = { "logout" })
	public String logout(ModelMap modelMap, HttpServletRequest request,
			HttpSession session) {
		session.removeAttribute("user");
		session.removeAttribute("env");
		session.invalidate();
		return "redirect:home";
	}

	/**
	 * Gets the login page.
	 * 
	 * @param modelMap
	 *            the model map
	 * @param request
	 *            the request
	 * @param session
	 *            the session
	 * @return the login page
	 */
	@RequestMapping(value = { "login" }, method = RequestMethod.GET)
	public String getLoginPage(ModelMap modelMap, HttpServletRequest request,
			HttpSession session) {
		session.setAttribute("env", Environment.getInstance());
		logger.debug("Environment: " + Environment.getInstance().toString());
		return "t_login";
	}

	/**
	 * Login.
	 *
	 * @param modelMap the model map
	 * @param request the request
	 * @param session the session
	 * @return the string
	 */
	@RequestMapping(value = { "login" }, method = RequestMethod.POST)
	public String login(ModelMap modelMap, HttpServletRequest request,
			HttpSession httpSession, RedirectAttributes redirectAttributes) {
		String username = StringUtils.defaultString(request
				.getParameter("username"));
		String password = StringUtils
				.defaultString(request.getParameter("pwd"));
		List <String> errors = Lists.newArrayList();
		modelMap.addAttribute("errors", errors);
		List <String> warnings = Lists.newArrayList();
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
			//If a guest user created an account after creating an event, save the data first.
			User user = (User) httpSession.getAttribute("user");
			Event e = null;
			Object fmf = httpSession.getAttribute("full_menu_flow");
			boolean guestLogin = false;
			if (user != null && user.isGuest()) {
				guestLogin = true;
				Customer c = guestHelper.saveDataForGuest(modelMap,
						httpSession, login, user);
				e = (Event) httpSession.getAttribute("event");
				user.setName(c.getName());
				Object userFromDatabase = personalSettingsService
						.getUserWithLoginID(login.getId(), user.getRole());
				if (userFromDatabase != null
						&& Roles.CUSTOMER == user.getRole()) {
					Customer customer = (Customer) userFromDatabase;
					user.setCustomer(customer);
					user.setCustomerID(customer.getId());
					user.setGuest(false);
				}
				if (fmf == null || Boolean.FALSE.equals((Boolean) fmf)) {
					Set <Integer> previouslySelectedRestaurants = Sets
							.newHashSet();
					modelMap.put("prevR", previouslySelectedRestaurants);
					String cuisine = (String) httpSession
							.getAttribute("cuisineType");
					Set <Restaurant> restaurants = restaurantService
							.fetchRestaurantsOfType(cuisine);
					List <RestaurantDTO> nearByRestaurants = restaurantService
							.getNearbyYelpReviews(e.getLocation(), restaurants);
					if (CollectionUtils.isNotEmpty(nearByRestaurants)) {
						modelMap.put("restaurants", nearByRestaurants);
					}
				}
			}
			else {
				user = new User();
			}
			httpSession.setAttribute("user", user);
			user.setLoginID(login.getId());
			user.setUsername(username);
			Roles role = Roles.get(login.getRole());
			user.setRole(role);
			if (guestLogin) {
				if (fmf != null && Boolean.TRUE.equals((Boolean) fmf)) {
					redirectAttributes.addAttribute("eventId", e.getId());
					return "redirect:/menu/view/all";
				}
				else {
					return "menus/t__cateringRestaurants";
				}
			}
			return "redirect:dashboard";
		}
		catch (Exception ex) {
			logger.error(ex);
			errors.add("An unknown exception occured while logging you in. Please try later.");
		}
		return "t_login";
	}

	/**
	 * Forgot password.
	 *
	 * @param modelMap the model map
	 * @param request the request
	 * @param session the session
	 * @return the string
	 */
	@RequestMapping(value = { "forgotPassword" }, method = RequestMethod.POST)
	public String forgotPassword(ModelMap modelMap, HttpServletRequest request,
			HttpSession session) {
		String username = StringUtils.defaultString(request
				.getParameter("username"));
		List <String> errors = Lists.newArrayList();
		modelMap.addAttribute("errors", errors);
		List <String> successMessages = Lists.newArrayList();
		modelMap.addAttribute("successMessages", successMessages);
		// If the username does not exist in our DB, return error.
		Login login = loginService.retrieveLoginFor(username, null);
		if (login == null) {
			errors.add("Can't find that email, sorry.");
			return "t_login";
		}
		// Generate random password, MD5 it and save it, then send email
		try {
			String newPwdRaw = StringUtils.substring(login.getPassword(), 10,
					15);
			String newPwdMD5 = Helper.generateMD5(newPwdRaw);
			login.setPassword(newPwdMD5);
			String[] username_domain = StringUtils.split(username, "@");
			String resetToken = StringUtils.join(username_domain[0], "@",
					newPwdMD5, "@", username_domain[1]);
			String resetToken_URLSafe = Base64
					.encodeBase64URLSafeString(resetToken.getBytes());
			boolean sendEmailStatus = emailHelper.sendPasswordResetEmail(
					newPwdRaw, resetToken_URLSafe, username);
			if (sendEmailStatus) {
				successMessages
						.add("Please check your email for further instructions.");
			}
			else {
				errors.add("Ouch! Something went wrong. Please try again.");
			}
		}
		catch (NoSuchAlgorithmException e) {
			errors.add("Exception occured while generating MD5 hash for new password."
					+ e.getMessage());
		}
		return "t_login";
	}
}
