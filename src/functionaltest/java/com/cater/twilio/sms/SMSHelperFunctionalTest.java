package com.cater.twilio.sms;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cater.constants.Roles;
import com.cater.model.Login;

/**
 * Description: 
 * Created: Mar 27, 2015
 *  
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:test-applicationContext-hibernate.xml" })
@Component
public class SMSHelperFunctionalTest {
	@Autowired
	private SMSHelper fixture;

	@Test
	public void testSendRegistrationConfirmationSMS() {
		Login login = new Login();
		login.setRole(Roles.CUSTOMER.toString());
		login.setPassword("1234ABCDE567890");
		boolean isSmsOk = true;
		String phoneNumber = "9165204113";
		fixture.sendRegistrationConfirmationSMS(login, isSmsOk, phoneNumber);
	}
}
