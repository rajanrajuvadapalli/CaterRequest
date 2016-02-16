package com.cater;

import java.util.Set;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;

import com.cater.model.Customer;
import com.cater.model.Event;
import com.cater.model.Login;
import com.cater.model.Restaurant;
import com.cater.service.CustomerService;
import com.cater.service.LoginService;
import com.cater.service.RestaurantService;
import com.cater.ui.data.User;

@Component
public class GuestHelper {
	private static final Logger logger = Logger.getLogger(GuestHelper.class);
	@Autowired
	private LoginService loginService;
	/** The customer service. */
	@Autowired
	private CustomerService customerService;
	@Autowired
	private RestaurantService restaurantService;

	/**
	 * Save data for guest.
	 *
	 * @param modelMap the model map
	 * @param httpSession the http session
	 * @param login the login
	 * @param user the user
	 * @return the customer
	 */
	public Customer saveDataForGuest(ModelMap modelMap,
			HttpSession httpSession, Login login, User user) {
		Customer c = customerService.findCustomerWithLoginId(login.getId());
		logger.debug("Creating event for " + c.getName());
		Event e = (Event) httpSession.getAttribute("event");
		e.setId(null);
		e.getLocation().setId(null);
		e.setCustomer(c);
		customerService.saveOrUpdateEvent(e);
		com.cater.model.Menu menuModel = (com.cater.model.Menu) httpSession
				.getAttribute("menu");
		menuModel.setEvent(e);
		menuModel.setId(null);
		Boolean fmf = (Boolean) httpSession.getAttribute("full_menu_flow");
		if (Boolean.TRUE.equals(fmf)) {
			menuModel.setFullMenu(true);
			//We do not want to automatically submit the quote.
			//We take the user to "summary" page.
			/*Quote quote = new Quote();
			quote.setStatus(QuoteStatus.CREATED.toString());
			quote.setMenu(menuModel);
			Integer rId = (Integer) httpSession
					.getAttribute("full_menu_flow_rid");
			quote.setRestaurant(restaurantService.findRestaurantWithId(rId));
			restaurantService.saveOrUpdateQuote(quote);
			httpSession.setAttribute("full_menu_flow_qid", quote.getId());
			restaurantService.sendNotification(quote, null);*/
		}
		customerService.saveOrUpdateMenu(menuModel);
		Integer menuId = menuModel.getId();
		httpSession.setAttribute("menuId", menuId);
		user.setGuest(false);
		//When guest user logs in, show the restaurant selection page directly.
		String cuisine = (String) httpSession.getAttribute("cuisineType");
		modelMap.put("cuisineType", cuisine);
		Set <Restaurant> restaurants = restaurantService
				.fetchRestaurantsOfType(cuisine);
		modelMap.put("restaurants", restaurants);
		modelMap.put("eventLocation", e.getLocation());
		return c;
	}
}
