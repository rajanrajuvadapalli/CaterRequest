package com.cater.menu;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Locale;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import com.cater.controller.MenuController;
import com.cater.model.Menu;
import com.google.common.collect.Lists;

/**
 * The Class MenuHelper.
 */
@Component
public class MenuHelper {
	/** The Constant logger. */
	private static final Logger logger = Logger.getLogger(MenuHelper.class);
	/** The Constant MENU_DELIMITER. */
	public static final String MENU_DELIMITER = "|";

	/**
	 * Gets the menu for email.
	 *
	 * @param menuModel the menu model
	 * @return the menu for email
	 */
	public StringBuilder getMenuForEmail(Menu menuModel) {
		StringBuilder menuSummary = new StringBuilder();
		try {
			String cuisine = menuModel.getCuisineType();
			List <String> previouslySelectedMenuItemCodes = Lists
					.newArrayList(StringUtils.split(menuModel.getData(),
							MENU_DELIMITER));
			if (StringUtils.equalsIgnoreCase("INDIAN_SOUTH", cuisine)
					|| StringUtils.equalsIgnoreCase("INDIAN_NORTH", cuisine)) {
				File f = new File(MenuController.class.getResource(
						"/menus/" + StringUtils.lowerCase(cuisine, Locale.US)
								+ ".json").getFile());
				com.cater.menu.Menu menuJson = new MenuDeserializer()
						.readJSON(f);
				List <String> itemNames = Lists.newArrayList();
				for (String previouslySelectedItemCode : previouslySelectedMenuItemCodes) {
					for (MenuCategory cat : menuJson.getCategories()) {
						for (MenuItem menuItem : cat.getItems()) {
							if (StringUtils.equals(previouslySelectedItemCode,
									menuItem.getCode())) {
								itemNames.add(menuItem.getName());
							}
						}
					}
				}
				if (CollectionUtils.isNotEmpty(itemNames)) {
					menuSummary.append(StringUtils.join(itemNames, ", "));
				}
			}
			else {
				for (String item : previouslySelectedMenuItemCodes) {
					if (StringUtils.isNotBlank(item)) {
						String description = StringUtils
								.replace(StringUtils.substringAfter(item, "+"),
										"+", " ");
						String name = StringUtils.substringBefore(item, "+");
						menuSummary.append("<b>" + name + ": </b>")
								.append(description).append("<br />");
					}
				}
			}
		}
		catch (IOException ex) {
			long ts = System.currentTimeMillis();
			menuSummary.append("<Error: " + ts + ">");
			logger.error("Failed to read menu: " + ts, ex);
		}
		logger.debug(menuSummary.toString());
		return menuSummary;
	}
}
