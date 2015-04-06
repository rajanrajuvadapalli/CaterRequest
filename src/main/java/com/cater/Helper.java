package com.cater;

import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;

// TODO: Auto-generated Javadoc
/**
 * The Class Helper.
 */
public final class Helper {
	/** The Constant phonePattern. */
	private static final Pattern phonePattern = Pattern.compile("[0-9]{10}");

	/**
	 * Instantiates a new helper.
	 */
	private Helper() {
		//All methods are static
	}

	/**
	 * Format phone.
	 *
	 * @param phone the phone
	 * @return the string
	 */
	public static String formatPhone(String phone) {
		if (StringUtils.isNotBlank(phone)
				&& phonePattern.matcher(phone).matches()) {
			return String.format("(%s) %s-%s",
					StringUtils.substring(phone, 0, 3),
					StringUtils.substring(phone, 3, 6),
					StringUtils.substring(phone, 6, 10));
		}
		return phone;
	}

	/**
	 * String to integer.
	 *
	 * @param aString the a string
	 * @return the integer
	 */
	public static Integer stringToInteger(String aString) {
		try {
			return Integer.parseInt(aString);
		}
		catch (Exception ex) {
			return null;
		}
	}


	/**
	 * Extract just10digit number.
	 *
	 * @param phone the phone
	 * @return the string
	 */
	public static String extractJust10digitNumber(String phone) {
		String massagedPhone = StringUtils.replaceEach(
				StringUtils.defaultString(phone), new String[] { "-", "(", ")",
						" " }, new String[] { "", "", "", "" });
		return massagedPhone;
	}
}
