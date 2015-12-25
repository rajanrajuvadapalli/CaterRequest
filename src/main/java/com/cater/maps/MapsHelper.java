package com.cater.maps;

import java.util.List;
import java.util.Set;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Component;

import com.beust.jcommander.internal.Lists;
import com.cater.model.Address;
import com.cater.model.RestaurantBranch;
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

	/**
	 * Gets the distance.
	 *
	 * @param address the address
	 * @param branches the branches
	 * @return the distance
	 */
	public List <RestaurantDTO> getDistance(Address address,
			Set <RestaurantBranch> branches) {
		GeoApiContext context = new GeoApiContext()
				.setApiKey("AIzaSyAlobAYE25Q2m62_DX3wc1AMimO2Xr-WHc");
		String[] origin = { address.getAddressString() };
		List <RestaurantDTO> nearByRestaurants = Lists.newArrayList();
		for (RestaurantBranch branch : branches) {
			String[] destination = { branch.getAddress().getAddressString() };
			try {
				DistanceMatrix dm = DistanceMatrixApi
						.getDistanceMatrix(context, origin, destination)
						.units(Unit.IMPERIAL).await();
				if (dm.rows.length > 0 && dm.rows[0].elements.length > 0) {
					com.google.maps.model.Distance distance = dm.rows[0].elements[0].distance;
					Long distanceInMeters = distance.inMeters;
					if (distanceInMeters <= 80467) {
						RestaurantDTO restaurantDTO = new RestaurantDTO();
						restaurantDTO.setDistance(distance.toString());
						restaurantDTO.setDistanceInMeters(distanceInMeters);
						restaurantDTO.setBranch(branch);
						nearByRestaurants.add(restaurantDTO);
					}
				}
				else {
					RestaurantDTO restaurantDTO = new RestaurantDTO();
					restaurantDTO.setDistance("0");
					restaurantDTO.setDistanceInMeters(new Long(0));
					nearByRestaurants.add(restaurantDTO);
				}
			}
			catch (Exception ex) {
				RestaurantDTO restaurantDTO = new RestaurantDTO();
				restaurantDTO.setDistance("0");
				restaurantDTO.setDistanceInMeters(new Long(0));
				nearByRestaurants.add(restaurantDTO);
			}
		} // end of iter
			// WRITE sorting
		/*
		 * if(!nearByRestaurants.isEmpty() && nearByRestaurants!= null){ ÷ }
		 */
		return nearByRestaurants;
	}

	/**
	 * Gets the distance.
	 *
	 * @param address the address
	 * @param branch the branch
	 * @return the distance
	 */
	public RestaurantDTO getDistance(Address address, RestaurantBranch branch) {
		Set <RestaurantBranch> branches = Sets.newHashSet(branch);
		List <RestaurantDTO> restaurantDTOs = getDistance(address, branches);
		if (CollectionUtils.isNotEmpty(restaurantDTOs)) {
			return restaurantDTOs.iterator().next();
		}
		RestaurantDTO restaurantDTO = new RestaurantDTO();
		restaurantDTO.setDistance("0");
		restaurantDTO.setDistanceInMeters(new Long(0));
		return restaurantDTO;
	}
}
