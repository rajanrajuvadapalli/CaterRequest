package com.cater.service.rest;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.apache.log4j.Logger;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import com.cater.aws.s3.AmazonS3;

@Path("/s3")
public class AmazonS3Service {
	private static final Logger logger = Logger
			.getLogger(AmazonS3Service.class);
	private AmazonS3 amazonS3;

	public AmazonS3Service() {
		WebApplicationContext webApplicationContext = ContextLoader
				.getCurrentWebApplicationContext();
		amazonS3 = webApplicationContext.getBean(AmazonS3.class);
	}

	@GET
	@Path("menu/{filename}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response getMenuFor(@PathParam("filename") String filename) {
		try {
			logger.debug("Retrieving " + filename + " from S3.");
			String jsonMenu = amazonS3.downloadJsonMenu(filename).toString();
			return Response.ok().entity(jsonMenu)
					.type(MediaType.APPLICATION_JSON).build();
		}
		catch (Exception ex) {
			logger.error(ex);
			return Response.serverError().build();
		}
	}
}
