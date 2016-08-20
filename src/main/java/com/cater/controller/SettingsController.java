package com.cater.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cater.Helper;
import com.cater.constants.Roles;
import com.cater.data.DiscountElement;
import com.cater.data.DiscountStrategy;
import com.cater.model.Customer;
import com.cater.model.Discount;
import com.cater.model.Login;
import com.cater.model.Restaurant;
import com.cater.service.CustomerService;
import com.cater.service.LoginService;
import com.cater.service.PersonalSettingsService;
import com.cater.service.RestaurantService;
import com.cater.service.UpdateResult;
import com.cater.twilio.sms.SMSHelper;
import com.cater.ui.data.RegistrationData;
import com.cater.ui.data.User;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.collect.Lists;

/**
 * The Class SettingsController.
 */
@Controller
@RequestMapping(value = { "settings" })
public class SettingsController {
	private static final Logger logger = Logger
			.getLogger(SettingsController.class);
	/** The personal settings service. */
	@Autowired
	private PersonalSettingsService personalSettingsService;
	/** The login service. */
	@Autowired
	private LoginService loginService;
	/** The sms helper. */
	@Autowired
	private SMSHelper smsHelper;
	/** The restaurant service. */
	@Autowired
	private RestaurantService restaurantService;
	@Autowired
	private CustomerService customerService;

	/**
	 * Gets the personal info.
	 *
	 * @param modelMap the model map
	 * @param request the request
	 * @param session the session
	 * @return the personal info
	 */
	@RequestMapping(value = { "personalInfo" })
	public String getPersonalInfo(ModelMap modelMap,
			HttpServletRequest request, HttpSession session) {
		boolean result = checkUserInSessionAndRetrieveData(session);
		if (!result) {
			return "t_home";
		}
		//If the user is not in session redirect to the home page.
		User user = (User) session.getAttribute("user");
		if (Roles.CUSTOMER == user.getRole()) {
			return "settings/t_personalInfo_customer";
		}
		else if (Roles.RESTAURANT == user.getRole()) {
			if (user.getRestaurants().size() > 1
					&& user.getRestaurant() == null) {
				return "settings/t_personalInfo_restaurants";
			}
			else {
				String json = user.getRestaurant().getDiscountStrategyAsJson();
				logger.info(json);
				modelMap.addAttribute("discounts", json);
				return "settings/t_personalInfo_restaurant";
			}
		}
		return "settings/t_personalInfo";
	}

	/**
	 * Gets the change password.
	 *
	 * @param modelMap the model map
	 * @param request the request
	 * @param session the session
	 * @return the change password
	 */
	@RequestMapping(value = { "changePassword" }, method = RequestMethod.GET)
	public String getChangePassword(ModelMap modelMap,
			HttpServletRequest request, HttpSession session) {
		boolean result = checkUserInSessionAndRetrieveData(session);
		if (!result) {
			return "t_home";
		}
		return "settings/t_changePassword";
	}

