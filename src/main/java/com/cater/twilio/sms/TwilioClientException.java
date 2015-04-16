package com.cater.twilio.sms;


public class TwilioClientException extends Exception {
	private static final long serialVersionUID = 4530858093325780582L;

	public TwilioClientException(String message) {
		super(message);
	}

	public TwilioClientException(String message, Throwable t) {
		super(message, t);
	}

}
