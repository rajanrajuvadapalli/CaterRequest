package com.cater.maps;

import java.util.List;
import java.util.Set;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Component;

import com.beust.jcommander.internal.Lists;
import com.cater.model.Address;
import com.cater.model.Restaurant;
import com.google.common.collect.Sets;
import com.google.maps.DistanceMatrixApi;
import com.google.maps.GeoApiContext;
import com.google.maps.model.DistanceMatrix;
import com.google.maps.model.Unit;

/**
 * The Class MapsHelper.
 */
@Component
public class MapsHelper {
	/** The Constant RESTAURANT_DISPLAY_RADIUS. 
	 * 15 miles = 24140 meters */
	private static final int RESTAURANT_DISPLAY_RADIUS = 24140;
	/**
	 * Gets the distance.
	 *
	 * @param address the address
	 * @param restaurants the restaurants
	 * @return the distance
	 */
	public List <RestaurantDTO> getDistance(Address address,
			Set <Restaurant> restaurants) {
		GeoApiContext context = new GeoApiContext()
				.setApiKey("AIzaSyAlobAYE25Q2m62_DX3wc1AMimO2Xr-WHc");
		String[] origin = { address.getAddressString() };
		List <RestaurantDTO> nearByRestaurants = Lists.newArrayList();
		for (Restaurant rest : restaurants) {
			String[] destination = { rest.getAddress().getAddressString() };
			try {
				DistanceMatrix dm = DistanceMatrixApi
						.getDistanceMatrix(context, origin, destination)
						.units(Unit.IMPERIAL).await();
				if (dm.rows.length > 0 && dm.rows[0].elements.length > 0) {
					com.google.maps.model.Distance distance = dm.rows[0].elements[0].distance;
					Long distanceInMeters = distance.inMeters;
					if (distanceInMeters <= RESTAURANT_DISPLAY_RADIUS) {
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
			// TODO: WRITE sorting
		/*
		 * if(!nearByRestaurants.isEmpty() && nearByRestaurants!= null){ ÷ }
		 */
		return nearByRestaurants;
	}

	/**
	 * Gets the distance.
	 *
	 * @param address the address
	 * @param restaurant the restaurant
	 * @return the distance
	 */
	public RestaurantDTO getDistance(Address address, Restaurant restaurant) {
		Set <Restaurant> restaurants = Sets.newHashSet(restaurant);
		List <RestaurantDTO> restaurantDTOs = getDistance(address, restaurants);
		if (CollectionUtils.isNotEmpty(restaurantDTOs)) {
			return restaurantDTOs.iterator().next();
		}
		RestaurantDTO restaurantDTO = new RestaurantDTO();
		restaurantDTO.setDistance("0");
		restaurantDTO.setDistanceInMeters(new Long(0));
		restaurantDTO.setRestaurant(restaurant);
		return restaurantDTO;
	}
}
