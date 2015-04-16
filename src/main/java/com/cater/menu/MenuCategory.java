package com.cater.menu;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonInclude(JsonInclude.Include.NON_EMPTY)
@JsonPropertyOrder({ "code", "name", "items" })
public class MenuCategory {
	@JsonProperty(value = "code")
	private String code;
	@JsonProperty(value = "name")
	private String name;
	@JsonProperty(value = "items")
	private List <MenuItem> items;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List <MenuItem> getItems() {
		return items;
	}

	public void setItems(List <MenuItem> items) {
		this.items = items;
	}
}
