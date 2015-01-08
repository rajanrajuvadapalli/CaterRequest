$('document').ready(function() {
	listRestaurantQuotes();
});

function listRestaurantQuotes() {
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
}

function displayMenu(elem) {
	var url = elem.attr("href");
	var windowSize = "width=600,height=900,scrollbars=yes";
	window.open(url, '_blank', windowSize);
}

function displayMenu2(menuId) {
	$.ajax({
		url : "/cater4party/menu/view/" + menuId,
		type : "GET",
		context : document.body,
		success : function(response) {
			alert("Success");
			/*
			 * console.log("Hari"); console.log(response); // var windowName =
			 * menuId;// $(this).attr("name"); var windowSize =
			 * "width=600,height=900,scrollbars=yes"; var w = window.open('',
			 * '', windowSize); w.document.write(response);
			 */
		},
		error : function(xhr, status, error) {
			alert('Unexpected error. Please contact system administrator.'
					+ status + xhr.responseText);
		}
	});

}