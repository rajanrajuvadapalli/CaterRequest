package com.cater.maps;

import java.util.Comparator;

public class RestaurantDistanceComparator implements Comparator<RestaurantDTO> {
	@Override
	public int compare(RestaurantDTO restaurant1, RestaurantDTO restaurant2) {
		Long distance1 = restaurant1.getDistanceInMeters();
		Long distance2 = restaurant2.getDistanceInMeters();
		return (int) (distance1.longValue() - distance2.longValue());
	}
}
