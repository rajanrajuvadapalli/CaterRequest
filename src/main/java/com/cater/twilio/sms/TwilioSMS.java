package com.cater.twilio.sms;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.google.common.collect.Lists;
import com.twilio.sdk.TwilioRestClient;
import com.twilio.sdk.TwilioRestException;
import com.twilio.sdk.resource.factory.MessageFactory;
import com.twilio.sdk.resource.instance.Message;

/**
 * Description: I use Twilio's RESTful API to send SMS messages.
 * Created: Mar 27, 2015
 * @author Hari 
 */
@Component
public class TwilioSMS {
	private static final Logger logger = Logger.getLogger(TwilioSMS.class);
	@Value("${twilio.sid}")
	private String sid;
	@Value("${twilio.auth}")
	private String auth_token;
	@Value("${twilio.from.number}")
	private String from;
	private TwilioRestClient client;
	@Value("${sms.enabled}")
	private boolean smsEnabled;

	/**
	 * Send message.
	 *
	 * @param to the to
	 * @param body the body
	 * @throws TwilioRestException the twilio rest exception
	 */
	public void sendMessage(String to, String body) throws TwilioRestException {
		if (!smsEnabled || StringUtils.isBlank(to) || StringUtils.isBlank(body)) {
			return;
		}
		logger.debug("Sending SMS to " + to + " with body: " + body);
		// Build the parameters 
		List <NameValuePair> params = Lists.newArrayList();
		params.add(new BasicNameValuePair("To", to));
		params.add(new BasicNameValuePair("From", from));
		params.add(new BasicNameValuePair("Body", body));
		MessageFactory messageFactory = getClient().getAccount()
				.getMessageFactory();
		Message message = messageFactory.create(params);
		logger.debug("Message sent! SID: " + message.getSid());
	}

	/**
	 * Gets the client.
	 *
	 * @return the client
	 */
	private TwilioRestClient getClient() {
		if (client == null) {
			client = new TwilioRestClient(sid, auth_token);
		}
		return client;
	}
}
