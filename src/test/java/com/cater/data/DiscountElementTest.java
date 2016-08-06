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

public class DiscountElementTest {
	private DiscountElement fixture;

	@Before
	public void setUp() throws Exception {
		fixture = new DiscountElement();
	}

	@After
	public void tearDown() throws Exception {
		fixture = null;
	}

	@Test
	public void testSerialize_1() throws JsonGenerationException,
			JsonMappingException, IOException {
		fixture.setLower(0);
		fixture.setUpper(200);
		fixture.setDiscountPercent(new BigDecimal(20.1));
		StringWriter sw = new StringWriter();
		new ObjectMapper().writeValue(sw, fixture);
		assertEquals("{\"lower\":0,\"upper\":200,\"pct\":20.10}", sw.toString());
	}

	@Test
	public void testSerialize_2() throws JsonGenerationException,
			JsonMappingException, IOException {
		fixture = null;
		StringWriter sw = new StringWriter();
		new ObjectMapper().writeValue(sw, fixture);
		assertEquals("null", sw.toString());
	}

	@Test
	public void testDeSerialize_1() throws JsonGenerationException,
			JsonMappingException, IOException {
		String json = "{\"lower\":10,\"upper\":300,\"pct\":15.25}";
		DiscountElement element = new ObjectMapper().readValue(json,
				DiscountElement.class);
		assertEquals(10, element.getLower());
		assertEquals(300, element.getUpper());
		assertEquals(new BigDecimal(15.25), element.getDiscountPercent());
	}
}
