function calculateDistance() {
	var getAddressesHash = function() {
		var eventAddress = $('#event-address').val();
		var restaurantAddresses = $('.restaurants').map(
				function(index, restaurantAddress) {
					return restaurantAddress.dataset.restaurantAddress;
				});

		return {
			event : eventAddress,
			restaurants : restaurantAddresses
		};
	};

	var buildRequest = function(addresses) {
		return {
			origins : [ addresses.event ],
			destinations : addresses.restaurants,
			travelMode : google.maps.TravelMode.DRIVING,
			unitSystem : google.maps.UnitSystem.IMPERIAL,
			avoidHighways : false
		};
	};

	var getDistances = function(cb) {
		var requestObj = buildRequest(getAddressesHash());
		var service = new google.maps.DistanceMatrixService();
		return service.getDistanceMatrix(requestObj, cb);
	};

	var displayDistances = function(response, status) {
		// status = 'INVALID_REQUEST' => throw and handle error case
		if (status != google.maps.DistanceMatrixStatus.OK) {
			alert('Error was: ' + status);
		} else {
			var distances = $.map(response.rows[0].elements, function(element,
					index) {
				return {
					text : element.distance.text,
					value : element.distance.value
				};
			});
			var restaurantAddresses = response.destinationAddresses;
			var $restaurants = $('.restaurants');
			var currentRestaurantName = "";
			var currentRestaurantId = "";
			var $currentRestaurant = null;
			var restaurantsAndDistances = [];
			var $restaurantsContainer = $('.display-restaurants');

			for (var i = 0; i < restaurantAddresses.length; i++) {
				$currentRestaurant = $($restaurants[i]);
				currentRestaurantName = $currentRestaurant
						.data('restaurant-name');
				currentRestaurantId = $currentRestaurant.data('restaurant-id');
				// Adding restaurant name, address and distance to array object
				// Adds only restaurants which are less than 50 miles radius
				if (distances[i].value <= 80467) {
					restaurantsAndDistances.push({
						id : currentRestaurantId,
						name : currentRestaurantName,
						address : restaurantAddresses[i],
						distance : distances[i].text,
						distanceValue : distances[i].value
					});
				}
			}
			// sorting with distance
			restaurantsAndDistances.sort(function(a, b) {
				if (a.distanceValue > b.distanceValue)
					return 1;
				if (a.distanceValue < b.distanceValue)
					return -1;

				return 0;
			});

			if ('catering' == $restaurantsContainer.data('page')) {
				for (var i = 0; i < restaurantsAndDistances.length; i++)
					$restaurantsContainer
							.append('<input type="checkbox" class="restaurant-details" name="restaurantId" value="'
									+ restaurantsAndDistances[i].id
									+ '"  />'
									+ ' <b>'
									+ restaurantsAndDistances[i].name
									+ ' - '
									+ restaurantsAndDistances[i].distance
									+ ' </b> <br>  '
									+ restaurantsAndDistances[i].address
									+ '<br>');
			} else {
				for (var i = 0; i < restaurantsAndDistances.length; i++)
					$restaurantsContainer
							.append('<div class="restaurant-details">' + ' <b>'
									+ restaurantsAndDistances[i].name + ' - '
									+ restaurantsAndDistances[i].distance
									+ ' </b> <br> '
									+ restaurantsAndDistances[i].address
									+ '<br> </div>');
			}

			$('.restaurants').remove();
		}

	};

	getDistances(displayDistances);
}
