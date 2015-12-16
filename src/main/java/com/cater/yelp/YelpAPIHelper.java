package com.cater.yelp;

import java.util.Locale;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.scribe.builder.ServiceBuilder;
import org.scribe.model.OAuthRequest;
import org.scribe.model.Response;
import org.scribe.model.Token;
import org.scribe.model.Verb;
import org.scribe.oauth.OAuthService;
import org.springframework.stereotype.Component;

import com.beust.jcommander.internal.Maps;
import com.cater.maps.RestaurantDTO;

/**
 * The Class YelpAPIHelper.
 */
@Component
public class YelpAPIHelper {
	/** The Constant logger. */
	private static final Logger logger = Logger.getLogger(YelpAPIHelper.class);
	/** The Constant API_HOST. */
	private static final String API_HOST = "api.yelp.com";
	// private static final String DEFAULT_TERM = "dinner";
	/** The Constant SEARCH_LIMIT. */
	// private static final String DEFAULT_LOCATION = "San Francisco, CA";
	private static final int SEARCH_LIMIT = 3;
	/** The Constant RADIUS_LIMIT. */
	//private static final int RADIUS_LIMIT = 40000;
	/** The Constant SEARCH_PATH. */
	private static final String SEARCH_PATH = "/v2/search";
	/** The Constant BUSINESS_PATH. */
	private static final String BUSINESS_PATH = "/v2/business";
	/** The Constant CONSUMER_KEY. */
	/*
	 * Update OAuth credentials below from the Yelp Developers API site:
	 * http://www.yelp.com/developers/getting_started/api_access
	 */
	private static final String CONSUMER_KEY = "PQQCi-HgeDwHiTmLWD9xRA";
	/** The Constant CONSUMER_SECRET. */
	private static final String CONSUMER_SECRET = "vaHGOpCa8HRbZwyqJacHCsTE3XU";
	/** The Constant TOKEN. */
	private static final String TOKEN = "_XvdI_ZX5-hT1sZrpuudroys9h1Oq6xI";
	/** The Constant TOKEN_SECRET. */
	private static final String TOKEN_SECRET = "j-3nTjCrn6VMOp5dADjMfGaEw00";
	/** The cuisine filter lookup. */
	private static Map <String, String> CUISINE_FILTER_LOOKUP = Maps
			.newHashMap();
	static {
		CUISINE_FILTER_LOOKUP.put("INDIAN_SOUTH", "indpak");
		CUISINE_FILTER_LOOKUP.put("INDIAN_NORTH", "indpak");
		CUISINE_FILTER_LOOKUP.put("MEXICAN", "mexican");
		CUISINE_FILTER_LOOKUP.put("SANDWICH", "sandwiches");
		CUISINE_FILTER_LOOKUP.put("THAI", "thai");
		CUISINE_FILTER_LOOKUP.put("PIZZA", "pizza");
	}
	/** The service. */
	OAuthService service;
	/** The access token. */
	Token accessToken;

	/**
	 * Instantiates a new yelp api helper.
	 */
	public YelpAPIHelper() {
	}

	/**
	 * Instantiates a new yelp api helper.
	 *
	 * @param consumerKey the consumer key
	 * @param consumerSecret the consumer secret
	 * @param token the token
	 * @param tokenSecret the token secret
	 */
	public YelpAPIHelper(String consumerKey, String consumerSecret,
			String token, String tokenSecret) {
		service = new ServiceBuilder().provider(TwoStepOAuth.class)
				.apiKey(consumerKey).apiSecret(consumerSecret).build();
		accessToken = new Token(token, tokenSecret);
	}

	/**
	 * Creates and sends a request to the Search API by term and location.
	 * <p>
	 * See <a
	 * href="http://www.yelp.com/developers/documentation/v2/search_api">Yelp
	 * Search API V2</a> for more info.
	 *
	 * @param term            <tt>String</tt> of the search term to be queried
	 * @param location            <tt>String</tt> of the location
	 * @param cuisine the cuisine
	 * @return <tt>String</tt> JSON Response
	 */
	private String searchForBusinessesByLocation(String term, String location,
			String cuisine) {
		OAuthRequest request = createOAuthRequest(SEARCH_PATH);
		request.addQuerystringParameter("term", term);
		request.addQuerystringParameter("location", location);
		request.addQuerystringParameter("limit", String.valueOf(SEARCH_LIMIT));
		if (StringUtils.isNotBlank(cuisine)) {
			request.addQuerystringParameter("category_filter", cuisine);
		}
		return sendRequestAndGetResponse(request);
	}

	/**
	 * Creates and sends a request to the Business API by business ID.
	 * <p>
	 * See <a
	 * href="http://www.yelp.com/developers/documentation/v2/business">Yelp
	 * Business API V2</a> for more info.
	 * 
	 * @param businessID
	 *            <tt>String</tt> business ID of the requested business
	 * @return <tt>String</tt> JSON Response
	 */
	private String searchByBusinessId(String businessID) {
		OAuthRequest request = createOAuthRequest(BUSINESS_PATH + "/"
				+ businessID);
		return sendRequestAndGetResponse(request);
	}

