package com.cater.constants;

import org.apache.commons.lang3.StringUtils;

public enum Roles {
	ADMIN,
	CUSTOMER,
	RESTAURANT;
	/**
	 * Gets the.
	 *
	 * @param s the s
	 * @return the roles
	 */
	public static Roles get(String s) {
		Roles rVal = null;
		for (Roles t : Roles.values()) {
			if (StringUtils.equalsIgnoreCase(t.toString(), s)) {
				rVal = t;
				break;
			}
		}
		return rVal;
	}
}
