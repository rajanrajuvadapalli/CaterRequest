package com.cater.twilio.sms;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.AbstractMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Scanner;

import org.apache.commons.lang3.StringUtils;

import com.google.common.collect.Maps;

/**
 * The Class TwilioCredentials.
 */
public class TwilioCredentials {
	/** The Constant DEFAULT_CREDENTIAL_PROFILES_FILENAME. */
	private static final String DEFAULT_CREDENTIAL_PROFILES_FILENAME = "credentials";
	/** The properties. */
	private Map <String, String> properties = Maps.newHashMap();

	/**
	 * The Enum PropertyNames.
	 */
	private enum PropertyNames {
		/** The sid. */
		SID("twilio.sid"),
		/** The auth token. */
		AUTH_TOKEN("twilio.auth"),
		/** The from number. */
		FROM_NUMBER("twilio.from.number"),
		/** The is sms enabled. */
		IS_SMS_ENABLED("twilio.sms.enabled");
		/** The value. */
		String value;

		/**
		 * Instantiates a new property names.
		 *
		 * @param keyName the key name
		 */
		PropertyNames(String keyName) {
			this.value = keyName;
		}
	}

	/**
	 * Instantiates a new twilio credentials.
	 *
	 * @throws TwilioClientException the twilio client exception
	 */
	public TwilioCredentials() throws TwilioClientException {
		// read ~/.twilio/credentials file
		String userHome = System.getProperty("user.home");
		if (userHome == null) {
			throw new TwilioClientException("Unable to load Twilio profiles: "
					+ "'user.home' System property is not set.");
		}
		File twilioDirectory = new File(userHome, ".twilio");
		File credentialsFile = new File(twilioDirectory,
				DEFAULT_CREDENTIAL_PROFILES_FILENAME);
		boolean foundCredentialProfiles = credentialsFile.exists()
				&& credentialsFile.isFile();
		if (!foundCredentialProfiles) {
			throw new TwilioClientException(
					"Could not locate twilio credentials file.");
		}
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(credentialsFile);
			readCredentails(new Scanner(fis));
		}
		catch (IOException ioe) {
			throw new TwilioClientException(
					"Unable to load Twilio credentials file at: "
							+ credentialsFile.getAbsolutePath(), ioe);
		}
		finally {
			if (fis != null)
				try {
					fis.close();
				}
				catch (IOException ioe) {
				}
		}
	}

	/**
	 * Read credentails.
	 *
	 * @param scanner the scanner
	 */
	private void readCredentails(Scanner scanner) {
		try {
			while (scanner.hasNextLine()) {
				String line = scanner.nextLine().trim();
				// Empty or comment lines
				if (line.isEmpty() || line.startsWith("#")) {
					continue;
				}
				Entry <String, String> property = parsePropertyLine(line);
				properties.put(property.getKey(), property.getValue());
			}
		}
		finally {
			scanner.close();
		}
	}

	/**
	 * Parses the property line.
	 *
	 * @param propertyLine the property line
	 * @return the entry
	 */
	private static Entry <String, String> parsePropertyLine(String propertyLine) {
		String[] pair = propertyLine.split("=", 2);
		if (pair.length != 2) {
			throw new IllegalArgumentException(
					"Invalid property format: no '=' character is found in the line ["
							+ propertyLine + "].");
		}
		String propertyKey = pair[0].trim();
		String propertyValue = pair[1].trim();
		return new AbstractMap.SimpleImmutableEntry <String, String>(
				propertyKey, propertyValue);
	}

	/**
	 * Gets the sid.
	 *
	 * @return the sid
	 */
	public String getSid() {
		return properties.get(PropertyNames.SID.value);
	}

	/**
	 * Gets the auth token.
	 *
	 * @return the auth token
	 */
	public String getAuthToken() {
		return properties.get(PropertyNames.AUTH_TOKEN.value);
	}

	/**
	 * Gets the from number.
	 *
	 * @return the from number
	 */
	public String getFromNumber() {
		return properties.get(PropertyNames.FROM_NUMBER.value);
	}

	/**
	 * Checks if is sms enabled.
	 *
	 * @return true, if is sms enabled
	 */
	public boolean isSmsEnabled() {
		return StringUtils.equalsIgnoreCase("true",
				properties.get(PropertyNames.IS_SMS_ENABLED.value));
	}
}
