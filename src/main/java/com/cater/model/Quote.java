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
	@Column(name = "data", length = 5000, nullable = true)
	private String data;
	@Column(name = "cuisine_type", length = 20, nullable = false)
	private String cuisineType;
	@OneToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER, optional = false)
	@JoinColumn(name = "event_sk", nullable = false)
	private Event event;
	@OneToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER, optional = true)
	@JoinColumn(name = "restaurant_sk", nullable = true)
	private Restaurant restaurant;
	@Column(name = "status", length = 20, nullable = true)
	private String status;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public Event getEvent() {
		return event;
	}

	public void setEvent(Event event) {
		this.event = event;
	}

	public Restaurant getRestaurant() {
		return restaurant;
	}

	public void setRestaurant(Restaurant restaurant) {
		this.restaurant = restaurant;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCuisineType() {
		return cuisineType;
	}

	public void setCuisineType(String cuisineType) {
		this.cuisineType = cuisineType;
	}

	/* (non-Javadoc)
	 * @see com.cater.model.AbstractTimestampEntity#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result
				+ ((cuisineType == null) ? 0 : cuisineType.hashCode());
		result = prime * result + ((data == null) ? 0 : data.hashCode());
		result = prime * result + ((event == null) ? 0 : event.hashCode());
		result = prime * result + id;
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
		if (cuisineType == null) {
			if (other.cuisineType != null) return false;
		}
		else if (!cuisineType.equals(other.cuisineType)) return false;
		if (data == null) {
			if (other.data != null) return false;
		}
		else if (!data.equals(other.data)) return false;
		if (event == null) {
			if (other.event != null) return false;
		}
		else if (!event.equals(other.event)) return false;
		if (id != other.id) return false;
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
