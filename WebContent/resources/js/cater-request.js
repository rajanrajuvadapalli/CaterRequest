$('document').ready(function() {
	$('.popup-with-form').magnificPopup({
		type : 'inline',
		fixedContentPos : false,
		fixedBgPos : true,
		overflowY : 'auto',
		closeBtnInside : true,
		midClick : true,
		preloader : false,
		removalDelay : 300,
		mainClass : 'my-mfp-zoom-in'
	});
});

function populateCuisineTypes() {
	$("span[id=cuisineType]")
			.replaceWith(
					"<select class=\"form-control inputs\" name=\"cuisineType\" id=\"cuisineType\" required=\"required\">"
							+ "	<option value=\"\">		           </option>              "
							+ "	<option value=\"AMERICAN\">		AMERICAN           </option>              "
							+ "	<option value=\"CHINESE\"> 		CHINESE            </option>              "
							+ "	<option value=\"CONTINENTAL\"> 	CONTINENTAL        </option>              "
							+ "	<option value=\"CUBAN\"> 		CUBAN              </option>              "
							+ "	<option value=\"FRENCH\"> 		FRENCH             </option>              "
							+ "	<option value=\"GREEK\"> 		GREEK              </option>              "
							+ "	<option value=\"INDIAN_SOUTH\">	INDIAN (SOUTH)     </option>              "
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
	var pwd1 = $("input[name=pwd1]");
	if (pwd1.val().length < 5) {
		alert("Your password must be at least 5 characters long");
		pwd1.focus();
		return false;
	}
	var pwd2 = $("input[name=pwd2]");
	if (pwd2.val().length < 5) {
		alert("Your other password must be at least 5 characters long");
		pwd2.focus();
		return false;
	}
	if (pwd1.val() != pwd2.val()) {
		alert("Your passwords do not match");
		pwd2.focus();
		return false;
	}
	var state = $("input[name=state]");
	if (state.val() != null && state.val().length != 2) {
		alert("State code should be 2 characters");
		state.focus();
		return false;
	}
	var hash = md5($("#pwd1").val());
	$("#pwd1").val(hash);
	$("#pwd2").val("");
	return true;
}

function validateLoginForm() {
	var pwd = $("input[name=pwd]");
	if (pwd.val() != null && pwd.val().length > 0 && pwd.val().length < 5) {
		alert("Your password must be at least 5 characters long");
		pwd.focus();
		return false;
	}
	var hash = md5($("#pwd").val());
	$("#pwd").val(hash);
	return true;
}

function validateEventForm() {
	// Validate that the date is in the future.
	var dateObject = $('input[id=datetimepicker]').val();
	// console.log("User entered: " + dateObject);
	var now = moment().format("YYYY/MM/DD HH:mm");
	// console.log("Now: " + now);
	if (dateObject < now) {
		alert("Please enter a date in the future." + "\nEntered date: "
				+ dateObject);
		return false;
	}
	var numberOfPeople = $('input[id=person_count]').val();
	if (numberOfPeople <= 1) {
		alert("Number of people should be 2 or more.");
		return false;
	}
	var state = $("input[name=state]");
	if (state.val() != null && state.val().length != 2) {
		alert("State code should be 2 characters");
		state.focus();
		return false;
	}
	var deliveryOption = $('select[id=deliveryOption]');
	if (deliveryOption.val() == '') {
		alert("Please select the delivery option.");
		deliveryOption.focus();
		return false;
	}
	return true;
}

function validateCuisine(formId) {
	var element = $('form[id=' + formId + '] select[id=cuisineType]');
	if (element.val() != "INDIAN_SOUTH") {
		alert("Sorry! " + element.val()
				+ " restaurants are not registered with us at this moment.");
		return false;
	}
	return true;
}

function validateMenuFormOnSubmit() {
	var atLeast1selected = false;
	$("form[id=menu-form] input[name=itemCode]").each(function() {
		if (this.checked) {
			atLeast1selected = true;
		}
	});
	if (!atLeast1selected) {
		alert('Please select at least 1 item.');
		return false;
	}
	return true;
}

function validateSelectRestaurantForm() {
	var atLeast1Selected = false;
	$(":checkbox").each(function() {
		if (this.checked == true) {
			atLeast1Selected = true;
		}
	});
	if (atLeast1Selected) {
		return true;
	} else {
		alert("Please select at least 1 restaurant.");
		return false;
	}
}