	/**
	 * Check user in session and retrieve data.
	 *
	 * @param session the session
	 * @return true, if successful
	 */
	@SuppressWarnings("unchecked")
	private boolean checkUserInSessionAndRetrieveData(HttpSession session) {
		//If the user is not in session redirect to the home page.
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return false;
		}
		//If the user is already in session, first retrieve all the fields from the database.
		Object userFromDatabase = personalSettingsService.getUserWithLoginID(
				user.getLoginID(), user.getRole());
		if (userFromDatabase == null) {
			return false;
		}
		RegistrationData data = new RegistrationData();
		if (Roles.CUSTOMER == user.getRole()) {
			Customer customer = (Customer) userFromDatabase;
			user.setCustomer(customer);
			/*data.setName(customer.getName());
			data.setPhone(customer.getContactNumber());
			data.setSmsOk(customer.isSmsOk());
			data.setNumberVerified(customer.isNumberVerified());
			Address address = customer.getAddress();
			populateAddress(data, address);*/
			user.setCustomerID(customer.getId());
		}
		else if (Roles.RESTAURANT == user.getRole()) {
			List <Restaurant> restaurants = (List <Restaurant>) userFromDatabase;
			user.setRestaurants(restaurants);
			if (restaurants.size() == 1) {
				user.setRestaurant(restaurants.get(0));
				user.setRestaurantID(restaurants.get(0).getId());
			}
			/*data.setRestaurantName(restaurant.getName());
			data.setCuisineType(restaurant.getCuisineType());
			data.setUrl(restaurant.getWebsiteUrl());
			data.setPhone(restaurant.getContactNumber());
			data.setNumberVerified(restaurant.isNumberVerified());
			Address address = restaurant.getAddress();
			populateAddress(data, address);
			data.setAboutUs(restaurant.getAboutUs());
			data.setDeliverMiles(restaurant.getDeliverMiles() == null ? ""
					: restaurant.getDeliverMiles() + "");*/
		}
		user.setData(data);
		session.setAttribute("user", user);
		return true;
	}

	/**
	 * Populate address.
	 *
	 * @param modelMap the model map
	 * @param request the request
	 * @param session the session
	 * @return the string
	 */
	/*private void populateAddress(RegistrationData data, Address address) {
		if (data != null && address != null) {
			data.setStreet1(address.getStreet1());
			data.setStreet2(address.getStreet2());
			data.setCity(address.getCity());
			data.setState(address.getState());
			data.setZip(address.getZip());
		}
	}*/
	@RequestMapping(value = { "personalInfo/customer" }, method = RequestMethod.POST)
	public String updatePersonalInfoCustomer(ModelMap modelMap,
			HttpServletRequest request, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			Integer customerID = user.getCustomerID();
			RegistrationData data = new RegistrationData();
			data.setName(StringUtils.defaultString(request.getParameter("name")));
			data.setPhone(StringUtils.defaultString(request
					.getParameter("phone")));
			data.setSmsOk(StringUtils.equalsIgnoreCase("on",
					request.getParameter("smsOk")));
			data.setStreet1(StringUtils.defaultString(
					request.getParameter("street1")).trim());
			data.setStreet2(StringUtils.defaultString(
					request.getParameter("street2")).trim());
			data.setCity(StringUtils
					.defaultString(request.getParameter("city")).trim());
			data.setState(StringUtils.defaultString(
					request.getParameter("state")).trim());
			data.setZip(StringUtils.defaultString(request.getParameter("zip"))
					.trim());
			data.setAboutUs(StringUtils.defaultString(request
					.getParameter("aboutus")));
			UpdateResult updateResult = personalSettingsService.updateDataFor(
					Roles.CUSTOMER, customerID, null, data);
			if (updateResult.isUpdateSuccess()) {
				List <String> successMessages = Lists.newArrayList();
				successMessages
						.add("Your account has been successfully updated.");
				if (updateResult.isPhoneNumberUpdated()) {
					Login login = loginService.findLoginWithId(user
							.getLoginID());
					if (smsHelper.sendRegistrationConfirmationSMS(login,
							data.isSmsOk(), data.getPhone())) {
						successMessages
								.add("We sent an verification code to your new phone number. Please verify below.");
					}
				}
				modelMap.addAttribute("successMessages", successMessages);
				checkUserInSessionAndRetrieveData(session);
			}
			else {
				List <String> errors = Lists.newArrayList();
				errors.add("Failed to update profile information.");
				modelMap.addAttribute("errors", errors);
			}
		}
		return "settings/t_personalInfo_customer";
	}

	/**
	 * Gets the personal info restaurant.
	 *
	 * @param restaurantID the restaurant id
	 * @param session the session
	 * @return the personal info restaurant
	 */
	@RequestMapping(value = { "personalInfo/restaurant/{restaurantID}" }, method = RequestMethod.GET)
	public String getPersonalInfoRestaurant(
			@PathVariable("restaurantID") int restaurantID, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			for (Restaurant r : user.getRestaurants()) {
				if (r != null && r.getId() == restaurantID) {
					user.setRestaurant(r);
					user.setRestaurantID(restaurantID);
					((User) session.getAttribute("user")).setName(r.getName());
					break;
				}
			}
			return "settings/t_personalInfo_restaurant";
		}
		return "settings/t_home";
	}

	/**
	 * Update personal info restaurant.
	 *
	 * @param modelMap the model map
	 * @param request the request
	 * @param session the session
	 * @param multipartFile the multipart file
	 * @return the string
	 */
	@RequestMapping(value = { "personalInfo/restaurant" }, method = RequestMethod.POST)
	public String updatePersonalInfoRestaurant(
			ModelMap modelMap,
			HttpServletRequest request,
			HttpSession session,
			@RequestParam(value = "input-profile-pic", required = false) MultipartFile multipartFile) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			Integer restaurantID = user.getRestaurantID();
			RegistrationData data = new RegistrationData();
			String restaurantName = StringUtils.defaultString(request
					.getParameter("restaurantName"));
			data.setRestaurantName(restaurantName);
			restaurantService.saveRestaurantProfilePic(restaurantID,
					restaurantName, multipartFile);
			data.setCuisineType(StringUtils.defaultString(request
					.getParameter("cuisineType")));
			data.setUrl(StringUtils.defaultString(request.getParameter("url")));
			data.setAboutUs(StringUtils.defaultString(request
					.getParameter("aboutus")));
			data.setSalesTax(Helper.stringToFloat(request.getParameter("sales")));
			data.setPhone(StringUtils.defaultString(request
					.getParameter("phone")));
			data.setEmail(StringUtils.defaultString(request
					.getParameter("email")));
			data.setDeliverMiles(request.getParameter("deliver-miles"));
			data.setStreet1(StringUtils.defaultString(
					request.getParameter("street1")).trim());
			data.setStreet2(StringUtils.defaultString(
					request.getParameter("street2")).trim());
			data.setCity(StringUtils
					.defaultString(request.getParameter("city")).trim());
			data.setState(StringUtils.defaultString(
					request.getParameter("state")).trim());
			data.setZip(StringUtils.defaultString(request.getParameter("zip"))
					.trim());
			UpdateResult updateResult = personalSettingsService.updateDataFor(
					Roles.RESTAURANT, null, restaurantID, data);
			if (updateResult.isUpdateSuccess()) {
				List <String> successMessages = Lists.newArrayList();
				successMessages
						.add("Your account has been successfully updated.");
				modelMap.addAttribute("successMessages", successMessages);
				if (updateResult.isPhoneNumberUpdated()) {
					Login login = loginService.findLoginWithId(user
							.getLoginID());
					if (smsHelper.sendRegistrationConfirmationSMS(login,
							data.isSmsOk(), data.getPhone())) {
						successMessages
								.add("We sent an verification code to your new phone number. Please verify below.");
					}
				}
				checkUserInSessionAndRetrieveData(session);
			}
			else {
				List <String> errors = Lists.newArrayList();
				errors.add("Failed to update profile information.");
				modelMap.addAttribute("errors", errors);
			}
		}
		return "settings/t_personalInfo_restaurant";
	}

	/**
	 * Change password.
	 *
	 * @param modelMap the model map
	 * @param request the request
	 * @param session the session
	 * @return the string
	 */
	@RequestMapping(value = { "changePassword" }, method = RequestMethod.POST)
	public String changePassword(ModelMap modelMap, HttpServletRequest request,
			HttpSession session, RedirectAttributes redirectAttributes) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			String currentPassword = StringUtils.defaultString(request
					.getParameter("currPwd"));
			Login login = loginService.retrieveLoginFor(user.getUsername(),
					currentPassword);
			//If we cannot find a login, then the current password entered is incorrect.
			List <String> errors = Lists.newArrayList();
			redirectAttributes.addFlashAttribute("errors", errors);
			List <String> successMessages = Lists.newArrayList();
			redirectAttributes.addFlashAttribute("successMessages",
					successMessages);
			if (login == null) {
				errors.add("Current password you entered is incorrect. Please try again.");
			}
			else {
				String newPassword = StringUtils.defaultString(request
						.getParameter("newPwd1"));
				boolean updateResult = loginService.updatePassword(
						user.getLoginID(), newPassword);
				if (updateResult) {
					successMessages
							.add("Your password has been successfully changed.");
				}
				else {
					errors.add("Failed to update password information. Please try again.");
				}
			}
		}
		//If we change the password as a result of password reset, then redirect to dashboard.
		if (session.getAttribute("passwordreset") != null) {
			session.removeAttribute("passwordreset");
			return "redirect:/dashboard";
		}
		return "redirect:/settings/personalInfo";
	}

	/**
	 * Change discount.
	 *
	 * @param modelMap the model map
	 * @param request the request
	 * @param session the session
	 * @return the string
	 */
	@RequestMapping(value = { "changeDiscount" }, method = RequestMethod.POST)
	public String changeDiscount(ModelMap modelMap, HttpServletRequest request,
			HttpSession session, RedirectAttributes redirectAttributes,
			@RequestParam("newDiscountJson") String newDiscountJson,
			@RequestParam("restaurantID") int restaurantID) {
		logger.info("newDiscountJson = " + newDiscountJson);
		logger.info("restaurantID = " + restaurantID);
		try {
			DiscountStrategy discountStrategy = new ObjectMapper().readValue(
					newDiscountJson, DiscountStrategy.class);
			if (discountStrategy != null
					&& CollectionUtils.isNotEmpty(discountStrategy.getValues())) {
				restaurantService.deleteExistingDiscounts(restaurantID);
				Restaurant restaurant = restaurantService
						.findRestaurantWithId(restaurantID);
				for (DiscountElement de : discountStrategy.getValues()) {
					Discount d = new Discount();
					d.setRestaurant(restaurant);
					d.setLower(de.getLower().doubleValue());
					d.setUpper(de.getUpper().doubleValue());
					d.setPercent(de.getDiscountPercent().doubleValue());
					restaurantService.saveOrUpdateDiscount(d);
				}
				List <String> successMessages = Lists.newArrayList();
				successMessages.add("Successfully updated discounts.");
				redirectAttributes.addFlashAttribute("successMessages",
						successMessages);
			}
		}
		catch (Exception e) {
			String msg = "Exception occured while processing the new discounts.";
			logger.error(msg, e);
			List <String> errors = Lists.newArrayList();
			errors.add(msg);
			modelMap.addAttribute("errors", errors);
		}
		return "redirect:/settings/personalInfo";
	}
	/**
	 * Delete restaurant branch.
	 *
	 * @param httpSession the http session
	 * @param modelMap the model map
	 * @param request the request
	 * @param branchID the branch id
	 * @param redirectAttributes the redirect attributes
	 * @return the string
	 */
	/*@RequestMapping(value = { "delete/restaurant/branch/{branchID}" }, method = RequestMethod.POST)
	public String deleteRestaurantBranch(HttpSession httpSession,
			ModelMap modelMap, HttpServletRequest request,
			@PathVariable(value = "branchID") Integer branchID,
			RedirectAttributes redirectAttributes) {
		User user = (User) httpSession.getAttribute("user");
		if (user == null) {
			return "t_home";
		}
		//delete Quote, Branch, Address (in order)
		RestaurantBranch branch = restaurantService
				.findRestaurantBranchWithId(branchID);
		String branchAddress = branch.getAddress().getAddressString();
		if (branch != null) {
			List <Quote> quotes = branch.getQuotes();
			if (CollectionUtils.isNotEmpty(quotes)) {
				for (Quote quote : quotes) {
					customerService.deleteQuote(quote);
				}
			}
			restaurantService.deleteRestaurantBranch(branch);
			customerService.deleteAddress(branch.getAddress());
			List <String> successMessages = Lists.newArrayList();
			successMessages.add("Successfully deleted your branch at: "
					+ branchAddress);
			redirectAttributes.addFlashAttribute("successMessages",
					successMessages);
		}
		return "redirect:/settings/personalInfo";
	}*/
}