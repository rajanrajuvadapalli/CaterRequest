package com.cater.email;

import java.io.IOException;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.amazonaws.regions.Region;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.simpleemail.AmazonSimpleEmailServiceClient;
import com.amazonaws.services.simpleemail.model.Body;
import com.amazonaws.services.simpleemail.model.Content;
import com.amazonaws.services.simpleemail.model.Destination;
import com.amazonaws.services.simpleemail.model.Message;
import com.amazonaws.services.simpleemail.model.SendEmailRequest;

/**
 * The Class AmazonSES.
 * @since 01/22/2015
 *  
 */
@Component
public class AmazonSES {
	private static final Logger logger = Logger.getLogger(AmazonSES.class);
	@Value("${admin.email}")
	private String ADMIN_EMAIL;
	@Value("${info.email}")
	private String INFO_EMAIL_ADDRESS;
	private final AmazonSimpleEmailServiceClient client;

	/**
	 * Instantiates a new amazon ses.
	 */
	public AmazonSES() {
		/*AWSCredentials credentials;
		try {
			
			 * The ProfileCredentialsProvider will return your [default]
			 * credential profile by reading from the credentials file located at
			 * (~/.aws/credentials).
			 *
			 * TransferManager manages a pool of threads, so we create a
			 * single instance and share it throughout our application.
			 
			credentials = new ProfileCredentialsProvider().getCredentials();
		}
		catch (Exception e) {
			throw new AmazonClientException(
					"Cannot load the credentials from the credential profiles file. "
							+ "Please make sure that your credentials file is at the correct "
							+ "location (~/.aws/credentials), and is in valid format.",
					e);
		}
		// Instantiate an Amazon SES client, which will make the service call with the supplied AWS credentials.
		client = new AmazonSimpleEmailServiceClient(credentials);*/
		// Instantiate an Amazon SES client, which will make the service call. The service call requires your AWS credentials. 
		// Because we're not providing an argument when instantiating the client, the SDK will attempt to find your AWS credentials 
		// using the default credential provider chain. The first place the chain looks for the credentials is in environment variables 
		// AWS_ACCESS_KEY_ID and AWS_SECRET_KEY. 
		// For more information, see http://docs.aws.amazon.com/AWSSdkDocsJava/latest/DeveloperGuide/credentials.html
		client = new AmazonSimpleEmailServiceClient();
		// Choose the AWS region of the Amazon SES endpoint you want to connect to. Note that your production
		// access status, sending limits, and Amazon SES identity-related settings are specific to a given
		// AWS region, so be sure to select an AWS region in which you set up Amazon SES. Here, we are using
		// the US East (N. Virginia) region. Examples of other regions that Amazon SES supports are US_WEST_2
		// and EU_WEST_1. For a complete list, see http://docs.aws.amazon.com/ses/latest/DeveloperGuide/regions.html
		Region REGION = Region.getRegion(Regions.US_WEST_2);
		client.setRegion(REGION);
	}

	/*
	 * Before running the code:
	 *      Fill in AWS access credentials in ~/.aws/credentials
	 *      https://console.aws.amazon.com/iam/home?#security_credential
	 *
	 * WANRNING:
	 *      To avoid accidental leakage of your credentials, DO NOT keep
	 *      the credentials file in your source directory.
	 */
	public void sendEmail(String emailSubject, String emailBody, String... toAddresses) throws IOException {
		// Construct an object to contain the recipient address.
		Destination destination = new Destination().withToAddresses(toAddresses).withCcAddresses(INFO_EMAIL_ADDRESS);
		// Create the subject and body of the message.
		Content subject = new Content().withData(emailSubject);
		Content htmlBody = new Content().withData(emailBody);
		Body body = new Body().withHtml(htmlBody);
		// Create a message with the specified subject and body.
		Message message = new Message().withSubject(subject).withBody(body);
		// Assemble the email.
		SendEmailRequest request = new SendEmailRequest().withSource(ADMIN_EMAIL).withDestination(destination)
				.withMessage(message);
		try {
			logger.info("Attempting to send an email through Amazon SES by using the AWS SDK for Java. From: "
					+ request.getSource() + destination.toString());
			// Send the email.
			client.sendEmail(request);
			logger.info("Email sent!");
		}
		catch (Exception ex) {
			logger.info("The email was not sent.");
			logger.error("Error message: " + ex.getMessage());
			throw new IOException(ex);
		}
	}
}
