package com.cater.email;

public class Notification {
	private Double price;
	private Double salesTax;
	private Double totalAmount;
	private String paymentStatus;

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Double getSalesTax() {
		return salesTax;
	}

	public void setSalesTax(Double salesTax) {
		this.salesTax = salesTax;
	}

	public Double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(Double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

}
