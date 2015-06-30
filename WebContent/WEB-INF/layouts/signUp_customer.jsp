<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="col-sm-offset-2 page-header">
	<h1>Registration</h1>
</div>

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

<div class="container container-fluid">
	<form class="form-horizontal" method="POST" id="register-form"
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
						<label for="name" class="col-sm-4 control-label">Name&nbsp;:</label>
						<div class="col-sm-6">
							<input type="text" size="30" maxlength="50" name="name"
								required="required" placeholder="First   Last"
								class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="email" class="col-sm-4 control-label">Email/Username&nbsp;:</label>
						<div class="col-sm-6">
							<input type="email" size="30" name="email" required="required"
								placeholder="Ex.: jenny@gmail.com" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="pwd1" class="col-sm-4 control-label">Password&nbsp;:</label>
						<div class="col-sm-6">
							<input type="password" size="30" name="pwd1" id="pwd1"
								required="required" placeholder="Password" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="pwd2" class="col-sm-4 control-label">Confirm
							Password&nbsp;:</label>
						<div class="col-sm-6">
							<input type="password" size="30" name="pwd2" id="pwd2"
								required="required" placeholder="Re-enter Password"
								class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="phone" class="col-sm-4 control-label">Contact
							Phone&nbsp;:</label>
						<div class="col-sm-6" align="left">
							<input type="text" size="30" name="phone" required="required"
								placeholder="Ex.: xxxxxxxxxx"
								pattern="\d{10}"
								class="form-control">
							&nbsp;<input type="checkbox" name="smsOk" id="customer"
								style="-webkit-transform: scale(1.5); -o-transform: scale(1.5); -ms-transform: scale(1.5); -moz-transform: scale(1.5); padding: 10px;">&nbsp;&nbsp;<span
								id="customer">Send me text alerts <sup>*</sup></span>
						</div>
					</div>
					<div class="form-group" id="customer">
						<label for="pwd2" class="col-sm-4 control-label">How did
							you hear about us&nbsp;?</label>
						<div class="col-sm-6">
							<select class="inputs" name="hearAboutUs"
								id="hearAboutUs" required="required">
								<option value="" selected="selected">Choose one...</option>
								<option value="friend_referral">Friend/referral</option>
								<option value="google">Google Search</option>
								<option value="online_ad">Online advertisement</option>
								<option value="social_media">Social Media</option>
								<option value="restaurant">Restaurant</option>
							</select>
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
						<label for="street1" class="col-sm-4 control-label">Street
							1&nbsp;:</label>
						<div class="col-sm-6">
							<input type="text" size="30" maxlength="50" name="street1"
								required="required" placeholder="Line 1" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="street2" class="col-sm-4 control-label">Street
							2&nbsp;:</label>
						<div class="col-sm-6">
							<input type="text" size="30" maxlength="50" name="street2"
								placeholder="Line 2" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="city" class="col-sm-4 control-label">City&nbsp;:</label>
						<div class="col-sm-6">
							<input type="text" size="30" name="city" required="required"
								placeholder="City" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="state" class="col-sm-4 control-label">State&nbsp;:</label>
						<div class="col-sm-6">
							<span id="stateArea"></span>
						</div>
					</div>
					<div class="form-group">
						<label for="zip" class="col-sm-4 control-label">Zip&nbsp;:</label>
						<div class="col-sm-6">
							<input type="text" size="10" name="zip" maxlength="10"
								required="required" placeholder="Ex.: xxxxx"
								pattern="^\d{5}(\-\d{4})?$"
								class="form-control">
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
		<div align="left" id="customer">
			<span style="color: gray; font-size: 14px;"><sup>*</sup>carrier
				charges may apply</span>
		</div>
	</form>
</div>

<script>
$('document').ready(function(){
	populateStateDropDown();
});
</script>
