package com.cater.menu.pizza;

import java.io.IOException;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;

public class StuffedEdgeTypeDeserializer extends
		JsonDeserializer <StuffedEdgeType> {
	@Override
	public StuffedEdgeType deserialize(JsonParser jp,
			DeserializationContext ctxt) throws IOException,
			JsonProcessingException {
		return StuffedEdgeType.fromValue(jp.getIntValue());
	}
}
