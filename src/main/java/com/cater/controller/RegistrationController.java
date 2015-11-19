package com.cater.controller;

import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cater.GuestHelper;
import com.cater.Helper;
import com.cater.constants.Roles;
import com.cater.email.EmailHelper;
import com.cater.maps.RestaurantDTO;
import com.cater.model.Login;
import com.cater.model.Restaurant;
import com.cater.service.CustomerService;
import com.cater.service.LoginService;
import com.cater.service.RegisterService;
import com.cater.service.RestaurantService;
import com.cater.twilio.sms.SMSHelper;
import com.cater.ui.data.RegistrationData;
import com.cater.ui.data.User;
import com.google.common.collect.Lists;
import com.google.common.collect.Sets;

/**
 * The Class RegistrationController.
 *  
 */
@Controller
public class RegistrationController {
	/** The Constant logger. */
	private static final Logger logger = Logger
			.getLogger(RegistrationController.class);
	/** The register service. */
	@Autowired
	private RegisterService registerService;
	/** The login service. */
	@Autowired
	private LoginService loginService;
	/** The customer service. */
	@Autowired
	private CustomerService customerService;
	/** The restaurant service. */
	@Autowired
	private RestaurantService restaurantService;
	/** The email helper. */
	@Autowired
	private EmailHelper emailHelper;
	/** The sms helper. */
	@Autowired
	private SMSHelper smsHelper;
	@Autowired
	private GuestHelper guestHelper;
	/** The customer care contact number. */
	@Value("${customer.care.contact.number}")
	private String customerCareContactNumber;

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
		String registerAs = request.getParameter("as");
		//String cuisine = request.getParameter("cuisineType");
		if (StringUtils.equalsIgnoreCase(registerAs, "customer")) {
			return "t_signUp_customer";
		}
		else {
			//Moved to MenuService REST service
			/*try {
				logger.debug(cuisine);
				File f = new File(RegistrationController.class.getResource(
						"/menus/" + StringUtils.lowerCase(cuisine, Locale.US)
								+ ".json").getFile());
				Menu menu = new MenuDeserializer().readJSON(f);
				modelMap.addAttribute("menu", menu);
			}
			catch (IOException ex) {
				logger.error(ex);
				List <String> menuerrors = Lists.newArrayList();
				menuerrors
						.add("Could not load the menu. Please contact customer support.");
				modelMap.addAttribute("menuerrors", menuerrors);
			}*/
			return "t_signUp_restaurant";
		}
	}

	@RequestMapping(value = { "register" }, method = RequestMethod.POST)
	public String register(
			ModelMap modelMap,
			HttpServletRequest request,
			HttpSession httpSession,
			@RequestParam(value = "input-profile-pic", required = false) MultipartFile multipartFile) {
		try {
			//First check if the email (user name used to login) is in use.
			String username = request.getParameter("email");
			String registerAs = request.getParameter("as");
			Login login = loginService.retrieveLoginFor(username, null);
			if (login != null) {
				List <String> warnings = Lists.newArrayList();
				warnings.add("The email address used is already registered.");
				if (!login.isActive()) {
					warnings.add("If you registered earlier, please check your email ("
							+ login.getUsername()
							+ ") for a confirmation email to complete the registration process.");
				}
				modelMap.addAttribute("warnings", warnings);
				return StringUtils.equalsIgnoreCase(registerAs, "customer") ? "t_signUp_customer"
						: "t_signUp_restaurant";
			}
			RegistrationData data = new RegistrationData();
			data.setName(StringUtils.defaultString(request.getParameter("name")));
			data.setRestaurantName(StringUtils.defaultString(request
					.getParameter("restaurantName")));
			data.setCuisineType(StringUtils.defaultString(request
					.getParameter("cuisineType")));
			data.setUrl(StringUtils.defaultString(request.getParameter("url")));
			data.setDeliverMiles(request.getParameter("deliver-miles"));
			data.setEmail(StringUtils.defaultString(username));
			data.setPassword(StringUtils.defaultString(request
					.getParameter("pwd1")));
			data.setPhone(StringUtils.defaultString(request
					.getParameter("phone")));
			data.setSmsOk(StringUtils.equalsIgnoreCase("on",
					request.getParameter("smsOk")));
			data.setStreet1(StringUtils.defaultString(request
					.getParameter("street1")));
			data.setStreet2(StringUtils.defaultString(request
					.getParameter("street2")));
			data.setCity(StringUtils.defaultString(request.getParameter("city")));
			data.setState(StringUtils.defaultString(request
					.getParameter("state")));
			data.setZip(StringUtils.defaultString(request.getParameter("zip")));
			data.setAboutUs(StringUtils.defaultString(request
					.getParameter("aboutus")));
			data.setSalesTax(Helper.stringToFloat(request.getParameter("sales")));
			logger.debug("Form data: " + data.toString());
			login = registerService.register(data);
			//If a guest user created an account after creating an event, save the data first.
			User user = (User) httpSession.getAttribute("user");
			boolean guestLogin = false;
			if (user != null && user.isGuest()) {
				guestLogin = true;
				//Customer c = 
				guestHelper
						.saveDataForGuest(modelMap, httpSession, login, user);
			}
			//When one signs up, logout the current user from session.
			httpSession.removeAttribute("user");
			String[] username_domain = StringUtils.split(login.getUsername(),
					"@");
			List <Object> tokens = Lists.newLinkedList();//order matters here.
			tokens.add(username_domain[0]);
			tokens.add(login.getPassword());
			tokens.add(username_domain[1]);
			if (guestLogin) {
				tokens.add("GUEST");
				tokens.add(httpSession.getAttribute("cuisineType"));
				tokens.add(httpSession.getAttribute("menuId"));
			}
			String confirmationToken = StringUtils.join(tokens, "@");
			String confirmationToken_URLSafe = Base64
					.encodeBase64URLSafeString(confirmationToken.getBytes());
			logger.debug("Confirmation token for " + login.getUsername() + ": "
					+ confirmationToken + "(" + confirmationToken_URLSafe + ")");
			String customer_restaurant_name = "";
			if (Roles.CUSTOMER == Roles.get(login.getRole())) {
				modelMap.put("name", data.getName());
				customer_restaurant_name = customerService
						.findCustomerWithLoginId(login.getId()).getName();
			}
			else if (Roles.RESTAURANT == Roles.get(login.getRole())) {
				modelMap.put("name", data.getRestaurantName());
				Restaurant restaurant = restaurantService
						.findRestaurantWithLoginId(login.getId());
				customer_restaurant_name = restaurant.getName();
				restaurantService.saveRestaurantProfilePic(restaurant,
						multipartFile);
			}
			boolean sendEmailStatus = emailHelper
					.sendRegistrationConfirmationEmail(
							customer_restaurant_name,
							confirmationToken_URLSafe, username);
			smsHelper.sendRegistrationConfirmationSMS(login, data.isSmsOk(),
					data.getPhone());
			if (sendEmailStatus) {
				return "t_registerSuccess";
			}
			else {
				List <String> errors = Lists.newArrayList();
				errors.add("Ouch! Something went wrong. Please contact technical support at "
						+ customerCareContactNumber);
				modelMap.addAttribute("errors", errors);
				return StringUtils.equalsIgnoreCase(registerAs, "customer") ? "t_signUp_customer"
						: "t_signUp_restaurant";
			}
		}
		catch (Exception e) {
			logger.error(e);
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
			HttpServletRequest request, HttpSession httpSession,
			@RequestParam("confirmation_token") String confirmationToken_URLSafe) {
		String confirmationToken = new String(
				Base64.decodeBase64(confirmationToken_URLSafe));
		logger.info("Received request for confirmation: " + confirmationToken);
		String[] tokens = StringUtils.split(confirmationToken, "@");
		if (tokens == null || tokens.length < 3) {
			List <String> errors = Lists.newArrayList();
			errors.add("Invalid confirmation link used. Please register again.");
			modelMap.addAttribute("errors", errors);
			return "t_login";
		}
		String username = tokens[0] + "@" + tokens[2];
		String pwd = tokens[1];
		Login login = loginService.retrieveLoginFor(username, pwd);
		if (login == null) {
			List <String> errors = Lists.newArrayList();
			errors.add("Invalid confirmation link used. Please register again.");
			modelMap.addAttribute("errors", errors);
			return "t_login";
		}
		boolean wasGuest = false;
		if (tokens.length >= 4) {
			wasGuest = "GUEST".equalsIgnoreCase(tokens[3]);
		}
		if (wasGuest) {
			//If guest clicked the confirmation link, take them directly to the restaurant selection page.
			String cuisine = tokens[4];
			httpSession.setAttribute("cuisineType", cuisine);
			modelMap.put("cuisineType", cuisine);
			Integer menuId = Integer.parseInt(tokens[5]);
			httpSession.setAttribute("menuId", menuId);
			com.cater.model.Menu menu = customerService.findMenuWithId(menuId);
			Set <Restaurant> restaurants = restaurantService
					.fetchRestaurantsOfType(cuisine);
			//modelMap.put("restaurants", restaurants);
			List <RestaurantDTO> nearByRestaurants = restaurantService
					.getNearbyYelpReviews(menu.getEvent().getLocation(),
							restaurants);
			if (CollectionUtils.isNotEmpty(nearByRestaurants)) {
				modelMap.put("restaurants", nearByRestaurants);
			}
			modelMap.put("eventLocation", menu.getEvent().getLocation());
			Set <Integer> previouslySelectedRestaurants = Sets.newHashSet();
			modelMap.put("prevR", previouslySelectedRestaurants);
			User user = new User();
			user.setLoginID(login.getId());
			user.setUsername(username);
			Roles role = Roles.get(login.getRole());
			user.setRole(role);
			httpSession.setAttribute("user", user);
			return "menus/t__cateringRestaurants";
		}
		//If the account is already active, display warning message.
		//Otherwise, make the account active and display confirmation message.
		else if (login.isActive()) {
			List <String> warnings = Lists.newArrayList();
			warnings.add("Your account has already been activated. Please login to continue.");
			modelMap.addAttribute("warnings", warnings);
		}
		else {
			registerService.activateUser(login);
			List <String> successMessages = Lists.newArrayList();
			successMessages
					.add("Your account has been successfully activated. Please login to continue.");
			modelMap.addAttribute("successMessages", successMessages);
		}
		return "t_login";
	}

	/**
	 * Reset password.
	 *
	 * @param modelMap the model map
	 * @param request the request
	 * @param session the session
	 * @param resetToken_URLSafe the reset token_ url safe
	 * @return the string
	 */
	@RequestMapping(value = { "resetpassword" })
	public String resetPassword(ModelMap modelMap, HttpServletRequest request,
			HttpSession session,
			@RequestParam("token") String resetToken_URLSafe) {
		String resetToken = new String(Base64.decodeBase64(resetToken_URLSafe));
		logger.info("Received request for password reset: " + resetToken);
		String[] tokens = StringUtils.split(resetToken, "@");
		List <String> errors = Lists.newArrayList();
		modelMap.addAttribute("errors", errors);
		if (tokens == null || tokens.length != 3) {
			errors.add("Invalid link used.");
			return "t_login";
		}
		String username = tokens[0] + "@" + tokens[2];
		String pwd = tokens[1];
		Login login = loginService.retrieveLoginFor(username, pwd);
		if (login == null) {
			errors.add("Invalid link used.");
			return "t_login";
		}
		//Redirect to change password screen.
		User user = new User();
		user.setLoginID(login.getId());
		user.setUsername(username);
		Roles role = Roles.get(login.getRole());
		user.setRole(role);
		session.setAttribute("user", user);
		session.setAttribute("passwordreset", Boolean.TRUE);
		return "redirect:settings/changePassword";
	}
}
