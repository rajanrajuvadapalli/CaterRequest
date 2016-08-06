package com.cater.ui.data;

import org.apache.commons.lang3.StringUtils;

public class RegistrationData {
	private static final String NEW_LINE = "\n";
	private String name;
	private String restaurantName;
	private String cuisineType;
	private String url;
	private String deliverMiles;
	private String email;
	private String password;
	private String phone;
	private boolean smsOk;
	private boolean numberVerified;
	private String phoneVerificationCode;
	private String street1;
	private String street2;
	private String city;
	private String state;
	private String zip;
	private String aboutUs;
	private float salesTax;
	private String primaryCuisine;
	private String[] secondaryCuisineTypes;

	public float getSalesTax() {
		return salesTax;
	}

	public void setSalesTax(float salesTax) {
		this.salesTax = salesTax;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRestaurantName() {
		return restaurantName;
	}

	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}

	public String getCuisineType() {
		return cuisineType;
	}

	public void setCuisineType(String cuisineType) {
		this.cuisineType = cuisineType;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getDeliverMiles() {
		return deliverMiles;
	}

	public void setDeliverMiles(String deliverMiles) {
		this.deliverMiles = deliverMiles;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public boolean isSmsOk() {
		return smsOk;
	}

	public void setSmsOk(boolean smsOk) {
		this.smsOk = smsOk;
	}

	public boolean isNumberVerified() {
		return numberVerified;
	}

	public void setNumberVerified(boolean numberVerified) {
		this.numberVerified = numberVerified;
	}

	public String getPhoneVerificationCode() {
		return phoneVerificationCode;
	}

	public void setPhoneVerificationCode(String phoneVerificationCode) {
		this.phoneVerificationCode = phoneVerificationCode;
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

	public String getAboutUs() {
		return aboutUs;
	}

	public void setAboutUs(String aboutUs) {
		this.aboutUs = aboutUs;
	}

	public String getPrimaryCuisine() {
		return primaryCuisine;
	}

	public void setPrimaryCuisine(String primaryCuisine) {
		this.primaryCuisine = primaryCuisine;
	}

	public String[] getSecondaryCuisineTypes() {
		return secondaryCuisineTypes;
	}

	public void setSecondaryCuisineTypes(String[] secondaryCuisineTypes) {
		this.secondaryCuisineTypes = secondaryCuisineTypes;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		if (StringUtils.isNotBlank(restaurantName)) {
			builder.append("[restaurantName: ").append(restaurantName)
					.append(NEW_LINE);
			builder.append("primaryCuisine: ").append(primaryCuisine)
					.append(NEW_LINE);
			builder.append("secondaryCuisineTypes: ")
					.append(secondaryCuisineTypes).append(NEW_LINE);
			builder.append("cuisineType: ").append(cuisineType)
					.append(NEW_LINE);
			builder.append("url: ").append(url).append(NEW_LINE);
			builder.append("aboutUs: ").append(aboutUs).append(NEW_LINE);
		}
		else {
			builder.append("[name: ").append(name).append(NEW_LINE);
		}
		builder.append("email: ").append(email).append(NEW_LINE);
		builder.append("password: ").append(password).append(NEW_LINE);
		builder.append("phone: ").append(phone).append(NEW_LINE);
		builder.append("isSmsOk: ").append(smsOk).append(NEW_LINE);
		builder.append("street1: ").append(street1).append(NEW_LINE);
		builder.append("street2: ").append(street2).append(NEW_LINE);
		builder.append("city: ").append(city).append(NEW_LINE);
		builder.append("state: ").append(state).append(NEW_LINE);
		builder.append("zip: ").append(zip).append("]");
		return builder.toString();
	}
}
