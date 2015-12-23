package com.cater.maps;

import com.cater.model.RestaurantBranch;

public class RestaurantDTO {
	private RestaurantBranch branch;
	private Object reviewImage;
	private String distance;
	private int numberOfReviews;
	private Long distanceInMeters;
	private Object websiteUrl;

	public RestaurantBranch getBranch() {
		return branch;
	}

	public void setBranch(RestaurantBranch branch) {
		this.branch = branch;
	}

	public Object getReviewImage() {
		return reviewImage;
	}

	public void setReviewImage(Object reviewImage) {
		this.reviewImage = reviewImage;
	}

	public String getDistance() {
		return distance;
	}

	public void setDistance(String distance) {
		this.distance = distance;
	}

	public int getNumberOfReviews() {
		return numberOfReviews;
	}

	public void setNumberOfReviews(int numberOfReviews) {
		this.numberOfReviews = numberOfReviews;
	}

	public Long getDistanceInMeters() {
		return distanceInMeters;
	}

	public void setDistanceInMeters(Long distanceInMeters) {
		this.distanceInMeters = distanceInMeters;
	}

	public Object getWebsiteUrl() {
		return websiteUrl;
	}

	public void setWebsiteUrl(Object websiteUrl) {
		this.websiteUrl = websiteUrl;
	}
}
