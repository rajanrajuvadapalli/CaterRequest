package com.cater.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * The Class Address.
 * 
 * Script for MySQL
 * CREATE TABLE cater4party.Address (
	`id` INT NOT NULL  AUTO_INCREMENT
	,PRIMARY KEY (id)
	,`street1` VARCHAR(50) NOT NULL 
	,`street2` VARCHAR(50)  NULL 
	,`city` VARCHAR(20) NOT NULL 
	,`state` VARCHAR(2) NOT NULL 
	,`zip` VARCHAR(9) NOT NULL 
	,`create_ts` DATETIME NOT NULL
	,`lupd_ts` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP)
 */
@Entity
@Table(name = "Address")
public class Address extends AbstractTimestampEntity implements Serializable {
	private static final long serialVersionUID = -5664392162328826793L;
	private static final String NEW_LINE = "\n";
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "street1", length = 50, nullable = false)
	private String street1;
	@Column(name = "street2", length = 50, nullable = true)
	private String street2;
	@Column(name = "city", length = 20, nullable = false)
	private String city;
	@Column(name = "state", length = 2, nullable = false)
	private String state;
	@Column(name = "zip", length = 9, nullable = false)
	private String zip;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getStreet1() {
		return street1;
	}

	public void setStreet1(String street1) {
		this.street1 = street1;
	}

	public String getStreet2() {
		return street2;
	}

	public void setStreet2(String street2) {
		this.street2 = street2;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	/* (non-Javadoc)
	 * @see com.cater.model.AbstractTimestampEntity#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((city == null) ? 0 : city.hashCode());
		result = prime * result + id;
		result = prime * result + ((state == null) ? 0 : state.hashCode());
		result = prime * result + ((street1 == null) ? 0 : street1.hashCode());
		result = prime * result + ((street2 == null) ? 0 : street2.hashCode());
		result = prime * result + ((zip == null) ? 0 : zip.hashCode());
		return result;
	}

	/* (non-Javadoc)
	 * @see com.cater.model.AbstractTimestampEntity#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (getClass() != obj.getClass())
			return false;
		Address other = (Address) obj;
		if (city == null) {
			if (other.city != null)
				return false;
		}
		else if (!city.equals(other.city))
			return false;
		if (id != other.id)
			return false;
		if (state == null) {
			if (other.state != null)
				return false;
		}
		else if (!state.equals(other.state))
			return false;
		if (street1 == null) {
			if (other.street1 != null)
				return false;
		}
		else if (!street1.equals(other.street1))
			return false;
		if (street2 == null) {
			if (other.street2 != null)
				return false;
		}
		else if (!street2.equals(other.street2))
			return false;
		if (zip == null) {
			if (other.zip != null)
				return false;
		}
		else if (!zip.equals(other.zip))
			return false;
		return true;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("[street1: ").append(street1).append(NEW_LINE);
		builder.append("street2: ").append(street2).append(NEW_LINE);
		builder.append("city: ").append(city).append(NEW_LINE);
		builder.append("state: ").append(state).append(NEW_LINE);
		builder.append("zip: ").append(zip).append("]");
		return builder.toString();
	}
}
