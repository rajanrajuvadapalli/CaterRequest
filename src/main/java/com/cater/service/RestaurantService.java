package com.cater.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Set;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.cater.constants.Roles;
import com.cater.dao.QuoteDAO;
import com.cater.dao.RestaurantDAO;
import com.cater.email.EmailHelper;
import com.cater.model.Quote;
import com.cater.model.Restaurant;
import com.cater.twilio.sms.SMSHelper;

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
	@Value("${profile.pic.folder}")
	private String profilePicFolder;

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

	public void saveRestaurantProfilePic(Integer restaurantID,
			String restaurantName, MultipartFile multipartFile) {
		//Save the profile picture for restaurant
		String fileType = "";
		if (multipartFile != null) {
			String originalFileName = multipartFile.getOriginalFilename();
			logger.debug("Saving profile picture " + originalFileName);
			if (StringUtils.contains(originalFileName, ".")) {
				fileType = StringUtils.substring(originalFileName,
						StringUtils.lastIndexOf(originalFileName, "."));
			}
			String imageUrl = profilePicFolder + "/Restaurant_" + restaurantID;
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
			}
			catch (IOException e) {
				logger.error("Failed to save the profile image for restaurant "
						+ restaurantName + " with ID: " + restaurantID);
			}
			logger.debug(String.format(
					"Successfully saved %s's profile pic to %s",
					restaurantName, f.getAbsolutePath()));
		}
	}
}
