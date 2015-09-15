package com.cater.menu.pizza;

import java.util.Map;

import com.cater.menu.MenuItem;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import com.fasterxml.jackson.annotation.JsonTypeInfo;

@JsonInclude(JsonInclude.Include.NON_EMPTY)
@JsonPropertyOrder({ "code", "name", "description", "isSelected", "size",
		"set", "ing" })
@JsonTypeInfo(use = JsonTypeInfo.Id.NAME, include = JsonTypeInfo.As.PROPERTY, property = "objectType")
public class PizzaMenuItem extends MenuItem {
	@JsonProperty(value = "size")
	private String size;
	@JsonProperty(value = "set")
	private StuffedEdgeType stuffedEdge;
	@JsonProperty(value = "ing")
	private Map <PizzaIngredient, PizzaIngredientLevel> ingredients;

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public StuffedEdgeType getStuffedEdge() {
		return stuffedEdge;
	}

	public void setStuffedEdge(StuffedEdgeType stuffedEdge) {
		this.stuffedEdge = stuffedEdge;
	}

	public Map <PizzaIngredient, PizzaIngredientLevel> getIngredients() {
		return ingredients;
	}

	public void setIngredients(
			Map <PizzaIngredient, PizzaIngredientLevel> ingredients) {
		this.ingredients = ingredients;
	}
}
