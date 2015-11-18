<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAlobAYE25Q2m62_DX3wc1AMimO2Xr-WHc&signed_in=true&libraries=places&callback=initAutocomplete"
        async defer></script>
<div class="col-sm-10 col-sm-offset-1 page-header">
	<h1>Create Event</h1>
</div>
<div class="col-sm-10 col-sm-offset-1">
	<c:if test="${not empty errors}">
		<div class="alert alert-danger">
			<button type="button" class="close btn-lg" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			<ul>
				<c:forEach items="${errors}" var="e">
					<li align="left">${e}</li>
				</c:forEach>
			</ul>

		</div>
	</c:if>

	<c:if test="${not empty successMessages}">
		<div class="alert alert-success">
			<button type="button" class="close btn-lg" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			<ul>
				<c:forEach items="${successMessages}" var="sm">
					<li align="left">${sm}</li>
				</c:forEach>
			</ul>

		</div>
	</c:if>

	<c:if test="${not empty warnings}">
		<div class="alert alert-warning">
			<button type="button" class="close btn-lg" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			<ul>
				<c:forEach items="${warnings}" var="w">
					<li align="left">${w}</li>
				</c:forEach>
			</ul>
		</div>
	</c:if>
</div>

<div class="col-sm-10 col-sm-offset-1">
	<form class="form-horizontal" method="POST" id="event-form"
		action="${pageContext.request.contextPath}/customer/createEvent"
		enctype="application/x-www-form-urlencoded" autocomplete="off"
		onsubmit="return validateEventForm();">
		<div class="col-sm-10 col-sm-offset-1">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">The Basics</h3>
				</div>
				<div class="panel-body">

					<div class="form-group">
						<label for="name" class="col-sm-3 control-label">Event
							Name<span style="color: red">*</span> :
						</label>
						<div class="col-sm-6">
							<input type="text" size="50" maxlength="250" name="name"
								required="required" placeholder="Ex.: Victoria's Birthday party"
								autofocus class="form-control">
						</div>
					</div>

					<div class="form-group">
						<label for="datetimepicker" class="col-sm-3 control-label">Date/Time<span
							style="color: red">*</span> :
						</label>
						<div class="col-sm-6">
							<input type="text" size="30" maxlength="50" name="datetimepicker"
								id="datetimepicker" required="required" class="form-control">
						</div>
					</div>

					<div class="form-group">
						<label for="person_count" class="col-sm-3 control-label">Number
							of Adults<span style="color: red">*</span> :
						</label>
						<div class="col-sm-6">
							<input type="text" size="20" maxlength="20" name="person_count"
								id="person_count" required="required" pattern="[0-9]+"
								title="Must be a Number" class="form-control">
						</div>
					</div>

					<div class="form-group">
						<label for="kids_count" class="col-sm-3 control-label">Number
							of Kids<span style="color: red">*</span> :
						</label>
						<div class="col-sm-6">
							<input type="text" size="20" maxlength="20" name="kids_count"
								id="kids_count" required="required" pattern="[0-9]+"
								title="Must be a Number" class="form-control">
						</div>
					</div>

					<!-- Note: This will be a future enhancement. -->
					<!-- <div class="form-group">
					<label for="budget_total" class="col-sm-3 control-label">Total
						Budget :</label>
					<div class="col-sm-6">
						<input type="text" size="20" maxlength="20" name="budget_total"
							required="required" pattern="[0-9]+" title="Must be a Number"
							class="form-control">
					</div>
				</div> -->
				</div>
			</div>

			<div class="panel panel-success">
				<div class="panel-heading">
					<h3 class="panel-title">Event Location</h3>
				</div>
				<div class="panel-body">
					<input type="hidden" name="LastAddressValidated" value="">
					<div class="alert alert-danger hidden" id="addressnotok">
						<button type="button" class="close btn-lg" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						Address validation failed. Please check your address.<br /> If
						the problem persists, please contact customer support.
					</div>
					<div class="form-group">
					<label for="street1"   class="col-sm-3 control-label">
						</label>
					 <div class="col-sm-6" id="locationField" >
                     <input id="autocomplete" placeholder="Enter your address"
                             onFocus="geolocate()" type="text" class="form-control">
                      </div>
                     </div> 
					<div class="form-group">
					
						<label for="street1"   class="col-sm-3 control-label">Street <span
							style="color: red">*</span> :
						</label>
						<div class="col-sm-2">
							<input type="text" size="5" maxlength="10" name="street_number" id="street_number"
								placeholder="Street" class="form-control">
					    </div>
					    <div class="col-sm-4">
							<input type="text" size="30" maxlength="50" name="street_name"  id="route" 
								required="required" placeholder="Street Name" class="form-control">
						</div>
						
					</div>

					<div class="form-group">
						<label for="street2" class="col-sm-3 control-label">Street
							2 :</label>
						<div class="col-sm-6">
							<input type="text" size="30" maxlength="50" name="street2"  
								placeholder="Apt/Door No" class="form-control">
						</div>
					</div> 

					<div class="form-group">
						<label for="city"    class="col-sm-3 control-label">City<span
							style="color: red">*</span> :
						</label>
						<div class="col-sm-6">
							<input type="text" size="30" name="city" required="required" id="locality"	
								placeholder="City" class="form-control">
						</div>
					</div>

					<div class="form-group">
						<label for="state"   class="col-sm-3 control-label">State<span
							style="color: red">*</span> :
						</label>
						<div class="col-sm-6">
						<input type="text" size="30" name="state" required="required"  id="administrative_area_level_1"	
								placeholder="State" class="form-control">
							
						</div>
					</div>

					<div class="form-group">
						<label for="zip" class="col-sm-3 control-label">Zip<span
							style="color: red">*</span> :
						</label>
						<div class="col-sm-6">
							<input type="text" size="10" name="zip" maxlength="10"  id="postal_code" 
								required="required" placeholder="Ex.: xxxxx"
								pattern="^\d{5}(\-\d{4})?$" class="form-control">
						</div>
					</div>

					<div class="form-group">
						<label for="deliveryOption" class="col-sm-3 control-label">Delivery
							Option<span style="color: red">*</span> :
						</label>
						<div class="col-sm-6">
							<select class="form-control inputs" name="deliveryOption"
								id="deliveryOption">
								<option value="" selected="selected">Choose one...</option>
								<option value="1">Pick Up</option>
								<option value="2">Delivered</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="panel panel-warning">
				<div class="panel-heading">
					<h3 class="panel-title">Menu selection (optional)</h3>
				</div>
				<div class="panel-body">
					<label class="col-sm-3 control-label">Select menu type : </label>
					<div class="col-sm-6">
						<span id="cuisineType"></span>
					</div>
				</div>
			</div>
			<div class="col-sm-1 col-xs-6">
				<button type="button" class="btn btn-default"
					onclick="window.location.href='${pageContext.request.contextPath}/dashboard'">
					Cancel</button>
			</div>
			<div class="col-sm-1 col-sm-offset-9 col-xs-6">
				<button type="submit" class="btn btn-default">Create Event</button>
				<br /> <br /> <br />
			</div>
	</form>
