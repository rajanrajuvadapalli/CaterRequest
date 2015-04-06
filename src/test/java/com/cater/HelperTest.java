package com.cater;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class HelperTest {
	@Test
	public void testMassage_1() {
		String phone = null;
		String massagedPhone = Helper.extractJust10digitNumber(phone);
		assertEquals("", massagedPhone);
	}

	@Test
	public void testMassage_2() {
		String phone = "123456789";
		String massagedPhone = Helper.extractJust10digitNumber(phone);
		assertEquals("123456789", massagedPhone);
	}

	@Test
	public void testMassage_3() {
		String phone = "(916) 215-1111";
		String massagedPhone = Helper.extractJust10digitNumber(phone);
		assertEquals("9162151111", massagedPhone);
	}
}
