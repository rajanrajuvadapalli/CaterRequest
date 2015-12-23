package com.cater.controller;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Nullable;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cater.Helper;
import com.cater.constants.QuoteStatus;
import com.cater.model.Quote;
import com.cater.model.Restaurant;
import com.cater.model.RestaurantBranch;
import com.cater.service.CustomerService;
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
	/** The Constant logger. */
	private static final Logger logger = Logger
			.getLogger(RestaurantDashboardController.class);
	/** The restaurant service. */
	@Autowired
	private RestaurantService restaurantService;
	/** The customer service. */
	@Autowired
	private CustomerService customerService;
	/** The register service. */
	@Autowired
	private RegisterService registerService;

	/**
	 * Gets the dashboard.
	 *
	 * @param modelMap the model map
	 * @param request the request
	 * @param session the session
	 * @return the dashboard
	 */
	@RequestMapping(value = { "dashboard" })
	public String getDashboard(ModelMap modelMap, HttpServletRequest request,
			HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "t_home";
		}
		Restaurant restaurant = restaurantService
				.findRestaurantWithLoginId(user.getLoginID());
		modelMap.put("restaurant", restaurant);
		((User) session.getAttribute("user")).setName(restaurant.getName());
		/*Map <Integer, Double> bargainMap = getBargainPercentages(restaurant);
		modelMap.put("bargain", bargainMap);*/
		return "restaurant/t_dashboard";
	}

	/**
	 * Gets the bargain percentages.
	 *
	 * @param branch the branch
	 * @return the bargain percentages
	 */
	private Map <Integer, Double> getBargainPercentages(RestaurantBranch branch) {
		Map <Integer, Double> bargain = Maps.newHashMap();
		//For each quote, compare with other restaurant's quote and calculate %
		for (Quote rQuote : branch.getQuotes()) {
			Collection <Quote> allQuotesForThisEvent;
			Collection <Quote> allQuotesForThisMenu;
			if (rQuote != null
					&& rQuote.getPrice() != null
					&& (allQuotesForThisEvent = rQuote.getMenu().getQuotes())
							.size() > 1
					&& (allQuotesForThisMenu = filterByCuisine(
							allQuotesForThisEvent, branch.getRestaurant()
									.getCuisineType())).size() > 1) {
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
								&& input.getRestaurantBranch() != null
								&& input.getRestaurantBranch().getRestaurant() != null
								&& StringUtils.equalsIgnoreCase(cuisineType,
										input.getRestaurantBranch()
												.getRestaurant()
												.getCuisineType());
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
				customerService.sendNotification(quote);
				List <String> successMessages = Lists.newArrayList();
				successMessages
						.add("Your quote is successfully submitted for event: "
								+ quote.getMenu().getEvent().getName());
				redirectAttributes.addFlashAttribute("successMessages",
						successMessages);
				modelMap.put("successMessages", successMessages);
			}
		}
		return "redirect:/dashboard";
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
	public String addBranch(HttpSession httpSession, ModelMap modelMap,
			HttpServletRequest request, RedirectAttributes redirectAttributes) {
		User user = (User) httpSession.getAttribute("user");
		if (user == null) {
			return "t_home";
		}
		Restaurant restaurant = restaurantService
				.findRestaurantWithLoginId(user.getLoginID());
		RegistrationData data = new RegistrationData();
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
				.concat(" ")
				.concat(StringUtils.defaultString(request
						.getParameter("street_name")));
		data.setStreet1(street1);
		String apt_classifier = StringUtils.defaultString(request
				.getParameter("apt_classifier"));
		String street2 = StringUtils.defaultString(request
				.getParameter("street2"));
		if (StringUtils.isNotBlank(street2)) {
			data.setStreet2(apt_classifier + " " + street2);
		}
		data.setCity(StringUtils.defaultString(request.getParameter("city")));
		data.setState(StringUtils.defaultString(request.getParameter("state")));
		data.setZip(StringUtils.defaultString(request.getParameter("zip")));
		data.setSalesTax(Helper.stringToFloat(request.getParameter("sales")));
		logger.debug("Add branch form data: " + data.toString());
		registerService.saveNewRestaurantBranch(data, restaurant);
		List <String> successMessages = Lists.newArrayList();
		successMessages.add("Successfully added a branch.");
		redirectAttributes
				.addFlashAttribute("successMessages", successMessages);
		modelMap.addAttribute("successMessages", successMessages);
		return "redirect:/dashboard";
	}
}
