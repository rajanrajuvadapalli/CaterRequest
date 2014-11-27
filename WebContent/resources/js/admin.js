$('document').ready(function() {
	$("div[id=customersList]").show();
	$("div[id=restaurantsList]").hide();
	$("div[id=eventsList]").hide();
});

function listCustomers() {
	$("div[id=customersList]").show();
	$("div[id=restaurantsList]").hide();
	$("div[id=eventsList]").hide();
}

function listRestaurants() {
	$("div[id=customersList]").hide();
	$("div[id=restaurantsList]").show();
	$("div[id=eventsList]").hide();
}

function listEvents() {
	$("div[id=customersList]").hide();
	$("div[id=restaurantsList]").hide();
	$("div[id=eventsList]").show();
}