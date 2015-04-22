package com.cater;

import static org.junit.Assert.assertEquals;

import java.security.NoSuchAlgorithmException;

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

	@Test
	public void testGenerateMD5() throws NoSuchAlgorithmException {
		String inputString = "11111";
		String md5Expected = "b0baee9d279d34fa1dfd71aadb908c3f";
		String md5Actual = Helper.generateMD5(inputString);
		assertEquals(md5Expected, md5Actual);
	}

	@Test
	public void testFormatCurrency_1() {
		Double amount = null;
		String actual = Helper.formatCurrency(amount);
		assertEquals("", actual);
	}

	@Test
	public void testFormatCurrency_2() {
		Double amount = 12345.789;
		String actual = Helper.formatCurrency(amount);
		assertEquals("$12,345.79", actual);
	}
}
