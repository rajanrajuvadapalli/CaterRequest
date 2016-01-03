package com.cater.service.rest;

import static javax.ws.rs.core.MediaType.TEXT_PLAIN;
import static javax.ws.rs.core.Response.Status.BAD_REQUEST;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import com.cater.Helper;
import com.cater.dao.CustomerDAO;
import com.cater.dao.LoginDAO;
import com.cater.dao.RestaurantDAO;
import com.cater.model.Customer;
import com.cater.model.Login;
import com.cater.model.Restaurant;
import com.cater.twilio.sms.SMSHelper;

/**
 * The Class PhoneService.
 */
@Path("/phone")
public class PhoneService {
	/** The Constant logger. */
	private static final Logger logger = Logger.getLogger(PhoneService.class);
	/** The login dao. */
	private LoginDAO loginDAO;
	/** The customer dao. */
	private CustomerDAO customerDAO;
	/** The restaurant dao. */
	private RestaurantDAO restaurantDAO;
	/** The sms helper. */
	private SMSHelper smsHelper;

	/**
	 * Instantiates a new phone service.
	 */
	public PhoneService() {
		WebApplicationContext webApplicationContext = ContextLoader
				.getCurrentWebApplicationContext();
		loginDAO = webApplicationContext.getBean(LoginDAO.class);
		customerDAO = webApplicationContext.getBean(CustomerDAO.class);
		restaurantDAO = webApplicationContext.getBean(RestaurantDAO.class);
		smsHelper = webApplicationContext.getBean(SMSHelper.class);
	}

	/**
	 * @param loginID
	 * @param customerOrRestaurantID
	 * @param payload
	 * @return
	 */
	@POST
	@Path("/verify/{loginId}/{id}")
	@Consumes(TEXT_PLAIN)
	@Produces(TEXT_PLAIN)
	public Response verifyNumber(@PathParam("loginId") int loginID,
			@PathParam("id") int customerOrRestaurantID, String payload) {
		String verificationCode = payload;
		logger.debug("Verifying phone number for user with login ID: "
				+ loginID + " with Verification Code: " + verificationCode);
		if (StringUtils.isBlank(verificationCode)) {
			logger.debug("Verification code cannot be blank.");
			return Response.status(BAD_REQUEST)
					.entity("Verification code cannot be blank.").build();
		}
		// Retrieve the user from DB
		Login login = loginDAO.findById(loginID);
		if (login == null) {
			logger.debug("Could not find user.");
			return Response.status(BAD_REQUEST).entity("Could not find user.")
					.build();
		}
		try {
			// Get the verification code
			String password = login.getPassword();
			String expectedVerificationCode = "";
			if (StringUtils.isNotBlank(password) && password.length() >= 10) {
				expectedVerificationCode = StringUtils
						.substring(password, 4, 9);
			}
			// verify
			if (StringUtils.isNotBlank(expectedVerificationCode)
					&& StringUtils.equalsIgnoreCase(expectedVerificationCode,
							verificationCode)) {
				// Update database
				if (login.isCustomer()) {
					logger.debug("Updating consumer table.");
					Customer customer = customerDAO
							.findById(customerOrRestaurantID);
					if (customer.getLogin().getId() != loginID) {
						return Response.status(BAD_REQUEST)
								.entity("Could not find the customer.").build();
					}
					customer.setNumberVerified(true);
				}
				else if (login.isRestaurant()) {
					logger.debug("Updating restaurant table.");
					Restaurant restaurant = restaurantDAO
							.findById(customerOrRestaurantID);
					if (restaurant.getLogin().getId() != loginID) {
						return Response.status(BAD_REQUEST)
								.entity("Could not find the restaurant.")
								.build();
					}
					restaurant.setNumberVerified(true);
				}
				return Response.ok()
						.entity("Successfully validated phone number.").build();
			}
			return Response
					.ok()
					.entity("Incorrect verification code used. Please try again.")
					.build();
		}
		catch (Exception ex) {
			logger.error(ex);
			return Response.serverError().build();
		}
	}


	/**
	 * Send verification code.
	 *
	 * @param loginID the login id
	 * @param customerOrRestaurantID the customer or restaurant id
	 * @param payload the payload
	 * @return the response
	 */
	@POST
	@Path("/verify/sendcode/{loginId}/{id}")
	@Consumes(TEXT_PLAIN)
	@Produces(TEXT_PLAIN)
	public Response sendVerificationCode(@PathParam("loginId") int loginID,
			@PathParam("id") int customerOrRestaurantID, String payload) {
		String phoneNumber = Helper.extractJust10digitNumber(payload);
		logger.debug("Sending phone verification code for user with login ID: "
				+ loginID);
		// Retrieve the user from DB
		Login login = loginDAO.findById(loginID);
		if (login == null) {
			logger.debug("Could not find user.");
			return Response.status(BAD_REQUEST).entity("Could not find user.")
					.build();
		}
		try {
			// Update database if number has changed
			if (login.isCustomer()) {
				logger.debug("Updating consumer table.");
				Customer customer = customerDAO
						.findById(customerOrRestaurantID);
				if (customer.getLogin().getId() != loginID) {
					return Response.status(BAD_REQUEST)
							.entity("Could not find the customer.").build();
				}
				customer.setContactNumber(phoneNumber);
			}
			else if (login.isRestaurant()) {
				logger.debug("Updating restaurant table.");
				Restaurant restaurant = restaurantDAO
						.findById(customerOrRestaurantID);
				if (restaurant.getLogin().getId() != loginID) {
					return Response.status(BAD_REQUEST)
							.entity("Could not find the restaurant.").build();
				}
				restaurant.setContactNumber(phoneNumber);
			}
			smsHelper.resendPhoneVerificationSMS(login, phoneNumber);
			return Response
					.ok()
					.entity("Successfully sent verification code to phone number "
							+ phoneNumber).build();
		}
		catch (Exception ex) {
			logger.error(ex);
			return Response.serverError().build();
		}
	}
}
