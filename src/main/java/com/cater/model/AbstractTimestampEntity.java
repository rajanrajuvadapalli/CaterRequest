package com.cater.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@MappedSuperclass
public abstract class AbstractTimestampEntity {
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_ts", nullable = false)
	private Date created;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "lupd_ts", nullable = false)
	private Date updated;

	@PrePersist
	protected void onCreate() {
		updated = created = new Date();
	}

	@PreUpdate
	protected void onUpdate() {
		updated = new Date();
	}
}
