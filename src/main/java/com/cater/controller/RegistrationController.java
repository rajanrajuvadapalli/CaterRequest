package com.cater.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
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

import com.cater.constants.Roles;
import com.cater.email.EmailHelper;
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
		return StringUtils.equalsIgnoreCase(registerAs, "customer") ? "t_signUp_customer"
				: "t_signUp_restaurant";
	}

	/**
	 * Register.
	 *
	 * @param modelMap the model map
	 * @param request the request
	 * @param session the session
	 * @return the string
	 */
	@RequestMapping(value = { "register" }, method = RequestMethod.POST)
	public String register(
			ModelMap modelMap,
			HttpServletRequest request,
			HttpSession session,
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
			logger.debug("Form data: " + data.toString());
			login = registerService.register(data);
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
		//If the account is already active, display warning message.
		//Otherwise, make the account active and display confirmation message.
		if (login.isActive()) {
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
