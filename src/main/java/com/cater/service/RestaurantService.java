package com.cater.service;

import java.io.File;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.PostConstruct;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.MapUtils;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.cater.Environment;
import com.cater.aws.s3.AmazonS3;
import com.cater.constants.Roles;
import com.cater.dao.QuoteDAO;
import com.cater.dao.RestaurantDAO;
import com.cater.email.EmailHelper;
import com.cater.email.Notification;
import com.cater.maps.MapsHelper;
import com.cater.maps.RestaurantDTO;
import com.cater.model.Quote;
import com.cater.model.Restaurant;
import com.cater.model.RestaurantSearch;
import com.cater.twilio.sms.SMSHelper;
import com.cater.yelp.YelpAPIHelper;

/**
 * The Class RestaurantService.
 */
@Component
public class RestaurantService {
	/** The Constant logger. */
	private static final Logger logger = Logger
			.getLogger(RestaurantService.class);
	/** The restaurant dao. */
	@Autowired
	private RestaurantDAO restaurantDAO;
	/** The quote dao. */
	@Autowired
	private QuoteDAO quoteDAO;
	/** The email helper. */
	@Autowired
	private EmailHelper emailHelper;
	/** The sms helper. */
	@Autowired
	private SMSHelper smsHelper;
	/** The amazons3. */
	@Autowired
	private AmazonS3 amazons3;

	/**
	 * Post construct.
	 */
	/*	@Value("${profile.pic.folder}")
		private String profilePicFolder;
	*/
	@PostConstruct
	private void postConstruct() {
		//If a system property is set, it will override
		//the value set in the properties file
		/*profilePicFolder = System.getProperty("profile.pic.folder",
				profilePicFolder);*/
	}

	/**
	 * Fetch all restaurants.
	 *
	 * @return the list
	 */
	public List <Restaurant> fetchAllRestaurants() {
		return restaurantDAO.fetchAllRestaurants();
	}
	
	public List<Restaurant> fetchAllRestaurantsWithFullMenu(){
		return restaurantDAO.fetchAllRestaurantsWithFullMenu();
	}

	public Set <Restaurant> fetchAllRestaurantsWithNoPrimaryCuisine() {
		return restaurantDAO.fetchAllRestaurantsWithNoPrimaryCuisine();
	}

	/**
	 * Fetch restaurants of type.
	 *
	 * @param cuisine the cuisine
	 * @return the sets the
	 */
	public Set <Restaurant> fetchRestaurantsOfType(String cuisine) {
		return restaurantDAO.fetchRestaurantsOfType(cuisine);
	}

	public Set <Restaurant> fetchRestaurantsOfTypePrimary(String cuisine) {
		return restaurantDAO.fetchRestaurantsOfTypePrimary(cuisine);
	}

	public Set <Restaurant> fetchRestaurantsOfTypeSecondary(String cuisine) {
		return restaurantDAO.fetchRestaurantsOfTypeSecondary(cuisine);
	}

	public List <Quote> fetchUpcomingQuotes(Integer restaurantID) {
		return restaurantDAO.fetchUpcomingQuotes(restaurantID);
	}

	public List <Quote> fetchNewRequests(Integer restaurantID) {
		return restaurantDAO.fetchNewRequests(restaurantID);
	}

	public List <Quote> fetchPastQuotes(Integer restaurantID) {
		return restaurantDAO.fetchPastQuotes(restaurantID);
	}

	public List <Quote> fetchConfirmedQuotes(Integer restaurantID) {
		return restaurantDAO.fetchConfirmedQuotes(restaurantID);
	}

	/**
	 * Find restaurant with id.
	 *
	 * @param restaurantId the restaurant id
	 * @return the restaurant
	 */
	public Restaurant findRestaurantWithId(Integer restaurantId) {
		return restaurantDAO.findById(restaurantId);
	}

	/**
	 * Find restaurants with login id.
	 *
	 * @param loginID the login id
	 * @return the list
	 */
	public List <Restaurant> findRestaurantsWithLoginId(Integer loginID) {
		return restaurantDAO.findByLoginID(loginID);
	}

	/**
	 * Find quote with id.
	 *
	 * @param quoteId the quote id
	 * @return the quote
	 */
	public Quote findQuoteWithId(Integer quoteId) {
		return quoteDAO.findById(quoteId);
	}

	/**
	 * Find quotes with event id.
	 *
	 * @param eventId the event id
	 * @return the list
	 */
	/*public List<Quote> findQuotesWithMenuId(Integer menuId) {
		return quoteDAO.findByMenuId(menuId);
	}*/
	public List <Quote> findQuotesWithEventId(Integer eventId) {
		return quoteDAO.findByEventId(eventId);
	}

	/**
	 * Find quote with restaurant id and menu id.
	 *
	 * @param restaurantId the restaurant id
	 * @param menuId the menu id
	 * @return the quote
	 */
	public Quote findQuoteWithRestaurantIdAndMenuId(Integer restaurantId,
			Integer menuId) {
		return quoteDAO.findByRestaurantIdAndMenuId(restaurantId, menuId);
	}

	/**
	 * Save or update quote.
	 *
	 * @param q the q
	 * @return true, if successful
	 */
	public boolean saveOrUpdateQuote(Quote q) {
		return quoteDAO.saveOrUpdate(q);
	}

