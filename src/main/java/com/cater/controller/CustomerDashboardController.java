package com.cater.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cater.model.Address;
import com.cater.model.Customer;
import com.cater.model.Event;
import com.cater.service.CustomerService;
import com.cater.ui.data.User;

@Controller
@RequestMapping(value = { "customer" })
public class CustomerDashboardController {
	private static final Logger logger = Logger
			.getLogger(CustomerDashboardController.class);
	private static final SimpleDateFormat SDF = new SimpleDateFormat(
			"MM/dd/yyyy HH:mm");
	@Autowired
	private CustomerService customerService;

	/**
	 * List events.
	 *
	 * @param httpSession the http session
	 * @return the list
	 */
	@RequestMapping(value = { "listEvents" }, method = RequestMethod.GET)
	public String listEvents(HttpSession httpSession, ModelMap modelMap) {
		User user = (User) httpSession.getAttribute("user");
		if (user != null) {
			Customer c = customerService.findCustomerWithLoginId(user
					.getLoginID());
			modelMap.addAttribute("events", c.getEvents());
		}
		return "notiles/_eventsList";
	}

	/**
	 * Gets the creates the event form.
	 *
	 * @return the creates the event form
	 */
	@RequestMapping(value = { "createEvent" }, method = RequestMethod.GET)
	public String getCreateEventForm() {
		return "notiles/_createEvent";
	}

	/**
	 * Creates the event.
	 *
	 * @param httpSession the http session
	 * @param modelMap the model map
	 * @param request the request
	 * @return the string
	 */
	@RequestMapping(value = { "createEvent" }, method = RequestMethod.POST)
	public String createEvent(HttpSession httpSession, ModelMap modelMap,
			HttpServletRequest request) {
		User user = (User) httpSession.getAttribute("user");
		if (user != null) {
			Customer c = customerService.findCustomerWithLoginId(user
					.getLoginID());
			logger.debug("Creating event for " + c.getName());
			Event e = new Event();
			e.setName(StringUtils.defaultString(request.getParameter("name")));
			Address a = new Address();
			a.setStreet1(StringUtils.defaultString(request
					.getParameter("street1")));
			a.setStreet2(StringUtils.defaultString(request
					.getParameter("street2")));
			a.setCity(StringUtils.defaultString(request.getParameter("city")));
			a.setState(StringUtils.defaultString(request.getParameter("state")));
			a.setZip(StringUtils.defaultString(request.getParameter("zip")));
			e.setLocation(a);
			Date dateTime;
			try {
				dateTime = SDF.parse(StringUtils.defaultString(request
						.getParameter("datetimepicker")));
				e.setDate_time(dateTime);
			}
			catch (ParseException e1) {
				logger.error(e1);
			}
			e.setCustomer(c);
			customerService.saveEvent(e);
			modelMap.addAttribute("events", c.getEvents());
			return "t_dashboardCustomer";
		}
		return "t_home";
	}
}
