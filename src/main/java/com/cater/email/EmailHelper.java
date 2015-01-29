package com.cater.email;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.cater.controller.MenuController;

/**
 * The Class EmailHelper.
 * @since 01/22/2015
 * @author Hari 
 */
@Component
public class EmailHelper {
	/** The Constant logger. */
	private static final Logger logger = Logger.getLogger(EmailHelper.class);
	@Value("${admin.email}")
	private String ADMIN_EMAIL;
	/** The amazon ses. */
	@Autowired
	private AmazonSES amazonSES;

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
			String emailSubject = EmailSubject.REGISTRATION_CONFIRMATION;
			File f = new File(MenuController.class.getResource(
					"/email/registrationConfirmation.html").getFile());
			String emailBody = FileUtils.readFileToString(f);
			emailBody = StringUtils.replace(emailBody, "${USERNAME}", username);
			emailBody = StringUtils.replace(emailBody, "${TOKEN}",
					confirmationToken);
			amazonSES.sendEmail(emailSubject, emailBody, toAddresses);
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
			File f = new File(MenuController.class.getResource(
					"/email/contactUs.html").getFile());
			String emailBody = FileUtils.readFileToString(f);
			emailBody = StringUtils.replace(emailBody, "${NAME}", name);
			emailBody = StringUtils.replace(emailBody, "${EMAIL}",
					requesterEmail);
			emailBody = StringUtils.replace(emailBody, "${MESSAGE}",
					stringToHtml(message));
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
}
