$('document').ready(function() {
	$("input[id=datetimepicker]").datetimepicker();
});

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
	if (element.val() != "INDIAN") {
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
