package com.cater.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cater.email.EmailHelper;
import com.google.common.collect.Lists;

/**
 * Description:.
 *
 * @since Jan 29, 2015
 * 
 */
@Controller
@RequestMapping(value = { "contactUs" })
public class ContactUsController {
	/** The Constant logger. */
	private static final Logger logger = Logger
			.getLogger(ContactUsController.class);
	/** The email helper. */
	@Autowired
	private EmailHelper emailHelper;
	/** The customer care contact number. */
	@Value("${customer.care.contact.number}")
	private String customerCareContactNumber;
	@Value("${info.email}")
	private String INFO_EMAIL;

	/**
	 * Contact us.
	 *
	 * @param request the request
	 * @param modelMap the model map
	 * @return the string
	 */
	@RequestMapping(value = { "" }, method = RequestMethod.GET)
	public String contactUs(HttpServletRequest request, ModelMap modelMap) {
		modelMap.addAttribute("infoEmail", INFO_EMAIL);
		return "t_contactUs";
	}

	/**
	 * Send email.
	 *
	 * @param request the request
	 * @param modelMap the model map
	 * @return the string
	 */
	@RequestMapping(value = { "" }, method = RequestMethod.POST)
	public String sendEmail(HttpServletRequest request, ModelMap modelMap) {
		String name = StringUtils.defaultString(request.getParameter("name"));
		String requesterEmail = StringUtils.defaultString(request
				.getParameter("email"));
		String subject = StringUtils.defaultString(request
				.getParameter("subject"));
		String message = StringUtils.defaultString(request
				.getParameter("message"));
		logger.debug("Received message: " + message);
		boolean sendEmailStatus = emailHelper.sendContactUsEmail(name,
				requesterEmail, subject, message);
		if (sendEmailStatus) {
			List<String> successMessages = Lists.newArrayList();
			successMessages.add("We received your message.");
			modelMap.addAttribute("successMessages", successMessages);
		}
		else {
			List<String> errors = Lists.newArrayList();
			errors.add("Ouch! Something went wrong. Please contact technical support at "
					+ customerCareContactNumber);
			modelMap.addAttribute("errors", errors);
		}
		modelMap.addAttribute("infoEmail", INFO_EMAIL);
		return "t_contactUs";
	}
}
