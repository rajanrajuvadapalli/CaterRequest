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

<div class="col-sm-10 col-sm-offset-1">
	<div class="panel panel-info">
		<div class="panel-heading">
			<h3 class="panel-title">Personal Info</h3>
		</div>
		<div class="panel-body">

			<form class="form-horizontal" method="POST" id="profileFormCustomer"
				action="${pageContext.request.contextPath}/settings/personalInfo/customer"
				enctype="multipart/form-data" autocomplete="off"
				onsubmit="return validateProfileFormCustomer();">
				<c:if test="${sessionScope.user.role.value == 'CUSTOMER'}">
					<div class="form-group">
						<label for="name" class="col-sm-3 control-label">Name<span
							style="color: red">*</span>:
						</label>
						<div class="col-sm-6">
							<input type="text" size="30" maxlength="50" name="name"
								required="required" class="form-control"
								value="${sessionScope.user.customer.name}">
						</div>
					</div>

					<div class="form-group">
						<label for="phone" class="col-sm-3 control-label">Contact
							Phone<span style="color: red">*</span>:
						</label>
						<div class="row">
							<div class="col-sm-3">
								<input type="text" size="20" maxlength="20" name="phone"
									id="phone" class="form-control" required="required"
									placeholder="Ex.: xxxxxxxxxx" pattern="\d{10}"
									value="${sessionScope.user.customer.contactNumber}">
							</div>
							<c:choose>
								<c:when test="${sessionScope.user.customer.numberVerified}">
									<div class="col-xs-1" align="left">
										<span class="glyphicon glyphicon-ok" style="color: green;"></span>
									</div>
								</c:when>
								<c:otherwise>
									<div class="col-sm-3" align="left">
										<button formaction="" onclick="sendPhoneVerificationCode('')"
											id="send-pvc" class="btn btn-default">Re-send
											verification code</button>
									</div>

								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-sm-3 control-label"></label>
						<div class="col-sm-6">
							&nbsp;<input type="checkbox" name="smsOk" id="customer"
								${sessionScope.user.customer.smsOk?"checked":""}
								style="-webkit-transform: scale(1.5); -o-transform: scale(1.5); -ms-transform: scale(1.5); -moz-transform: scale(1.5); padding: 10px;">&nbsp;&nbsp;<span
								id="customer">Send me text alerts <span
								class="glyphicon glyphicon-question-sign" style="color: #00b6e6"
								data-toggle="tooltip" title="Carrier charges may apply."></span></span>
						</div>
					</div>
					<c:if test="${!sessionScope.user.customer.numberVerified}">
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
									<button formaction=""
										onclick="validatePhoneVerificationCode('')" id="pvc"
										class="btn btn-default">Verify</button>
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
						Address validation failed. Please check your address.<br /> If
						the problem persists, please contact customer support.
					</div>
					<div class="form-group">
						<label for="street1" class="col-sm-3 control-label">Street<span
							style="color: red">*</span>:
						</label>

						<div class="col-sm-6">
							<input type="text" size="30" maxlength="50" name="street1"
								class="form-control"
								value="${sessionScope.user.customer.address.street1} ${sessionScope.user.customer.address.street2}">
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
								class="form-control"
								value="${sessionScope.user.customer.address.city}">
						</div>
					</div>
					<div class="form-group">
						<label for="state" class="col-sm-3 control-label">State<span
							style="color: red">*</span>:
						</label>
						<div class="col-sm-6">
							<input type="hidden" name="stateExisting"
								value="${sessionScope.user.customer.address.state}"> <span
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
								pattern="^\d{5}(\-\d{4})?$"
								value="${sessionScope.user.customer.address.zip}">
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-3 control-label"></label>

						<div class="col-sm-6" align="left">
							<button type="submit" class="btn btn-default">Update</button>
						</div>
					</div>
				</c:if>
			</form>
		</div>
	</div>
</div>

<div class="col-sm-10 col-sm-offset-1">
	<div class="panel panel-info">
		<div class="panel-heading">
			<h3 class="panel-title">Change Password</h3>
		</div>
		<div class="panel-body">
			<form class="form-horizontal" method="POST" id="accountSettingsForm"
				action="${pageContext.request.contextPath}/settings/changePassword"
				novalidate enctype="application/x-www-form-urlencoded"
				autocomplete="off" onsubmit="return validateAccountSettingsForm();">
				<div class="form-group">
					<label for="currPwd" class="col-sm-3 control-label">Current
						Password: </label>

					<div class="col-sm-6">
						<input type="password" size="30" id="currPwd" name="currPwd"
							class="form-control" autocomplete="off">
					</div>
				</div>
				<div class="form-group">
					<label for="newPwd1" class="col-sm-3 control-label">New
						Password: </label>

					<div class="col-sm-6">
						<input type="password" size="30" id="newPwd1" name="newPwd1"
							class="form-control" autocomplete="off">
					</div>
				</div>
				<div class="form-group">
					<label for="newPwd2" class="col-sm-3 control-label">Retype
						New Password: </label>
					<div class="col-sm-6">
						<input type="password" size="30" id="newPwd2" name="newPwd2"
							class="form-control" autocomplete="off">
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

<script>
	$('document').ready(function() {
		populateStateDropDown();
		var existingState = $('input[name=stateExisting]').val();
		$('select[name=state]').val(existingState);
	});
</script>