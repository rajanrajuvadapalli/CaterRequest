package com.cater.controller;

import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cater.model.Customer;
import com.cater.model.Event;
import com.cater.ui.data.User;
import com.google.common.collect.Lists;

@Controller
@RequestMapping(value = { "customer" })
public class CustomerDashboardController {
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
			List<Event> events = Lists.newArrayList();
			Event e = new Event();
			e.setName("test");
			Customer customer = new Customer();
			customer.setName("Hari");
			e.setCustomer(customer);
			Calendar c = Calendar.getInstance(Locale.US);
			c.set(2015, 1, 1);
			e.setDate_time(c.getTime());
			events.add(e);
			modelMap.addAttribute("events", events);
		}
		return "notiles/_eventsList";
	}
}
