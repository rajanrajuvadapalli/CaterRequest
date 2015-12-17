<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="col-sm-10 col-sm-offset-1 page-header">
	<h1>Settings</h1>
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
	<div class="panel panel-info">
		<div class="panel-heading">
			<h3 class="panel-title">Personal Info</h3>
		</div>
		<div class="panel-body">

			<form class="form-horizontal" method="POST" id="profileForm"
				action="${pageContext.request.contextPath}/settings/personalInfo"
				enctype="multipart/form-data" autocomplete="off"
				onsubmit="return validateProfileForm();">
				<c:if test="${sessionScope.user.role.value == 'CUSTOMER'}">
					<div class="form-group">
						<label for="name" class="col-sm-3 control-label">Name<span
							style="color: red">*</span>:
						</label>
						<div class="col-sm-6">
							<input type="text" size="30" maxlength="50" name="name"
								required="required" class="form-control"
								value="${sessionScope.user.data.name}">
						</div>
					</div>
				</c:if>
				<c:if test="${sessionScope.user.role.value == 'RESTAURANT'}">
					<div class="form-group">
						<label for="" class="col-sm-3 control-label"> </label>
						<div class="col-sm-6">
							<c:if test="${sessionScope.env.isProd()}">
								<img
								src="https://s3-us-west-2.amazonaws.com/caterrequest-restaurant-profile-pics/Restaurant_${sessionScope.user.restaurantID}"
								alt="${sessionScope.user.data.restaurantName}" width="150">
							</c:if>
							<c:if test="${sessionScope.env.isUat()}">
								<img
								src="https://s3-us-west-2.amazonaws.com/rajrv-caterrequest-profile-pics/Restaurant_${sessionScope.user.restaurantID}"
								alt="${sessionScope.user.data.restaurantName}" width="150">
							</c:if>
							<input type="button" name="changeProfilePicButton"
								value="Change Pic" class="btn btn-default btn-sm">
						</div>
					</div>
					<div class="form-group hidden" id="restaurant-pic">
						<label for="profilePic" class="col-sm-3 control-label">
							Picture&nbsp;:</label>
						<div class="col-sm-6">
							<!-- Show only image files for selection & preview. Control button labels, styles, 
								 and icons for the browse, upload, and remove buttons. -->
							<input id="input-profile-pic" name="input-profile-pic"
								type="file"
								accept="image/x-png, image/gif, image/jpeg, image/jpg"
								class="file" data-show-upload="false" data-show-caption="true">
							<i>Accepted formats are PNG, JPG, JPEG and GIF. Image file
								size limit is 4MB.</i>
						</div>
					</div>
					<div class="form-group">
						<label for="restaurantName" class="col-sm-3 control-label">Restaurant
							Name<span style="color: red">*</span>:
						</label>
						<div class="col-sm-6">
							<input type="text" size="30" maxlength="50" name="restaurantName"
								required="required" class="form-control"
								value="${sessionScope.user.data.restaurantName}">
						</div>
					</div>
					<div class="form-group">
						<label for="cuisineType" class="col-sm-3 control-label">Cuisine
							Type<span style="color: red">*</span>:
						</label>
						<div class="col-sm-6">
							<input type="hidden" name="cuisineType" id="cuisineType"
								value="${sessionScope.user.data.cuisineType}"> <span
								id="cuisineType"></span>
						</div>
					</div>
					<div class="form-group">
						<label for="url" class="col-sm-3 control-label">Website
							URL<span style="color: red">*</span>:
						</label>
						<div class="col-sm-6">
							<input type="text" size="30" maxlength="50" name="url"
								required="required" class="form-control"
								value="${sessionScope.user.data.url}">
						</div>
					</div>
					<div class="form-group">
						<label for="deliver-miles" class="col-sm-3 control-label">Number
							of miles you can deliver<br />(optional):
						</label>
						<div class="col-sm-6" align="left">
							<input type="text" size="5" name="deliver-miles" pattern="\d+"
								class="form-control"
								placeholder="leave this field blank if you do not deliver"
								value="${sessionScope.user.data.deliverMiles}">
						</div>
					</div>
					<div class="form-group">
						<label for="aboutus" class="col-sm-3 control-label">About
							your restaurant<span style="color: red">*</span>:
						</label>
						<div class="col-sm-6">
							<textarea rows="4" name="aboutus" class="form-control"
								required="required">${sessionScope.user.data.aboutUs}</textarea>
						</div>
					</div>
				</c:if>
				<div class="form-group">
					<label for="phone" class="col-sm-3 control-label">Contact
						Phone<span style="color: red">*</span>:
					</label>
					<div class="row">
						<div class="col-sm-3">
							<input type="text" size="20" maxlength="20" name="phone"
								id="phone" class="form-control" required="required"
								placeholder="Ex.: xxxxxxxxxx" pattern="\d{10}"
								value="${sessionScope.user.data.phone}">
						</div>
						<c:choose>
							<c:when test="${sessionScope.user.data.numberVerified}">
								<div class="col-xs-1" align="left">
									<span class="glyphicon glyphicon-ok" style="color: green;"></span>
								</div>
							</c:when>
							<c:otherwise>
								<div class="col-sm-3" align="left">
									<button formaction="" id="send-pvc" class="btn btn-default">Re-send
										verification code</button>
								</div>

							</c:otherwise>
						</c:choose>
						<br />
						<div class="col-sm-6 col-sm-offset-3" id="customer" align="left">
							&nbsp;&nbsp;<input type="checkbox" name="smsOk"
								${sessionScope.user.data.smsOk?"checked":""}
								style="-webkit-transform: scale(1.5); -o-transform: scale(1.5); -ms-transform: scale(1.5); -moz-transform: scale(1.5); padding: 10px;">
							&nbsp;Send me text alerts<sup>*</sup>
						</div>
					</div>
				</div>
				<c:if test="${!sessionScope.user.data.numberVerified}">
					<div class="form-group">
						<label for="pvc" class="col-sm-3 control-label">Verification
							Code: </label>
						<div class="row">
							<div class="col-sm-3">
								<input type="text" size="10" maxlength="5" name="pvc" id="pvc"
									class="form-control"
									value="${sessionScope.user.data.phoneVerificationCode}"
									style="text-transform: uppercase"> <input type="text"
									hidden="true" value="${sessionScope.user.loginID}"
									id="pvc-loginID"> <input type="text" hidden="true"
									value="${sessionScope.user.role.value}" id="pvc-role">

								<input type="text" hidden="true"
									value="${pageContext.request.contextPath}" id="contextpath">

							</div>
							<div class="col-sm-1">
								<button formaction="" id="pvc" class="btn btn-default">Verify</button>
							</div>
						</div>
					</div>
				</c:if>
				<input type="hidden" name="LastAddressValidated" value="">
				<div class="alert alert-danger hidden" id="addressnotok">
					<button type="button" class="close btn-lg" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					Address validation failed. Please check your address.<br /> If the
					problem persists, please contact customer support.
				</div>
				<div class="form-group">
					<label for="street1" class="col-sm-3 control-label">Street<span
						style="color: red">*</span>:
					</label>

					<div class="col-sm-6">
						<input type="text" size="30" maxlength="50" name="street1"
							class="form-control" value="${sessionScope.user.data.street1}">
					</div>
				</div>
				<!--div class="form-group">
					<label for="street2" class="col-sm-3 control-label">Street
						2<span style="color: red">*</span>: </label>

					<div class="col-sm-6">
						<input type="text" size="30" maxlength="50" name="street2"
							class="form-control" value="${sessionScope.user.data.street2}">
					</div>
				</div -->
				<div class="form-group">
					<label for="city" class="col-sm-3 control-label">City<span
						style="color: red">*</span>:
					</label>

					<div class="col-sm-6">
						<input type="text" size="30" maxlength="50" name="city"
							class="form-control" value="${sessionScope.user.data.city}">
					</div>
				</div>
				<div class="form-group">
					<label for="state" class="col-sm-3 control-label">State<span
						style="color: red">*</span>:
					</label>
					<div class="col-sm-6">
						<input type="hidden" name="stateExisting"
							value="${sessionScope.user.data.state}"> <span
							id="stateArea"></span>
					</div>
				</div>
				<div class="form-group">
					<label for="zip" class="col-sm-3 control-label">Zip<span
						style="color: red">*</span>:
					</label>

					<div class="col-sm-6">
						<input type="text" size="10" name="zip" maxlength="10"
							class="form-control" placeholder="Ex.: xxxxx"
							pattern="^\d{5}(\-\d{4})?$" value="${sessionScope.user.data.zip}">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label"></label>

					<div class="col-sm-6" align="left">
						<button type="submit" class="btn btn-default">Update</button>
					</div>
				</div>

			</form>
		</div>
	</div>
</div>
<div class="col-sm-10 col-sm-offset-1">
	<span style="color: gray; font-size: 14px;"><sup>*</sup>carrier
		charges may apply</span>
</div>

<script>
	$('document').ready(function() {
		populateCuisineTypes();
		populateStateDropDown();
		var existingState = $('input[name=stateExisting]').val();
		$('select[name=state]').val(existingState);
		var existingCuisine = $('input[name=cuisineType]').val();
		$('select[name=cuisineType]').val(existingCuisine);
		$("input[name=changeProfilePicButton]").click(function() {
			$("div[id=restaurant-pic]").removeClass("hidden");
		});
	});
</script>