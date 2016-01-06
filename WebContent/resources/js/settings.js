$('document').ready(function() {
	// $('button[id=pvc]').click(validatePhoneVerificationCode);
	// $('button[id=send-pvc]').click(sendPhoneVerificationCode);
});

function validateProfileFormCustomer() {
	var customerName = $("input[name=name]");
	if (customerName.val() != null && customerName.val().length > 0
			&& customerName.val().length < 4) {
		alert("Name must at least be 4 characters");
		customerName.focus();
		return false;
	}
	var stateElement = $("select[name=state]");
	var state = stateElement.val();
	if (state != null && state.length != 2) {
		alert("State code should be 2 characters");
		stateElement.focus();
		return false;
	}
	var st1 = $("input[name=street1]").val();
	var city = $("input[name=city]").val();
	var zip = $("input[name=zip]").val();
	var CurrentAddress = st1 + ", " + city + ", " + state + ", " + zip;
	var LastAddressValidated = $("input[name=LastAddressValidated]").val();
	// console.log("LastAddressValidated: " + LastAddressValidated);
	// console.log("CurrentAddress: " + CurrentAddress);
	if (LastAddressValidated != CurrentAddress) {
		$("input[name=LastAddressValidated]").val(CurrentAddress);
		var geocoder = new google.maps.Geocoder();
		geocoder.geocode({
			'address' : CurrentAddress
		}, addressCallbackFunctionForCustomer);
		return false;
	}
	return true;
}

function addressCallbackFunctionForCustomer(results, status) {
	$("div[id=addressnotok]").addClass('hidden');
	if (status == google.maps.GeocoderStatus.OK) {
		var address = results[0].formatted_address;
		console.log("Validated address: " + address);
		numCommas = address.match(/,/g).length;
		if (numCommas >= 3) { // Address is valid, Continue to submit form
			var st1 = $("input[name=street1]").val();
			var city = $("input[name=city]").val();
			var state = $("select[name=state]").val();
			var zip = $("input[name=zip]").val();
			var CurrentAddress = st1 + ", " + city + ", " + state + ", " + zip;
			var values = address.split(', ');
			var validatedStreet = values[0];
			var validatedCity = values[1];
			var state_zip = values[2].split('');
			var validatedState = state_zip[0];
			var validatedZip = state_zip[1];
			var LastAddressValidated = validatedStreet + ", " + validatedCity
					+ ", " + validatedState + ", " + validatedZip;
			$("input[name=LastAddressValidated]").val(LastAddressValidated);
			$("input[name=street1]").val(validatedStreet);
			$("input[name=city]").val(validatedCity);
			$("input[name=state]").val(validatedState);
			$("input[name=zip]").val(validatedZip);
			if (LastAddressValidated != CurrentAddress) {
				alert("\nAddress you entered: " + CurrentAddress
						+ "\nWe updated it to: " + LastAddressValidated
						+ "\nPlease verify and make changes if necessary.");
			} else {
				alert("Address is verified and accepted.");
			}

			var customerName = $("input[name=name]").val();
			if (customerName != null) {
				$("form[id=customer-register-form]").submit();
			} else {
				$("form[id=restaurant-register-form]").submit();
			}

			return;
		}
	} // Address is invalid
	$("input[name=LastAddressValidated]").val("");
	$("div[id=addressnotok]").removeClass('hidden');
}

function validateProfileFormRestaurant() {
	var restaurantName = $("input[name=restaurantName]");
	if (restaurantName.val() != null && restaurantName.val().length > 0
			&& restaurantName.val().length < 4) {
		alert("Restaurant name must at least be 4 characters");
		restaurantName.focus();
		return false;
	}
	return true;
}

function validateAccountSettingsForm() {
	var currPwd = $("input[name=currPwd]");
	if (currPwd.val().length < 5) {
		alert("Your password must be at least 5 characters long");
		currPwd.focus();
		return false;
	}
	var newPwd1 = $("input[name=newPwd1]");
	if (newPwd1.val().length < 5) {
		alert("Your New password must be at least 5 characters long");
		newPwd1.focus();
		return false;
	}
	var newPwd2 = $("input[name=newPwd2]");
	if (newPwd2.val().length < 5) {
		alert("Your new2 password must be at least 5 characters long");
		newPwd2.focus();
		return false;
	}
	if (newPwd1.val() != newPwd2.val()) {
		alert("Your passwords do not match");
		newPwd2.focus();
		return false;
	}
	$("#currPwd").val(md5($("#currPwd").val()));
	$("#newPwd1").val(md5($("#newPwd1").val()));
	$("#newPwd2").val("");
	return true;
}

function validatePhoneVerificationCode(restaurantID) {
	var loginID = $('input[id=pvc-loginID]').val();
	var role = $('input[id=pvc-role]').val();
	var contextPath = $('input[id=contextpath]').val();
	var url = contextPath + "/rest/phone/verify/" + loginID + "/" + role;
	if (restaurantID != "") {
		url = url + "?restaurantID=" + restaurantID;
	}
	var pvc = $('input[id=pvc]').val();
	/*
	 * console.log("login ID: " + loginID); console.log("Role: " + role);
	 * console.log("URL: " + url); console.log("phone verification code: " +
	 * pvc);
	 */

	if (pvc == null || pvc.length != 5) {
		alert("Please enter the complete verification code.");
		$('input[id=pvc]').focus();
		return false;
	}

	$.ajax({
		url : url,
		data : pvc,
		type : "POST",
		contentType : "text/plain;",
		// accepts : "text/plain",
		async : false,
		processData : false,
		success : function(response) {
			alert(response);
			window.location.href = contextPath + '/settings/personalInfo';
		},
		error : function(xhr, status, error) {
			alert(response + " " + error);
		}
	});
	return false;
}

function sendPhoneVerificationCode(restaurantID) {
	var loginID = $('input[id=pvc-loginID]').val();
	var role = $('input[id=pvc-role]').val();
	var contextPath = $('input[id=contextpath]').val();
	var url = contextPath + "/rest/phone/verify/sendcode/" + loginID + "/"
			+ role;
	if (restaurantID != "") {
		url = url + "?restaurantID=" + restaurantID;
	}
	var phoneNumber = $('input[id=phone]').val();
	/*
	 * console.log("login ID: " + loginID); console.log("Role: " + role);
	 * console.log("URL: " + url); console.log("phone number: " + phoneNumber);
	 */

	if (phoneNumber == null || phoneNumber.length == 0) {
		alert("Please enter a phone number.");
		$('input[id=phone]').focus();
		return false;
	}

	$.ajax({
		url : url,
		data : phoneNumber,
		type : "POST",
		contentType : "text/plain;",
		// accepts : "text/plain",
		async : false,
		processData : false,
		success : function(response) {
			alert(response);
			window.location.href = contextPath + '/settings/personalInfo';
			//btn.button('complete');
		},
		error : function(xhr, status, error) {
			alert(response + " " + error);
		}
	});
	return false;
}
