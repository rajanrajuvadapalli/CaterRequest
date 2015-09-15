package com.cater.menu.pizza;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

@JsonSerialize(using = StuffedEdgeTypeSerializer.class)
@JsonDeserialize(using = StuffedEdgeTypeDeserializer.class)
public enum StuffedEdgeType {
	BOARDERLESS_FILLED(1), COTTAGE_CHEESE(2), CHEDDAR(3), PEPPERONI(4), CHICKEN(
			5), MOZERELLA(6), PALMETTO(7);
	int value;

	StuffedEdgeType(int value) {
		this.value = value;
	}

	public static StuffedEdgeType fromValue(int intValue) {
		for (StuffedEdgeType t : values()) {
			if (t != null && t.value == intValue) {
				return t;
			}
		}
		return null;
	}
}
