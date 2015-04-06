package com.cater.service;

public class UpdateResult {
	private boolean isUpdateSuccess = false;
	private boolean isPhoneNumberUpdated = false;

	public boolean isPhoneNumberUpdated() {
		return isPhoneNumberUpdated;
	}

	public void setPhoneNumberUpdated(boolean isPhoneNumberUpdated) {
		this.isPhoneNumberUpdated = isPhoneNumberUpdated;
	}

	public boolean isUpdateSuccess() {
		return isUpdateSuccess;
	}

	public void setUpdateSuccess(boolean isUpdateSuccess) {
		this.isUpdateSuccess = isUpdateSuccess;
	}
}
