<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
		<input type="text" hidden="hidden" name="cuisineType" value="${sessionScope.cuisineType}">
		
		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">The Basics</h3>
			</div>
			<div class="panel-body">

				<div class="form-group">
					<label for="name" class="col-sm-3 control-label">Event Name<span
						style="color: red">*</span> :
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
						of Kids :
					</label>
					<div class="col-sm-6">
						<input type="text" size="20" maxlength="20" name="kids_count"
							id="kids_count" pattern="[0-9]+"
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
				<!-- <input type="hidden" name="LastAddressValidated" value="">
					<div class="alert alert-danger hidden" id="addressnotok">
						<button type="button" class="close btn-lg" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						Address validation failed. Please check your address.<br /> If
						the problem persists, please contact customer support.
					</div> -->
				<div class="form-group">
					<label for="addressText" class="col-sm-3 control-label"> </label>
					<div class="col-sm-6" id="locationField">
						<input id="autocomplete" name="addressString" placeholder="Enter your address"
							onFocus="geolocate()" type="text" class="form-control" autocomplete="off"
							value="${sessionScope.addressString}">
					</div>
				</div>
				<div id="address" style="display:none;">
				<div class="form-group">
					<label for="street1" class="col-sm-3 control-label">Street
						<span style="color: red">*</span> :
					</label>
					<div class="col-sm-2">
						<input type="text" size="5" maxlength="10" name="street_number"
							id="street_number" placeholder="Street #" class="form-control"
							value="${sessionScope.street_number}">
					</div>
					<div class="col-sm-4">
						<input type="text" size="30" maxlength="50" name="street_name"
							id="route" required="required" placeholder="Street Name"
							class="form-control" value="${sessionScope.street_name}">
					</div>
				</div>
				<div class="form-group">
					<label for="street2" class="col-sm-3 control-label">Apt/Ste
						:</label>
					<div class="col-sm-3">
						<span id="apt_classifier"></span>
					</div>
					<div class="col-sm-3">
						<input type="text" size="30" maxlength="50" name="street2"
							placeholder="" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label for="city" class="col-sm-3 control-label">City<span
						style="color: red">*</span> :
					</label>
					<div class="col-sm-6">
						<input type="text" size="30" name="city" required="required"
							id="locality" placeholder="City" class="form-control"
							value="${sessionScope.event.location.city}">
					</div>
				</div>
				<div class="form-group">
					<label for="state" class="col-sm-3 control-label">State<span
						style="color: red">*</span> :
					</label>
					<div class="col-sm-6">
						<input type="text" size="30" name="state" required="required"
							id="administrative_area_level_1" placeholder="State"
							class="form-control" value="${sessionScope.event.location.state}">
					</div>
				</div>
				<div class="form-group">
					<label for="zip" class="col-sm-3 control-label">Zip<span
						style="color: red">*</span> :
					</label>
					<div class="col-sm-6">
						<input type="text" size="10" name="zip" maxlength="10"
							id="postal_code" required="required" placeholder="Ex.: xxxxx"
							pattern="^\d{5}(\-\d{4})?$" class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label for="deliveryOption" class="col-sm-3 control-label">Delivery
						Option<span style="color: red">*</span> :
					</label>
					<div class="col-sm-6">
						<span id="deliveryOption"></span>
					</div>
				</div>
				</div>
			</div>
			
		</div>
		<!-- Guests will start by selecting the menu, so no need for this div -->
		<c:if test="${!sessionScope.user.isGuest()}">
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
		</c:if>
		<c:if test="${!sessionScope.user.isGuest()}">
			<div class="col-sm-1 col-xs-6">
				<button type="button" class="btn btn-default"
					onclick="window.location.href='${pageContext.request.contextPath}/dashboard'">
					Cancel</button>
			</div>
		</c:if>
		<div class="col-sm-1 col-sm-offset-9 col-xs-6">
			<c:choose>
				<c:when test="${sessionScope.user.isGuest()}">
					<button type="submit" class="btn btn-default">Next</button>
				</c:when>
				<c:otherwise>
					<button type="submit" class="btn btn-default">Create Event</button>
				</c:otherwise>
			</c:choose>
			<br /> <br /> <br />
		</div>
	</form>
</div>

<script>
	$('document').ready(
			function() {
				//populateStateDropDown();
				populateCuisineTypes();
				populateAptSuite();
				populateDeliveryOption();
				//Cuisine type is not required here
				$("select[name=cuisineType]").removeAttr('required');
				$("input[id=datetimepicker]").datetimepicker(
						{
							dayOfWeekStart : 0,
							lazyInit : true,
							lang : 'en',
							//closeOnDateSelect : true,
							minDate : moment().add(72, "hours").format(
									'YYYY/MM/DD'), //for today use 0 or -1970/01/01
							startDate : moment().add(72, "hours").format(
									'YYYY/MM/DD'),
							//step : 15,
							//minTime : '06:00',
							//maxTime : '21:00',
							allowTimes : [ '6:00', '6:15', '6:30', '6:45',
									'7:00', '7:15', '7:30', '7:45', '8:00',
									'8:15', '8:30', '8:45', '9:00', '9:15',
									'9:30', '9:45', '10:00', '10:15', '10:30',
									'10:45', '11:00', '11:15', '11:30',
									'11:45', '12:00', '12:15', '12:30',
									'12:45', '13:00', '13:15', '13:30',
									'13:45', '14:00', '14:15', '14:30',
									'14:45', '15:00', '15:15', '15:30',
									'15:45', '16:00', '16:15', '16:30',
									'16:45', '17:00', '17:15', '17:30',
									'17:45', '18:00', '18:15', '18:30',
									'18:45', '19:00', '19:15', '19:30',
									'19:45', '20:00', '20:15', '20:30',
									'20:45', '21:00' ]
						});
			});
</script>

