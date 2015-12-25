package com.cater.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
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
import com.cater.model.Customer;
import com.cater.model.Login;
import com.cater.model.Quote;
import com.cater.model.Restaurant;
import com.cater.model.RestaurantBranch;
import com.cater.service.CustomerService;
import com.cater.service.LoginService;
import com.cater.service.PersonalSettingsService;
import com.cater.service.RestaurantService;
import com.cater.service.UpdateResult;
import com.cater.twilio.sms.SMSHelper;
import com.cater.ui.data.RegistrationData;
import com.cater.ui.data.User;
import com.google.common.collect.Lists;

/**
 * The Class SettingsController.
 */
@Controller
@RequestMapping(value = { "settings" })
public class SettingsController {
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
			return "settings/t_personalInfo_restaurant";
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
			Restaurant restaurant = (Restaurant) userFromDatabase;
			user.setRestaurant(restaurant);
			user.setRestaurantID(restaurant.getId());
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
			UpdateResult updateResult = personalSettingsService
					.updateDataForCustomer(customerID, data);
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
			UpdateResult updateResult = personalSettingsService
					.updateDataForRestaurant(restaurantID, data);
			if (updateResult.isUpdateSuccess()) {
				List <String> successMessages = Lists.newArrayList();
				successMessages
						.add("Your account has been successfully updated.");
				modelMap.addAttribute("successMessages", successMessages);
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
	 * Update personal info branch.
	 *
	 * @param modelMap the model map
	 * @param request the request
	 * @param session the session
	 * @return the string
	 */
	@RequestMapping(value = { "personalInfo/branch" }, method = RequestMethod.POST)
	public String updatePersonalInfoBranch(ModelMap modelMap,
			HttpServletRequest request, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			//Integer restaurantID = user.getRestaurantID();
			Integer restaurantBranchID = Helper.stringToInteger(request
					.getParameter("restaurantBranchID"));
			RegistrationData data = new RegistrationData();
			data.setSalesTax(Helper.stringToFloat(request.getParameter("sales")));
			data.setPhone(StringUtils.defaultString(request
					.getParameter("phone")));
			data.setEmail(StringUtils.defaultString(request
					.getParameter("email")));
			data.setDeliverMiles(request.getParameter("deliver-miles"));
			data.setStreet1(StringUtils.defaultString(request
					.getParameter("street1")));
			data.setStreet2(StringUtils.defaultString(request
					.getParameter("street2")));
			data.setCity(StringUtils.defaultString(request.getParameter("city")));
			data.setState(StringUtils.defaultString(request
					.getParameter("state")));
			data.setZip(StringUtils.defaultString(request.getParameter("zip")));
			UpdateResult updateResult = personalSettingsService
					.updateDataForRestaurantBranch(restaurantBranchID, data);
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
	 * Delete restaurant branch.
	 *
	 * @param httpSession the http session
	 * @param modelMap the model map
	 * @param request the request
	 * @param branchID the branch id
	 * @param redirectAttributes the redirect attributes
	 * @return the string
	 */
	@RequestMapping(value = { "delete/restaurant/branch/{branchID}" }, method = RequestMethod.POST)
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
	}
}
