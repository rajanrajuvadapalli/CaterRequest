package com.cater.model;

import java.io.Serializable;
import java.util.Iterator;
import java.util.List;

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
import javax.persistence.Table;

import com.beust.jcommander.internal.Lists;
import com.google.common.collect.Iterables;

/**
 * The Class Restaurant.
 */
@Entity
@Table(name = "Restaurant")
public class Restaurant extends TimestampEntity implements Serializable {
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = -4558590649364593837L;
	/** The id. */
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	/** The name. */
	@Column(name = "name", length = 50, nullable = false)
	private String name;
	/** The login. */
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER, optional = false)
	@JoinColumn(name = "login_sk", nullable = false)
	private Login login;
	/** The cuisine type. */
	@Column(name = "cuisine_type", length = 20, nullable = false)
	private String cuisineType;
	/** The website url. */
	@Column(name = "website_url", length = 50, nullable = true)
	private String websiteUrl;
	/** The about us. */
	@Column(name = "about_us", length = 5000, nullable = true)
	private String aboutUs;
	/** The branches. */
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "restaurant_sk")
	public List <RestaurantBranch> branches;

	/**
	 * Gets the id.
	 *
	 * @return the id
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * Sets the id.
	 *
	 * @param id the new id
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * Gets the name.
	 *
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * Sets the name.
	 *
	 * @param name the new name
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * Gets the login.
	 *
	 * @return the login
	 */
	public Login getLogin() {
		return login;
	}

	/**
	 * Sets the login.
	 *
	 * @param login the new login
	 */
	public void setLogin(Login login) {
		this.login = login;
	}

	/**
	 * Gets the cuisine type.
	 *
	 * @return the cuisine type
	 */
	public String getCuisineType() {
		return cuisineType;
	}

	/**
	 * Sets the cuisine type.
	 *
	 * @param cuisineType the new cuisine type
	 */
	public void setCuisineType(String cuisineType) {
		this.cuisineType = cuisineType;
	}

	/**
	 * Gets the website url.
	 *
	 * @return the website url
	 */
	public String getWebsiteUrl() {
		return websiteUrl;
	}

	/**
	 * Sets the website url.
	 *
	 * @param websiteUrl the new website url
	 */
	public void setWebsiteUrl(String websiteUrl) {
		this.websiteUrl = websiteUrl;
	}

	/**
	 * Gets the about us.
	 *
	 * @return the about us
	 */
	public String getAboutUs() {
		return aboutUs;
	}

	/**
	 * Sets the about us.
	 *
	 * @param aboutUs the new about us
	 */
	public void setAboutUs(String aboutUs) {
		this.aboutUs = aboutUs;
	}

	/**
	 * Gets the branches.
	 *
	 * @return the branches
	 */
	public List <RestaurantBranch> getBranches() {
		if (branches == null) {
			branches = Lists.newArrayList();
		}
		return branches;
	}

	/**
	 * Sets the branches.
	 *
	 * @param branches the new branches
	 */
	public void setBranches(List <RestaurantBranch> branches) {
		this.branches = branches;
	}

	/**
	 * Hash code.
	 *
	 * @return the int
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((aboutUs == null) ? 0 : aboutUs.hashCode());
		result = prime * result
				+ ((branches == null) ? 0 : branches.hashCode());
		result = prime * result
				+ ((cuisineType == null) ? 0 : cuisineType.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((login == null) ? 0 : login.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result
				+ ((websiteUrl == null) ? 0 : websiteUrl.hashCode());
		return result;
	}

	/**
	 * Equals.
	 *
	 * @param obj the obj
	 * @return true, if successful
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (getClass() != obj.getClass())
			return false;
		Restaurant other = (Restaurant) obj;
		if (aboutUs == null) {
			if (other.aboutUs != null)
				return false;
		}
		else if (!aboutUs.equals(other.aboutUs))
			return false;
		if (branches == null) {
			if (other.branches != null)
				return false;
		}
		else if (!branches.equals(other.branches))
			return false;
		if (cuisineType == null) {
			if (other.cuisineType != null)
				return false;
		}
		else if (!cuisineType.equals(other.cuisineType))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		}
		else if (!id.equals(other.id))
			return false;
		if (login == null) {
			if (other.login != null)
				return false;
		}
		else if (!login.equals(other.login))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		}
		else if (!name.equals(other.name))
			return false;
		if (websiteUrl == null) {
			if (other.websiteUrl != null)
				return false;
		}
		else if (!websiteUrl.equals(other.websiteUrl))
			return false;
		return true;
	}

	/**
	 * Gets the branch with id.
	 *
	 * @param restaurantBranchID the restaurant branch id
	 * @return the branch with id
	 */
	public RestaurantBranch getBranchWithId(Integer restaurantBranchID) {
		Iterable <RestaurantBranch> results = Iterables.filter(getBranches(),
				new com.google.common.base.Predicate <RestaurantBranch>() {
					@Override
					public boolean apply(RestaurantBranch input) {
						return input != null && restaurantBranchID != null
								&& input.getId() == restaurantBranchID;
					}
				});
		Iterator <RestaurantBranch> it;
		if (results != null && (it = results.iterator()).hasNext()) {
			return it.next();
		}
		return null;
	}
}
