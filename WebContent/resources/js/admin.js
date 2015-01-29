$('document').ready(function() {
	validateContactUsFormOnSubmit();
	//$("div[id=customersList]").show();
	//$("div[id=restaurantsList]").hide();
	//$("div[id=eventsList]").hide();
});

function validateContactUsFormOnSubmit() {
	$("form[id=contactUsForm]")
			.validate(
					{
						submitHandler : function(form) {
							form.submit();
						}
					});
}

/*
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
}*/