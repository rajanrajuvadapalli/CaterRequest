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
public class Quote extends TimestampEntity implements Serializable {
	private static final long serialVersionUID = -4202547189354658190L;
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER, optional = true)
	@JoinColumn(name = "menu_sk", nullable = false)
	private Menu menu;
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER, optional = true)
	@JoinColumn(name = "restaurant_branch_sk", nullable = false)
	private RestaurantBranch restaurantBranch;
	@Column(name = "price")
	private Double price;
	@Column(name = "deliver", nullable = false, unique = false, updatable = true)
	private boolean canDeliver;
	@Column(name = "status", length = 20, nullable = true)
	private String status;
	@Column(name = "notes", length = 1000, nullable = true)
	private String notes;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public RestaurantBranch getRestaurantBranch() {
		return restaurantBranch;
	}

	public void setRestaurantBranch(RestaurantBranch restaurantBranch) {
		this.restaurantBranch = restaurantBranch;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public boolean canDeliver() {
		return canDeliver;
	}

	public void setCanDeliver(boolean canDeliver) {
		this.canDeliver = canDeliver;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + (canDeliver ? 1231 : 1237);
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((menu == null) ? 0 : menu.hashCode());
		result = prime * result + ((notes == null) ? 0 : notes.hashCode());
		result = prime * result + ((price == null) ? 0 : price.hashCode());
		result = prime
				* result
				+ ((restaurantBranch == null) ? 0 : restaurantBranch.hashCode());
		result = prime * result + ((status == null) ? 0 : status.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (getClass() != obj.getClass())
			return false;
		Quote other = (Quote) obj;
		if (canDeliver != other.canDeliver)
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		}
		else if (!id.equals(other.id))
			return false;
		if (menu == null) {
			if (other.menu != null)
				return false;
		}
		else if (!menu.equals(other.menu))
			return false;
		if (notes == null) {
			if (other.notes != null)
				return false;
		}
		else if (!notes.equals(other.notes))
			return false;
		if (price == null) {
			if (other.price != null)
				return false;
		}
		else if (!price.equals(other.price))
			return false;
		if (restaurantBranch == null) {
			if (other.restaurantBranch != null)
				return false;
		}
		else if (!restaurantBranch.equals(other.restaurantBranch))
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		}
		else if (!status.equals(other.status))
			return false;
		return true;
	}
}
