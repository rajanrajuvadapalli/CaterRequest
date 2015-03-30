package com.cater.twilio.sms;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

/**
 * Description: 
 * Created: Mar 28, 2015
 * @author Hari 
 */
public class SMSHelperTest {
	private SMSHelper fixture = new SMSHelper();

	@Test
	public void testMassage_1() {
		String phone = null;
		String massagedPhone = fixture.massage(phone);
		assertEquals("", massagedPhone);
	}

	@Test
	public void testMassage_2() {
		String phone = "123456789";
		String massagedPhone = fixture.massage(phone);
		assertEquals("123456789", massagedPhone);
	}

	@Test
	public void testMassage_3() {
		String phone = "(916) 215-1111";
		String massagedPhone = fixture.massage(phone);
		assertEquals("9162151111", massagedPhone);
	}
}
