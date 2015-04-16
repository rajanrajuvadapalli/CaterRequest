$('document').ready(function() {
	validateProfileForm();
	validateAccountSettingsForm();
	$('button[id=pvc]').click(validatePhoneVerificationCode);
	$('button[id=send-pvc]').click(sendPhoneVerificationCode);
});

function validateProfileForm() {
	$("form[id=profileForm]")
			.validate(
					{
						rules : {
							name : {
								minlength : 4
							},
							restaurantName : {
								minlength : 4
							},
							phone : {
								phoneUS : true
							},
							zip : {
								pattern : /^\d{5}(\-\d{4})?$/
							}
						},
						messages : {
							name : {
								required : "Please enter your name.",
								minlength : "Name must at least be 4 characters"
							},
							restaurantName : {
								required : "Please enter your restaurant's name.",
								minlength : "Name must at least be 4 characters"
							},
							zip : {
								pattern : "Please enter a valid zip in the form xxxxx or xxxxx-xxxx"
							}
						},
						submitHandler : function(form) {
							form.submit();
						}
					});
}

function validateAccountSettingsForm() {
	$("form[id=accountSettingsForm]").validate({
		rules : {
			currPwd : {
				minlength : 5
			},
			newPwd1 : {
				minlength : 5
			},
			newPwd2 : {
				minlength : 5,
				equalTo : "#newPwd1"
			}
		},
		messages : {
			currPwd : {
				required : "Please provide a current password",
				minlength : "Your password must be at least 5 characters long"
			},
			pwd1 : {
				required : "Please provide a new password",
				minlength : "Your password must be at least 5 characters long"
			},
			pwd2 : {
				required : "Please retype new password",
				minlength : "Your password must be at least 5 characters long",
				equalTo : "Please enter the same password as above"
			}
		},
		submitHandler : function(form) {
			$("#currPwd").val(md5($("#currPwd").val()));
			$("#newPwd1").val(md5($("#newPwd1").val()));
			$("#newPwd2").val("");
			form.submit();
		}
	});
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
