package com.cater.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cater.constants.EventStatus;
import com.cater.constants.QuoteStatus;
import com.cater.model.Quote;
import com.cater.service.CustomerService;
import com.cater.service.RestaurantService;
import com.google.common.collect.Lists;
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
	/** The restaurant service. */
	@Autowired
	private RestaurantService restaurantService;
	/** The customer service. */
	@Autowired
	private CustomerService customerService;

	// test secret key
	// public static String Stripe_apiKey = "sk_test_8DMVcm6trnvUH50s3GW90ezp";

	@RequestMapping(value = { "charge" }, method = RequestMethod.POST)
	public String chargePayment(HttpServletRequest request, HttpSession session, RedirectAttributes redirectAttributes,
			@RequestParam(value = "quoteId", required = true) Integer quoteId,
			@RequestParam(value = "amountInCents", required = true) Integer totalAmount) {
		List<String> errors = Lists.newArrayList();
		redirectAttributes.addFlashAttribute("errors", errors);
		System.out.println("In Stripe Payments!!!");

		Stripe.apiKey = "sk_live_MPCHtykGcxwk1DXVWjq9UUXX";
		// Get the credit card details submitted by the form
		String token = request.getParameter("stripeToken");

		// Create the charge on Stripe's servers - this will charge the user's
		// card
		try {
			Map<String, Object> chargeParams = new HashMap<String, Object>();
			chargeParams.put("amount", totalAmount); // amount in cents, again
			chargeParams.put("currency", "usd");
			chargeParams.put("source", token);
			chargeParams.put("description", "Charge amount");

			Charge charge = Charge.create(chargeParams);

			System.out.println("amount:" + charge.getAmount());
			System.out.println("status:" + charge.getStatus());
			if (charge.getStatus().equals("succeeded")) {
				System.out.println("RESPONSE SUCCESS");
				Quote quote = restaurantService.findQuoteWithId(quoteId);

				quote.setStatus(QuoteStatus.PAID.toString());
				List<String> successMessages = Lists.newArrayList();
				redirectAttributes.addFlashAttribute("successMessages", successMessages);
				// Reject all other quotes
				for (Quote q : quote.getMenu().getQuotes()) {
					if (!q.getId().equals(quote.getId())) {
						q.setStatus(QuoteStatus.DENIED.toString());
					}
				}
				quote.getMenu().getEvent().setStatus(EventStatus.CONFIRMED.toString());
				restaurantService.sendNotification(quote, null);
				customerService.sendNotification(quote);
				successMessages.add("Congratulations, your order has been placed!");
			} else {

				throw new Exception("Payment failed. Please try again.");
			}

		} catch (CardException e) {
			// The card has been declined
			System.out.println("Status is: " + e.getCode());
			System.out.println("Message is: " + e.getMessage());
			errors.add("The card has been declined");

			e.printStackTrace();
		} catch (AuthenticationException e) {
			errors.add("he card has been declined");
			e.printStackTrace();
		} catch (InvalidRequestException e) {
			errors.add("Invalid Request ");
			e.printStackTrace();
		} catch (APIConnectionException e) {
			errors.add("Network communication with Stripe failed");
			e.printStackTrace();
		} catch (APIException e) {

			e.printStackTrace();
		} catch (Exception e) {
			errors.add(e.getMessage());
			e.printStackTrace();
		}

		return "redirect:/customer/dashboard";
	}

}
