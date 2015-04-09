$('document').ready(function() {
	$("input[id=datetimepicker]").datetimepicker();
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
	$('button[id=pvc]').click(validatePhoneVerificationCode);
});

function validatePhoneVerificationCode() {
	var loginID = $('input[id=pvc-loginID]').val();
	var role = $('input[id=pvc-role]').val();
	var url = "/cater4party/rest/phone/verify/" + loginID + "?role=" + role;
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
			window.location.href = '/cater4party/settings/personalInfo';
		},
		error : function(xhr, status, error) {
			alert(response + " " + error);
		}/*
			 * , statusCode : { 404 : function() { alert("page not found"); },
			 * 400 : function() { alert("400"); } }
			 */
	});
	return false;
}

function validateEventForm() {
	// Validate that the date is in the future.
	var dateObject = $('input[id=datetimepicker]').datepicker('getDate');
	if (new Date().getTime() > dateObject) {
		alert("Please enter a date in the future.");
		return false;
	}
	var numberOfPeople = $('input[id=person_count]').val();
	if (numberOfPeople <= 1) {
		alert("Number of people should be 2 or more.");
		return false;
	}
	return true;
}

function validateCuisine(formId) {
	var element = $('form[id=' + formId + '] select[id=cuisineType]');
	if (element.val() != "INDIAN" && element.val() != "SOUTHINDIAN"   ) {
		alert("Sorry! " + element.val()
				+ " restaurants are not registered with us at this moment.");
		return false;
	}
	return true;
}

/*
 * function listCustomerEvents() { // Make an ajax call and get list of events
 * var element = $("td[id=customerDashboardData]"); element.html("<div
 * class=\"sideMenuItemsDetail\">Fetching data...</div>"); $.ajax({ url :
 * "/cater4party/customer/listEvents", type : "GET", context : document.body,
 * success : function(response) { // console.log(response);
 * element.html(response); }, error : function(xhr, status, error) {
 * element.html("<div class=\"sideMenuItemsDetail\">Status:" + status + ", <br>Error:" +
 * error + "</div>"); } }); }
 */

function validateMenuFormOnSubmit() {
	var atLeast1selected = false;
	$("form[id=menu-form] input[name=itemName]").each(function() {
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
