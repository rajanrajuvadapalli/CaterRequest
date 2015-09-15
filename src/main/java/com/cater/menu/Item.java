package com.cater.menu;

import com.cater.menu.pizza.PizzaMenuItem;
import com.fasterxml.jackson.annotation.JsonSubTypes;
import com.fasterxml.jackson.annotation.JsonTypeInfo;

@JsonTypeInfo(use = JsonTypeInfo.Id.NAME, include = JsonTypeInfo.As.PROPERTY, property = "objectType")
@JsonSubTypes({ @JsonSubTypes.Type(value = MenuItem.class),
		@JsonSubTypes.Type(value = PizzaMenuItem.class) })
public abstract class Item {
}
