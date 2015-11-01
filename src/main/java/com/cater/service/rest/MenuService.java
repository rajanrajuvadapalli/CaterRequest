package com.cater.service.rest;

import java.io.File;
import java.io.IOException;
import java.util.Locale;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;

import com.cater.menu.Menu;
import com.cater.menu.MenuDeserializer;

@Path("/menu")
public class MenuService {
	private static final Logger logger = Logger.getLogger(MenuService.class);

	@GET
	@Path("{cuisine}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getMenuForCuisine(@PathParam("cuisine") String cuisine) {
		try {
			logger.debug(cuisine);
			File f = new File(MenuService.class.getResource(
					"/menus/" + StringUtils.lowerCase(cuisine, Locale.US)
							+ ".json").getFile());
			Menu menu = new MenuDeserializer().readJSON(f);
			return Response.ok().entity(menu).type(MediaType.APPLICATION_JSON)
					.build();
		}
		catch (IOException ex) {
			logger.error(ex);
			return Response.serverError().build();
		}
	}
}
