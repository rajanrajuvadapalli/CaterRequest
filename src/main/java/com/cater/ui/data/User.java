package com.cater.ui.data;

import com.cater.constants.Roles;

public class User {
	private int loginID;
	private String username;
	private Roles role;
	private RegistrationData data;

	public int getLoginID() {
		return loginID;
	}

	public void setLoginID(int loginID) {
		this.loginID = loginID;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Roles getRole() {
		return role;
	}

	public void setRole(Roles role) {
		this.role = role;
	}

	public RegistrationData getData() {
		return data;
	}

	public void setData(RegistrationData data) {
		this.data = data;
	}
}
