package com.cater.menu.pizza;

import static org.junit.Assert.assertEquals;

import java.io.IOException;

import org.junit.Test;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

public class PizzaIngredientLevelTest {
	@Test
	public void testLevelSerialize() throws JsonProcessingException {
		SampleJson sampleJson = new SampleJson();
		sampleJson.setLevel(PizzaIngredientLevel.LEFT);
		String value = getObjectMapper().writeValueAsString(sampleJson);
		assertEquals("{\"l\":1}", value);
	}

	@Test
	public void testLevelDeSerialize() throws IOException {
		String aJson = "{\"l\":3}";
		SampleJson sampleJson = getObjectMapper().readValue(aJson,
				SampleJson.class);
		assertEquals(PizzaIngredientLevel.ALL, sampleJson.getLevel());
	}

	private ObjectMapper getObjectMapper() {
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.READ_ENUMS_USING_TO_STRING,
				true);
		mapper.configure(
				DeserializationFeature.READ_UNKNOWN_ENUM_VALUES_AS_NULL, true);
		return mapper;
	}

	static class SampleJson {
		@JsonProperty("l")
		private PizzaIngredientLevel level;

		public PizzaIngredientLevel getLevel() {
			return level;
		}

		public void setLevel(PizzaIngredientLevel level) {
			this.level = level;
		}
	}
}