</div>

<script>
	$('document').ready(function() {
		populateStateDropDown();
		populateCuisineTypes();
		//Cuisine type is not required here
		$("select[name=cuisineType]").removeAttr('required');
		$("input[id=datetimepicker]").datetimepicker({
			dayOfWeekStart : 1,
			lang : 'en'
		});
	});
	
	
	//Auto complete addresses script

	var placeSearch, autocomplete;
	var componentForm = {
	  street_number: 'short_name',
	  route: 'long_name',
	  locality: 'long_name',
	  administrative_area_level_1: 'short_name',
	 
	  postal_code: 'short_name'
	};

	function initAutocomplete() {
	  // Create the autocomplete object, restricting the search to geographical
	  // location types.
	  autocomplete = new google.maps.places.Autocomplete(
	      (document.getElementById('autocomplete')),
	      {types: ['geocode']});

	  // When the user selects an address from the dropdown, populate the address
	  // fields in the form.
	  autocomplete.addListener('place_changed', fillInAddress);
	}

	// [START region_fillform]
	function fillInAddress() {
	  // Get the place details from the autocomplete object.
	  var place = autocomplete.getPlace();

	  for (var component in componentForm) {
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
	}
	// [END region_fillform]

	// [START region_geolocation]
	// Bias the autocomplete object to the user's geographical location,
	// as supplied by the browser's 'navigator.geolocation' object.
	function geolocate() {
	  if (navigator.geolocation) {
	    navigator.geolocation.getCurrentPosition(function(position) {
	      var geolocation = {
	        lat: position.coords.latitude,
	        lng: position.coords.longitude
	      };
	      var circle = new google.maps.Circle({
	        center: geolocation,
	        radius: position.coords.accuracy
	      });
	      autocomplete.setBounds(circle.getBounds());
	    });
	  }
	}
	// [END region_geolocation]

	
</script>

