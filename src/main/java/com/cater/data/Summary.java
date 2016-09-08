package com.cater.data;

import java.math.BigDecimal;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Summary {
	@JsonProperty("subtotal")
	private BigDecimal subtotal;
	@JsonProperty("discPct")
	private BigDecimal discPct;
	@JsonProperty("disc")
	private BigDecimal disc;
	@JsonProperty("tax")
	private BigDecimal tax;
	@JsonProperty("total")
	private BigDecimal total;

	public BigDecimal getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(BigDecimal subtotal) {
		this.subtotal = subtotal;
	}

	public BigDecimal getDiscPct() {
		return discPct;
	}

	public void setDiscPct(BigDecimal discPct) {
		this.discPct = discPct;
	}

	public BigDecimal getDisc() {
		return disc;
	}

	public void setDisc(BigDecimal disc) {
		this.disc = disc;
	}

	public BigDecimal getTax() {
		return tax;
	}

	public void setTax(BigDecimal tax) {
		this.tax = tax;
	}

	public BigDecimal getTotal() {
		return total;
	}

	public void setTotal(BigDecimal total) {
		this.total = total;
	}
}
