package com.cater.model;

import java.io.Serializable;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.OrderBy;
import javax.persistence.Table;

@Entity
@Table(name = "Menu")
public class Menu extends TimestampEntity implements Serializable {
	private static final long serialVersionUID = -3414170199430466757L;
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(name = "data", length = 50000, nullable = true)
	private String data;
	@Column(name = "comments", length = 1000, nullable = true)
	private String comments;
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER, optional = false)
	@JoinColumn(name = "event_sk", nullable = true)
	private Event event;
	@Column(name = "cuisine_type", length = 20, nullable = true)
	private String cuisineType;
	@Column(name = "full_menu", nullable = false, unique = false, updatable = true)
	private boolean isFullMenu;
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "menu_sk")
	@OrderBy("price ASC")
	public List <Quote> quotes;
	@Column(name = "summary", length = 50, nullable = true)
	private String summary;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
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

	public boolean isFullMenu() {
		return isFullMenu;
	}

	public void setFullMenu(boolean isFullMenu) {
		this.isFullMenu = isFullMenu;
	}

	public List <Quote> getQuotes() {
		return quotes;
	}

	public void setQuotes(List <Quote> quotes) {
		this.quotes = quotes;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public Date getLupdPlus24() {
		Calendar calendar = Calendar.getInstance(Locale.US);
		calendar.setTime(getUpdated());
		calendar.add(Calendar.HOUR, 24);
		return calendar.getTime();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result
				+ ((comments == null) ? 0 : comments.hashCode());
		result = prime * result
				+ ((cuisineType == null) ? 0 : cuisineType.hashCode());
		result = prime * result + ((data == null) ? 0 : data.hashCode());
		result = prime * result + ((event == null) ? 0 : event.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + (isFullMenu ? 1231 : 1237);
		result = prime * result + ((quotes == null) ? 0 : quotes.hashCode());
		result = prime * result + ((summary == null) ? 0 : summary.hashCode());
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
		Menu other = (Menu) obj;
		if (comments == null) {
			if (other.comments != null)
				return false;
		}
		else if (!comments.equals(other.comments))
			return false;
		if (cuisineType == null) {
			if (other.cuisineType != null)
				return false;
		}
		else if (!cuisineType.equals(other.cuisineType))
			return false;
		if (data == null) {
			if (other.data != null)
				return false;
		}
		else if (!data.equals(other.data))
			return false;
		if (event == null) {
			if (other.event != null)
				return false;
		}
		else if (!event.equals(other.event))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		}
		else if (!id.equals(other.id))
			return false;
		if (isFullMenu != other.isFullMenu)
			return false;
		if (quotes == null) {
			if (other.quotes != null)
				return false;
		}
		else if (!quotes.equals(other.quotes))
			return false;
		if (summary == null) {
			if (other.summary != null)
				return false;
		}
		else if (!summary.equals(other.summary))
			return false;
		return true;
	}
}