	/**
	 * Gets the number of restaurants.
	 *
	 * @return the number of restaurants
	 */
	public int getNumberOfRestaurants() {
		return restaurantDAO.getNumberOfRestaurants();
	}

	/**
	 * Send notification.
	 *
	 * @param quote the quote
	 * @param optionalMessage the optional message
	 */
	public void sendNotification(Quote quote, StringBuilder optionalMessage) {
		emailHelper.sendNotificationEmailTo(Roles.RESTAURANT, quote,
				optionalMessage);
		smsHelper.sendNotificationSMSto(Roles.RESTAURANT, quote,
				optionalMessage);
	}
	
	/**
	 * Send payment notification.
	 *
	 * @param quote the quote
	 * @param optionalMessage the optional message
	 */
	public void paymentNotification(Quote quote, Notification notification, StringBuilder optionalMessage) {
		emailHelper.paymentNotificationEmail(Roles.RESTAURANT, quote, notification,
				optionalMessage);
		smsHelper.sendNotificationSMSto(Roles.RESTAURANT, quote,
				optionalMessage);
	}

	/**
	 * Save restaurant profile pic.
	 *
	 * @param restaurant the restaurant
	 * @param multipartFile the multipart file
	 */
	public void saveRestaurantProfilePic(Restaurant restaurant,
			MultipartFile multipartFile) {
		saveRestaurantProfilePic(restaurant.getId(), restaurant.getName(),
				multipartFile);
	}

	/**
	 * Search for restaurants by user name.
	 *
	 * @param name the name
	 * @return the list
	 */
	public List <RestaurantSearch> searchForRestaurantsByUserName(String name) {
		return restaurantDAO.searchRestaurantsByUserName(name);
	}

	/**
	 * Search for restaurants by date range.
	 *
	 * @param fromDate the from date
	 * @param toDate the to date
	 * @return the list
	 */
	public List <RestaurantSearch> searchForRestaurantsByDateRange(
			Date fromDate, Date toDate) {
		return restaurantDAO.searchRestaurantsByDateRange(fromDate, toDate);
	}

	/**
	 * Save restaurant profile pic.
	 *
	 * @param restaurantID the restaurant id
	 * @param restaurantName the restaurant name
	 * @param multipartFile the multipart file
	 */
	public void saveRestaurantProfilePic(Integer restaurantID,
			String restaurantName, MultipartFile multipartFile) {
		//Save the profile picture for restaurant
		String fileType = "";
		String originalFileName = "";
		if (multipartFile != null
				&& StringUtils.isNotBlank(originalFileName = multipartFile
						.getOriginalFilename())) {
			logger.debug("Saving profile picture " + originalFileName);
			if (StringUtils.contains(originalFileName, ".")) {
				fileType = StringUtils.substring(originalFileName,
						StringUtils.lastIndexOf(originalFileName, "."));
			}
			String imageUrl = "Restaurant_" + restaurantID;
			File f = null;
			try {
				//First delete if exists
				if ((f = new File(imageUrl + ".jpg")).exists()) {
					FileUtils.deleteQuietly(f);
				}
				if ((f = new File(imageUrl + ".jpeg")).exists()) {
					FileUtils.deleteQuietly(f);
				}
				if ((f = new File(imageUrl + ".png")).exists()) {
					FileUtils.deleteQuietly(f);
				}
				if ((f = new File(imageUrl + ".gif")).exists()) {
					FileUtils.deleteQuietly(f);
				}
				f = new File(imageUrl + fileType);
				IOUtils.copy(multipartFile.getInputStream(),
						FileUtils.openOutputStream(f, false));
				if (Environment.isProd() || Environment.isUat()) {
					amazons3.upload(f);
				}
				else {
					logger.debug("*** LOCAL ENVIRONMENT *** Not saving profile pic to cloud.");
				}
				FileUtils.deleteQuietly(f);
			}
			catch (Exception e) {
				logger.error("Failed to save the profile image for restaurant "
						+ restaurantName + " with ID: " + restaurantID);
			}
			/*logger.debug(String.format(
					"Successfully saved %s's profile pic to %s",
					restaurantName, f.getAbsolutePath()));*/
		}
	}

	/**
	 * Gets the nearby yelp reviews.
	 *
	 * @param eventLocation the event location
	 * @param restaurants the restaurants
	 * @return the nearby yelp reviews
	 */
	public Collection <RestaurantDTO> getNearbyYelpReviews(
			com.cater.model.Address eventLocation, Set <Restaurant> restaurants) {
		Collection <RestaurantDTO> nearByRestaurants = null;
		try {
			nearByRestaurants = new MapsHelper().getDistance(eventLocation,
					restaurants);
			if (CollectionUtils.isNotEmpty(nearByRestaurants)) {
				for (RestaurantDTO restaurantDTO : nearByRestaurants) {
					Map <Object, Object> yelpReviews = YelpAPIHelper
							.getRatings(restaurantDTO);
					if (MapUtils.isNotEmpty(yelpReviews)) {
						restaurantDTO.setNumberOfReviews(Integer
								.parseInt(yelpReviews.get("noOfReviews")
										.toString()));
						restaurantDTO
								.setReviewImage(yelpReviews.get("ratings"));
						restaurantDTO.setWebsiteUrl(yelpReviews
								.get("websiteUrl"));
					}
				}
			}
		}
		catch (Exception e1) {
			logger.error("Exception occurred while getting yelp reviews.", e1);
		}
		return nearByRestaurants;
	}
}
