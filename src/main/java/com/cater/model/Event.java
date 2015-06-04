package com.cater.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * The Class Event.
 */
@Entity
@Table(name = "Event")
public class Event extends TimestampEntity implements Serializable {
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 8977768799207482935L;
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(name = "name", length = 250, nullable = false)
	private String name;
	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER, optional = false)
	@JoinColumn(name = "customer_sk", nullable = false)
	private Customer customer;
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER, optional = false)
	@JoinColumn(name = "location_sk", nullable = false)
	private Address location;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "date_time", nullable = false)
	private Date date_time;
	@Column(name = "person_count", nullable = true)
	private Integer personCount;
	@Column(name = "pick_up", nullable = false, unique = false, updatable = true)
	private boolean pickUp;
	@Column(name = "budget_total", nullable = true)
	private Integer budgetTotal;
	@Column(name = "status", length = 30, nullable = true)
	private String status;

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Address getLocation() {
		return location;
	}

	public void setLocation(Address location) {
		this.location = location;
	}

	public Date getDate_time() {
		return date_time;
	}

	public void setDate_time(Date date_time) {
		this.date_time = date_time;
	}

	public Integer getPersonCount() {
		return personCount;
	}

	public void setPersonCount(Integer personCount) {
		this.personCount = personCount;
	}

	public boolean isPickUp() {
		return pickUp;
	}

	public void setPickUp(boolean pickUp) {
		this.pickUp = pickUp;
	}

	public Integer getBudgetTotal() {
		return budgetTotal;
	}

	public void setBudgetTotal(Integer budgetTotal) {
		this.budgetTotal = budgetTotal;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result
				+ ((budgetTotal == null) ? 0 : budgetTotal.hashCode());
		result = prime * result
				+ ((customer == null) ? 0 : customer.hashCode());
		result = prime * result
				+ ((date_time == null) ? 0 : date_time.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((location == null) ? 0 : location.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result
				+ ((personCount == null) ? 0 : personCount.hashCode());
		result = prime * result + (pickUp ? 1231 : 1237);
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
		Event other = (Event) obj;
		if (budgetTotal == null) {
			if (other.budgetTotal != null)
				return false;
		}
		else if (!budgetTotal.equals(other.budgetTotal))
			return false;
		if (customer == null) {
			if (other.customer != null)
				return false;
		}
		else if (!customer.equals(other.customer))
			return false;
		if (date_time == null) {
			if (other.date_time != null)
				return false;
		}
		else if (!date_time.equals(other.date_time))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		}
		else if (!id.equals(other.id))
			return false;
		if (location == null) {
			if (other.location != null)
				return false;
		}
		else if (!location.equals(other.location))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		}
		else if (!name.equals(other.name))
			return false;
		if (personCount == null) {
			if (other.personCount != null)
				return false;
		}
		else if (!personCount.equals(other.personCount))
			return false;
		if (pickUp != other.pickUp)
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		}
		else if (!status.equals(other.status))
			return false;
		return true;
	}
	public static final String STATUS_ACTIVE="ACTIVE";
	public static final String STATUS_CONFIRMED="CONFIRMED";
	public static final String STATUS_COMPLETE="COMPLETE";
	
}
