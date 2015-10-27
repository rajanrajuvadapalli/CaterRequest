package com.cater.model;

import java.util.Date;

public class RestaurantSearch {
	private Integer userId;

	private String restaurantName;
	private String restaurantNumber;
	private String eventName;
	private String restaurantLocation;
	private String rStreet1;
	private String rStreet2;
	private String rCity;
	private String rState;
	private String rZip;
	private String eventStreet1;
	private String eventStreet2;
	private String eventCity;
	private String eventState;
	private String eventZip;
	private String emailId;

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getrStreet1() {
		return rStreet1;
	}

	public void setrStreet1(String rStreet1) {
		this.rStreet1 = rStreet1;
	}

	public String getrStreet2() {
		return rStreet2;
	}

	public void setrStreet2(String rStreet2) {
		this.rStreet2 = rStreet2;
	}

	public String getrCity() {
		return rCity;
	}

	public void setrCity(String rCity) {
		this.rCity = rCity;
	}

	public String getrState() {
		return rState;
	}

	public void setrState(String rState) {
		this.rState = rState;
	}

	public String getrZip() {
		return rZip;
	}

	public void setrZip(String rZip) {
		this.rZip = rZip;
	}

	public String getEventStreet1() {
		return eventStreet1;
	}

	public void setEventStreet1(String eventStreet1) {
		this.eventStreet1 = eventStreet1;
	}

	public String getEventStreet2() {
		return eventStreet2;
	}

	public void setEventStreet2(String eventStreet2) {
		this.eventStreet2 = eventStreet2;
	}

	public String getEventCity() {
		return eventCity;
	}

	public void setEventCity(String eventCity) {
		this.eventCity = eventCity;
	}

	public String getEventState() {
		return eventState;
	}

	public void setEventState(String eventState) {
		this.eventState = eventState;
	}

	public String getEventZip() {
		return eventZip;
	}

	public void setEventZip(String eventZip) {
		this.eventZip = eventZip;
	}

	private Double price;
	private Date date_time;
	private String status;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getRestaurantName() {
		return restaurantName;
	}

	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}

	public String getRestaurantNumber() {
		return restaurantNumber;
	}

	public void setRestaurantNumber(String restaurantNumber) {
		this.restaurantNumber = restaurantNumber;
	}

	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public String getRestaurantLocation() {
		return restaurantLocation;
	}

	public void setRestaurantLocation(String restaurantLocation) {
		this.restaurantLocation = restaurantLocation;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Date getDate_time() {
		return date_time;
	}

	public void setDate_time(Date date_time) {
		this.date_time = date_time;
	}

}