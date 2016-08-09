package com.cater.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Discount")
public class Discount extends TimestampEntity implements Serializable {
	private static final long serialVersionUID = -6364395943772045987L;
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER, optional = true)
	@JoinColumn(name = "restaurant_sk", nullable = false)
	private Restaurant restaurant;
	@Column(name = "lower")
	private Integer lower;
	@Column(name = "upper")
	private Integer upper;
	@Column(name = "pct")
	private Double percent;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Restaurant getRestaurant() {
		return restaurant;
	}

	public void setRestaurant(Restaurant restaurant) {
		this.restaurant = restaurant;
	}

	public Integer getLower() {
		return lower;
	}

	public void setLower(Integer lower) {
		this.lower = lower;
	}

	public Integer getUpper() {
		return upper;
	}

	public void setUpper(Integer upper) {
		this.upper = upper;
	}

	public Double getPercent() {
		return percent;
	}

	public void setPercent(Double percent) {
		this.percent = percent;
	}
}
