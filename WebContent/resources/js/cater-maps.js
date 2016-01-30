//Auto complete addresses script
var placeSearch, autocomplete;
var componentForm = {
	street_number : 'short_name',
	route : 'long_name',
	locality : 'long_name',
	administrative_area_level_1 : 'short_name',
	postal_code : 'short_name'
};

// [START region_fillform]
function fillInAddress() {
	//console.log("Inside fillInAddress");
	// Get the place details from the autocomplete object.
	var place = autocomplete.getPlace();
	//console.log(place);
	for ( var component in componentForm) {
		//console.log(component);
		document.getElementById(component).value = '';
		document.getElementById(component).disabled = false;
	}

	// Get each component of the address from the place details
	// and fill the corresponding field on the form.
	for (var i = 0; i < place.address_components.length; i++) {
		var addressType = place.address_components[i].types[0];

		if (componentForm[addressType]) {
			var val = place.address_components[i][componentForm[addressType]];
			document.getElementById(addressType).value = val;
				
		}
	}
	if(document.getElementById("address") != null){
	   document.getElementById("address").style.display = "block";
	  
	   
	}
	 if (place != ''){
		   document.getElementById("address").style.display = "block";
	   }
	
}
// [END region_fillform]

function initAutocomplete() {
	// Create the autocomplete object, restricting the search to geographical
	// location types.
	autocomplete = new google.maps.places.Autocomplete((document
			.getElementById('autocomplete')), {
		types : [ 'geocode' ]
	});

	// When the user selects an address from the dropdown, populate the address
	// fields in the form.
	autocomplete.addListener('place_changed', fillInAddress);
}

// [START region_geolocation]
// Bias the autocomplete object to the user's geographical location,
// as supplied by the browser's 'navigator.geolocation' object.
function geolocate() {
	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(function(position) {
			var geolocation = {
				lat : position.coords.latitude,
				lng : position.coords.longitude
			};
			var circle = new google.maps.Circle({
				center : geolocation,
				radius : position.coords.accuracy
			});
			/*console.log("Coords: (" + position.coords.latitude + ", "
					+ position.coords.longitude + "), Radius: "
					+ position.coords.accuracy + " miles");*/
			autocomplete.setBounds(circle.getBounds());
		});
	}
}
// [END region_geolocation]
