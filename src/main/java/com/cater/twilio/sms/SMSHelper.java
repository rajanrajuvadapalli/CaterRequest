package com.cater.twilio.sms;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cater.constants.QuoteStatus;
import com.twilio.sdk.TwilioRestException;

/**
 * Description: 
 * Created: Mar 27, 2015
 * @author Hari 
 */
@Component
public class SMSHelper {
	private static final Logger logger = Logger.getLogger(SMSHelper.class);
	@Autowired
	private TwilioSMS twilioSms;

	public boolean sendStatusNotification(String to, QuoteStatus quoteStatus) {
		if (StringUtils.isBlank(to) || quoteStatus == null) {
			return false;
		}
		try {
			twilioSms.sendMessage(to, createMessage(quoteStatus));
		}
		catch (TwilioRestException e) {
			logger.error("Failed to send SMS.", e);
			return false;
		}
		return true;
	}

	private String createMessage(QuoteStatus quoteStatus) {
		switch (quoteStatus) {
		case CREATED:
			return "You have successfully created request for quote.";
		default:
			break;
		}
		return "";
	}
}
