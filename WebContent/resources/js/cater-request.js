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
							//+ "	<option value=\"\">		           </option>              "
							//+ "	<option value=\"AMERICAN\">		AMERICAN           </option>              "
							//+ "	<option value=\"CHINESE\"> 		CHINESE            </option>              "
							//+ "	<option value=\"CONTINENTAL\"> 	CONTINENTAL        </option>              "
							//+ "	<option value=\"CUBAN\"> 		CUBAN              </option>              "
							//+ "	<option value=\"FRENCH\"> 		FRENCH             </option>              "
							//+ "	<option value=\"GREEK\"> 		GREEK              </option>              "
							+ "	<option value=\"INDIAN_SOUTH\">	INDIAN (SOUTH)     </option>              "
							+ "	<option value=\"INDIAN_NORTH\">	INDIAN (NORTH)     </option>              "
							//+ "	<option value=\"INDONESIAN\"> 	INDONESIAN         </option>              "
							//+ "	<option value=\"ITALIAN\"> 		ITALIAN            </option>              "
							//+ "	<option value=\"JAPANESE\"> 	JAPANESE           </option>              "
							//+ "	<option value=\"KOREAN\"> 		KOREAN             </option>              "
							//+ "	<option value=\"LEBANESE\"> 	LEBANESE           </option>              "
							//+ "	<option value=\"MALAYSIAN\"> 	MALAYSIAN          </option>              "
							//+ "	<option value=\"MEXICAN\"> 		MEXICAN            </option>              "
							//+ "	<option value=\"RUSSIAN\"> 		RUSSIAN            </option>              "
							//+ "	<option value=\"SINGAPORE\"> 	SINGAPORE          </option>              "
							//+ "	<option value=\"SPANISH\">	 	SPANISH            </option>              "
							//+ "	<option value=\"THAI\"> 		THAI               </option>              "
							//+ "	<option value=\"TIBETAN\"> 		TIBETAN            </option>              "
							//+ "	<option value=\"VIETNAMESE\"> 	VIETNAMESE         </option>              "
							+ "</select>                                                          ");
}

