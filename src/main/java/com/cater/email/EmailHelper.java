package com.cater.email;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cater.controller.MenuController;

/**
 * The Class EmailHelper.
 * @since 01/22/2015
 * @author Hari 
 */
@Component
public class EmailHelper {
	private static final Logger logger = Logger.getLogger(EmailHelper.class);
	@Autowired
	private AmazonSES amazonSES;

	/**
	 * Send registration confirmation email.
	 *
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
}
