$('document').ready(function() {
	//listRestaurantQuotes();
});

/*function listRestaurantQuotes() {
	// Make an ajax call and get list of quotes
	var element = $("td[id=restaurantDashboardData]");
	element.html("<div class=\"sideMenuItemsDetail\">Fetching data...</div>");
	$.ajax({
		url : "/cater4party/restaurant/listQuotes",
		type : "GET",
		context : document.body,
		success : function(response) {
			// console.log(response);
			element.html(response);
		},
		error : function(xhr, status, error) {
			element.html("<div class=\"sideMenuItemsDetail\">Status:" + status
					+ ", <br>Error:" + error + "</div>");
		}
	});
}*/


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

/*
function listRestaurantDocs() {
	// Make an ajax call and get list of quotes
	var element = $("td[id=restaurantDashboardData]");
	element.html("<div class=\"sideMenuItemsDetail\">Fetching data...</div>");
	$.ajax({
		url : "/cater4party/restaurant/listDocs",
		type : "GET",
		context : document.body,
		success : function(response) {
			// console.log(response);
			element.html(response);
		},
		error : function(xhr, status, error) {
			element.html("<div class=\"sideMenuItemsDetail\">Status:" + status
					+ ", <br>Error:" + error + "</div>");
		}
	});
}*/
