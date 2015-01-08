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
 * The Class Restaurant.
 * 
 * CREATE TABLE Restaurant (
	`id` INT NOT NULL AUTO_INCREMENT
	,PRIMARY KEY (id)
	,`name` VARCHAR(50) NOT NULL 
	,`address_sk` INT NOT NULL 
	,`login_sk` INT NOT NULL 
	,`contact_number` VARCHAR(20) NOT NULL 
	,`contact_email` VARCHAR(50) NOT NULL 
	,`cuisine_type` VARCHAR(20) NOT NULL 
	,`website_url` VARCHAR(50)  NULL 
	,`create_ts` DATETIME NOT NULL 
	,`lupd_ts` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP)
-- Create Foreign Key: Restaurant.address_sk -> Address.id
ALTER TABLE Restaurant ADD FOREIGN KEY (address_sk) REFERENCES Address(id);
-- Create Foreign Key: Restaurant.login_sk -> Login.id
ALTER TABLE Restaurant ADD FOREIGN KEY (login_sk) REFERENCES Login(id);
 */
@Entity
@Table(name = "Restaurant")
public class Restaurant extends AbstractTimestampEntity implements Serializable {
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -4558590649364593837L;
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "name", length = 50, nullable = false)
	private String name;
	@OneToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER, optional = false)
	@JoinColumn(name = "address_sk", nullable = false)
	private Address address;
	@OneToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER, optional = false)
	@JoinColumn(name = "login_sk", nullable = false)
	private Login login;
	@Column(name = "contact_number", length = 20, nullable = false)
	private String contactNumber;
	@Column(name = "contact_email", length = 50, nullable = false)
	private String contactEmail;
	@Column(name = "cuisine_type", length = 20, nullable = false)
	private String cuisineType;
	@Column(name = "website_url", length = 50, nullable = true)
	private String websiteUrl;
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "restaurant_sk")
	public List<Quote> quotes;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public Login getLogin() {
		return login;
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

	public String getContactEmail() {
		return contactEmail;
	}

	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}

	public String getCuisineType() {
		return cuisineType;
	}

	public void setCuisineType(String cuisineType) {
		this.cuisineType = cuisineType;
	}

	public String getWebsiteUrl() {
		return websiteUrl;
	}

	public void setWebsiteUrl(String websiteUrl) {
		this.websiteUrl = websiteUrl;
	}

	public List<Quote> getQuotes() {
		return quotes;
	}

	public void setQuotes(List<Quote> quotes) {
		this.quotes = quotes;
	}

	/* (non-Javadoc)
	 * @see com.cater.model.AbstractTimestampEntity#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((address == null) ? 0 : address.hashCode());
		result = prime * result
				+ ((contactEmail == null) ? 0 : contactEmail.hashCode());
		result = prime * result
				+ ((contactNumber == null) ? 0 : contactNumber.hashCode());
		result = prime * result
				+ ((cuisineType == null) ? 0 : cuisineType.hashCode());
		result = prime * result + id;
		result = prime * result + ((login == null) ? 0 : login.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result
				+ ((websiteUrl == null) ? 0 : websiteUrl.hashCode());
		return result;
	}

	/* (non-Javadoc)
	 * @see com.cater.model.AbstractTimestampEntity#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj) return true;
		if (!super.equals(obj)) return false;
		if (getClass() != obj.getClass()) return false;
		Restaurant other = (Restaurant) obj;
		if (address == null) {
			if (other.address != null) return false;
		}
		else if (!address.equals(other.address)) return false;
		if (contactEmail == null) {
			if (other.contactEmail != null) return false;
		}
		else if (!contactEmail.equals(other.contactEmail)) return false;
		if (contactNumber == null) {
			if (other.contactNumber != null) return false;
		}
		else if (!contactNumber.equals(other.contactNumber)) return false;
		if (cuisineType == null) {
			if (other.cuisineType != null) return false;
		}
		else if (!cuisineType.equals(other.cuisineType)) return false;
		if (id != other.id) return false;
		if (login == null) {
			if (other.login != null) return false;
		}
		else if (!login.equals(other.login)) return false;
		if (name == null) {
			if (other.name != null) return false;
		}
		else if (!name.equals(other.name)) return false;
		if (websiteUrl == null) {
			if (other.websiteUrl != null) return false;
		}
		else if (!websiteUrl.equals(other.websiteUrl)) return false;
		return true;
	}
}
