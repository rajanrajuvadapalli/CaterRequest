$('document').ready(function() {
	validateProfileForm();
	validateAccountSettingsForm();
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

