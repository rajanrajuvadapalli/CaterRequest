package com.cater.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@MappedSuperclass
public class TimestampEntity {
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_ts", updatable = false)
	private final Date created = new Date();
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "lupd_ts")
	private Date updated;

	public Date getCreated() {
		return created;
	}

	public Date getUpdated() {
		return updated;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((created == null) ? 0 : created.hashCode());
		result = prime * result + ((updated == null) ? 0 : updated.hashCode());
		return result;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj) return true;
		if (obj == null) return false;
		if (getClass() != obj.getClass()) return false;
		TimestampEntity other = (TimestampEntity) obj;
		if (created == null) {
			if (other.created != null) return false;
		}
		else if (!created.equals(other.created)) return false;
		if (updated == null) {
			if (other.updated != null) return false;
		}
		else if (!updated.equals(other.updated)) return false;
		return true;
	}
}
