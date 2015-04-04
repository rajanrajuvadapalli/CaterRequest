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

import com.cater.dao.CustomerDAO;
import com.cater.dao.LoginDAO;
import com.cater.dao.RestaurantDAO;
import com.cater.model.Customer;
import com.cater.model.Login;
import com.cater.model.Restaurant;

@Path("/phone")
public class PhoneService {
	private static final Logger logger = Logger.getLogger(PhoneService.class);
	private LoginDAO loginDAO;
	private CustomerDAO customerDAO;
	private RestaurantDAO restaurantDAO;

	public PhoneService() {
		WebApplicationContext webApplicationContext = ContextLoader
				.getCurrentWebApplicationContext();
		loginDAO = webApplicationContext.getBean(LoginDAO.class);
		customerDAO = webApplicationContext.getBean(CustomerDAO.class);
		restaurantDAO = webApplicationContext.getBean(RestaurantDAO.class);
	}

	@POST
	@Path("/verify/{loginId}")
	@Consumes(TEXT_PLAIN)
	@Produces(TEXT_PLAIN)
	public Response verifyNumber(@PathParam("loginId") int loginId,
			@QueryParam("role") String role, String payload) {
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
				if (StringUtils.equalsIgnoreCase("customer", role)) {
					logger.debug("Updating consumer table.");

					Customer customer = customerDAO.findByLoginID(loginId);
					customer.setNumberVerified(true);
					customerDAO.saveOrUpdate(customer);
				} else if (StringUtils.equalsIgnoreCase("restaurant", role)) {
					logger.debug("Updating restaurant table.");
					Restaurant restaurant = restaurantDAO
							.findByLoginID(loginId);
					restaurant.setNumberVerified(true);
					restaurantDAO.saveOrUpdate(restaurant);
				}
				return Response.ok()
						.entity("Successfully validated phone number.").build();
			}
			return Response
					.ok()
					.entity("Incorrect verification code used. Please try again.")
					.build();
		} catch (Exception ex) {
			logger.error(ex);
			return Response.serverError().build();
		}
	}
}
