package com.cater.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.datetime.DateFormatter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cater.service.CustomerService;
import com.cater.service.RestaurantService;
import com.cater.ui.data.User;

/**
 * Description:.
 *
 * @since Jan 27, 2015
 * 
 */
@Controller
@RequestMapping(value = { "admin" })
public class AdminDashboardController {
	/** The customer service. */
	@Autowired
	private CustomerService customerService;
	/** The restaurant service. */
	@Autowired
	private RestaurantService restaurantService;
	private static final SimpleDateFormat SDF = new SimpleDateFormat(
			"yyyy/MM/dd HH:mm", Locale.US);

	/**
	 * Gets the dashboard.
	 *
	 * @param session the session
	 * @return the dashboard
	 */
	@RequestMapping(value = { "dashboard" })
	public String getDashboard(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "t_home";
		}
		user.setName("ADMIN");
		//refreshCounts(session);
		return "admin/t_dashboard";
	}

	/**
	 * List customers.
	 *
	 * @param modelMap the model map
	 * @param session the session
	 * @return the string
	 * @throws ParseException 
	 */
	@RequestMapping(value = { "customerSearch" }, method = RequestMethod.GET)
	public String listCustomers(ModelMap modelMap, HttpServletRequest request, HttpSession session) throws ParseException {
		String customerName = StringUtils.defaultString(request

				.getParameter("id"));
	    if(!customerName.isEmpty()){
		
			modelMap.put("customers", customerService.searchCustomerByName(customerName));
		}
		else{
			//String to = StringUtils.defaultString(request.getParameter("toDate"));
			Date toDate = SDF.parse(StringUtils.defaultString(request.getParameter("toDate")));
			//String from = StringUtils.defaultString(request.getParameter("fromDate"));
			Date fromDate = SDF.parse(StringUtils.defaultString(request.getParameter("fromDate")));
			System.out.println(" to date:"+toDate+" from date "+fromDate );
			modelMap.put("customers", customerService.searchCustomerByDateRange(fromDate, toDate));
			
		}
		return "admin/t_listCustomers";
	}
	
	
	@RequestMapping(value = { "restaurantSearch" }, method = RequestMethod.GET)
	public String listRestaurants(ModelMap modelMap, HttpServletRequest request, HttpSession session) throws ParseException {
		String restaurantName = StringUtils.defaultString(request
				.getParameter("id"));
		if(!restaurantName.isEmpty()){
			
			modelMap.put("restaurants", restaurantService.searchForRestaurantsByName(restaurantName));
		}
		else{
			Date toDate = SDF.parse(StringUtils.defaultString(request.getParameter("toDate")));
			Date fromDate = SDF.parse(StringUtils.defaultString(request.getParameter("fromDate")));
			modelMap.put("restaurants", restaurantService.searchForRestaurantsByDateRange(fromDate,toDate));
			System.out.println(" to date:"+toDate+" from date "+fromDate );
		}
		
		refreshCounts(session);
		
		return "admin/t_listRestaurants";
	}
	/**
	 * List customers.
	 *
	 * @param modelMap the model map
	 * @param session the session
	 * @return the string
	 */
	@RequestMapping(value = { "listCustomers/{customerId}" }, method = RequestMethod.POST)
	public String listCustomers(ModelMap modelMap, HttpSession session,
			@PathVariable(value = "customerId") Integer customerId) {
	//	modelMap.put("customers", customerService.searchCustomerById(customerId));
		refreshCounts(session);
		
		return "admin/t_listCustomers";
	}

	/**
	 * List events.
	 *
	 * @param modelMap the model map
	 * @param session the session
	 * @return the string
	 */
	@RequestMapping(value = { "listEvents" }, method = RequestMethod.GET)
	public String listEvents(ModelMap modelMap, HttpSession session) {
		modelMap.put("events", customerService.fetchAllEvents());
		refreshCounts(session);
		return "admin/t_listEvents";
	}

	/**
	 * List restaurants.
	 *
	 * @param modelMap the model map
	 * @param session the session
	 * @return the string
	 */
	@RequestMapping(value = { "listRestaurants" }, method = RequestMethod.GET)
	public String listRestaurants(ModelMap modelMap, HttpSession session) {
		modelMap.put("restaurants", restaurantService.fetchAllRestaurants());
		refreshCounts(session);
		return "admin/t_listRestaurants";
	}

	/**
	 * Refresh counts.
	 *
	 * @param session the session
	 */
	public void refreshCounts(HttpSession session) {
		session.setAttribute("nCustomers",
				customerService.getNumberOfCustomers());
		session.setAttribute("nRestaurants",
				restaurantService.getNumberOfRestaurants());
		session.setAttribute("nEvents", customerService.getNumberOfEvents());
	}
}