	/**
	 * Creates and returns an {@link OAuthRequest} based on the API endpoint
	 * specified.
	 * 
	 * @param path
	 *            API endpoint to be queried
	 * @return <tt>OAuthRequest</tt>
	 */
	private OAuthRequest createOAuthRequest(String path) {
		OAuthRequest request = new OAuthRequest(Verb.GET, "http://" + API_HOST
				+ path);
		return request;
	}

	/**
	 * Sends an {@link OAuthRequest} and returns the {@link Response} body.
	 * 
	 * @param request
	 *            {@link OAuthRequest} corresponding to the API request
	 * @return <tt>String</tt> body of API response
	 */
	private String sendRequestAndGetResponse(OAuthRequest request) {
		logger.debug("Querying " + request.getCompleteUrl() + " ...");
		service.signRequest(accessToken, request);
		Response response = request.send();
		return response.getBody();
	}

	/**
	 * Queries the Search API based on the command line arguments and takes the
	 * first result to query the Business API.
	 *
	 * @param yelpApi            <tt>YelpAPI</tt> service instance
	 * @param restaurantDTO the restaurant dto
	 * @param zip the zip
	 * @return the map
	 * @throws ParseException 
	 */
	private static Map <Object, Object> queryAPI(YelpAPIHelper yelpApi,
			RestaurantDTO restaurantDTO, String zip) throws ParseException {
		String restaurantName = restaurantDTO.getRestaurant().getName();
		String cuisineType = StringUtils.upperCase(StringUtils
				.defaultString(restaurantDTO.getRestaurant().getCuisineType()),
				Locale.US);
		String yelpCuisineFilter = cuisineType;
		if (StringUtils.isNotBlank(cuisineType)
				&& CUISINE_FILTER_LOOKUP.containsKey(cuisineType)) {
			yelpCuisineFilter = CUISINE_FILTER_LOOKUP.get(cuisineType);
		}
		String searchResponseJSON = yelpApi.searchForBusinessesByLocation(
				restaurantName, zip, yelpCuisineFilter);
		JSONParser parser = new JSONParser();
		JSONObject response = null;
		try {
			response = (JSONObject) parser.parse(searchResponseJSON);
		}
		catch (ParseException pe) {
			logger.error("Error: could not parse JSON response: "
					+ searchResponseJSON);
			throw pe;
		}
		JSONArray businesses = (JSONArray) response.get("businesses");
		Map <Object, Object> yelpRatings = Maps.newHashMap();
		if (businesses != null) {
			for (int i = 0; i < businesses.size(); i++) {
				JSONObject firstBusiness = (JSONObject) businesses.get(i);
				JSONObject businessLocation = (JSONObject) firstBusiness
						.get("location");
				String postalCode = businessLocation.get("postal_code")
						.toString();
				if (StringUtils.equalsIgnoreCase(restaurantName,
						(String) firstBusiness.get("name"))
						&& StringUtils.equalsIgnoreCase(postalCode,
								restaurantDTO.getRestaurant().getAddress()
										.getZip())) {
					if (firstBusiness.get("id") != null
							|| org.springframework.util.StringUtils
									.isEmpty(firstBusiness.get("id"))) {
						String firstBusinessID = firstBusiness.get("id")
								.toString();
						// Select the first business and display business details
						String businessResponseJSON = yelpApi
								.searchByBusinessId(firstBusinessID.toString());
						JSONParser parser1 = new JSONParser();
						JSONObject businessResponse = null;
						try {
							businessResponse = (JSONObject) parser1
									.parse(businessResponseJSON);
						}
						catch (ParseException e) {
							logger.error(
									"Could not parse response from yelp API.",
									e);
						}
						yelpRatings.put("ratings",
								businessResponse.get("rating_img_url_large")
										.toString());
						yelpRatings.put(
								"noOfReviews",
								Integer.parseInt(businessResponse.get(
										"review_count").toString()));
						yelpRatings.put("websiteUrl",
								businessResponse.get("url"));
					}
				}
			}
		}
		return yelpRatings;
	}

	/*  */
	/**
	 * Command-line interface for the sample Yelp API runner.
	 *
	 * @param restaurantDTO the restaurant dto
	 * @param zipCode the zip code
	 * @return the ratings
	 */
	/*
	 * private static class YelpAPICLI {
	 * 
	 * @Parameter(names = {"-q", "--term"}, description = "Search Query Term")
	 * public String term = DEFAULT_TERM;
	 * 
	 * @Parameter(names = {"-l", "--location"}, description =
	 * "Location to be Queried") public String location = DEFAULT_LOCATION; }
	 */
	/**
	 * Main entry for sample Yelp API requests.
	 * <p>
	 * After entering your OAuth credentials, execute <tt><b>run.sh</b></tt> to
	 * run this example.
	 * 
	 * @return
	 * @throws ParseException 
	 */
	public static Map <Object, Object> getRatings(RestaurantDTO restaurantDTO,
			String zipCode) throws ParseException {
		YelpAPIHelper yelpApi = new YelpAPIHelper(CONSUMER_KEY,
				CONSUMER_SECRET, TOKEN, TOKEN_SECRET);
		// queryAPI(yelpApi, yelpApiCli);
		return queryAPI(yelpApi, restaurantDTO, zipCode);
	}
}
