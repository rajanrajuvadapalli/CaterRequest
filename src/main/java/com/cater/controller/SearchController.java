package com.cater.controller;

import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.collections4.list.TreeList;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cater.Environment;
import com.cater.Helper;
import com.cater.maps.MapsHelper;
import com.cater.maps.RestaurantDTO;
import com.cater.model.Address;
import com.cater.model.Restaurant;
import com.cater.service.RestaurantService;
import com.cater.yelp.YelpAPIHelper;

/**
 * The Class SearchController.
 */
@Controller
public class SearchController {
	/** The Constant logger. */
	private static final Logger logger = Logger
			.getLogger(SearchController.class);
	/** The restaurant service. */
	@Autowired
	private RestaurantService restaurantService;

	/**
	 * Search restaurants.
	 *
	 * @param modelMap the model map
	 * @param request the request
	 * @param session the session
	 * @return the string
	 * @throws Exception the exception
	 */
	/*
	 * search for list of restaurants
	 * 
	 * @author sandeep appikonda
	 */
	@RequestMapping(value = { "search" }, method = RequestMethod.GET)
	public String searchRestaurants(
			ModelMap modelMap,
			HttpServletRequest request,
			HttpSession session,
			@RequestParam(value = "zip", required = true) String zip,
			@RequestParam(value = "cuisineType", required = false) String cuisineType)
			throws Exception {
		session.setAttribute("env", Environment.getInstance());
		//When we use the search functionality, we start without creating the event.
		//We should force the user to create event.
		session.removeAttribute("eventId");
		if (StringUtils.isNotBlank(zip)) {
			modelMap.put("eventZip", zip);
			Collection <Restaurant> restaurants = null;
			if (StringUtils.isNotBlank(cuisineType)) {
				logger.debug("cuisineType: " + cuisineType);
				modelMap.put("cuisineType", cuisineType);
				restaurants = restaurantService
						.fetchRestaurantsOfType(cuisineType);
			}
			else {
				restaurants = restaurantService.fetchAllRestaurants();
			}
			if (CollectionUtils.isNotEmpty(restaurants)) {
				logger.debug("Found " + restaurants.size() + " restaurants.");
				Collection <RestaurantDTO> nearByRestaurants = getRestaurantDTOs(
						restaurants, zip);
				modelMap.put("restaurants", nearByRestaurants);
			}
			else {
				logger.debug("Found 0 restaurants.");
			}
		}
		return "t_search";
	}

	/**
	 * Gets the restaurant dt os.
	 *
	 * @param restaurants the restaurants
	 * @param zipCode the zip code
	 * @return the restaurant dt os
	 * @throws ParseException the parse exception
	 */
	private Collection <RestaurantDTO> getRestaurantDTOs(
			Collection <Restaurant> restaurants, String zipCode)
			throws ParseException {
		if (CollectionUtils.isNotEmpty(restaurants)) {
			MapsHelper mapsHelper = new MapsHelper();
			Address address = new Address();
			address.setZip(zipCode);
			long start = System.currentTimeMillis();
			Collection <RestaurantDTO> nearByRestaurants = mapsHelper
					.getDistance(address, restaurants);
			logger.info("Took " + (System.currentTimeMillis() - start) / 1000
					+ " seconds to get distance matrix.");
			if (CollectionUtils.isNotEmpty(nearByRestaurants)) {
				start = System.currentTimeMillis();
				ExecutorService executor = Executors.newFixedThreadPool(10);
				List <Future <?>> list = new TreeList <>();
				for (RestaurantDTO restaurantDTO : nearByRestaurants) {
					if (restaurantDTO != null) {
						Future <?> future = executor.submit(new YelpCallable(
								restaurantDTO));
						list.add(future);
					}
				}
				for (Future <?> future : list) {
					try {
						future.get();
					}
					catch (Exception e) {
						logger.error("Failed to get yelp reviews.", e);
					}
				}
				executor.shutdown();
				logger.info("Took " + (System.currentTimeMillis() - start)
						/ 1000 + " seconds to get yelp reviews for "
						+ nearByRestaurants.size() + " restaurants.");
			}
			return nearByRestaurants;
		}
		return null;
	}

	/**
	 * The Class YelpCallable.
	 */
	class YelpCallable implements Runnable {
		private RestaurantDTO restaurantDTO;

		YelpCallable(RestaurantDTO restaurantDTO) {
			this.restaurantDTO = restaurantDTO;
		}

		@Override
		public void run() {
			try {
				Map <?, ?> yelpReviews = YelpAPIHelper
						.getRatings(restaurantDTO);
				if (MapUtils.isNotEmpty(yelpReviews)) {
					restaurantDTO.setNumberOfReviews(Helper
							.stringToInt(yelpReviews.get("noOfReviews")
									.toString()));
					restaurantDTO.setReviewImage(yelpReviews.get("ratings"));
					restaurantDTO.setWebsiteUrl(yelpReviews.get("websiteUrl"));
					logger.debug(String.format(
							"Restaurant %s has %s yelp ratings.", restaurantDTO
									.getRestaurant().getName(), yelpReviews
									.get("ratings")));
				}
			}
			catch (Exception ex) {
				logger.error("Failed to get yelp ratings.", ex);
			}
		}
	}
}