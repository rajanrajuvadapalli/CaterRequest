package com.cater.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cater.constants.QuoteStatus;
import com.cater.model.Quote;
import com.cater.model.Restaurant;
import com.cater.service.RestaurantService;
import com.cater.ui.data.User;

@Controller
@RequestMapping(value = { "restaurant" })
public class RestaurantDashboardController {
	/*private static final Logger logger = Logger
			.getLogger(RestaurantDashboardController.class);*/
	@Autowired
	private RestaurantService restaurantService;

	/**
	 * List quotes.
	 *
	 * @param httpSession the http session
	 * @param modelMap the model map
	 * @return the string
	 */
	@RequestMapping(value = { "listQuotes" }, method = RequestMethod.GET)
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
	}

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
			HttpServletRequest request) {
		User user = (User) httpSession.getAttribute("user");
		if (user != null) {
			String price = request.getParameter("price");
			Integer menuId = (Integer) httpSession.getAttribute("menuId");
			Restaurant restaurant = restaurantService
					.findRestaurantWithLoginId(user.getLoginID());
			Quote q = restaurantService.findQuoteWithRestaurantIdAndMenuId(
					restaurant.getId(), menuId);
			if (q != null) {
				q.setPrice(Double.parseDouble(price));
				q.setStatus(QuoteStatus.RESTAURANT_UPDATED_PRICE.toString());
				restaurantService.saveOrUpdateQuote(q);
			}
		}
		return "redirect:/home";
	}

	/**
	 * List docs.
	 *
	 * @param httpSession the http session
	 * @param modelMap the model map
	 * @param request the request
	 * @return the string
	 */
	@RequestMapping(value = { "listDocs" }, method = RequestMethod.GET)
	public String listDocs(HttpSession httpSession, ModelMap modelMap,
			HttpServletRequest request) {
		User user = (User) httpSession.getAttribute("user");
		if (user == null) {
			return "redirect:/home";
		}
		//Sweep the directory for this restaurant
		return "notiles/_docsListRestaurant";
	}
}
