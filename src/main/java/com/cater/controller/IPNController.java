package com.cater.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cater.constants.EventStatus;
import com.cater.constants.QuoteStatus;
import com.cater.model.Quote;
import com.cater.service.CustomerService;
import com.cater.service.RestaurantService;
import com.google.common.collect.Lists;

@Controller
@RequestMapping(value = { "payment" })
public class IPNController {

	private final static String CONTENT_TYPE = "Content-Type";
	private final static String MIME_APP_URLENC = "application/x-www-form-urlencoded";

	private final static String PAY_PAL_DEBUG = "https://www.sandbox.paypal.com/cgi-bin/webscr";
	private final static String PAY_PAL_PROD = "https://www.paypal.com/cgi-bin/webscr";

	private final static String PARAM_VAL_CMD = "cmd=_notify-synch";
	private final static String TOKEN_CMD = "&at=zWoidcCSL1Fv_It6TNJmsQGN62SRhIsqB5QtFKT9Hmn2tnKJsUKqT4nulXG";

	@Autowired
	private RestaurantService restaurantService;

	@Autowired
	private CustomerService customerService;

	@RequestMapping(value = { "notify" }, method = RequestMethod.GET)
	public String IpnListener(HttpServletRequest request, HttpSession session,
			RedirectAttributes redirectAttributes) {

		try {

			// 2. Prepare 'notify-validate' command with exactly the same
			// parameters
			Enumeration en = request.getParameterNames();
			StringBuilder cmd = new StringBuilder(PARAM_VAL_CMD);
			String token = TOKEN_CMD;
			String txValue = "";
			String paramName;
			while (en.hasMoreElements()) {
				paramName = (String) en.nextElement();
				if (paramName.equals("tx")) {
					txValue = request.getParameter(paramName);
				}
			}

			// 3. Post above command to Paypal IPN URL {@link IpnConfig#ipnUrl}
			StringBuilder url = new StringBuilder();
			url.append(PAY_PAL_PROD).append("?").append(cmd).append("&tx=")
					.append(txValue).append(token);

			URL u = new URL(url.toString());

			HttpsURLConnection uc = (HttpsURLConnection) u.openConnection();
			uc.setDoOutput(true);
			uc.setRequestProperty(CONTENT_TYPE, MIME_APP_URLENC);
			uc.setRequestProperty("Host", "www.paypal.com");
			PrintWriter pw = new PrintWriter(uc.getOutputStream());
			pw.println(cmd.toString());
			pw.close();

			// 4. Read response from Paypal

			BufferedReader in = new BufferedReader(new InputStreamReader(
					uc.getInputStream()));
			String res = in.readLine();
			StringBuilder target = new StringBuilder();
			String line;
			while ((line = in.readLine()) != null) {
				target.append(line).append("&");

			}
			String[] tokens = target.toString().split("&");
			for (int i = 0; i < tokens.length; i++) {
				addToMap(tokens[i]);
			}

			in.close();

			String status = map.get("payment_status");
			Integer quoteId = Integer.parseInt(request.getParameter("item_number"));
			List<String> errors = Lists.newArrayList();
			redirectAttributes.addFlashAttribute("errors", errors);
			List<String> successMessages = Lists.newArrayList();
			redirectAttributes.addFlashAttribute("successMessages",
					successMessages);

			// 6. Validate captured Paypal IPN Information
			if (res.equals("SUCCESS")) 
			{
				Quote quote = restaurantService.findQuoteWithId(quoteId);
			
		    	if (status.toUpperCase().equals("COMPLETE") || status.toUpperCase().equals("PENDING")) 
		    	{
					quote.setStatus(QuoteStatus.APPROVED.toString());
					// Reject all other quotes
					for (Quote q : quote.getMenu().getQuotes()) {
						if (!q.getId().equals(quote.getId())) {
							q.setStatus(QuoteStatus.DENIED.toString());
						}
					}
					quote.getMenu().getEvent()
							.setStatus(EventStatus.CONFIRMED.toString());
					restaurantService.sendNotification(quote, null);
					customerService.sendNotification(quote);
					successMessages
							.add("Congratulations, your Order has been placed!");
				}

				else {

					errors.add("Cannot confirm order with no quotes.");
					status.trim();
				}

			}
			else {
				errors.add("Inavlid response {" + res + "} expecting {SUCCESS}");

			}
		}
		catch (Exception e) {
				
			e.printStackTrace();
		}

		return "redirect:/customer/dashboard";
	}

	private void addToMap(String token) {
		String[] tokens = token.split("=");
		if (tokens.length == 2) {
			if (!map.containsKey(tokens[0])) {
				map.put(tokens[0], tokens[1]);
			}
		}

	}

	private static HashMap<String, String> map = new HashMap<String, String>();

}