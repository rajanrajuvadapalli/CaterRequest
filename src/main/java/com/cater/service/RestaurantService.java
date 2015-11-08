package com.cater.service;

import java.io.File;
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

import com.cater.aws.s3.AmazonS3;
import com.cater.constants.Roles;
import com.cater.dao.QuoteDAO;
import com.cater.dao.RestaurantDAO;
import com.cater.email.EmailHelper;
import com.cater.maps.MapsHelper;
import com.cater.maps.RestaurantDTO;
import com.cater.model.Quote;
import com.cater.model.Restaurant;
import com.cater.model.RestaurantSearch;
import com.cater.twilio.sms.SMSHelper;
import com.cater.yelp.YelpAPIHelper;

@Component
public class RestaurantService {
	private static final Logger logger = Logger
			.getLogger(RestaurantService.class);
	@Autowired
	private RestaurantDAO restaurantDAO;
	@Autowired
	private QuoteDAO quoteDAO;
	@Autowired
	private EmailHelper emailHelper;
	@Autowired
	private SMSHelper smsHelper;
	@Autowired
	private YelpAPIHelper yelpHelper;
	@Autowired
	private AmazonS3 amazons3;

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

	public List <Restaurant> fetchAllRestaurants() {
		return restaurantDAO.fetchAllRestaurants();
	}

	public Set <Restaurant> fetchRestaurantsOfType(String cuisine) {
		return restaurantDAO.fetchRestaurantsOfType(cuisine);
	}

	public Restaurant findRestaurantWithId(Integer restaurantId) {
		return restaurantDAO.findById(restaurantId);
	}

	public Restaurant findRestaurantWithLoginId(Integer loginID) {
		return restaurantDAO.findByLoginID(loginID);
	}

	public Quote findQuoteWithId(Integer quoteId) {
		return quoteDAO.findById(quoteId);
	}

	/*public List<Quote> findQuotesWithMenuId(Integer menuId) {
		return quoteDAO.findByMenuId(menuId);
	}*/
	public List <Quote> findQuotesWithEventId(Integer eventId) {
		return quoteDAO.findByEventId(eventId);
	}

	public Quote findQuoteWithRestaurantIdAndMenuId(Integer restaurantId,
			Integer menuId) {
		return quoteDAO.findByRestaurantIdAndMenuId(restaurantId, menuId);
	}

	public boolean saveOrUpdateQuote(Quote q) {
		return quoteDAO.saveOrUpdate(q);
	}

	public int getNumberOfRestaurants() {
		return restaurantDAO.getNumberOfRestaurants();
	}

	public void sendNotification(Quote quote, StringBuilder optionalMessage) {
		emailHelper.sendNotificationEmailTo(Roles.RESTAURANT, quote,
				optionalMessage);
		smsHelper.sendNotificationSMSto(Roles.RESTAURANT, quote,
				optionalMessage);
	}

	public void saveRestaurantProfilePic(Restaurant restaurant,
			MultipartFile multipartFile) {
		saveRestaurantProfilePic(restaurant.getId(), restaurant.getName(),
				multipartFile);
	}

	public List <RestaurantSearch> searchForRestaurantsByName(String name) {
		return restaurantDAO.searchRestaurantsByName(name);
	}

	public List <RestaurantSearch> searchForRestaurantsByDateRange(
			Date fromDate, Date toDate) {
		return restaurantDAO.searchRestaurantsByDateRange(fromDate, toDate);
	}

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
				amazons3.upload(f);
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

	public List <RestaurantDTO> getNearbyYelpReviews(
			com.cater.model.Address eventLocation, Set <Restaurant> restaurants) {
		List <RestaurantDTO> nearByRestaurants = null;
		try {
			nearByRestaurants = new MapsHelper().getDistance(
					eventLocation.toString(), restaurants);
			if (CollectionUtils.isNotEmpty(nearByRestaurants)) {
				for (RestaurantDTO restaurantDTO : nearByRestaurants) {
					String eventAddress = eventLocation.getStreet1() + " "
							+ eventLocation.getStreet2() + " "
							+ eventLocation.getState() + " "
							+ eventLocation.getZip();
					Map <Object, Object> yelpReviews = yelpHelper.getRatings(
							restaurantDTO.getRestaurant().getName(),
							eventAddress);
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
