package com.cater.menu.pizza;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

@JsonSerialize(using = PizzaIngredientLevelSerializer.class)
@JsonDeserialize(using = PizzaIngredientLevelDeserializer.class)
public enum PizzaIngredientLevel {
	LEFT(1), RIGHT(2), ALL(3);
	int value;

	PizzaIngredientLevel(int value) {
		this.value = value;
	}

	public static PizzaIngredientLevel fromValue(int intValue) {
		for (PizzaIngredientLevel l : values()) {
			if (l != null && l.value == intValue) {
				return l;
			}
		}
		return null;
	}
}
