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
import com.cater.model.RestaurantBranch;
import com.cater.service.CustomerService;
import com.cater.service.LoginService;
import com.cater.service.RestaurantService;
import com.cater.ui.data.User;

/**
 * The Class GuestHelper.
 */
@Component
public class GuestHelper {
	/** The Constant logger. */
	private static final Logger logger = Logger.getLogger(GuestHelper.class);
	/** The login service. */
	@Autowired
	private LoginService loginService;
	/** The customer service. */
	@Autowired
	private CustomerService customerService;
	/** The restaurant service. */
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
		menuModel.setId(null);
		customerService.saveOrUpdateMenu(menuModel);
		Integer menuId = menuModel.getId();
		httpSession.setAttribute("menuId", menuId);
		user.setGuest(false);
		//When guest user logs in, show the restaurant selection page directly.
		String cuisine = (String) httpSession.getAttribute("cuisineType");
		modelMap.put("cuisineType", cuisine);
		Set <RestaurantBranch> branches = restaurantService
				.fetchRestaurantBranchesOfType(cuisine);
		modelMap.put("branches", branches);
		modelMap.put("eventLocation", e.getLocation());
		return c;
	}
}
