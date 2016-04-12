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

@Entity
@Table(name = "Restaurant")
public class Restaurant extends TimestampEntity implements Serializable {
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -4558590649364593837L;
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(name = "name", length = 50, nullable = false)
	private String name;
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER, optional = false)
	@JoinColumn(name = "address_sk", nullable = false)
	private Address address;
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER, optional = false)
	@JoinColumn(name = "login_sk", nullable = false)
	private Login login;
	@Column(name = "contact_number", length = 20, nullable = false)
	private String contactNumber;
	@Column(name = "number_verified", nullable = false, unique = false, updatable = true)
	private boolean isNumberVerified;
	@Column(name = "contact_email", length = 50, nullable = false)
	private String contactEmail;
	@Column(name = "cuisine_type", length = 20, nullable = false)
	private String cuisineType;
	@Column(name = "website_url", length = 50, nullable = true)
	private String websiteUrl;
	@Column(name = "deliver_miles", nullable = true)
	private Integer deliverMiles;
	@Column(name = "about_us", length = 5000, nullable = true)
	private String aboutUs;
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "restaurant_sk")
	public List<Quote> quotes;
	@Column(name = "sales_tax", length = 5, nullable = false)
	private float salesTax;
	@Column(name = "full_menu_exist", nullable = false, unique = false, updatable = true)
	private boolean isFullMenuExist;

	public float getSalesTax() {
		return salesTax;
	}

	public void setSalesTax(float salesTax) {
		this.salesTax = salesTax;
	}

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

	public boolean isNumberVerified() {
		return isNumberVerified;
	}

	public void setNumberVerified(boolean isNumberVerified) {
		this.isNumberVerified = isNumberVerified;
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

	public Integer getDeliverMiles() {
		return deliverMiles;
	}

	public void setDeliverMiles(Integer deliverMiles) {
		this.deliverMiles = deliverMiles;
	}

	public String getAboutUs() {
		return aboutUs;
	}

	public void setAboutUs(String aboutUs) {
		this.aboutUs = aboutUs;
	}

	public List<Quote> getQuotes() {
		return quotes;
	}

	public void setQuotes(List<Quote> quotes) {
		this.quotes = quotes;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((aboutUs == null) ? 0 : aboutUs.hashCode());
		result = prime * result + ((address == null) ? 0 : address.hashCode());
		result = prime * result + ((contactEmail == null) ? 0 : contactEmail.hashCode());
		result = prime * result + ((contactNumber == null) ? 0 : contactNumber.hashCode());
		result = prime * result + ((cuisineType == null) ? 0 : cuisineType.hashCode());
		result = prime * result + ((deliverMiles == null) ? 0 : deliverMiles.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + (isNumberVerified ? 1231 : 1237);
		result = prime * result + ((login == null) ? 0 : login.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((quotes == null) ? 0 : quotes.hashCode());
		result = prime * result + Float.floatToIntBits(salesTax);
		result = prime * result + ((websiteUrl == null) ? 0 : websiteUrl.hashCode());
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
		Restaurant other = (Restaurant) obj;
		if (aboutUs == null) {
			if (other.aboutUs != null)
				return false;
		} else if (!aboutUs.equals(other.aboutUs))
			return false;
		if (address == null) {
			if (other.address != null)
				return false;
		} else if (!address.equals(other.address))
			return false;
		if (contactEmail == null) {
			if (other.contactEmail != null)
				return false;
		} else if (!contactEmail.equals(other.contactEmail))
			return false;
		if (contactNumber == null) {
			if (other.contactNumber != null)
				return false;
		} else if (!contactNumber.equals(other.contactNumber))
			return false;
		if (cuisineType == null) {
			if (other.cuisineType != null)
				return false;
		} else if (!cuisineType.equals(other.cuisineType))
			return false;
		if (deliverMiles == null) {
			if (other.deliverMiles != null)
				return false;
		} else if (!deliverMiles.equals(other.deliverMiles))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (isNumberVerified != other.isNumberVerified)
			return false;
		if (login == null) {
			if (other.login != null)
				return false;
		} else if (!login.equals(other.login))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (quotes == null) {
			if (other.quotes != null)
				return false;
		} else if (!quotes.equals(other.quotes))
			return false;
		if (Float.floatToIntBits(salesTax) != Float.floatToIntBits(other.salesTax))
			return false;
		if (websiteUrl == null) {
			if (other.websiteUrl != null)
				return false;
		} else if (!websiteUrl.equals(other.websiteUrl))
			return false;
		return true;
	}
}
