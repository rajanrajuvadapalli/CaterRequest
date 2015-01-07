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
@Table(name = "Quote")
public class Quote extends AbstractTimestampEntity implements Serializable {
	private static final long serialVersionUID = -4202547189354658190L;
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@OneToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER, optional = true)
	@JoinColumn(name = "menu_sk", nullable = false)
	private Menu menu;
	@OneToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER, optional = true)
	@JoinColumn(name = "restaurant_sk", nullable = false)
	private Restaurant restaurant;
	@Column(name = "price")
	private Double price;
	@Column(name = "status", length = 20, nullable = true)
	private String status;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public Restaurant getRestaurant() {
		return restaurant;
	}

	public void setRestaurant(Restaurant restaurant) {
		this.restaurant = restaurant;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	/* (non-Javadoc)
	 * @see com.cater.model.AbstractTimestampEntity#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + id;
		result = prime * result + ((menu == null) ? 0 : menu.hashCode());
		result = prime * result + ((price == null) ? 0 : price.hashCode());
		result = prime * result
				+ ((restaurant == null) ? 0 : restaurant.hashCode());
		result = prime * result + ((status == null) ? 0 : status.hashCode());
		return result;
	}

	/* (non-Javadoc)
	 * @see com.cater.model.AbstractTimestampEntity#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj) return true;
		if (!super.equals(obj)) return false;
		if (getClass() != obj.getClass()) return false;
		Quote other = (Quote) obj;
		if (id != other.id) return false;
		if (menu == null) {
			if (other.menu != null) return false;
		}
		else if (!menu.equals(other.menu)) return false;
		if (price == null) {
			if (other.price != null) return false;
		}
		else if (!price.equals(other.price)) return false;
		if (restaurant == null) {
			if (other.restaurant != null) return false;
		}
		else if (!restaurant.equals(other.restaurant)) return false;
		if (status == null) {
			if (other.status != null) return false;
		}
		else if (!status.equals(other.status)) return false;
		return true;
	}
}
