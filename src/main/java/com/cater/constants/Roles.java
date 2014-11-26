package com.cater.constants;

import org.apache.commons.lang3.StringUtils;

public enum Roles {
	ADMIN("ADMIN"),
	CUSTOMER("CUSTOMER"),
	RESTAURANT("RESTAURANT");
	private String value;

	private Roles(String value) {
		this.value = value;
	}

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

	public String getValue() {
		return value;
	}

	@Override
	public String toString() {
		return value;
	}
}
