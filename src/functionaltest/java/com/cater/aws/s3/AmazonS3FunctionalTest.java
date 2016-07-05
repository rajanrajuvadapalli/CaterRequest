package com.cater.aws.s3;

import static org.junit.Assert.assertNotNull;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:test-applicationContext-hibernate.xml" })
@Component
public class AmazonS3FunctionalTest {
	private static final Logger logger = Logger
			.getLogger(AmazonS3FunctionalTest.class);
	@Autowired
	private AmazonS3 fixture;

	/**
	 * Test download json menu.
	 */
	@Test
	public void testDownloadJsonMenu() {
		String fileName = "California_Kabob_Restaurant_95827.json";
		logger.info("Downloading menu for " + fileName);
		StringBuffer stringBuffer = fixture.downloadJsonMenu(fileName);
		assertNotNull(stringBuffer);
		logger.info("Json menu: " + stringBuffer.toString());
	}
}
