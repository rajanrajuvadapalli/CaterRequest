package com.cater.aws.s3;

import java.io.File;
import java.io.IOException;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.amazonaws.AmazonClientException;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.EnvironmentVariableCredentialsProvider;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.transfer.TransferManager;
import com.amazonaws.services.s3.transfer.Upload;

@Component
public class AmazonS3 {
	private static final Logger logger = Logger.getLogger(AmazonS3.class);
	@Value("${aws.s3.bucket}")
	private String bucketName;

	private AmazonS3() {
		//Force use only spring injection.
	}

	public void upload(File file) throws AmazonServiceException,
			AmazonClientException, IOException, InterruptedException {
		String existingBucketName = bucketName;
		String keyName = file.getName();
		//Strip off the extension
		if (StringUtils.isNotBlank(keyName) && keyName.indexOf(".") > 0) {
			keyName = StringUtils.split(keyName, ".")[0];
		}
		TransferManager tm = new TransferManager(
				new EnvironmentVariableCredentialsProvider());
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
}
