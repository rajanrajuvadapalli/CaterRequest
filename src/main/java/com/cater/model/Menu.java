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
@Table(name = "Menu")
public class Menu extends AbstractTimestampEntity implements Serializable {
	private static final long serialVersionUID = -3414170199430466757L;
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "data", length = 5000, nullable = true)
	private String data;
	@OneToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER, optional = false)
	@JoinColumn(name = "event_sk", nullable = false)
	private Event event;
	@Column(name = "cuisine_type", length = 20, nullable = false)
	private String cuisineType;

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
		Menu other = (Menu) obj;
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
		return true;
	}
}
