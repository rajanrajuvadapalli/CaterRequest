package com.cater.maps;

import org.apache.commons.collections.CollectionUtils;

import com.cater.model.Discount;
import com.cater.model.Restaurant;

public class RestaurantDTO {
	private Restaurant restaurant;
	private Object reviewImage;
	private String distance;
	private int numberOfReviews;
	private Long distanceInMeters;
	private Object websiteUrl;

	public Restaurant getRestaurant() {
		return restaurant;
	}

	public void setRestaurant(Restaurant restaurant) {
		this.restaurant = restaurant;
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

	public Double getMaxDiscountPercent() {
		Double max = new Double(0);
		if (restaurant != null
				&& CollectionUtils.isNotEmpty(restaurant.getDiscountStrategy())) {
			for (Discount d : restaurant.getDiscountStrategy()) {
				if (d != null && d.getPercent() != null
						&& max.compareTo(d.getPercent()) == -1) {
					max = d.getPercent();
				}
			}
		}
		return max;
	}
}
