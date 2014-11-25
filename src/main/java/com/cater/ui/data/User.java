package com.cater.ui.data;

import com.cater.constants.Roles;

public class User {
	private String username;
	private Roles role;

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
}
