package com.cater.menu.pizza;

import java.io.IOException;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;

public class PizzaIngredientLevelDeserializer extends
		JsonDeserializer <PizzaIngredientLevel> {
	@Override
	public PizzaIngredientLevel deserialize(JsonParser jp,
			DeserializationContext ctxt) throws IOException,
			JsonProcessingException {
		return PizzaIngredientLevel.fromValue(jp.getIntValue());
	}
}
