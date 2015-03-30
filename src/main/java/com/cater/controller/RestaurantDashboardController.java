package com.cater.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.cater.service.CustomerService;
import com.cater.service.RestaurantService;
import com.cater.ui.data.User;
import com.google.common.collect.Lists;

@Controller
@RequestMapping(value = { "restaurant" })
public class RestaurantDashboardController {
	/*private static final Logger logger = Logger
			.getLogger(RestaurantDashboardController.class);*/
	@Autowired
	private RestaurantService restaurantService;
	@Autowired
	private CustomerService customerService;

	@RequestMapping(value = { "dashboard" })
	public String getDashboard(ModelMap modelMap, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "t_home";
		}
		Restaurant restaurant = restaurantService
				.findRestaurantWithLoginId(user.getLoginID());
		modelMap.put("restaurant", restaurant);
		((User) session.getAttribute("user")).setName(restaurant.getName());
		return "restaurant/t_dashboard";
	}

	/**
	 * List quotes.
	 *
	 * @param httpSession the http session
	 * @param modelMap the model map
	 * @return the string
	 */
	/*@RequestMapping(value = { "listQuotes" }, method = RequestMethod.GET)
	public String listQuotes(HttpSession httpSession, ModelMap modelMap) {
		User user = (User) httpSession.getAttribute("user");
		if (user != null) {
			Restaurant restaurant = restaurantService
					.findRestaurantWithLoginId(user.getLoginID());
			if (restaurant != null) {
				modelMap.addAttribute("quotes", restaurant.getQuotes());
			}
		}
		return "notiles/_quotesListRestaurant";
	}*/
	/**
	 * Submit price.
	 *
	 * @param httpSession the http session
	 * @param modelMap the model map
	 * @param request the request
	 * @return the string
	 */
	@RequestMapping(value = { "submitprice" }, method = RequestMethod.POST)
	public String submitPrice(HttpSession httpSession, ModelMap modelMap,
			HttpServletRequest request, RedirectAttributes redirectAttributes) {
		User user = (User) httpSession.getAttribute("user");
		if (user != null) {
			String price = request.getParameter("price");
			String quoteIdString = request.getParameter("quoteId");
			Quote quote = restaurantService.findQuoteWithId(Helper
					.stringToInteger(quoteIdString));
			Double existingPrice = quote.getPrice();
			if (quote != null) {
				Double newPrice = Double.parseDouble(price);
				quote.setPrice(newPrice);
				if (existingPrice == null || existingPrice == 0) {
					quote.setStatus(QuoteStatus.RESTAURANT_SUBMITTED_PRICE
							.toString());
				}
				else if (!newPrice.equals(existingPrice)) {
					quote.setStatus(QuoteStatus.RESTAURANT_UPDATED_PRICE
							.toString());
				}
				restaurantService.saveOrUpdateQuote(quote);
				customerService.sendNotification(quote);
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
	/**
	 * List docs.
	 *
	 * @param httpSession the http session
	 * @param modelMap the model map
	 * @param request the request
	 * @return the string
	 */
	/*@RequestMapping(value = { "listDocs" }, method = RequestMethod.GET)
	public String listDocs(HttpSession httpSession, ModelMap modelMap,
			HttpServletRequest request) {
		User user = (User) httpSession.getAttribute("user");
		if (user == null) {
			return "redirect:/home";
		}
		//Sweep the directory for this restaurant
		return "notiles/_docsListRestaurant";
	}*/
}
