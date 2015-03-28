package com.cater.twilio.sms;

import java.util.ArrayList;
import java.util.List;

import org.apache.http.NameValuePair;
import org.apache.http.message.BasicNameValuePair;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

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
	@Value("${twilio.sid}")
	private String sid;
	@Value("${twilio.auth}")
	private String auth_token;
	@Value("${twilio.from.number}")
	private String from;
	private TwilioRestClient client;

	/**
	 * Send message.
	 *
	 * @param to the to
	 * @param body the body
	 * @throws TwilioRestException the twilio rest exception
	 */
	public void sendMessage(String to, String body) throws TwilioRestException {
		// Build the parameters 
		List <NameValuePair> params = new ArrayList <NameValuePair>();
		params.add(new BasicNameValuePair("To", to));
		params.add(new BasicNameValuePair("From", from));
		params.add(new BasicNameValuePair("Body", body));
		MessageFactory messageFactory = getClient().getAccount()
				.getMessageFactory();
		Message message = messageFactory.create(params);
		System.out.println(message.getSid());
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
