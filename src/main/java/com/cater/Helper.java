package com.cater;

import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;

public class Helper {
	private static final Pattern phonePattern = Pattern.compile("[0-9]{10}");

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
}
