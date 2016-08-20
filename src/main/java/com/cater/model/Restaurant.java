package com.cater.model;

import java.io.IOException;
import java.io.Serializable;
import java.io.StringWriter;
import java.math.BigDecimal;
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
import javax.persistence.OrderBy;
import javax.persistence.Table;

import org.apache.commons.collections.CollectionUtils;

import com.cater.data.DiscountElement;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.common.collect.Lists;

// TODO: Auto-generated Javadoc
/**
 * The Class Restaurant.
 */
@Entity
@Table(name = "Restaurant")
public class Restaurant extends TimestampEntity implements Serializable {
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -4558590649364593837L;
	/** The id. */
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	/** The name. */
	@Column(name = "name", length = 50, nullable = false)
	private String name;
	/** The address. */
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER, optional = false)
	@JoinColumn(name = "address_sk", nullable = false)
	private Address address;
	/** The login. */
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER, optional = false)
	@JoinColumn(name = "login_sk", nullable = false)
	private Login login;
	/** The contact number. */
	@Column(name = "contact_number", length = 20, nullable = false)
	private String contactNumber;
	/** The is number verified. */
	@Column(name = "number_verified", nullable = false, unique = false, updatable = true)
	private boolean isNumberVerified;
	/** The contact email. */
	@Column(name = "contact_email", length = 50, nullable = false)
	private String contactEmail;
	/** The cuisine type. */
	@Column(name = "cuisine_type", length = 20, nullable = false)
	private String cuisineType;
	/** The website url. */
	@Column(name = "website_url", length = 50, nullable = true)
	private String websiteUrl;
	/** The deliver miles. */
	@Column(name = "deliver_miles", nullable = true)
	private Integer deliverMiles;
	/** The about us. */
	@Column(name = "about_us", length = 5000, nullable = true)
	private String aboutUs;
	/** The quotes. */
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "restaurant_sk")
	public List <Quote> quotes;
	/** The sales tax. */
	@Column(name = "sales_tax", length = 5, nullable = false)
	private float salesTax;
	/** The is full menu exist. */
	@Column(name = "full_menu_exist", nullable = false, unique = false, updatable = true)
	private boolean isFullMenuExist;
	/** The discount strategy. */
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "restaurant_sk")
	@OrderBy("lower ASC")
	public List <Discount> discountStrategy;

	/**
	 * Gets the sales tax.
	 *
	 * @return the sales tax
	 */
	public float getSalesTax() {
		return salesTax;
	}

	/**
	 * Sets the sales tax.
	 *
	 * @param salesTax the new sales tax
	 */
	public void setSalesTax(float salesTax) {
		this.salesTax = salesTax;
	}

	/**
	 * Gets the id.
	 *
	 * @return the id
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * Sets the id.
	 *
	 * @param id the new id
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * Gets the name.
	 *
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * Sets the name.
	 *
	 * @param name the new name
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * Gets the address.
	 *
	 * @return the address
	 */
	public Address getAddress() {
		return address;
	}

	/**
	 * Sets the address.
	 *
	 * @param address the new address
	 */
	public void setAddress(Address address) {
		this.address = address;
	}

	/**
	 * Gets the login.
	 *
	 * @return the login
	 */
	public Login getLogin() {
		return login;
	}

	/**
	 * Sets the login.
	 *
	 * @param login the new login
	 */
	public void setLogin(Login login) {
		this.login = login;
	}

	/**
	 * Gets the contact number.
	 *
	 * @return the contact number
	 */
	public String getContactNumber() {
		return contactNumber;
	}

	/**
	 * Sets the contact number.
	 *
	 * @param contactNumber the new contact number
	 */
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	/**
	 * Checks if is number verified.
	 *
	 * @return true, if is number verified
	 */
	public boolean isNumberVerified() {
		return isNumberVerified;
	}

	/**
	 * Sets the number verified.
	 *
	 * @param isNumberVerified the new number verified
	 */
	public void setNumberVerified(boolean isNumberVerified) {
		this.isNumberVerified = isNumberVerified;
	}

	/**
	 * Gets the contact email.
	 *
	 * @return the contact email
	 */
	public String getContactEmail() {
		return contactEmail;
	}

	/**
	 * Sets the contact email.
	 *
	 * @param contactEmail the new contact email
	 */
	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}

	/**
	 * Gets the cuisine type.
	 *
	 * @return the cuisine type
	 */
	public String getCuisineType() {
		return cuisineType;
	}

	/**
	 * Sets the cuisine type.
	 *
	 * @param cuisineType the new cuisine type
	 */
	public void setCuisineType(String cuisineType) {
		this.cuisineType = cuisineType;
	}

	/**
	 * Gets the website url.
	 *
	 * @return the website url
	 */
	public String getWebsiteUrl() {
		return websiteUrl;
	}

	/**
	 * Sets the website url.
	 *
	 * @param websiteUrl the new website url
	 */
	public void setWebsiteUrl(String websiteUrl) {
		this.websiteUrl = websiteUrl;
	}

	/**
	 * Gets the deliver miles.
	 *
	 * @return the deliver miles
	 */
	public Integer getDeliverMiles() {
		return deliverMiles;
	}

	/**
	 * Sets the deliver miles.
	 *
	 * @param deliverMiles the new deliver miles
	 */
	public void setDeliverMiles(Integer deliverMiles) {
		this.deliverMiles = deliverMiles;
	}

	/**
	 * Gets the about us.
	 *
	 * @return the about us
	 */
	public String getAboutUs() {
		return aboutUs;
	}

	/**
	 * Sets the about us.
	 *
	 * @param aboutUs the new about us
	 */
	public void setAboutUs(String aboutUs) {
		this.aboutUs = aboutUs;
	}

	/**
	 * Gets the quotes.
	 *
	 * @return the quotes
	 */
	public List <Quote> getQuotes() {
		return quotes;
	}

	/**
	 * Sets the quotes.
	 *
	 * @param quotes the new quotes
	 */
	public void setQuotes(List <Quote> quotes) {
		this.quotes = quotes;
	}

	/**
	 * Checks if is full menu exist.
	 *
	 * @return true, if is full menu exist
	 */
	public boolean isFullMenuExist() {
		return isFullMenuExist;
	}

	/**
	 * Sets the full menu exist.
	 *
	 * @param isFullMenuExist the new full menu exist
	 */
	public void setFullMenuExist(boolean isFullMenuExist) {
		this.isFullMenuExist = isFullMenuExist;
	}

	/**
	 * Gets the discount strategy.
	 *
	 * @return the discount strategy
	 */
	public List <Discount> getDiscountStrategy() {
		return discountStrategy;
	}

	/**
	 * Sets the discount strategy.
	 *
	 * @param discountStrategy the new discount strategy
	 */
	public void setDiscountStrategy(List <Discount> discountStrategy) {
		this.discountStrategy = discountStrategy;
	}

	/* (non-Javadoc)
	 * @see com.cater.model.TimestampEntity#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((aboutUs == null) ? 0 : aboutUs.hashCode());
		result = prime * result + ((address == null) ? 0 : address.hashCode());
		result = prime * result
				+ ((contactEmail == null) ? 0 : contactEmail.hashCode());
		result = prime * result
				+ ((contactNumber == null) ? 0 : contactNumber.hashCode());
		result = prime * result
				+ ((cuisineType == null) ? 0 : cuisineType.hashCode());
		result = prime * result
				+ ((deliverMiles == null) ? 0 : deliverMiles.hashCode());
		result = prime
				* result
				+ ((discountStrategy == null) ? 0 : discountStrategy.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + (isFullMenuExist ? 1231 : 1237);
		result = prime * result + (isNumberVerified ? 1231 : 1237);
		result = prime * result + ((login == null) ? 0 : login.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((quotes == null) ? 0 : quotes.hashCode());
		result = prime * result + Float.floatToIntBits(salesTax);
		result = prime * result
				+ ((websiteUrl == null) ? 0 : websiteUrl.hashCode());
		return result;
	}

	/* (non-Javadoc)
	 * @see com.cater.model.TimestampEntity#equals(java.lang.Object)
	 */
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
		}
		else if (!aboutUs.equals(other.aboutUs))
			return false;
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
		if (cuisineType == null) {
			if (other.cuisineType != null)
				return false;
		}
		else if (!cuisineType.equals(other.cuisineType))
			return false;
		if (deliverMiles == null) {
			if (other.deliverMiles != null)
				return false;
		}
		else if (!deliverMiles.equals(other.deliverMiles))
			return false;
		if (discountStrategy == null) {
			if (other.discountStrategy != null)
				return false;
		}
		else if (!discountStrategy.equals(other.discountStrategy))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		}
		else if (!id.equals(other.id))
			return false;
		if (isFullMenuExist != other.isFullMenuExist)
			return false;
		if (isNumberVerified != other.isNumberVerified)
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
		if (quotes == null) {
			if (other.quotes != null)
				return false;
		}
		else if (!quotes.equals(other.quotes))
			return false;
		if (Float.floatToIntBits(salesTax) != Float
				.floatToIntBits(other.salesTax))
			return false;
		if (websiteUrl == null) {
			if (other.websiteUrl != null)
				return false;
		}
		else if (!websiteUrl.equals(other.websiteUrl))
			return false;
		return true;
	}

	/**
	 * Gets the max discount percent.
	 *
	 * @return the max discount percent
	 */
	public Double getMaxDiscountPercent() {
		Double max = new Double(0);
		if (CollectionUtils.isNotEmpty(getDiscountStrategy())) {
			for (Discount d : getDiscountStrategy()) {
				if (d != null && d.getPercent() != null
						&& max.compareTo(d.getPercent()) == -1) {
					max = d.getPercent();
				}
			}
		}
		return max;
	}

	/**
	 * Gets the discount strategy as json.
	 *
	 * @return the discount strategy as json
	 */
	public String getDiscountStrategyAsJson() {
		String json = "";
		try {
			List <Discount> discountsFromDb = getDiscountStrategy();
			if (CollectionUtils.isNotEmpty(discountsFromDb)) {
				List <DiscountElement> discounts = Lists.newArrayList();
				for (Discount d : discountsFromDb) {
					DiscountElement de = new DiscountElement(new BigDecimal(
							d.getLower()), new BigDecimal(d.getUpper()),
							new BigDecimal(d.getPercent()));
					discounts.add(de);
				}
				StringWriter sw = new StringWriter();
				new ObjectMapper().writeValue(sw, discounts);
				json = sw.toString();
			}
		}
		catch (IOException e) {
			//nothing to do
		}
		return json;
	}
}
