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
@Table(name = "Restaurant_branch")
public class RestaurantBranch extends TimestampEntity implements Serializable {
	private static final long serialVersionUID = 5376522873666364083L;
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER, optional = false)
	@JoinColumn(name = "restaurant_sk", nullable = false)
	private Restaurant restaurant;
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER, optional = false)
	@JoinColumn(name = "address_sk", nullable = false)
	private Address address;
	@Column(name = "contact_number", length = 20, nullable = false)
	private String contactNumber;
	@Column(name = "number_verified", nullable = false, unique = false, updatable = true)
	private boolean isNumberVerified;
	@Column(name = "contact_email", length = 50, nullable = false)
	private String contactEmail;
	@Column(name = "deliver_miles", nullable = true)
	private Integer deliverMiles;
	@Column(name = "sales_tax", length = 5, nullable = false)
	private float salesTax;
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "restaurant_branch_sk")
	public List <Quote> quotes;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Restaurant getRestaurant() {
		return restaurant;
	}

	public void setRestaurant(Restaurant restaurant) {
		this.restaurant = restaurant;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
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

	public Integer getDeliverMiles() {
		return deliverMiles;
	}

	public void setDeliverMiles(Integer deliverMiles) {
		this.deliverMiles = deliverMiles;
	}

	public float getSalesTax() {
		return salesTax;
	}

	public void setSalesTax(float salesTax) {
		this.salesTax = salesTax;
	}

	public List <Quote> getQuotes() {
		return quotes;
	}

	public void setQuotes(List <Quote> quotes) {
		this.quotes = quotes;
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
		result = prime * result
				+ ((deliverMiles == null) ? 0 : deliverMiles.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + (isNumberVerified ? 1231 : 1237);
		result = prime * result + ((quotes == null) ? 0 : quotes.hashCode());
		result = prime * result
				+ ((restaurant == null) ? 0 : restaurant.hashCode());
		result = prime * result + Float.floatToIntBits(salesTax);
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
		RestaurantBranch other = (RestaurantBranch) obj;
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
		if (deliverMiles == null) {
			if (other.deliverMiles != null)
				return false;
		}
		else if (!deliverMiles.equals(other.deliverMiles))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		}
		else if (!id.equals(other.id))
			return false;
		if (isNumberVerified != other.isNumberVerified)
			return false;
		if (quotes == null) {
			if (other.quotes != null)
				return false;
		}
		else if (!quotes.equals(other.quotes))
			return false;
		if (restaurant == null) {
			if (other.restaurant != null)
				return false;
		}
		else if (!restaurant.equals(other.restaurant))
			return false;
		if (Float.floatToIntBits(salesTax) != Float
				.floatToIntBits(other.salesTax))
			return false;
		return true;
	}
}
