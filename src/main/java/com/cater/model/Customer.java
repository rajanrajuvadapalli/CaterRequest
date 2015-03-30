package com.cater.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 * The Class Customer.
 * 
 * Script for MySQL
 * CREATE TABLE cater4party.Customer (
	`id` INT NOT NULL AUTO_INCREMENT
	,PRIMARY KEY (id)
	,`name` VARCHAR(50) NOT NULL 
	,`login_sk` INT NOT NULL 
	,`contact_number` VARCHAR(20) NOT NULL 
	,`sms_ok` BIT(1)
	,`contact_email` VARCHAR(50) NOT NULL 
	,`address_sk` INT  NULL 
	,`create_ts` DATETIME NOT NULL
	,`lupd_ts` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP)
-- Create Foreign Key: Customer.address_sk -> Address.id
ALTER TABLE Customer ADD FOREIGN KEY (address_sk) REFERENCES Address(id);
-- Create Foreign Key: Customer.login_sk -> Login.id
ALTER TABLE Customer ADD FOREIGN KEY (login_sk) REFERENCES Login(id);
 */
@Entity
@Table(name = "Customer")
public class Customer extends TimestampEntity implements Serializable {
	private static final long serialVersionUID = -5882175270370982220L;
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(name = "name", length = 50, nullable = false)
	private String name;
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER, optional = false)
	@JoinColumn(name = "login_sk", nullable = false)
	private Login login;
	@Column(name = "contact_number", length = 20, nullable = false)
	private String contactNumber;
	@Column(name = "sms_ok", nullable = false, unique = false, updatable = true)
	private boolean smsOk;
	@Column(name = "contact_email", length = 50, nullable = false)
	private String contactEmail;
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER, optional = false)
	@JoinColumn(name = "address_sk", nullable = true)
	private Address address;
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "customer_sk")
	public List <Event> events;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setLogin(Login login) {
		this.login = login;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public boolean isSmsOk() {
		return smsOk;
	}

	public void setSmsOk(boolean smsOk) {
		this.smsOk = smsOk;
	}

	public String getContactEmail() {
		return contactEmail;
	}

	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public Login getLogin() {
		return login;
	}

	public Address getAddress() {
		return address;
	}

	public List <Event> getEvents() {
		return events;
	}

	public void setEvents(List <Event> events) {
		this.events = events;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((address == null) ? 0 : address.hashCode());
		result = prime * result
				+ ((contactEmail == null) ? 0 : contactEmail.hashCode());
		result = prime * result
				+ ((contactNumber == null) ? 0 : contactNumber.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((login == null) ? 0 : login.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
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
		Customer other = (Customer) obj;
		if (address == null) {
			if (other.address != null)
				return false;
		}
		else if (!address.equals(other.address))
			return false;
		if (contactEmail == null) {
			if (other.contactEmail != null)
				return false;
		}
		else if (!contactEmail.equals(other.contactEmail))
			return false;
		if (contactNumber == null) {
			if (other.contactNumber != null)
				return false;
		}
		else if (!contactNumber.equals(other.contactNumber))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		}
		else if (!id.equals(other.id))
			return false;
		if (login == null) {
			if (other.login != null)
				return false;
		}
		else if (!login.equals(other.login))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		}
		else if (!name.equals(other.name))
			return false;
		return true;
	}
}