function populateStateDropDown() {
	var json_states = '[{"name": "Alabama","abbreviation": "AL"},{"name": "Alaska","abbreviation": "AK"},{"name": "American Samoa","abbreviation": "AS"},{"name": "Arizona","abbreviation": "AZ"},{"name": "Arkansas","abbreviation": "AR"},{"name": "California","abbreviation": "CA"},{"name": "Colorado","abbreviation": "CO"},{"name": "Connecticut","abbreviation": "CT"},{"name": "Delaware","abbreviation": "DE"},{"name": "District Of Columbia","abbreviation": "DC"},{"name": "Federated States Of Micronesia","abbreviation": "FM"},{"name": "Florida","abbreviation": "FL"},{"name": "Georgia","abbreviation": "GA"},{"name": "Guam","abbreviation": "GU"},{"name": "Hawaii","abbreviation": "HI"},{"name": "Idaho","abbreviation": "ID"},{"name": "Illinois","abbreviation": "IL"},{"name": "Indiana","abbreviation": "IN"},{"name": "Iowa","abbreviation": "IA"},{"name": "Kansas","abbreviation": "KS"},{"name": "Kentucky","abbreviation": "KY"},{"name": "Louisiana","abbreviation": "LA"},{"name": "Maine","abbreviation": "ME"},{"name": "Marshall Islands","abbreviation": "MH"},{"name": "Maryland","abbreviation": "MD"},{"name": "Massachusetts","abbreviation": "MA"},{"name": "Michigan","abbreviation": "MI"},{"name": "Minnesota","abbreviation": "MN"},{"name": "Mississippi","abbreviation": "MS"},{"name": "Missouri","abbreviation": "MO"},{"name": "Montana","abbreviation": "MT"},{"name": "Nebraska","abbreviation": "NE"},{"name": "Nevada","abbreviation": "NV"},{"name": "New Hampshire","abbreviation": "NH"},{"name": "New Jersey","abbreviation": "NJ"},{"name": "New Mexico","abbreviation": "NM"},{"name": "New York","abbreviation": "NY"},{"name": "North Carolina","abbreviation": "NC"},{"name": "North Dakota","abbreviation": "ND"},{"name": "Northern Mariana Islands","abbreviation": "MP"},{"name": "Ohio","abbreviation": "OH"},{"name": "Oklahoma","abbreviation": "OK"},{"name": "Oregon","abbreviation": "OR"},{"name": "Palau","abbreviation": "PW"},{"name": "Pennsylvania","abbreviation": "PA"},{"name": "Puerto Rico","abbreviation": "PR"},{"name": "Rhode Island","abbreviation": "RI"},{"name": "South Carolina","abbreviation": "SC"},{"name": "South Dakota","abbreviation": "SD"},{"name": "Tennessee","abbreviation": "TN"},{"name": "Texas","abbreviation": "TX"},{"name": "Utah","abbreviation": "UT"},{"name": "Vermont","abbreviation": "VT"},{"name": "Virgin Islands","abbreviation": "VI"},{"name": "Virginia","abbreviation": "VA"},{"name": "Washington","abbreviation": "WA"},{"name": "West Virginia","abbreviation": "WV"},{"name": "Wisconsin","abbreviation": "WI"},{"name": "Wyoming","abbreviation": "WY"}]';
	obj = $.parseJSON(json_states);
	var stateDiv = $("span[id=stateArea]");
	var selectNode = $("<select/>").attr('name', 'state').attr('id', 'state')
			.attr('required', 'true').attr('class', 'form-control inputs')
			.appendTo(stateDiv);
	$("<option />", {
		value : '',
		text : ''
	}).appendTo(selectNode);
	for (var i = 0; i < obj.length; i++) {
		$("<option />", {
			value : obj[i].abbreviation,
			text : obj[i].name
		}).appendTo(selectNode);
	}
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
		}, addressCallbackFunction);
		return false;
	}
	var hash = md5($("#pwd1").val());
	$("#pwd1").val(hash);
	$("#pwd2").val(hash);
	return true;
}

function addressCallbackFunction(results, status) {
	if (status == google.maps.GeocoderStatus.OK) {
		var address = results[0].formatted_address;
		console.log("Validated address: " + address);
		numCommas = address.match(/,/g).length;
		if (numCommas >= 3) {
			// Address is valid, Continue to submit form
			var st1 = $("input[name=street1]").val();
			var city = $("input[name=city]").val();
			var state = $("select[name=state]").val();
			var zip = $("input[name=zip]").val();
			var CurrentAddress = st1 + ", " + city + ", " + state + ", " + zip;
			var values = address.split(', ');
			var validatedStreet = values[0];
			var validatedCity = values[1];
			var state_zip = values[2].split(' ');
			var validatedState = state_zip[0];
			var validatedZip = state_zip[1];
			var LastAddressValidated = validatedStreet + ", " + validatedCity
					+ ", " + validatedState + ", " + validatedZip;
			$("input[name=LastAddressValidated]").val(LastAddressValidated);
			$("input[name=street1]").val(validatedStreet);
			$("input[name=city]").val(validatedCity);
			$("input[name=state]").val(validatedState);
			$("input[name=zip]").val(validatedZip);
			alert("\nAddress you entered: " + CurrentAddress
					+ "\nWe updated it to: " + LastAddressValidated
					+ "\nPlease verify and make changes if necessary.");
			/*
			 * var customerName = $("input[name=name]").val(); if (customerName !=
			 * null) { $("form[id=customer-register-form]").submit(); } else {
			 * $("form[id=restaurant-register-form]").submit(); }
			 */
			return;
		}
	}
	// Address is invalid
	$("input[name=LastAddressValidated]").val("");
	$("div[id=addressnotok]").removeClass('hidden');
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
	if (element.val() != "INDIAN_SOUTH" && element.val() != "INDIAN_NORTH") {
		alert("Sorry! " + element.val()
				+ " restaurants are not registered with us at this moment.");
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
