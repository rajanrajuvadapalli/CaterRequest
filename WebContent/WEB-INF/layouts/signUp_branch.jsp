<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="col-sm-10 col-sm-offset-1 page-header">
	<h1>Add a Branch/Restaurant</h1>
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
					<li>${e}</li>
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
					<li>${sm}</li>
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
					<li>${w}</li>
				</c:forEach>
			</ul>
		</div>
	</c:if>
</div>

<div class="row">
	<div class="col-sm-11 col-sm-offset-1">
		<form class="form-horizontal" method="POST"
			id="restaurant-register-form"
			action="${pageContext.request.contextPath}/restaurant/addBranch"
			enctype="multipart/form-data"
			onsubmit="return validateAddBranchFormOnSubmit();">
			<div class="col-sm-12">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">Personal Info</h3>
					</div>
					<div class="panel-body">
						<div class="form-group" id="restaurant">
							<label for="profilePic" class="col-sm-4 control-label">Upload
								Picture<span style="color: red">*</span>:
							</label>
							<div class="col-sm-6">
								<!-- Show only image files for selection & preview. Control button labels, styles, 
								 and icons for the browse, upload, and remove buttons. -->
								<input id="input-profile-pic" name="input-profile-pic"
									type="file"
									accept="image/x-png, image/gif, image/jpeg, image/jpg"
									class="file" required="required" data-show-upload="false"
									data-show-caption="true"> <i>Accepted formats are
									PNG, JPG, JPEG and GIF. Image file size limit is 4MB.</i>
							</div>
						</div>
						<div class="form-group" id="restaurant">
							<label for="restaurantName" class="col-sm-4 control-label">Restaurant&nbsp;Name<span
								style="color: red">*</span>:
							</label>
							<div class="col-sm-6">
								<input type="text" size="30" maxlength="50"
									name="restaurantName" required="required"
									placeholder="Restaurant Name" class="form-control">
							</div>
						</div>
						<div class="form-group" id="restaurant">
							<label for="cuisineType" class="col-sm-4 control-label">Primary
								Cuisine Type: </label>
							<div class="col-sm-6">
								<input type="text" hidden="true"
									value="${pageContext.request.contextPath}" id="contextpath">
								<span id="cuisineType"></span> <span
									class="glyphicon glyphicon-question-sign"
									style="color: #00b6e6" data-toggle="tooltip"
									title="You will be included in the bidding process only if you have a primary cuisine."></span>
							</div>
						</div>
						<div class="form-group" id="restaurant">
							<label for="cuisineType" class="col-sm-4 control-label">Secondary
								Cuisine Types: </label>
							<div class="col-sm-6">
								<span id="cuisineType_sec"></span>
							</div>
						</div>
						<div class="form-group" id="restaurant">
							<label for="url" class="col-sm-4 control-label">Website
								URL<span style="color: red">*</span>:
							</label>
							<div class="col-sm-6">
								<input type="url" size="50" name="url"
									placeholder="Ex.: http://www.example.com" class="form-control">
							</div>
						</div>
						<div class="panel-body">
							<div class="form-group">
								<label for="email" class="col-sm-4 control-label">Contact
									Email<span style="color: red">*</span>:
								</label>
								<div class="col-sm-6">
									<input type="email" size="30" name="email" required="required"
										class="form-control">
								</div>
							</div>
							<div class="form-group">
								<label for="phone" class="col-sm-4 control-label">Contact
									Phone<span style="color: red">*</span>:
								</label>
								<div class="col-sm-6" align="left">
									<input type="text" size="30" name="phone" required="required"
										placeholder="Ex.: xxxxxxxxxx" pattern="\d{10}"
										class="form-control">
								</div>
							</div>
							<div class="form-group">
								<label for="sales" class="col-sm-4 control-label">Sales
									Tax<span style="color: red">*</span>:
								</label>
								<div class="col-sm-6" align="left">
									<input type="text" size="30" name="sales" required="required"
										placeholder="Ex: x.xx" pattern="[0-9]+([\.|,][0-9]+)?"
										class="form-control">
								</div>
							</div>
							<div class="form-group">
								<label for="deliver-miles" class="col-sm-4 control-label">Number
									of miles you can deliver<br />(optional):
								</label>
								<div class="col-sm-6" align="left">
									<input type="text" size="5" name="deliver-miles" pattern="\d+"
										class="form-control"
										placeholder="leave this field blank if you do not deliver">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="panel panel-success">
					<div class="panel-heading">
						<h3 class="panel-title">Address</h3>
					</div>
					<div class="panel-body">
						<div class="form-group">
							<label for="addressText" class="col-sm-4 control-label">
							</label>
							<div class="col-sm-6" id="locationField">
								<input id="autocomplete" placeholder="Enter your address"
									onFocus="geolocate()" type="text" class="form-control"
									autocomplete="off">
							</div>
						</div>
						<div class="form-group">
							<label for="street1" class="col-sm-4 control-label">Street
								<span style="color: red">*</span> :
							</label>
							<div class="col-sm-2">
								<input type="text" size="5" maxlength="10" name="street_number"
									id="street_number" placeholder="Street #" class="form-control">
							</div>
							<div class="col-sm-4">
								<input type="text" size="30" maxlength="50" name="street_name"
									id="route" required="required" placeholder="Street Name"
									class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label for="street2" class="col-sm-4 control-label">Apt/Ste
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
							<label for="city" class="col-sm-4 control-label">City<span
								style="color: red">*</span> :
							</label>
							<div class="col-sm-6">
								<input type="text" size="30" name="city" required="required"
									id="locality" placeholder="City" class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label for="state" class="col-sm-4 control-label">State<span
								style="color: red">*</span> :
							</label>
							<div class="col-sm-6">
								<input type="text" size="2" maxlength="2" name="state"
									required="required" id="administrative_area_level_1"
									placeholder="State" class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label for="zip" class="col-sm-4 control-label">Zip<span
								style="color: red">*</span> :
							</label>
							<div class="col-sm-6">
								<input type="text" size="10" name="zip" maxlength="10"
									id="postal_code" required="required" placeholder="Ex.: xxxxx"
									pattern="^\d{5}(\-\d{4})?$" class="form-control">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-12">
				<div class="panel panel-success">
					<div class="panel-heading">
						<h3 class="panel-title">Menu</h3>
					</div>
					<div class="panel-body">
						<div id="consent-menu">
							<p>Please select the cuisine type above to continue.</p>
						</div>
						<div class="col-sm-6">
							<button type="submit" class="btn btn-default"
								name="add-branch-button" disabled="true">Add Branch</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>

<script>
	$('document').ready(
			function() {
				populateCuisineTypesDrowpdown();
				populateCuisineTypesCheckbox();
				populateAptSuite();
				$("select[name=cuisineType]").change(
						populateMenuForRestaurantConsent);
				$("select[name=cuisineType]").change(
						function() {
							var selectedCT = $(this).val();
							//console.log("Primary cuisine: " + selectedCT);
							//First clear all disabled attributes.
							$("input[name=cuisineType_sec]").each(function() {
								$(this).removeAttr("disabled");
								$(this).attr("checked", false);
							});
							//Disable primary cuisine from secondary list.
							$(
									"input[name=cuisineType_sec][value='"
											+ selectedCT + "']").attr(
									"disabled", "disabled");
						});
				$("input[name=menuconsent]").live('change', function() {
					var element = $("button[name=add-branch-button]");
					if (this.checked) {
						element.prop('disabled', false);
					} else {
						element.prop('disabled', true);
					}
				});
			});
</script>
