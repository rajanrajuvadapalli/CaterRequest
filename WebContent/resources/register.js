//Hide the registration form on load
//Instead show the options first
$('document').ready(function() {
	$("[id=register-options]").show();
	$("[id=register-form]").hide();
	
});

function showRegistrationFormFor(user) {
	$("[id=register-options]").hide();
	$("[id=register-form]").show();
	//Show form elements specific to the user
	if(user == 'customer') {
		$("[id=customer]").show();
		$("[id=restaurant]").hide();
	} else if(user == 'restaurant') {
		$("[id=customer]").hide();
		$("[id=restaurant]").show();
	} 
}