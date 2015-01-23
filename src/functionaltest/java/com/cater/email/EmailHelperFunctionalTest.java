package com.cater.email;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * The Class EmailHelperFunctionalTest.
 * @author Hari 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:test-applicationContext-hibernate.xml" })
@Component
public class EmailHelperFunctionalTest {
	@Autowired
	private EmailHelper fixture;

	@Test
	public void test_1() {
		String confirmationToken = "6e59af905262ac8606d95bb1b14185d3";
		fixture.sendRegistrationConfirmationEmail("Hari", confirmationToken,
				"hari2139@gmail.com");
	}
}
