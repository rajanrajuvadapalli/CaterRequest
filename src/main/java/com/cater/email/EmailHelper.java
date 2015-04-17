package com.cater.email;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.time.DateFormatUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.cater.constants.QuoteStatus;
import com.cater.constants.Roles;
import com.cater.model.Customer;
import com.cater.model.Event;
import com.cater.model.Quote;
import com.cater.model.Restaurant;
import com.cater.twilio.sms.SMSHelper;

/**
 * The Class EmailHelper.
 * @since 01/22/2015
 */
@Component
public class EmailHelper {
	/** The Constant logger. */
	private static final Logger logger = Logger.getLogger(EmailHelper.class);
	/** The admin email. */
	@Value("${admin.email}")
	private String ADMIN_EMAIL;
	/** The amazon ses. */
	@Autowired
	private AmazonSES amazonSES;
	/** The email subject_registration confirmation. */
	@Value("${email.subject.registration.confirmation}")
	private String emailSubject_registrationConfirmation;
	/** The email subject_password reset. */
	@Value("${email.subject.password.reset}")
	private String emailSubject_passwordReset;
	/** The email subject_notification. */
	@Value("${email.subject.notification}")
	private String emailSubject_notification;

	/**
	 * Send registration confirmation email.
	 *
	 * @param username the username
	 * @param confirmationToken the confirmation token
	 * @param toAddresses the to addresses
	 * @return true, if successful
	 */
	public boolean sendRegistrationConfirmationEmail(String username,
			String confirmationToken, String... toAddresses) {
		try {
			File f = new File(EmailHelper.class.getResource(
					"/email/registrationConfirmation.html").getFile());
			String emailBody = FileUtils.readFileToString(f);
			String[] searchList = new String[2];
			String[] replacementList = new String[2];
			searchList[0] = "${USERNAME}";
			replacementList[0] = username;
			searchList[1] = "${TOKEN}";
			replacementList[1] = confirmationToken;
			emailBody = StringUtils.replaceEach(emailBody, searchList,
					replacementList);
			amazonSES.sendEmail(emailSubject_registrationConfirmation,
					emailBody, toAddresses);
		}
		catch (IOException e) {
			logger.error("Error while sending registration confirmation email.");
			return false;
		}
		return true;
	}

	/**
	 * Send contact us email.
	 *
	 * @param name the name
	 * @param requesterEmail the requester email
	 * @param subject the subject
	 * @param message the message
	 * @return true, if successful
	 */
	public boolean sendContactUsEmail(String name, String requesterEmail,
			String subject, String message) {
		try {
			String emailSubject = "Message from " + name + " [" + subject + "]";
			File f = new File(EmailHelper.class.getResource(
					"/email/contactUs.html").getFile());
			String emailBody = FileUtils.readFileToString(f);
			String[] searchList = new String[3];
			String[] replacementList = new String[3];
			searchList[0] = "${NAME}";
			replacementList[0] = name;
			searchList[1] = "${EMAIL}";
			replacementList[1] = requesterEmail;
			searchList[2] = "${MESSAGE}";
			replacementList[2] = stringToHtml(message);
			emailBody = StringUtils.replaceEach(emailBody, searchList,
					replacementList);
			String[] toAddresses = new String[] { ADMIN_EMAIL, requesterEmail };
			amazonSES.sendEmail(emailSubject, emailBody, toAddresses);
		}
		catch (IOException e) {
			logger.error("Error while sending contact us email.");
			return false;
		}
		return true;
	}

	/**
	 * String to html.
	 *
	 * @param message the message
	 * @return the string
	 */
	private String stringToHtml(String message) {
		return StringUtils.replace(message, "\n", "<br>");
	}

	/**
	 * Send notification email to.
	 *
	 * @param role the role
	 * @param quote the quote
	 * @param optionalMessage the optional message
	 * @return true, if successful
	 */
	public boolean sendNotificationEmailTo(Roles role, Quote quote,
			String optionalMessage) {
		if (quote == null) {
			logger.error("Quote cannot be null.");
			return false;
		}
		try {
			Event event = quote.getMenu().getEvent();
			Restaurant restaurant = quote.getRestaurant();
			Customer customer = event.getCustomer();
			String to = role == Roles.RESTAURANT ? restaurant.getContactEmail()
					: customer.getContactEmail();
			String username = role == Roles.RESTAURANT ? restaurant.getName()
					: customer.getName();
			File f = new File(EmailHelper.class.getResource(
					"/email/notification.html").getFile());
			String emailBody = FileUtils.readFileToString(f);
			String[] searchList = new String[8];
			String[] replacementList = new String[8];
			searchList[0] = "${USERNAME}";
			replacementList[0] = username;
			searchList[1] = "${STATUS_MESSAGE}";
			replacementList[1] = SMSHelper.messages.get(role).get(
					QuoteStatus.valueOf(quote.getStatus()));
			searchList[2] = "${EVENT_NAME}";
			replacementList[2] = event.getName();
			searchList[3] = "${EVENT_TIME}";
			replacementList[3] = DateFormatUtils.format(event.getDate_time(),
					"yyyy-MM-dd HH:mm:SS");
			searchList[4] = "${CUSTOMER_NAME}";
			replacementList[4] = customer.getName();
			searchList[5] = "${RESTAURANT_NAME}";
			replacementList[5] = restaurant.getName();
			searchList[6] = "${QUOTE_PRICE}";
			replacementList[6] = quote.getPrice() == null ? "" : StringUtils
					.defaultString(quote.getPrice().toString());
			searchList[7] = "${COMMENTS}";
			replacementList[7] = StringUtils.defaultString(optionalMessage);
			emailBody = StringUtils.replaceEach(emailBody, searchList,
					replacementList);
			String[] toAddresses = new String[] { to };
			amazonSES.sendEmail(emailSubject_notification, emailBody,
					toAddresses);
		}
		catch (IOException e) {
			logger.error("Error while sending notificaiton email.");
			return false;
		}
		return true;
	}

	/**
	 * Send password reset email.
	 *
	 * @param newPwdRaw the new pwd raw
	 * @param resetToken_URLSafe the reset token_ url safe
	 * @param toAddress the to address
	 * @return true, if successful
	 */
	public boolean sendPasswordResetEmail(String newPwdRaw,
			String resetToken_URLSafe, String toAddress) {
		try {
			File f = new File(EmailHelper.class.getResource(
					"/email/passwordReset.html").getFile());
			String emailBody = FileUtils.readFileToString(f);
			String[] searchList = new String[3];
			String[] replacementList = new String[3];
			searchList[0] = "${USERNAME}";
			replacementList[0] = toAddress;
			searchList[1] = "${TEMP_PWD}";
			replacementList[1] = newPwdRaw;
			searchList[2] = "${TOKEN}";
			replacementList[2] = resetToken_URLSafe;
			emailBody = StringUtils.replaceEach(emailBody, searchList,
					replacementList);
			amazonSES.sendEmail(emailSubject_passwordReset, emailBody,
					toAddress);
		}
		catch (IOException e) {
			logger.error("Error while sending registration confirmation email.");
			return false;
		}
		return true;
	}
}
