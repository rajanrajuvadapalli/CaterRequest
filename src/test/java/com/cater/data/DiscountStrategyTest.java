package com.cater.data;

import static org.junit.Assert.assertEquals;

import java.io.IOException;
import java.io.StringWriter;
import java.math.BigDecimal;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class DiscountStrategyTest {
	private DiscountStrategy fixture;

	@Before
	public void setUp() throws Exception {
		fixture = new DiscountStrategy();
	}

	@After
	public void tearDown() throws Exception {
		fixture = null;
	}

	@Test
	public void testSerialize_1() throws JsonGenerationException,
			JsonMappingException, IOException {
		StringWriter sw = new StringWriter();
		new ObjectMapper().writeValue(sw, fixture);
		assertEquals("{\"strategy\":[]}", sw.toString());
	}

	@Test
	public void testSerialize_2() throws JsonGenerationException,
			JsonMappingException, IOException {
		DiscountElement element1 = null;
		fixture.addElement(element1);
		StringWriter sw = new StringWriter();
		new ObjectMapper().writeValue(sw, fixture);
		assertEquals("{\"strategy\":[null]}", sw.toString());
	}

	@Test
	public void testSerialize_3() throws JsonGenerationException,
			JsonMappingException, IOException {
		DiscountElement element1 = new DiscountElement(new BigDecimal(0),
				new BigDecimal(200), new BigDecimal(20.1));
		fixture.addElement(element1);
		DiscountElement element2 = new DiscountElement(new BigDecimal(201),
				new BigDecimal(500), new BigDecimal(15.23));
		fixture.addElement(element2);
		StringWriter sw = new StringWriter();
		new ObjectMapper().writeValue(sw, fixture);
		assertEquals(
				"{\"strategy\":[{\"lower\":0.00,\"upper\":200.00,\"pct\":20.10},{\"lower\":201.00,\"upper\":500.00,\"pct\":15.23}]}",
				sw.toString());
		assertEquals("20.10", fixture.getDiscountPercentFor(new BigDecimal(30))
				.toString());
		assertEquals("15.23", fixture
				.getDiscountPercentFor(new BigDecimal(300)).toString());
	}
}
