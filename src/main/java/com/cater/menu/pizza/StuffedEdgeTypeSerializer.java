package com.cater.menu.pizza;

import java.io.IOException;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

public class StuffedEdgeTypeSerializer extends JsonSerializer <StuffedEdgeType> {
	@Override
	public void serialize(StuffedEdgeType edgeType, JsonGenerator generator,
			SerializerProvider provider) throws IOException,
			JsonProcessingException {
		generator.writeNumber(edgeType.value);
	}
}
