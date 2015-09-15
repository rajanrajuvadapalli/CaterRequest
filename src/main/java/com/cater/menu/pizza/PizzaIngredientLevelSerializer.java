package com.cater.menu.pizza;

import java.io.IOException;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

public class PizzaIngredientLevelSerializer extends
		JsonSerializer <PizzaIngredientLevel> {
	@Override
	public void serialize(PizzaIngredientLevel level, JsonGenerator generator,
			SerializerProvider provider) throws IOException,
			JsonProcessingException {
		generator.writeNumber(level.value);
	}
}
