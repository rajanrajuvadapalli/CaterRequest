<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="col-sm-10 col-sm-offset-1 page-header">
	<h1>Registration</h1>
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

<div class="container container-fluid">
	<div>
		<h2>Are you a Restaurant Owner?</h2>
		<p>Improve your business in Catering space with minimal to zero
			efforts. Cater Request handles the tiresome process of finding the
			customers and gathering all the information required from customer
			for their catering order. All you have to do is login into Cater
			Request and give price quote for the customer's request.</p>

		<h2>How it works:</h2>
		<ol>
			<li>Customer requests for price quote.</li>
			<li>Restaurant responds to customer's request.</li>
			<li>Customer review the request and makes payment to confirm the
				order.</li>
		</ol>

		<h2>Why choose Cater Request:</h2>
		<ol>
			<li>Saves Time We provide more exposure to your business.</li>
			<li>No more confusion over the order.</li>
		</ol>
	</div>
	<br /> <br />
	<form class="form-horizontal" method="POST"
		id="restaurant-register-form"
		action="${pageContext.request.contextPath}/register"
		enctype="multipart/form-data"
		onsubmit="return validateRegistrationFormOnSubmit();">
		<input type="hidden" name="as" value="restaurant">
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
								data-show-caption="true"
								placeholder="Upload png, jpg, jpeg or gif image">
						</div>
					</div>
					<div class="form-group" id="restaurant">
						<label for="restaurantName" class="col-sm-4 control-label">Restaurant&nbsp;Name<span
							style="color: red">*</span>:
						</label>
						<div class="col-sm-6">
							<input type="text" size="30" maxlength="50" name="restaurantName"
								required="required" placeholder="Restaurant Name"
								class="form-control">
						</div>
					</div>
					<div class="form-group" id="restaurant">
						<label for="cuisineType" class="col-sm-4 control-label">Cuisine
							Type<span style="color: red">*</span>:
						</label>
						<div class="col-sm-6">
							<span id="cuisineType"></span>
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
					<div class="form-group">
						<label for="email" class="col-sm-4 control-label">Email/Username<span
							style="color: red">*</span>:
						</label>
						<div class="col-sm-6">
							<input type="email" size="30" name="email" required="required"
								placeholder="Ex.: jenny@gmail.com" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="pwd1" class="col-sm-4 control-label">Password<span
							style="color: red">*</span>:
						</label>
						<div class="col-sm-6">
							<input type="password" size="30" name="pwd1" id="pwd1"
								required="required" placeholder="Password" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="pwd2" class="col-sm-4 control-label">Confirm
							Password<span style="color: red">*</span>:
						</label>
						<div class="col-sm-6">
							<input type="password" size="30" name="pwd2" id="pwd2"
								required="required" placeholder="Re-enter Password"
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
						<label for="pwd2" class="col-sm-4 control-label">How did
							you hear about us?<span style="color: red">*</span>
						</label>
						<div class="col-sm-6">
							<input type="text" hidden="true"
								value="${pageContext.request.contextPath}" id="contextpath">
							<span id="hearAboutUs"></span>
						</div>
					</div>
					<div class="form-group">
						<label for="aboutus" class="col-sm-4 control-label">Tell
							us something about your restaurant<span style="color: red">*</span>:
						</label>
						<div class="col-sm-6">
							<textarea rows="4" name="aboutus" class="form-control"
								required="required"></textarea>
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
						<label for="street1" class="col-sm-4 control-label">Street<span
							style="color: red">*</span>:
						</label>
						<div class="col-sm-6">
							<input type="text" size="30" maxlength="50" name="street1"
								required="required" placeholder="Line 1" class="form-control">
						</div>
					</div>
					<!-- <div class="form-group">
						<label for="street2" class="col-sm-4 control-label">Street
							2<span
							style="color: red">*</span>&nbsp;:</label>
						<div class="col-sm-6">
							<input type="text" size="30" maxlength="50" name="street2"
								placeholder="Line 2" class="form-control">
						</div>
					</div> -->
					<div class="form-group">
						<label for="city" class="col-sm-4 control-label">City<span
							style="color: red">*</span>:
						</label>
						<div class="col-sm-6">
							<input type="text" size="30" name="city" required="required"
								placeholder="City" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="state" class="col-sm-4 control-label">State<span
							style="color: red">*</span>:
						</label>
						<div class="col-sm-6">
							<span id="stateArea"></span>
						</div>
					</div>
					<div class="form-group">
						<label for="zip" class="col-sm-4 control-label">Zip<span
							style="color: red">*</span>:
						</label>
						<div class="col-sm-6">
							<input type="text" size="10" name="zip" maxlength="10"
								required="required" placeholder="Ex.: xxxxx"
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
					<div id="consent-menu"></div>
					<%-- <c:forEach items="${menu.categories}" var="category">
						<c:if test="${not empty category.items}">
							<div class="col-sm-12">
								<b>${category.name}</b>
								<ol>
									<c:forEach items="${category.items}" var="item">
										<li>${item.name}</li>
									</c:forEach>
								</ol>
							</div>
						</c:if>
					</c:forEach> --%>
					<div class="col-sm-6">
						<br /> <br /> <input required type="checkbox" name="menuconsent"
							value="yes"> I accept the menu. <br /> <br />
						<button type="submit" class="btn btn-default"
							name="register-button">Register</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>

<script>
	$('document').ready(function() {
		populateCuisineTypes();
		populateHearAboutUs();
		populateStateDropDown();
		$("button[name=register-button]").prop('disabled', true);
		$("input[name=menuconsent]").change(function() {
			var element = $("button[name=register-button]");
			if (this.checked) {
				//element.addClass("btn-default");
				element.prop('disabled', false);
			} else {
				//element.removeClass("btn-default");
				element.prop('disabled', true);
			}
		});
		$("select[name=cuisineType]").change(populateMenuForRestaurantConsent);

	});
</script>
