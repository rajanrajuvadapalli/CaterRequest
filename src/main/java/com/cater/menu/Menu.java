package com.cater.menu;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;

@JsonInclude(JsonInclude.Include.NON_EMPTY)
@JsonPropertyOrder({ "cuisine", "categories" })
public class Menu {
	@JsonProperty(value = "cuisine")
	private String cuisine;
	@JsonProperty(value = "categories")
	private List <MenuCategory> categories;
	@JsonProperty(value = "comments")
	private String comments;

	public String getCuisine() {
		return cuisine;
	}

	public void setCuisine(String cuisine) {
		this.cuisine = cuisine;
	}

	public List <MenuCategory> getCategories() {
		return categories;
	}

	public void setCategories(List <MenuCategory> categories) {
		this.categories = categories;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}
}
