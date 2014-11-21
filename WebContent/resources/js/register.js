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
					"<select class=\"inputs\" name=\"cuisineType\" id=\"cuisineType\" required=\"required\">"
							+ "	<option value=\"01\"> AMERICAN           </option>              "
							+ "	<option value=\"02\"> CHINESE            </option>              "
							+ "	<option value=\"03\"> CONTINENTAL        </option>              "
							+ "	<option value=\"04\"> CUBAN              </option>              "
							+ "	<option value=\"05\"> FRENCH             </option>              "
							+ "	<option value=\"06\"> GREEK              </option>              "
							+ "	<option value=\"07\"> INDIAN             </option>              "
							+ "	<option value=\"08\"> INDONESIAN         </option>              "
							+ "	<option value=\"09\"> ITALIAN            </option>              "
							+ "	<option value=\"10\"> JAPANESE           </option>              "
							+ "	<option value=\"11\"> KOREAN             </option>              "
							+ "	<option value=\"12\"> LEBANESE           </option>              "
							+ "	<option value=\"13\"> MALAYSIAN          </option>              "
							+ "	<option value=\"14\"> MEXICAN            </option>              "
							+ "	<option value=\"15\"> RUSSIAN            </option>              "
							+ "	<option value=\"16\"> SINGAPORE          </option>              "
							+ "	<option value=\"17\"> SPANISH            </option>              "
							+ "	<option value=\"18\"> THAI               </option>              "
							+ "	<option value=\"19\"> TIBETAN            </option>              "
							+ "	<option value=\"20\"> VIETNAMESE         </option>              "
							+ "</select>                                                          ");
}

function validateRegistrationFormOnSubmit() {
	$("form[id=register-form]").validate({
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
			phone: {
				phoneUS: true
			},
			zip:{
				pattern: /^\d{5}(\-\d{4})?$/
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
			zip:{
				pattern: "Please enter a valid zip in the form xxxxx or xxxxx-xxxx"
			}
		},
		submitHandler : function(form){
			var hash = md5($("#pwd1").val());
			$("#pwd1").val(hash);
			$("#pwd2").val("");
			form.submit();
		}
	});
}

