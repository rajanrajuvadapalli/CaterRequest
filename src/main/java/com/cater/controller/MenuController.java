package com.cater.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cater.constants.QuoteStatus;
import com.cater.menu.Menu;
import com.cater.menu.MenuCategory;
import com.cater.menu.MenuDeserializer;
import com.cater.menu.MenuItem;
import com.cater.menu.MenuSerializer;
import com.cater.model.Event;
import com.cater.model.Quote;
import com.cater.service.CustomerService;
import com.cater.ui.data.User;
import com.google.common.collect.Lists;

@Controller
@RequestMapping(value = { "menu" })
public class MenuController {
	private static final Logger logger = Logger.getLogger(MenuController.class);
	@Autowired
	private CustomerService customerService;
	@Autowired
	private MenuSerializer menuSerializer;
	@Autowired
	private MenuDeserializer menuDeserializer;

	/**
	 * Select menu form.
	 *
	 * @param httpSession the http session
	 * @param modelMap the model map
	 * @param request the request
	 * @param cuisines the cuisines
	 * @return the string
	 */
	@RequestMapping(value = { "selectMenu" }, method = RequestMethod.POST)
	public String selectMenuForm(HttpSession httpSession, ModelMap modelMap,
			HttpServletRequest request,
			@RequestParam(value = "cuisine", required = true) String cuisine) {
		User user = (User) httpSession.getAttribute("user");
		if (user == null) {
			return "t_home";
		}
		String eventId = request.getParameter("eventId");
		httpSession.setAttribute("eventId", eventId);
		//First check the DB if a menu is selected earlier for this cuisine
		Event e = customerService.fetchEventWithId(Integer.valueOf(eventId));
		List<Quote> availableQuotes = customerService.findQuotesWithEventId(e
				.getId());
		String customerCreatedMenuData = null;
		if (CollectionUtils.isNotEmpty(availableQuotes)) {
			//Get the quote for the cuisine and with status = CREATED. This is the one created/selected by customer.
			for (Quote q : availableQuotes) {
				if (StringUtils.equalsIgnoreCase(cuisine, q.getCuisineType())
						&& StringUtils.equalsIgnoreCase(
								QuoteStatus.CREATED.toString(), q.getStatus())) {
					httpSession.setAttribute("quoteId", q.getId());
					customerCreatedMenuData = q.getData();
					break;
				}
			}
		}
		if (customerCreatedMenuData == null) {
			//TODO: Dynamically pull the menu after we start supporting more cuisines.
			//Temporarily hard coded to "indian" menu.
			try {
				File f = new File(CustomerDashboardController.class
						.getResource("/menus/indian.json").getFile());
				Menu menu = new MenuDeserializer().readJSON(f);
				modelMap.put("menu", menu);
			}
			catch (IOException ex) {
				logger.error("Failed to read indian menu.", ex);
			}
		}
		else {
			logger.debug("Customer already created menu for event "
					+ e.getName() + " of type " + cuisine);
			try {
				String menuJson = new String(
						Base64.decodeBase64(customerCreatedMenuData));
				Menu menu = menuDeserializer.readJSON(menuJson);
				modelMap.put("menu", menu);
			}
			catch (IOException ex) {
				logger.error("Failed to read indian menu.", ex);
			}
		}
		return "menus/t__cateringMenu";
	}

	/**
	 * Request quote.
	 *
	 * @param httpSession the http session
	 * @param modelMap the model map
	 * @param request the request
	 * @param itemNames the item names
	 * @return the string
	 */
	@RequestMapping(value = { "requestQuote" }, method = RequestMethod.POST)
	public String requestQuote(
			HttpSession httpSession,
			ModelMap modelMap,
			HttpServletRequest request,
			@RequestParam(value = "itemName", required = true) String[] itemNames) {
		User user = (User) httpSession.getAttribute("user");
		if (user == null) {
			return "t_home";
		}
		String cuisineType = request.getParameter("cuisine");
		String eventId = (String) httpSession.getAttribute("eventId");
		//TODO: Dynamically pull the menu after we start supporting more cuisines.
		//Temporarily hard coded to "indian" menu.
		try {
			String menuJson = "/menus/indian.json";
			if (StringUtils.equalsIgnoreCase("indian", cuisineType)) {
				menuJson = "/menus/indian.json";
			}
			File f = new File(CustomerDashboardController.class.getResource(
					menuJson).getFile());
			Menu menu = new MenuDeserializer().readJSON(f);
			for (String selectedItem : itemNames) {
				logger.debug("Selected item: " + selectedItem);
				for (MenuCategory cat : menu.getCategories()) {
					for (MenuItem menuItem : cat.getItems()) {
						if (StringUtils
								.equals(selectedItem, menuItem.getName())) {
							menuItem.setSelected(true);
						}
					}
				}
			}
			Event e = customerService
					.fetchEventWithId(Integer.valueOf(eventId));
			//Create or update quote
			Quote q = new Quote();
			Integer quoteId = (Integer) httpSession.getAttribute("quoteId");
			if (quoteId != null) {
				q = customerService.findQuoteWithId(quoteId);
			}
			q.setEvent(e);
			String data = menuSerializer.serialize(menu);
			logger.debug("Json menu (" + data.length() + ") " + data);
			data = Base64.encodeBase64String(data.getBytes());
			logger.debug("Encoded Json menu (" + data.length() + ")" + data);
			q.setData(data);
			q.setCuisineType(cuisineType);
			q.setStatus(QuoteStatus.CREATED.toString());
			customerService.saveQuote(q);
			List<String> successMessages = Lists.newArrayList();
			successMessages
					.add("Your request for quotes is successfully submitted for '"
							+ e.getName() + "'.");
			modelMap.addAttribute("successMessages", successMessages);
			httpSession.removeAttribute("eventId");
		}
		catch (IOException e) {
			logger.error(
					"Exception occurred while reading menu and saving quote.",
					e);
			return "t_500";
		}
		return "t_dashboardCustomer";
	}
}
