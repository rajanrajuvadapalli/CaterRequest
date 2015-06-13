<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="page-header">
	<h1>Settings</h1>
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

<div class="col-sm-12">
	<div class="panel panel-info">
		<div class="panel-heading">
			<h3 class="panel-title">Personal Info</h3>
		</div>
		<div class="panel-body">

			<form class="form-horizontal" method="POST" id="profileForm"
				action="${pageContext.request.contextPath}/settings/personalInfo"
				ectype="application/x-www-form-urlencoded"
				autocomplete="off"
				onsubmit="return validateProfileForm();">
				<c:if test="${sessionScope.user.role.value == 'CUSTOMER'}">
					<div class="form-group">

						<label for="name" class="col-sm-3 control-label">Name&nbsp;:</label>
						<div class="col-sm-6">
							<input type="text" size="30" maxlength="50" name="name"
								required="required" class="form-control"
								value="${sessionScope.user.data.name}">
						</div>
					</div>
				</c:if>
				<c:if test="${sessionScope.user.role.value == 'RESTAURANT'}">
					<div class="form-group">
						<label for="restaurantName" class="col-sm-3 control-label">Restaurant
							Name: </label>
						<div class="col-sm-6">
							<input type="text" size="30" maxlength="50" name="restaurantName"
								required="required" class="form-control"
								value="${sessionScope.user.data.restaurantName}">
						</div>
					</div>
					<div class="form-group">
						<label for="cuisineType" class="col-sm-3 control-label">Cuisine
							Type: </label>
						<div class="col-sm-6">
							<input type="text" size="30" maxlength="30" name="cuisineType"
								id="cuisineType" required="required" class="form-control"
								value="${sessionScope.user.data.cuisineType}">
						</div>
					</div>
					<div class="form-group">
						<label for="url" class="col-sm-3 control-label">Website
							URL: </label>
						<div class="col-sm-6">
							<input type="text" size="30" maxlength="50" name="url"
								required="required" class="form-control"
								value="${sessionScope.user.data.url}">
						</div>
					</div>

				</c:if>
				<div class="form-group">
					<label for="phone" class="col-sm-3 control-label">Contact
						Phone: </label>
					<div class="row">
						<div class="col-sm-3">
							<input type="text" size="20" maxlength="20" name="phone"
								id="phone" class="form-control" required="required"
								placeholder="Ex.: xxxxxxxxxx"
								pattern="\d{10}"
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
				<div class="form-group">
					<label for="street1" class="col-sm-3 control-label">Street
						1: </label>

					<div class="col-sm-6">
						<input type="text" size="30" maxlength="50" name="street1"
							class="form-control" value="${sessionScope.user.data.street1}">
					</div>
				</div>
				<div class="form-group">
					<label for="street2" class="col-sm-3 control-label">Street
						2: </label>

					<div class="col-sm-6">
						<input type="text" size="30" maxlength="50" name="street2"
							class="form-control" value="${sessionScope.user.data.street2}">
					</div>
				</div>
				<div class="form-group">
					<label for="city" class="col-sm-3 control-label">City: </label>

					<div class="col-sm-6">
						<input type="text" size="30" maxlength="50" name="city"
							class="form-control" value="${sessionScope.user.data.city}">
					</div>
				</div>
				<div class="form-group">
					<label for="state" class="col-sm-3 control-label">State: </label>
					<div class="col-sm-6">
						<input type="hidden" name="stateExisting" value="${sessionScope.user.data.state}">
						<span id="stateArea"></span>
					</div>
				</div>
				<div class="form-group">
					<label for="zip" class="col-sm-3 control-label">Zip: </label>

					<div class="col-sm-6">
						<input type="text" size="10" name="zip" maxlength="10"
							class="form-control"
							placeholder="Ex.: xxxxx"
							pattern="^\d{5}(\-\d{4})?$"
							value="${sessionScope.user.data.zip}">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-3 control-label"></label>

					<div class="col-sm-6" align="left">
						<button type="submit" class="btn btn-default">Update
						</button>
					</div>
				</div>

			</form>
		</div>
	</div>
	<div align="left">
		<span style="color: gray; font-size: 14px;"><sup>*</sup>carrier
			charges may apply</span>
	</div>
</div>

<script>
$('document').ready(function(){
	populateStateDropDown();
	var existingState = $('input[name=stateExisting]').val();
	$('select[name=state]').val(existingState);
});
</script>