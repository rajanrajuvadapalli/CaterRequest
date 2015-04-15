package com.cater.twilio.sms;

import static com.cater.constants.QuoteStatus.APPROVED;
import static com.cater.constants.QuoteStatus.CREATED;
import static com.cater.constants.QuoteStatus.CUSTOMER_UPDATED_MENU;
import static com.cater.constants.QuoteStatus.DENIED;
import static com.cater.constants.QuoteStatus.PAID;
import static com.cater.constants.QuoteStatus.RESTAURANT_SUBMITTED_PRICE;
import static com.cater.constants.QuoteStatus.RESTAURANT_UPDATED_PRICE;

import java.util.Locale;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cater.Helper;
import com.cater.constants.QuoteStatus;
import com.cater.constants.Roles;
import com.cater.model.Customer;
import com.cater.model.Event;
import com.cater.model.Login;
import com.cater.model.Quote;
import com.cater.model.Restaurant;
import com.google.common.collect.Maps;
import com.twilio.sdk.TwilioRestException;

/**
 * Description: Created: Mar 27, 2015.
 * 
 * 
 */
@Component
public class SMSHelper {
	/** The Constant logger. */
	private static final Logger logger = Logger.getLogger(SMSHelper.class);
	/** The twilio sms. */
	@Autowired
	private TwilioSMS twilioSms;
	/** The messages. */
	public static Map <Roles, Map <QuoteStatus, String>> messages = Maps
			.newHashMap();
	static {
		Map <QuoteStatus, String> restaurantStatusMessages = Maps.newHashMap();
		messages.put(Roles.RESTAURANT, restaurantStatusMessages);
		restaurantStatusMessages.put(CREATED,
				"You have a new request for quote.");
		restaurantStatusMessages.put(CUSTOMER_UPDATED_MENU,
				"Customer has updated the menu.");
		restaurantStatusMessages.put(APPROVED,
				"Customer has approved your quoted price.");
		restaurantStatusMessages.put(DENIED,
				"Customer has denied your quoted price.");
		restaurantStatusMessages.put(PAID, "Customer has paid.");
	}
	static {
		Map <QuoteStatus, String> customerStatusMessages = Maps.newHashMap();
		messages.put(Roles.CUSTOMER, customerStatusMessages);
		customerStatusMessages.put(CREATED,
				"You have created a new request for quote.");
		customerStatusMessages.put(CUSTOMER_UPDATED_MENU,
				"You updated the menu.");
		customerStatusMessages.put(RESTAURANT_UPDATED_PRICE,
				"Restaurant has updated the price quote.");
		customerStatusMessages.put(RESTAURANT_SUBMITTED_PRICE,
				"Restaurant has submitted a price quote for your event.");
		customerStatusMessages.put(APPROVED,
				"You approved restaurant's quoted price.");
		customerStatusMessages.put(DENIED,
				"You denied restaurant's quoted price.");
		customerStatusMessages.put(PAID, "You paid.");
	}

	/**
	 * Send notification sm sto.
	 *
	 * @param role
	 *            the role
	 * @param quote
	 *            the quote
	 * @param optionalMessage 
	 * @return true, if successful
	 */
	public boolean sendNotificationSMSto(Roles role, Quote quote,
			String optionalMessage) {
		if (quote == null) {
			logger.error("Quote cannot be null.");
			return false;
		}
		try {
			Event event = quote.getMenu().getEvent();
			Restaurant restaurant = quote.getRestaurant();
			Customer customer = event.getCustomer();
			String to = role == Roles.RESTAURANT ? restaurant
					.getContactNumber() : customer.getContactNumber();
			if (canWeSendSms(role, restaurant, customer)) {
				StringBuilder messageBuilder = new StringBuilder(messages.get(
						role).get(QuoteStatus.valueOf(quote.getStatus())));
				messageBuilder.append(" Event name: " + event.getName());
				if (role == Roles.RESTAURANT) {
					messageBuilder.append(" Customer name: "
							+ customer.getName());
				}
				else if (role == Roles.CUSTOMER) {
					messageBuilder.append(" Restaurant name: "
							+ restaurant.getName());
				}
				if (StringUtils.isNotBlank(optionalMessage)) {
					messageBuilder.append(optionalMessage);
				}
				messageBuilder
						.append(" --Please login to your account at http://www.caterrequest.com/login for more details.--");
				twilioSms.sendMessage(to, messageBuilder.toString());
			}
			else {
				logger.debug("Phone number is either not verified or the customer has opted out.");
			}
		}
		catch (TwilioRestException e) {
			logger.error("Failed to send SMS.", e);
			return false;
		}
		return true;
	}

	/**
	 * Can we send sms.
	 *
	 * @param role the role
	 * @param restaurant the restaurant
	 * @param customer the customer
	 * @return true, if successful
	 */
	private boolean canWeSendSms(Roles role, Restaurant restaurant,
			Customer customer) {
		// If restaurant, check if the number is verified.
		// If customer, check if they enrolled for getting notifications, then check if the number is verified.
		if (role == Roles.RESTAURANT) {
			return restaurant.isNumberVerified();
		}
		else if (role == Roles.CUSTOMER && customer.isSmsOk()) {
			return customer.isNumberVerified();
		}
		return false;
	}

	/**
	 * Send registration confirmation sms.
	 *
	 * @param login the login
	 * @param isSmsOk the is sms ok
	 * @param phoneNumber the phone number
	 * @return true, if successful
	 */
	public boolean sendRegistrationConfirmationSMS(Login login,
			boolean isSmsOk, String phoneNumber) {
		try {
			//If customer opts for SMS, send verification code to their mobile numbers.
			//If restaurant, always send verification code to their mobile numbers.
			if (Roles.RESTAURANT == Roles.get(login.getRole()) || isSmsOk) {
				String phoneVerificationCode = StringUtils.upperCase(
						StringUtils.substring(login.getPassword(), 4, 9),
						Locale.US);
				String to = Helper.extractJust10digitNumber(phoneNumber);
				String msg = "Thank you for registering with www.CaterRequest.com. "
						+ "Please check your registered email and click on the confirmation link to activate your account."
						+ "Your verification code is: " + phoneVerificationCode;
				twilioSms.sendMessage(to, msg);
				return true;
			}
		}
		catch (TwilioRestException e) {
			logger.error("Failed to send SMS.", e);
		}
		return false;
	}

	/**
	 * Resend phone verification sms.
	 *
	 * @param login the login
	 * @param phoneNumber the phone number
	 * @return true, if successful
	 */
	public boolean resendPhoneVerificationSMS(Login login, String phoneNumber) {
		try {
			String phoneVerificationCode = StringUtils
					.upperCase(
							StringUtils.substring(login.getPassword(), 4, 9),
							Locale.US);
			String to = Helper.extractJust10digitNumber(phoneNumber);
			String msg = "Your verification code is: " + phoneVerificationCode;
			twilioSms.sendMessage(to, msg);
			return true;
		}
		catch (TwilioRestException e) {
			logger.error("Failed to send SMS.", e);
		}
		return false;
	}
}
