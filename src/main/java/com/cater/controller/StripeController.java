package com.cater.controller;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cater.constants.EventStatus;
import com.cater.constants.QuoteStatus;
import com.cater.data.Summary;
import com.cater.email.Notification;
import com.cater.model.Quote;
import com.cater.service.CustomerService;
import com.cater.service.RestaurantService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.stripe.Stripe;
import com.stripe.exception.APIConnectionException;
import com.stripe.exception.APIException;
import com.stripe.exception.AuthenticationException;
import com.stripe.exception.CardException;
import com.stripe.exception.InvalidRequestException;
import com.stripe.model.Charge;

/**
 * This controller will charge stripe payment
 * 
 * @author appikonda
 *
 */
@Controller
@RequestMapping(value = { "stripePayment" })
public class StripeController {
	private static final Logger logger = Logger
			.getLogger(StripeController.class);
	private static final String STRIPE_LIVE_KEY = "sk_live_MPCHtykGcxwk1DXVWjq9UUXX";
	private static final String STRIPE_SANDBOX_KEY = "sk_test_8DMVcm6trnvUH50s3GW90ezp";
	/** The restaurant service. */
	@Autowired
	private RestaurantService restaurantService;
	/** The customer service. */
	@Autowired
	private CustomerService customerService;

	// test secret key
	/**
	 * Charge payment.
	 *
	 * @param request
	 *            the request
	 * @param session
	 *            the session
	 * @param redirectAttributes
	 *            the redirect attributes
	 * @param quoteId
	 *            the quote id
	 * @param totalAmount
	 *            the total amount
	 * @return the string
	 */
	// public static String Stripe_apiKey = "sk_test_8DMVcm6trnvUH50s3GW90ezp";
	@RequestMapping(value = { "charge" }, method = RequestMethod.POST)
	public String chargePayment(
			HttpServletRequest request,
			HttpSession session,
			RedirectAttributes redirectAttributes,
			@RequestParam(value = "quoteId", required = false) Integer quoteId,
			@RequestParam(value = "amountInCents", required = true) Integer totalAmount,
			@RequestParam(value = "full_menu_items", required = false) String fullmenuItemsJson,
			@RequestParam(value = "rId", required = false) String rId,
			@RequestParam(value = "summary", required = false) String summaryJson,
			@RequestParam(value = "comments") String comments) {
		Boolean fmf = (Boolean) session.getAttribute("full_menu_flow");
		List <String> errors = Lists.newArrayList();
		redirectAttributes.addFlashAttribute("errors", errors);
		logger.info("In Stripe Payments!!!");
		Summary summary = null;
		int amount = 0;
		try {
			if (Boolean.TRUE.equals(fmf)) {
				summary = new ObjectMapper().readValue(summaryJson,
						Summary.class);
				amount = summary.getTotal().multiply(new BigDecimal(100))
						.intValue();
			}
			else {
				amount = Integer.parseInt(StringUtils.defaultString(
						request.getParameter("amountInCents")).trim());
			}
			String rName = StringUtils.defaultString(
					request.getParameter("restuarantName")).trim();
			Stripe.apiKey = STRIPE_LIVE_KEY;
			// Get the credit card details submitted by the form
			String token = request.getParameter("stripeToken");
			String recieptEmail = request.getParameter("stripeEmail");
			// Create the charge on Stripe's servers - this will charge the user's
			// card
			Map <String, Object> chargeParams = Maps.newHashMap();
			chargeParams.put("amount", amount); // amount in cents, again
			chargeParams.put("currency", "usd");
			chargeParams.put("source", token);
			chargeParams.put("description", "Charge amount for" + rName);
			chargeParams.put("receipt_email", recieptEmail);
			Charge charge = Charge.create(chargeParams);
			if (charge.getStatus().equals("succeeded")) {
				logger.info("RESPONSE SUCCESS");
				List <String> successMessages = Lists.newArrayList();
				redirectAttributes.addFlashAttribute("successMessages",
						successMessages);
				if (Boolean.TRUE.equals(fmf)) {
					Notification notification = new Notification();
					notification.setPaymentStatus(QuoteStatus.PAID.toString());
					notification.setPrice(summary.getSubtotal().doubleValue());
					notification.setSalesTax(summary.getTax().doubleValue());
					notification.setTotalAmount(summary.getTotal()
							.doubleValue());
					StringBuilder message = new StringBuilder(
							"Customer has made a succesful payment for the below menu");
					restaurantService.paymentNotification(fullmenuItemsJson,
							summaryJson, comments, notification, message,
							restaurantService.findRestaurantWithId(new Integer(
									rId)), recieptEmail);
					successMessages
							.add("Congratulations, your order has been placed!");
				}
				else {
					Double salesTax = Double.parseDouble(StringUtils
							.defaultString(request.getParameter("salesTax")));
					Double totalAmt = Double.parseDouble(StringUtils
							.defaultString(request.getParameter("totalAmt")));
					Notification notification = new Notification();
					Quote quote = restaurantService.findQuoteWithId(quoteId);
					quote.setStatus(QuoteStatus.PAID.toString());
					// Reject all other quotes
					for (Quote q : quote.getMenu().getQuotes()) {
						if (!q.getId().equals(quote.getId())) {
							q.setStatus(QuoteStatus.DENIED.toString());
						}
					}
					quote.getMenu().getEvent()
							.setStatus(EventStatus.CONFIRMED.toString());
					notification.setPaymentStatus(QuoteStatus.PAID.toString());
					notification.setSalesTax(salesTax);
					notification.setTotalAmount(totalAmt);
					StringBuilder message = new StringBuilder(
							"Customer has made a succesful payment for the below menu");
					restaurantService.paymentNotification(quote, notification,
							message);
					StringBuilder optionalMessage = new StringBuilder(
							"You have to show this confirmation email at the time of food delivery or food pick up.");
					customerService.paymentNotification(quote, notification,
							optionalMessage);
					successMessages
							.add("Congratulations, your order has been placed!");
					successMessages
							.add("You have to show the confirmation email at the time of food delivery or food pick up.");
				}
			}
			else {
				throw new Exception("Payment failed. Please try again.");
			}
		}
		catch (CardException e) {
			// The card has been declined
			logger.info("Status is: " + e.getCode());
			logger.info("Message is: " + e.getMessage());
			errors.add("Your card has been declined.");
			logger.error("Exception occurred while using Stripe.", e);
		}
		catch (AuthenticationException e) {
			errors.add("Authentication with Stripe's API failed");
			logger.error("Exception occurred while using Stripe.", e);
		}
		catch (InvalidRequestException e) {
			errors.add("Invalid Request.");
			logger.error("Exception occurred while using Stripe.", e);
		}
		catch (APIConnectionException e) {
			errors.add("Network communication with Stripe failed.");
			logger.error("Exception occurred while using Stripe.", e);
		}
		catch (APIException e) {
			errors.add("Stripe communication failed");
			logger.error("Exception occurred while using Stripe.", e);
		}
		catch (Exception e) {
			errors.add(e.getMessage());
			logger.error("Exception occurred while using Stripe.", e);
		}
		if (Boolean.TRUE.equals(fmf)) {
			return "t_home";
		}
		else {
			return "redirect:/customer/dashboard";
		}
	}

	/**
	 * Retrieve payment.
	 *
	 * @param request
	 *            the request
	 * @param session
	 *            the session
	 * @param redirectAttributes
	 *            the redirect attributes
	 * @param track_id
	 *            the track_id
	 * @return the string
	 */
	// TODO: retrieving stripe payment
	@RequestMapping(value = { "retrieve" }, method = RequestMethod.POST)
	public String retrievePayment(HttpServletRequest request,
			HttpSession session, RedirectAttributes redirectAttributes,
			@RequestParam(value = "trackingId", required = true) String track_id) {
		Stripe.apiKey = STRIPE_SANDBOX_KEY;
		try {
			Charge retrieveCharge = Charge.retrieve(track_id);
			retrieveCharge.getAmount();
			retrieveCharge.getCard().getLast4();
		}
		catch (Exception e) {
			logger.error("Exception occurred while retrieving stripe payment.",
					e);
		}
		return null;
	}
}
