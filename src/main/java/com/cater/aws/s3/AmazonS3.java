package com.cater.aws.s3;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.amazonaws.AmazonClientException;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.SystemPropertiesCredentialsProvider;
import com.amazonaws.regions.Region;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.GetObjectRequest;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectInputStream;
import com.amazonaws.services.s3.transfer.TransferManager;
import com.amazonaws.services.s3.transfer.Upload;

@Component
public class AmazonS3 {
	private static final Logger logger = Logger.getLogger(AmazonS3.class);
	@Value("${aws.s3.bucket}")
	private String bucketName;
	@Value("${aws.s3.bucket.menu}")
	private String menuBucketName;

	private AmazonS3() {
		//Force use only spring injection.
	}

	/**
	 * Upload.
	 *
	 * @param file the file
	 * @throws AmazonServiceException the amazon service exception
	 * @throws AmazonClientException the amazon client exception
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws InterruptedException the interrupted exception
	 */
	public void upload(File file) throws AmazonServiceException,
			AmazonClientException, IOException, InterruptedException {
		String existingBucketName = bucketName;
		String keyName = file.getName();
		//Strip off the extension
		if (StringUtils.isNotBlank(keyName) && keyName.indexOf(".") > 0) {
			keyName = StringUtils.split(keyName, ".")[0];
		}
		TransferManager tm = new TransferManager(
				new SystemPropertiesCredentialsProvider());
		logger.debug(String.format(
				"Uploading the file to AmazonS3 [bucket: %s, file: %s]",
				existingBucketName, keyName));
		// TransferManager processes all transfers asynchronously, 
		// so this call will return immediately.
		Upload upload = tm.upload(existingBucketName, keyName, file);
		try {
			// Or you can block and wait for the upload to finish
			upload.waitForCompletion();
			logger.debug("Upload complete.");
			new AmazonS3Client().setObjectAcl(existingBucketName, keyName,
					CannedAccessControlList.PublicRead);
		}
		catch (AmazonClientException amazonClientException) {
			logger.error("Unable to upload file, upload was aborted.");
			amazonClientException.printStackTrace();
		}
	}

	/**
	 * Download json menu.
	 *
	 * @param fileName the file name
	 * @return the string buffer
	 */
	public StringBuffer downloadJsonMenu(String fileName) {
		AmazonS3Client s3Client = new AmazonS3Client(
				new SystemPropertiesCredentialsProvider());
		Region REGION = Region.getRegion(Regions.US_WEST_2);
		s3Client.setRegion(REGION);
		try {
			String keyName = "menu_json/" + fileName;
			logger.info(String.format(
					"Downloading a file from AmazonS3 [bucket: %s, file: %s]",
					menuBucketName, keyName));
			S3Object s3object = s3Client.getObject(new GetObjectRequest(
					menuBucketName, keyName));
			logger.debug("Download complete.");
			logger.info("Content-Type: "
					+ s3object.getObjectMetadata().getContentType());
			S3ObjectInputStream s3ObjectInputStream = s3object
					.getObjectContent();
			// Read one text line at a time.
			BufferedReader reader = new BufferedReader(new InputStreamReader(
					s3ObjectInputStream));
			StringBuffer jsonMenu = new StringBuffer();
			while (true) {
				String line = reader.readLine();
				if (line == null)
					break;
				jsonMenu.append(line);
			}
			return jsonMenu;
		}
		catch (AmazonServiceException ase) {
			logger.info("Caught an AmazonServiceException, which"
					+ " means your request made it "
					+ "to Amazon S3, but was rejected with an error response"
					+ " for some reason.");
			logger.info("Error Message:    " + ase.getMessage());
			logger.info("HTTP Status Code: " + ase.getStatusCode());
			logger.info("AWS Error Code:   " + ase.getErrorCode());
			logger.info("Error Type:       " + ase.getErrorType());
			logger.info("Request ID:       " + ase.getRequestId());
		}
		catch (AmazonClientException ace) {
			logger.error("Caught an AmazonClientException, which means"
					+ " the client encountered "
					+ "an internal error while trying to "
					+ "communicate with S3, "
					+ "such as not being able to access the network.");
			logger.error("Error Message: " + ace.getMessage());
		}
		catch (IOException e) {
			logger.error("Error Message: " + e.getMessage(), e);
		}
		return new StringBuffer("");
	}
}
