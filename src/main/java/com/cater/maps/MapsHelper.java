package com.cater.maps;

import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections4.list.TreeList;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
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
	private static final Logger logger = Logger.getLogger(MapsHelper.class);
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
	public Collection <RestaurantDTO> getDistance(Address address,
			Collection <Restaurant> restaurants) {
		GeoApiContext context = new GeoApiContext()
				.setApiKey("AIzaSyAlobAYE25Q2m62_DX3wc1AMimO2Xr-WHc");
		String[] origin = { getOriginAddress(address) };
		List <RestaurantDTO> nearByRestaurants = new TreeList <>();
		ExecutorService executor = Executors.newFixedThreadPool(10);
		List <Future <RestaurantDTO>> list = Lists.newArrayList();
		for (Restaurant rest : restaurants) {
			if (rest != null) {
				Future <RestaurantDTO> future = executor
						.submit(new DistanceThreadCallable(rest, context,
								origin));
				list.add(future);
			}
		}
		for (Future <RestaurantDTO> future : list) {
			try {
				RestaurantDTO rdto = future.get();
				if (rdto != null) {
					nearByRestaurants.add(rdto);
				}
			}
			catch (Exception e) {
				logger.error("Failed to get distance matrix.", e);
			}
		}
		executor.shutdown();
		// Sort restaurants by distance.
		Collections.sort(nearByRestaurants, new RestaurantDistanceComparator());
		return nearByRestaurants;
	}

	private String getOriginAddress(Address address) {
		StringBuilder builder = new StringBuilder();
		if (StringUtils.isNotBlank(address.getStreet1())) {
			builder.append(address.getStreet1()).append(", ");
		}
		if (StringUtils.isNotBlank(address.getStreet2())) {
			builder.append(address.getStreet2()).append(", ");
		}
		if (StringUtils.isNotBlank(address.getCity())) {
			builder.append(address.getCity()).append(", ");
		}
		if (StringUtils.isNotBlank(address.getState())) {
			builder.append(address.getState()).append(", ");
		}
		if (StringUtils.isNotBlank(address.getZip())) {
			builder.append(address.getZip());
		}
		return builder.toString();
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
		Collection <RestaurantDTO> restaurantDTOs = getDistance(address,
				restaurants);
		if (CollectionUtils.isNotEmpty(restaurantDTOs)) {
			return restaurantDTOs.iterator().next();
		}
		RestaurantDTO restaurantDTO = new RestaurantDTO();
		restaurantDTO.setDistance("0");
		restaurantDTO.setDistanceInMeters(new Long(0));
		restaurantDTO.setRestaurant(restaurant);
		return restaurantDTO;
	}

	/**
	 * The Class DistanceThreadCallable.
	 */
	class DistanceThreadCallable implements Callable <RestaurantDTO> {
		private Restaurant restaurant;
		private GeoApiContext context;
		private String[] origin;

		DistanceThreadCallable(Restaurant restaurant, GeoApiContext context,
				String[] origin) {
			this.restaurant = restaurant;
			this.context = context;
			this.origin = origin;
		}

		@Override
		public RestaurantDTO call() throws Exception {
			RestaurantDTO restaurantDTO = null;
			String[] destination = { restaurant.getAddress().getAddressString() };
			try {
				DistanceMatrix dm = DistanceMatrixApi
						.getDistanceMatrix(context, origin, destination)
						.units(Unit.IMPERIAL).await();
				if (dm.rows.length > 0 && dm.rows[0].elements.length > 0) {
					com.google.maps.model.Distance distance = dm.rows[0].elements[0].distance;
					Long distanceInMeters = distance.inMeters;
					if (distanceInMeters <= RESTAURANT_DISPLAY_RADIUS) {
						restaurantDTO = new RestaurantDTO();
						restaurantDTO.setDistance(distance.toString());
						restaurantDTO.setDistanceInMeters(distanceInMeters);
						restaurantDTO.setRestaurant(restaurant);
					}
				}
				else {
					restaurantDTO = new RestaurantDTO();
					restaurantDTO.setDistance("0");
					restaurantDTO.setDistanceInMeters(new Long(0));
					restaurantDTO.setRestaurant(restaurant);
				}
			}
			catch (Exception ex) {
				restaurantDTO = new RestaurantDTO();
				restaurantDTO.setDistance("0");
				restaurantDTO.setDistanceInMeters(new Long(0));
				restaurantDTO.setRestaurant(restaurant);
			}
			return restaurantDTO;
		}
	}
}
