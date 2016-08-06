package com.cater.data;

import java.math.BigDecimal;
import java.util.List;

import com.beust.jcommander.internal.Lists;
import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * The Class DiscountStrategy.
 */
public class DiscountStrategy {
	/** The values. */
	@JsonProperty("strategy")
	private List <DiscountElement> values;

	/**
	 * Adds the element.
	 *
	 * @param discountElement the discount element
	 */
	public void addElement(DiscountElement discountElement) {
		getValues().add(discountElement);
	}

	/**
	 * Gets the discount percent for.
	 *
	 * @param value the value
	 * @return the discount percent for
	 */
	public BigDecimal getDiscountPercentFor(int value) {
		for (DiscountElement de : getValues()) {
			if (de != null && value >= de.getLower() && value <= de.getUpper()) {
				return de.getDiscountPercent();
			}
		}
		return new BigDecimal(0).setScale(2, BigDecimal.ROUND_HALF_UP);
	}

	/**
	 * Gets the values.
	 *
	 * @return the values
	 */
	public List <DiscountElement> getValues() {
		if (values == null) {
			values = Lists.newArrayList();
		}
		return values;
	}

	/**
	 * Sets the values.
	 *
	 * @param values the new values
	 */
	public void setValues(List <DiscountElement> values) {
		this.values = values;
	}
}
