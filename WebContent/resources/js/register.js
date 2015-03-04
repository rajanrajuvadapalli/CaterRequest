//Hide the registration form on load
//Instead show the options first
$('document').ready(function() {
	$("[id=register-options]").show();
	$("[id=register-form]").hide();
	populateCuisineTypes();
	$('#state').bfhstates({
		country : 'US',
		state : 'CA'
	});
	validateRegistrationFormOnSubmit();
	validateLoginForm();
});

function showRegistrationFormFor(user) {
	$("[id=register-options]").hide();
	$("[id=register-form]").show();
	// Show form elements specific to the user
	if (user == 'customer') {
		$("[id=customer]").show();
		$("[id=restaurant]").hide();
	} else if (user == 'restaurant') {
		$("[id=customer]").hide();
		$("[id=restaurant]").show();
	}
}

function populateCuisineTypes() {
	$("span[id=cuisineType]")
			.replaceWith(
					"<select class=\"form-control inputs\" name=\"cuisineType\" id=\"cuisineType\" required=\"required\">"
							+ "	<option value=\"AMERICAN\">		AMERICAN           </option>              "
							+ "	<option value=\"CHINESE\"> 		CHINESE            </option>              "
							+ "	<option value=\"CONTINENTAL\"> 	CONTINENTAL        </option>              "
							+ "	<option value=\"CUBAN\"> 		CUBAN              </option>              "
							+ "	<option value=\"FRENCH\"> 		FRENCH             </option>              "
							+ "	<option value=\"GREEK\"> 		GREEK              </option>              "
							+ "	<option value=\"INDIAN\"> 		INDIAN             </option>              "
							+ "	<option value=\"INDONESIAN\"> 	INDONESIAN         </option>              "
							+ "	<option value=\"ITALIAN\"> 		ITALIAN            </option>              "
							+ "	<option value=\"JAPANESE\"> 	JAPANESE           </option>              "
							+ "	<option value=\"KOREAN\"> 		KOREAN             </option>              "
							+ "	<option value=\"LEBANESE\"> 	LEBANESE           </option>              "
							+ "	<option value=\"MALAYSIAN\"> 	MALAYSIAN          </option>              "
							+ "	<option value=\"MEXICAN\"> 		MEXICAN            </option>              "
							+ "	<option value=\"RUSSIAN\"> 		RUSSIAN            </option>              "
							+ "	<option value=\"SINGAPORE\"> 	SINGAPORE          </option>              "
							+ "	<option value=\"SPANISH\">	 	SPANISH            </option>              "
							+ "	<option value=\"THAI\"> 		THAI               </option>              "
							+ "	<option value=\"TIBETAN\"> 		TIBETAN            </option>              "
							+ "	<option value=\"VIETNAMESE\"> 	VIETNAMESE         </option>              "
							+ "</select>                                                          ");
}

function validateRegistrationFormOnSubmit() {
	$("form[id=register-form]")
			.validate(
					{
						rules : {
							name : {
								minlength : 4
							},
							restaurantName : {
								minlength : 4
							},
							pwd1 : {
								minlength : 5
							},
							pwd2 : {
								minlength : 5,
								equalTo : "#pwd1"
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
							pwd1 : {
								required : "Please provide a password",
								minlength : "Your password must be at least 5 characters long"
							},
							pwd2 : {
								required : "Please provide a password",
								minlength : "Your password must be at least 5 characters long",
								equalTo : "Please enter the same password as above"
							},
							zip : {
								pattern : "Please enter a valid zip in the form xxxxx or xxxxx-xxxx"
							}
						},
						submitHandler : function(form) {
							var hash = md5($("#pwd1").val());
							$("#pwd1").val(hash);
							$("#pwd2").val("");
							form.submit();
						}
					});
}

function validateLoginForm() {
	$("form[id=loginForm]").validate({
		rules : {
			pwd : {
				minlength : 5
			}
		},
		messages : {
			username : {
				required : "Please enter your email."
			},
			pwd : {
				required : "Please provide a password",
				minlength : "Your password must be at least 5 characters long"
			}

		},
		submitHandler : function(form) {
			var hash = md5($("#pwd").val());
			$("#pwd").val(hash);
			form.submit();
		}
	});
}
