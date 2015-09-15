package com.cater.menu.pizza;

import static org.junit.Assert.assertEquals;

import java.io.IOException;

import org.junit.Test;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

public class StuffedEdgeTypeTest {
	@Test
	public void testStuffedEdgeTypeSerialize() throws JsonProcessingException {
		SampleJson sampleJson = new SampleJson();
		sampleJson.setType(StuffedEdgeType.CHEDDAR);
		String value = getObjectMapper().writeValueAsString(sampleJson);
		assertEquals("{\"type\":3}", value);
	}

	@Test
	public void testStuffedEdgeTypeDeSerialize() throws IOException {
		String aJson = "{\"type\":5}";
		SampleJson sampleJson = getObjectMapper().readValue(aJson,
				SampleJson.class);
		assertEquals(StuffedEdgeType.CHICKEN, sampleJson.getType());
	}

	@Test
	public void testDeserializer() {
		assertEquals(StuffedEdgeType.BOARDERLESS_FILLED,
				StuffedEdgeType.fromValue(1));
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
		@JsonProperty("type")
		private StuffedEdgeType type;

		public StuffedEdgeType getType() {
			return type;
		}

		public void setType(StuffedEdgeType type) {
			this.type = type;
		}
	}
}
