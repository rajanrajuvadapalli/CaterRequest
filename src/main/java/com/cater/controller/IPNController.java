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

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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

/**
 * The Class IPNController.
 */
@Controller
@RequestMapping(value = { "payment" })
public class IPNController {
	/** The Constant CONTENT_TYPE. */
	private final static String CONTENT_TYPE = "Content-Type";
	/** The Constant MIME_APP_URLENC. */
	private final static String MIME_APP_URLENC = "application/x-www-form-urlencoded";
	/** The Constant PARAM_VAL_CMD. */
	private final static String PARAM_VAL_CMD = "cmd=_notify-synch";
	/** The Constant TOKEN_CMD. */
	private final static String TOKEN_CMD = "&at=zWoidcCSL1Fv_It6TNJmsQGN62SRhIsqB5QtFKT9Hmn2tnKJsUKqT4nulXG";
	/** The restaurant service. */
	@Autowired
	private RestaurantService restaurantService;
	/** The customer service. */
	@Autowired
	private CustomerService customerService;
	/** The paypal payment url. */
	@Value("${paypal.payment.url}")
	private String paypalPaymentUrl;

	/**
	 * Ipn listener.
	 * 
	 * @param request
	 *            the request
	 * @param session
	 *            the session
	 * @param redirectAttributes
	 *            the redirect attributes
	 * @return the string
	 */
	@RequestMapping(value = { "notify" }, method = RequestMethod.POST)
	public String IpnListener(HttpServletRequest request, HttpSession session,
			RedirectAttributes redirectAttributes) {
		try {
			// 2. Prepare 'notify-validate' command with exactly the same
			// parameters
			Enumeration<String> en = request.getParameterNames();
			StringBuilder cmd = new StringBuilder(PARAM_VAL_CMD);
			String token = TOKEN_CMD;
			String txValue = "";
			String paramName;
			while (en.hasMoreElements()) {
				paramName = en.nextElement();
				if (paramName.equals("tx")) {
					txValue = request.getParameter(paramName);
				}
			}
			// 3. Post above command to Paypal IPN URL {@link IpnConfig#ipnUrl}
			StringBuilder url = new StringBuilder().append(paypalPaymentUrl)
					.append("?").append(cmd).append("&tx=").append(txValue)
					.append(token);
			URL u = new URL(url.toString());
			System.out.println("payapal URL"+ u.toString());
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
			String response = in.readLine();
			// print response
			System.out.println("response: "+response);
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
			
			System.out.println("payment stauts-"+status);
			Integer quoteId = Integer.parseInt(request
					.getParameter("item_number"));
			List<String> errors = Lists.newArrayList();
			redirectAttributes.addFlashAttribute("errors", errors);
			List<String> successMessages = Lists.newArrayList();
			redirectAttributes.addFlashAttribute("successMessages",
					successMessages);
			// 6. Validate captured Paypal IPN Information
			if (StringUtils.equalsIgnoreCase("SUCCESS", response)
					|| StringUtils.equalsIgnoreCase("VERIFIED", response)) {
				System.out.println("RESPONSE SUCCESS");
				Quote quote = restaurantService.findQuoteWithId(quoteId);
				if (StringUtils.equalsIgnoreCase("COMPLETE", status)
						|| StringUtils.equalsIgnoreCase("PENDING", status)) {
					System.out.println("PAYMENT DONE!");
					quote.setStatus(QuoteStatus.PAID.toString());
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
							.add("Congratulations, your order has been placed!");
				} else {
					errors.add("Cannot confirm order with no quotes.");
					status.trim();
				}
			} else {
				errors.add("Inavlid response {" + response
						+ "} expecting {VERIFIED}");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/customer/dashboard";
	}

	/**
	 * Adds the to map.
	 * 
	 * @param token
	 *            the token
	 */
	private void addToMap(String token) {
		String[] tokens = token.split("=");
		if (tokens.length == 2) {
			if (!map.containsKey(tokens[0])) {
				map.put(tokens[0], tokens[1]);
			}
		}
	}

	/** The map. */
	private static HashMap<String, String> map = new HashMap<String, String>();
}