<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> -->
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
	<form class="form-horizontal" method="POST" id="customer-register-form"
		action="${pageContext.request.contextPath}/register"
		enctype="multipart/form-data"
		onsubmit="return validateRegistrationFormOnSubmit();">
		<input type="hidden" name="as" value="customer">
		<div class="col-sm-12">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">Personal Info</h3>
				</div>
				<div class="panel-body">
					<div class="form-group" id="customer">
						<label for="name" class="col-sm-4 control-label">Name<span
							style="color: red">*</span>&nbsp;:
						</label>
						<div class="col-sm-6">
							<input type="text" size="30" maxlength="50" name="name"
								required="required" placeholder="First   Last"
								class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="email" class="col-sm-4 control-label">Email/Username<span
							style="color: red">*</span>&nbsp;:
						</label>
						<div class="col-sm-6">
							<input type="email" size="30" name="email" required="required"
								placeholder="Ex.: jenny@gmail.com" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="pwd1" class="col-sm-4 control-label">Password<span
							style="color: red">*</span>&nbsp;:
						</label>
						<div class="col-sm-6">
							<input type="password" size="30" name="pwd1" id="pwd1"
								required="required" placeholder="Password" class="form-control" autocomplete="off">
						</div>
					</div>
					<div class="form-group">
						<label for="pwd2" class="col-sm-4 control-label">Confirm
							Password<span style="color: red">*</span>&nbsp;:
						</label>
						<div class="col-sm-6">
							<input type="password" size="30" name="pwd2" id="pwd2"
								required="required" placeholder="Re-enter Password"
								class="form-control" autocomplete="off">
						</div>
					</div>
					<div class="form-group">
						<label for="phone" class="col-sm-4 control-label">Contact
							Phone<span style="color: red">*</span>&nbsp;:
						</label>
						<div class="col-sm-6" align="left">
							<input type="text" size="30" name="phone" required="required"
								placeholder="Ex.: xxxxxxxxxx" pattern="\d{10}"
								class="form-control"><br/>&nbsp;<input type="checkbox"
								name="smsOk" id="customer"
								style="-webkit-transform: scale(1.5); -o-transform: scale(1.5); -ms-transform: scale(1.5); -moz-transform: scale(1.5); padding: 10px;">&nbsp;&nbsp;<span
								id="customer">Send me text alerts <span class="glyphicon glyphicon-question-sign" style="color:#00b6e6" data-toggle="tooltip"  title="Carrier charges may apply."></span></span>
						</div>
					</div>
					<div class="form-group" id="customer">
						<label for="pwd2" class="col-sm-4 control-label">How did
							you hear about us&nbsp;?<span style="color: red">*</span>
						</label>
						<div class="col-sm-6">
							<span id="hearAboutUs"></span>
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
						<label for="addressText" class="col-sm-4 control-label"> </label>
						<div class="col-sm-6" id="locationField">
							<input id="autocomplete" placeholder="Enter your address"
								onFocus="geolocate()" type="text" class="form-control" autocomplete="off">
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
							<input type="text" size="2" maxlength="2" name="state" required="required"
								id="administrative_area_level_1" placeholder="State"
								class="form-control">
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
					<div class="form-group">
						<label class="col-sm-4 control-label"></label>
						<div class="col-sm-6" align="left">
							<button type="submit" class="btn btn-default">Register</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>

<script>
	$('document').ready(function() {
		//populateStateDropDown();
		populateHearAboutUs();
		populateAptSuite();
	});
</script>
