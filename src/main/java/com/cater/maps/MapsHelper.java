package com.cater.maps;

import java.util.List;
import java.util.Set;

import com.beust.jcommander.internal.Lists;
import com.cater.model.Restaurant;
import com.google.maps.DistanceMatrixApi;
import com.google.maps.GeoApiContext;
import com.google.maps.model.DistanceMatrix;
import com.google.maps.model.Unit;

public class MapsHelper {
	public List <RestaurantDTO> getDistance(String eventAddress,
			Set <Restaurant> restaurants) throws Exception {
		GeoApiContext context = new GeoApiContext()
				.setApiKey("AIzaSyAlobAYE25Q2m62_DX3wc1AMimO2Xr-WHc");
		String[] origin = { eventAddress };
		List <RestaurantDTO> nearByRestaurants = Lists.newArrayList();
		for (Restaurant rest : restaurants) {
			String[] destination = { rest.getAddress().toString() };
			DistanceMatrix dm = DistanceMatrixApi
					.getDistanceMatrix(context, origin, destination)
					.units(Unit.IMPERIAL).await();
			Long distanceInMeters = dm.rows[0].elements[0].distance.inMeters;
			if (distanceInMeters <= 80467) {
				RestaurantDTO restaurantDTO = new RestaurantDTO();
				restaurantDTO.setDistance(dm.rows[0].elements[0].distance
						.toString());
				restaurantDTO.setDistanceInMeters(distanceInMeters);
				restaurantDTO.setRestaurant(rest);
				nearByRestaurants.add(restaurantDTO);
			}
		}// end of iter
			// WRITE sorting
		/*
		 * if(!nearByRestaurants.isEmpty() && nearByRestaurants!= null){ ÷ }
		 */
		return nearByRestaurants;
	}
}
