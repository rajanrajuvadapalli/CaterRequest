package com.cater.twilio.sms;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.AbstractMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Scanner;

import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

import com.google.common.collect.Maps;

// TODO: Auto-generated Javadoc
/**
 * The Class TwilioCredentials.
 */
public class TwilioCredentials {
	/** The Constant logger. */
	private static final Logger logger = Logger
			.getLogger(TwilioCredentials.class);
	/** The Constant DEFAULT_CREDENTIAL_PROFILES_FILENAME. */
	private static final String DEFAULT_CREDENTIAL_PROFILES_FILENAME = "credentials";
	/** The Constant TWILIO_FILE_PATH. */
	private static final String TWILIO_FILE_PATH = "TWILIO_FILE_PATH";
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
		File credentialsFile = null;
		String filePathOverride = System.getProperty(TWILIO_FILE_PATH);
		//If there is a system variable set for the path, use it
		if (StringUtils.isNotBlank(filePathOverride)) {
			credentialsFile = new File(filePathOverride);
			logger.debug("Twilio filePathOverride: "
					+ credentialsFile.getAbsolutePath());
		}
		else {
			// read ~/.twilio/credentials file
			String userHome = StringUtils.defaultString(System
					.getProperty("user.home"));
			if (userHome == null) {
				logger.debug("User home property is not found.");
				/*throw new TwilioClientException(
						"Unable to load Twilio profiles: "
								+ "'user.home' System property is not set.");*/
			}
			File twilioDirectory = new File(userHome, ".twilio");
			logger.debug("twilioDirectory: " + twilioDirectory);
			credentialsFile = new File(twilioDirectory,
					DEFAULT_CREDENTIAL_PROFILES_FILENAME);
		}
		boolean foundCredentialProfiles = credentialsFile != null
				&& credentialsFile.exists() && credentialsFile.isFile();
		/*if (!foundCredentialProfiles) {
			throw new TwilioClientException(
					"Could not locate twilio credentials file.");
		}*/
		if (foundCredentialProfiles) {
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
		//If twilio system properties are set, they take precedence.
		String sid = StringUtils.defaultIfBlank(
				System.getProperty("TWILIO_SID"), getSid());
		properties.put(PropertyNames.SID.value, sid);
		String authToken = StringUtils.defaultIfBlank(
				System.getProperty("TWILIO_AUTH_TOKEN"), getAuthToken());
		properties.put(PropertyNames.AUTH_TOKEN.value, authToken);
		String fromNumber = StringUtils.defaultIfBlank(
				System.getProperty("TWILIO_FROM_NUMBER"), getFromNumber());
		properties.put(PropertyNames.FROM_NUMBER.value, fromNumber);
		String enabled = StringUtils.defaultIfBlank(
				System.getProperty("TWILIO_ENABLED"),
				properties.get(PropertyNames.IS_SMS_ENABLED.value));
		properties.put(PropertyNames.IS_SMS_ENABLED.value, enabled);
		dumpProperties();
	}

	/**
	 * Dump properties.
	 */
	private void dumpProperties() {
		if (MapUtils.isNotEmpty(properties)) {
			for (Map.Entry <String, String> entry : properties.entrySet()) {
				logger.debug(entry.getKey() + ": " + entry.getValue());
			}
		}
		else {
			logger.debug("Properties are not loaded.");
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
