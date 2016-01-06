package com.cater.service.rest;

import static javax.ws.rs.core.MediaType.TEXT_PLAIN;
import static javax.ws.rs.core.Response.Status.BAD_REQUEST;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
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
	 * Verify number.
	 *
	 * @param loginId the login id
	 * @param role the role
	 * @param payload the payload
	 * @param restaurantBranchID the restaurant branch id
	 * @return the response
	 */
	@POST
	@Path("/verify/{loginId}/{role}")
	@Consumes(TEXT_PLAIN)
	@Produces(TEXT_PLAIN)
	public Response verifyNumber(@PathParam("loginId") int loginId,
			@PathParam("role") String role, String payload,
			@QueryParam("restaurantID") int restaurantID) {
		String verificationCode = payload;
		logger.debug("Verifying phone number for user with login ID: "
				+ loginId + " with Verification Code: " + verificationCode);
		if (StringUtils.isBlank(verificationCode)) {
			logger.debug("Verification code cannot be blank.");
			return Response.status(BAD_REQUEST)
					.entity("Verification code cannot be blank.").build();
		}
		if (StringUtils.isBlank(role)) {
			logger.debug("Role cannot be blank.");
			return Response.status(BAD_REQUEST).entity("Role cannot be blank.")
					.build();
		}
		// Retrieve the user from DB
		Login login = loginDAO.findById(loginId);
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
				String successMessage = "Successfully validated phone number.";
				if (StringUtils.equalsIgnoreCase("customer", role)) {
					logger.debug("Updating consumer table.");
					Customer customer = customerDAO.findByLoginID(loginId);
					customer.setNumberVerified(true);
				}
				else if (StringUtils.equalsIgnoreCase("restaurant", role)) {
					logger.debug("Updating restaurant table.");
					Restaurant branch = restaurantDAO.findById(restaurantID);
					branch.setNumberVerified(true);
					successMessage = "Successfully validated phone number for your branch at "
							+ branch.getAddress().getStreet1();
				}
				return Response.ok().entity(successMessage).build();
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
	 * @param loginId the login id
	 * @param role the role
	 * @param payload the payload
	 * @param restaurantBranchID the restaurant branch id
	 * @return the response
	 */
	@POST
	@Path("/verify/sendcode/{loginId}/{role}")
	@Consumes(TEXT_PLAIN)
	@Produces(TEXT_PLAIN)
	public Response sendVerificationCode(@PathParam("loginId") int loginId,
			@PathParam("role") String role, String payload,
			@QueryParam("restaurantID") int restaurantID) {
		String phoneNumber = Helper.extractJust10digitNumber(payload);
		logger.debug("Sending phone verification code for user with login ID: "
				+ loginId);
		if (StringUtils.isBlank(role)) {
			logger.debug("Role cannot be blank.");
			return Response.status(BAD_REQUEST).entity("Role cannot be blank.")
					.build();
		}
		// Retrieve the user from DB
		Login login = loginDAO.findById(loginId);
		if (login == null) {
			logger.debug("Could not find user.");
			return Response.status(BAD_REQUEST).entity("Could not find user.")
					.build();
		}
		try {
			// Update database if number has changed
			if (StringUtils.equalsIgnoreCase("customer", role)) {
				logger.debug("Updating consumer table.");
				Customer customer = customerDAO.findByLoginID(loginId);
				customer.setContactNumber(phoneNumber);
			}
			else if (StringUtils.equalsIgnoreCase("restaurant", role)) {
				logger.debug("Updating restaurant table.");
				Restaurant branch = restaurantDAO.findById(restaurantID);
				branch.setContactNumber(phoneNumber);
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
