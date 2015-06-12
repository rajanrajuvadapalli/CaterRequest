$('document').ready(function() {
	$('button[id=pvc]').click(validatePhoneVerificationCode);
	$('button[id=send-pvc]').click(sendPhoneVerificationCode);
});

function validateProfileForm() {
	var customerName = $("input[name=name]");
	if (customerName.val() != null && customerName.val().length > 0
			&& customerName.val().length < 4) {
		alert("Name must at least be 4 characters");
		customerName.focus();
		return false;
	}
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

function validatePhoneVerificationCode() {
	var loginID = $('input[id=pvc-loginID]').val();
	var role = $('input[id=pvc-role]').val();
	var contextPath = $('input[id=contextpath]').val();
	var url = contextPath + "/rest/phone/verify/" + loginID + "/" + role;
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

function sendPhoneVerificationCode() {
	var loginID = $('input[id=pvc-loginID]').val();
	var role = $('input[id=pvc-role]').val();
	var contextPath = $('input[id=contextpath]').val();
	var url = contextPath + "/rest/phone/verify/sendcode/" + loginID + "/"
			+ role;
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
			btn.button('complete');
		},
		error : function(xhr, status, error) {
			alert(response + " " + error);
		}
	});
	return false;
}
