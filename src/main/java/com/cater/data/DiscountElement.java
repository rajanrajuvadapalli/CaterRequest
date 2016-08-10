package com.cater.data;

import java.math.BigDecimal;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * The Class DiscountElement.
 */
public class DiscountElement {
	/** The lower. */
	@JsonProperty("lower")
	private BigDecimal lower;
	/** The upper. */
	@JsonProperty("upper")
	private BigDecimal upper;
	/** The discount percent. */
	@JsonProperty("pct")
	private BigDecimal discountPercent;

	/**
	 * Instantiates a new discount element.
	 */
	public DiscountElement() {
		//default constructor
	}

	/**
	 * Instantiates a new discount element.
	 *
	 * @param lower the lower
	 * @param upper the upper
	 * @param discountPercent the discount percent
	 */
	public DiscountElement(BigDecimal lower, BigDecimal upper,
			BigDecimal discountPercent) {
		this.lower = lower;
		this.upper = upper;
		this.discountPercent = discountPercent;
	}

	/**
	 * Gets the lower.
	 *
	 * @return the lower
	 */
	public BigDecimal getLower() {
		return lower.setScale(2, BigDecimal.ROUND_HALF_UP);
	}

	/**
	 * Sets the lower.
	 *
	 * @param lower the new lower
	 */
	public void setLower(BigDecimal lower) {
		this.lower = lower;
	}

	/**
	 * Gets the upper.
	 *
	 * @return the upper
	 */
	public BigDecimal getUpper() {
		return upper.setScale(2, BigDecimal.ROUND_HALF_UP);
	}

	/**
	 * Sets the upper.
	 *
	 * @param upper the new upper
	 */
	public void setUpper(BigDecimal upper) {
		this.upper = upper;
	}

	/**
	 * Gets the discount percent.
	 *
	 * @return the discount percent
	 */
	public BigDecimal getDiscountPercent() {
		return discountPercent.setScale(2, BigDecimal.ROUND_HALF_UP);
	}

	/**
	 * Sets the discount percent.
	 *
	 * @param discountPercent the new discount percent
	 */
	public void setDiscountPercent(BigDecimal discountPercent) {
		this.discountPercent = discountPercent;
	}
}
