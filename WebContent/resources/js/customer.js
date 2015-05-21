$('document').ready(function() {
	/*$("input[id=datetimepicker]").datetimepicker({
		dayOfWeekStart : 1,
		lang : 'en'
	});*/
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
