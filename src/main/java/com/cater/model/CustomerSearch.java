package com.cater.model;

import java.util.Date;
import java.util.List;
import java.util.Map;

public class CustomerSearch {
	private Integer userId;
	private String customerName;
	private String contactNumber;
	private boolean smsIndicator;
	private String eventName;
	private String restaurantName;
	private String customerEmail;
	private Double price;
	private Date date_time;
	private String eventStreet1;
	private String eventStreet2;
	private String eventCity;
	private String eventState;
	private String eventZip;
	private Integer eventId;

	// test
	private List<Event> events;
	private Map<Integer, List<Quote>> restaurantQuotes;

	public Map<Integer, List<Quote>> getRestaurantQuotes() {
		return restaurantQuotes;
	}

	public void setRestaurantQuotes(Map<Integer, List<Quote>> restaurantQuotes) {
		this.restaurantQuotes = restaurantQuotes;
	}

	public List<Event> getEvents() {
		return events;
	}

	public void setEvents(List<Event> events) {
		this.events = events;
	}

	public Integer getEventId() {
		return eventId;
	}

	public void setEventId(Integer eventId) {
		this.eventId = eventId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getCustomerEmail() {
		return customerEmail;
	}

	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
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

	public String getRestaurantName() {
		return restaurantName;
	}

	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public boolean isSmsIndicator() {
		return smsIndicator;
	}

	public void setSmsIndicator(boolean smsIndicator) {
		this.smsIndicator = smsIndicator;
	}

	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
}
