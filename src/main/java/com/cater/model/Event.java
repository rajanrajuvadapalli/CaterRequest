package com.cater.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * The Class Event.
 */
@Entity
@Table(name = "Event")
public class Event extends AbstractTimestampEntity implements Serializable {
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 8977768799207482935L;
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "name", length = 250, nullable = false)
	private String name;
	@ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER, optional = false)
	@JoinColumn(name = "customer_sk", nullable = false)
	private Customer customer;
	@OneToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER, optional = false)
	@JoinColumn(name = "location_sk", nullable = false)
	private Address location;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "date_time", nullable = false)
	private Date date_time;
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "event_sk")
	public List<Quote> quotes;

	public int getId() {
		return id;
	}

	public void setId(int id) {
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

	public List<Quote> getQuotes() {
		return quotes;
	}

	public void setQuotes(List<Quote> quotes) {
		this.quotes = quotes;
	}

	/* (non-Javadoc)
	 * @see com.cater.model.AbstractTimestampEntity#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result
				+ ((customer == null) ? 0 : customer.hashCode());
		result = prime * result
				+ ((date_time == null) ? 0 : date_time.hashCode());
		result = prime * result + id;
		result = prime * result
				+ ((location == null) ? 0 : location.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
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
		Event other = (Event) obj;
		if (customer == null) {
			if (other.customer != null) return false;
		}
		else if (!customer.equals(other.customer)) return false;
		if (date_time == null) {
			if (other.date_time != null) return false;
		}
		else if (!date_time.equals(other.date_time)) return false;
		if (id != other.id) return false;
		if (location == null) {
			if (other.location != null) return false;
		}
		else if (!location.equals(other.location)) return false;
		if (name == null) {
			if (other.name != null) return false;
		}
		else if (!name.equals(other.name)) return false;
		return true;
	}
}
