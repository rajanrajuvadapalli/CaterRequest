package com.cater.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Login")
public class Login extends AbstractTimestampEntity implements Serializable {
	private static final long serialVersionUID = -7098840889708226176L;
	@Id
	@Column(name = "login_pk")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "username", length = 50, nullable = false, unique = true, updatable = false)
	private String username;
	@Column(name = "password", length = 250, nullable = false, unique = false, updatable = true)
	private String password;
	@Column(name = "role", length = 20, nullable = false, unique = false, updatable = true)
	private String role;
	@Column(name = "active", nullable = false, unique = false, updatable = true)
	private boolean active;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}
}
