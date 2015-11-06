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
	public List <RestaurantDTO> getDistance(String eventAddress, Set <Restaurant> restaurants) {
		GeoApiContext context = new GeoApiContext().setApiKey("AIzaSyAlobAYE25Q2m62_DX3wc1AMimO2Xr-WHc");
		String[] origin = { eventAddress };
		List <RestaurantDTO> nearByRestaurants = Lists.newArrayList();
		for (Restaurant rest : restaurants) {
			String[] destination = { rest.getAddress().toString() };
			try {
				DistanceMatrix dm = DistanceMatrixApi.getDistanceMatrix(context, origin, destination)
						.units(Unit.IMPERIAL).await();
				if (dm.rows.length > 0 && dm.rows[0].elements.length > 0) {
					com.google.maps.model.Distance distance = dm.rows[0].elements[0].distance;
					Long distanceInMeters = distance.inMeters;
					if (distanceInMeters <= 80467) {
						RestaurantDTO restaurantDTO = new RestaurantDTO();
						restaurantDTO.setDistance(distance.toString());
						restaurantDTO.setDistanceInMeters(distanceInMeters);
						restaurantDTO.setRestaurant(rest);
						nearByRestaurants.add(restaurantDTO);
					}
				}
				else {
					RestaurantDTO restaurantDTO = new RestaurantDTO();
					restaurantDTO.setDistance("0");
					restaurantDTO.setDistanceInMeters(new Long(0));
					restaurantDTO.setRestaurant(rest);
					nearByRestaurants.add(restaurantDTO);
				}
			}
			catch (Exception ex) {
				RestaurantDTO restaurantDTO = new RestaurantDTO();
				restaurantDTO.setDistance("0");
				restaurantDTO.setDistanceInMeters(new Long(0));
				restaurantDTO.setRestaurant(rest);
				nearByRestaurants.add(restaurantDTO);
			}
		} // end of iter
			// WRITE sorting
			/*
			 * if(!nearByRestaurants.isEmpty() && nearByRestaurants!= null){ ÷ }
			 */
		return nearByRestaurants;
	}
}
