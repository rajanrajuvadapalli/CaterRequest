$(function() {
	var getAddressesHash = function() {
		var eventAddress = $('#event-address').val();
		var restaurantAddresses = $('.restaurant-address').map(function(index, restaurantAddress) {
		  return restaurantAddress.dataset.restaurantAddress;
		});

		return { event: eventAddress, restaurants: restaurantAddresses };	
	};

	var buildRequest = function(addresses) {
		address = addresses || {};
		return { origins: [addresses.event], destinations: addresses.restaurants, travelMode: google.maps.TravelMode.DRIVING, unitSystem: google.maps.UnitSystem.IMPERIAL, avoidHighways: false };
	};

	var getDistances = function(cb) {
		var requestObj = buildRequest(getAddressesHash());
		var service = new google.maps.DistanceMatrixService();
		return service.getDistanceMatrix(requestObj, cb);
	};

	var displayDistances = function(response, status) {
		var distances = $.map(response.rows[0].elements, function(element, index) { return element.distance.text; });
		var restaurantAddresses = response.destinationAddresses;
		var $restaurants = $('.restaurant-address');
		var currentRestaurantName = "";
		var $currentRestaurant = null;
		var restaurantsAndDistances = [];
		
		for (var i = 0; i < restaurantAddresses.length; i++) {
			$currentRestaurant = $($restaurants[i]);
			currentRestaurantName = $currentRestaurant.data('restaurant-name');
	        // Adding restaurant name, address and distance to array object
			restaurantsAndDistances.push({ name:currentRestaurantName, address : restaurantAddresses[i], distance: distances[i] });
		}
		// sorting with distance
		restaurantsAndDistances.sort(function (a, b) {
		  if (a.distance > b.distance) {
		    return 1;
		  }
		  if (a.distance < b.distance) {
		    return -1;
		  }
		  // a must be equal to b
		  return 0;
		});
		
		for (var i = 0; i < restaurantsAndDistances.length; i++) {
			$currentRestaurant = $($restaurants[i]);
			currentRestaurantName = $currentRestaurant.data('restaurant-name');
			$currentRestaurant.after(' <b>'+ restaurantsAndDistances[i].name + '</b> - ' + restaurantsAndDistances[i].address + '(' + restaurantsAndDistances[i].distance + ')');
		}
	};

	getDistances(displayDistances);	
});
