package com.cater.controller;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Nullable;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cater.Helper;
import com.cater.constants.QuoteStatus;
import com.cater.model.Login;
import com.cater.model.Quote;
import com.cater.model.Restaurant;
import com.cater.service.CustomerService;
import com.cater.service.LoginService;
import com.cater.service.RegisterService;
import com.cater.service.RestaurantService;
import com.cater.ui.data.RegistrationData;
import com.cater.ui.data.User;
import com.google.common.base.Predicate;
import com.google.common.collect.Collections2;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

/**
 * The Class RestaurantDashboardController.
 */
@Controller
@RequestMapping(value = { "restaurant" })
public class RestaurantDashboardController {
	private static final Logger logger = Logger
			.getLogger(RestaurantDashboardController.class);
	/** The restaurant service. */
	@Autowired
	private RestaurantService restaurantService;
	/** The customer service. */
	@Autowired
	private CustomerService customerService;
	/** The login service. */
	@Autowired
	private LoginService loginService;
	/** The register service. */
	@Autowired
	private RegisterService registerService;

	/**
	 * Gets the dashboard.
	 *
	 * @param modelMap the model map
	 * @param session the session
	 * @return the dashboard
	 */
	@RequestMapping(value = { "dashboard" })
	public String getDashboard(ModelMap modelMap, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "t_home";
		}
		List <Restaurant> restaurants = restaurantService
				.findRestaurantsWithLoginId(user.getLoginID());
		if (CollectionUtils.isNotEmpty(restaurants)) {
			if (restaurants.size() == 1) {
				Restaurant restaurant = restaurants.get(0);
				user.setRestaurantID(restaurant.getId());
				modelMap.put("restaurant", restaurant);
				((User) session.getAttribute("user")).setName(restaurant
						.getName());
				Map <Integer, Double> bargainMap = getBargainPercentages(restaurant);
				modelMap.put("bargain", bargainMap);
				List <Quote> newRequests = restaurantService
						.fetchNewRequests(restaurant.getId());
				modelMap.put("newRequests", newRequests);
				List <Quote> pastQuotes = restaurantService
						.fetchPastQuotes(restaurant.getId());
				modelMap.put("pastQuotes", pastQuotes);
				List <Quote> confirmedQuotes = restaurantService
						.fetchConfirmedQuotes(restaurant.getId());
				modelMap.put("confirmedQuotes", confirmedQuotes);
				return "restaurant/t_dashboard";
			}
			else {
				user.setRestaurants(restaurants);
				//If there are multiple restaurants, clear the current restaurant
				user.setRestaurant(null);
				user.setRestaurantID(0);
				//modelMap.put("restaurants", restaurants);
				String username = "";
				if (CollectionUtils.isNotEmpty(restaurants)) {
					username = restaurants.get(0).getLogin().getUsername();
				}
				((User) session.getAttribute("user")).setName(StringUtils
						.defaultString(username));
				//TODO: bargain map
				//TODO: set restaurant ID in session user object after the user makes a selection.
				return "restaurant/t_dashboard_restaurants";
			}
		}
		return "t_home";
	}

	/**
	 * Gets the dashboard for id.
	 *
	 * @param modelMap the model map
	 * @param session the session
	 * @param restaurantID the restaurant id
	 * @return the dashboard for id
	 */
	@RequestMapping(value = { "dashboard/{restaurantID}" }, method = RequestMethod.GET)
	public String getDashboardForId(ModelMap modelMap, HttpSession session,
			@PathVariable("restaurantID") int restaurantID) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "t_home";
		}
		Restaurant restaurant = restaurantService
				.findRestaurantWithId(restaurantID);
		user.setRestaurant(restaurant);
		user.setRestaurantID(restaurant.getId());
		modelMap.put("restaurant", restaurant);
		((User) session.getAttribute("user")).setName(restaurant.getName());
		Map <Integer, Double> bargainMap = getBargainPercentages(restaurant);
		modelMap.put("bargain", bargainMap);
		List <Quote> newRequests = restaurantService
				.fetchNewRequests(restaurant.getId());
		modelMap.put("newRequests", newRequests);
		List <Quote> pastQuotes = restaurantService.fetchPastQuotes(restaurant
				.getId());
		modelMap.put("pastQuotes", pastQuotes);
		List <Quote> confirmedQuotes = restaurantService
				.fetchConfirmedQuotes(restaurant.getId());
		modelMap.put("confirmedQuotes", confirmedQuotes);
		return "restaurant/t_dashboard";
	}

	/**
	 * Adds the branch form.
	 *
	 * @return the string
	 */
	@RequestMapping(value = { "addBranch" }, method = RequestMethod.GET)
	public String addBranchForm() {
		return "t_signUp_branch";
	}

	/**
	 * Adds the branch.
	 *
	 * @param httpSession the http session
	 * @param modelMap the model map
	 * @param request the request
	 * @param redirectAttributes the redirect attributes
	 * @return the string
	 */
	@RequestMapping(value = { "addBranch" }, method = RequestMethod.POST)
	public String addBranch(
			HttpSession httpSession,
			ModelMap modelMap,
			HttpServletRequest request,
			RedirectAttributes redirectAttributes,
			@RequestParam(value = "cuisineType_sec", required = false) String[] secondaryCuisineTypes) {
		User user = (User) httpSession.getAttribute("user");
		if (user == null) {
			return "t_home";
		}
		Login login = loginService.findLoginWithId(user.getLoginID());
		RegistrationData data = new RegistrationData();
		data.setRestaurantName(StringUtils.defaultString(request
				.getParameter("restaurantName")));
		String primaryCuisine = StringUtils.defaultString(request
				.getParameter("cuisineType"));
		data.setCuisineType(Helper.getCuisineType(primaryCuisine,
				secondaryCuisineTypes));
		data.setUrl(StringUtils.defaultString(request.getParameter("url")));
		String deliverMiles = StringUtils.defaultString(request
				.getParameter("deliver-miles"));
		if (StringUtils.isBlank(deliverMiles)) {
			deliverMiles = "0";
		}
		data.setDeliverMiles(deliverMiles);
		data.setEmail(StringUtils.defaultString(request.getParameter("email")));
		data.setPhone(StringUtils.defaultString(request.getParameter("phone")));
		data.setSmsOk(StringUtils.equalsIgnoreCase("on",
				request.getParameter("smsOk")));
		String street1 = StringUtils
				.defaultString(request.getParameter("street_number"))
				.trim()
				.concat(" ")
				.concat(StringUtils.defaultString(
						request.getParameter("street_name")).trim());
		data.setStreet1(street1);
		String apt_classifier = StringUtils.defaultString(
				request.getParameter("apt_classifier")).trim();
		String street2 = StringUtils.defaultString(
				request.getParameter("street2")).trim();
		if (StringUtils.isNotBlank(street2)) {
			data.setStreet2(apt_classifier + " " + street2);
		}
		data.setCity(StringUtils.defaultString(request.getParameter("city"))
				.trim());
		data.setState(StringUtils.defaultString(request.getParameter("state"))
				.trim());
		data.setZip(StringUtils.defaultString(request.getParameter("zip"))
				.trim());
		data.setSalesTax(Helper.stringToFloat(request.getParameter("sales")));
		//If the restaurant uses the same phone number used on other branch and if it was verified,
		//set the current branch verification flag to true.
		boolean isPhoneAlreadyVerified = false;
		List <Restaurant> restaurants = login.getRestaurants();
		if (CollectionUtils.isNotEmpty(restaurants)) {
			for (Restaurant r : restaurants) {
				if (r != null
						&& StringUtils.equalsIgnoreCase(r.getContactNumber(),
								data.getPhone())) {
					isPhoneAlreadyVerified = isPhoneAlreadyVerified
							|| r.isNumberVerified();
				}
			}
		}
		data.setNumberVerified(isPhoneAlreadyVerified);
		logger.debug("Add branch form data: " + data.toString());
		registerService.saveNewRestaurantBranch(data, login);
		List <String> successMessages = Lists.newArrayList();
		successMessages.add("Successfully added a branch.");
		redirectAttributes
				.addFlashAttribute("successMessages", successMessages);
		modelMap.addAttribute("successMessages", successMessages);
		return "redirect:/dashboard";
	}

	/**
	 * Gets the bargain percentages.
	 *
	 * @param restaurant the restaurant
	 * @return the bargain percentages
	 */
	private Map <Integer, Double> getBargainPercentages(Restaurant restaurant) {
		Map <Integer, Double> bargain = Maps.newHashMap();
		//For each quote, compare with other restaurant's quote and calculate %
		for (Quote rQuote : restaurant.getQuotes()) {
			Collection <Quote> allQuotesForThisEvent;
			Collection <Quote> allQuotesForThisMenu;
			if (rQuote != null
					&& rQuote.getPrice() != null
					&& (allQuotesForThisEvent = rQuote.getMenu().getQuotes())
							.size() > 1
					&& (allQuotesForThisMenu = filterByCuisine(
							allQuotesForThisEvent, restaurant.getCuisineType()))
							.size() > 1) {
				//Since the quotes are ORDERED by price in ASC order,
				//the first element should be the best quote.
				Iterator <Quote> iteratorForBestQuote = allQuotesForThisMenu
						.iterator();
				while (iteratorForBestQuote.hasNext()) {
					Quote bestQuote = iteratorForBestQuote.next();
					if (bestQuote == null || bestQuote.getPrice() == null) {
						continue;
					}
					if (rQuote.getId() != bestQuote.getId()) {
						//If the current restaurant's quote is not the best quote, find the %
						Double percent = rQuote.getPrice()
								/ bestQuote.getPrice();
						bargain.put(rQuote.getId(), percent);
					}
					break;
				}
			}
		}
		return bargain;
	}

	/**
	 * Filter by cuisine.
	 *
	 * @param allQuotesForThisMenu the all quotes for this menu
	 * @param cuisineType the cuisine type
	 * @return the collection
	 */
	private Collection <Quote> filterByCuisine(
			Collection <Quote> allQuotesForThisMenu, final String cuisineType) {
		return Collections2.filter(allQuotesForThisMenu,
				new Predicate <Quote>() {
					@Override
					public boolean apply(@Nullable Quote input) {
						return input != null
								&& input.getRestaurant() != null
								&& StringUtils.equalsIgnoreCase(cuisineType,
										input.getRestaurant().getCuisineType());
					}
				});
	}

	/**
	 * Submit price.
	 *
	 * @param httpSession the http session
	 * @param modelMap the model map
	 * @param request the request
	 * @param redirectAttributes the redirect attributes
	 * @return the string
	 */
	@RequestMapping(value = { "submitprice" }, method = RequestMethod.POST)
	public String submitPrice(HttpSession httpSession, ModelMap modelMap,
			HttpServletRequest request, RedirectAttributes redirectAttributes) {
		User user = (User) httpSession.getAttribute("user");
		if (user != null) {
			String price = request.getParameter("price");
			String deliver = request.getParameter("deliver");
			String notes = request.getParameter("notes");
			String quoteIdString = request.getParameter("quoteId");
			Quote quote = restaurantService.findQuoteWithId(Helper
					.stringToInteger(quoteIdString));
			Double existingPrice = quote.getPrice();
			if (quote != null) {
				Double newPrice = Double.parseDouble(price);
				quote.setCanDeliver(StringUtils
						.equalsIgnoreCase("yes", deliver) ? true : false);
				quote.setPrice(newPrice);
				if (existingPrice == null || existingPrice == 0) {
					quote.setStatus(QuoteStatus.RESTAURANT_SUBMITTED_PRICE
							.toString());
				}
				else if (!newPrice.equals(existingPrice)) {
					quote.setStatus(QuoteStatus.RESTAURANT_UPDATED_PRICE
							.toString());
				}
				quote.setNotes(notes);
				restaurantService.saveOrUpdateQuote(quote);
				customerService.sendNotification(quote, null);
				List <String> successMessages = Lists.newArrayList();
				successMessages
						.add("Your quote is successfully submitted for event: "
								+ quote.getMenu().getEvent().getName());
				redirectAttributes.addFlashAttribute("successMessages",
						successMessages);
			}
		}
		return "redirect:/dashboard";
	}
}
