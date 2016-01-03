package com.cater.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.cater.constants.Roles;

/**
 * The Class Login.
 * 
 * Script for MySQL
 * CREATE TABLE cater4party.Login (
	`id` INT NOT NULL AUTO_INCREMENT
	,PRIMARY KEY (id)
	,`username` VARCHAR(50) NOT NULL 
	,`password` VARCHAR(250) NOT NULL 
	,`role` VARCHAR(20) NOT NULL 
	,`active` BIT NOT NULL 
	,`create_ts` DATETIME NOT NULL
	,`lupd_ts` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP)
 */
@Entity
@Table(name = "Login")
public class Login extends TimestampEntity implements Serializable {
	private static final long serialVersionUID = -7098840889708226176L;
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(name = "username", length = 50, nullable = false, unique = true, updatable = false)
	private String username;
	@Column(name = "password", length = 250, nullable = false, unique = false, updatable = true)
	private String password;
	@Column(name = "role", length = 20, nullable = false, unique = false, updatable = true)
	private String role;
	@Column(name = "active", nullable = false, unique = false, updatable = true)
	private boolean active;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
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

	public boolean isCustomer() {
		return Roles.CUSTOMER == Roles.get(getRole());
	}

	public boolean isRestaurant() {
		return Roles.RESTAURANT == Roles.get(getRole());
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + (active ? 1231 : 1237);
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((password == null) ? 0 : password.hashCode());
		result = prime * result + ((role == null) ? 0 : role.hashCode());
		result = prime * result
				+ ((username == null) ? 0 : username.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (getClass() != obj.getClass())
			return false;
		Login other = (Login) obj;
		if (active != other.active)
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		}
		else if (!id.equals(other.id))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		}
		else if (!password.equals(other.password))
			return false;
		if (role == null) {
			if (other.role != null)
				return false;
		}
		else if (!role.equals(other.role))
			return false;
		if (username == null) {
			if (other.username != null)
				return false;
		}
		else if (!username.equals(other.username))
			return false;
		return true;
	}
}
