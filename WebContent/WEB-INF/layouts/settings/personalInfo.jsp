<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="page-header">
	<h1>Settings</h1>
</div>

<div class="col-sm-10">
	<div class="panel panel-info">
		<div class="panel-heading">
			<h3 class="panel-title">Personal Info</h3>
		</div>
		<div class="panel-body">

			<form class="form-horizontal" method="POST" id="profileForm"
				action="${pageContext.request.contextPath}/settings/profile"
				novalidate ectype="application/x-www-form-urlencoded"
				autocomplete="off">
				<c:if test="${sessionScope.user.role.value == 'CUSTOMER'}">
					<div class="form-group">

						<label for="name" class="col-sm-2 control-label">Name&nbsp;:</label>
						<div class="col-sm-6">
							<input type="text" size="30" maxlength="50" name="name"
								required="required" class="form-control"
								value="${sessionScope.user.data.name}">
						</div>
					</div>
				</c:if>
				<c:if test="${sessionScope.user.role.value == 'RESTAURANT'}">
					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">Restaurant
							Name: </label>
						<div class="col-sm-6">
							<input type="text" size="30" maxlength="50" name="restaurantName"
								required="required" class="form-control"
								value="${sessionScope.user.data.restaurantName}">
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">Cuisine
							Type: </label>
						<div class="col-sm-6">
							<input type="text" size="30" maxlength="30" name="cuisineType"
								id="cuisineType" required="required" class="form-control"
								value="${sessionScope.user.data.cuisineType}">
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">Website
							URL: </label>
						<div class="col-sm-6">
							<input type="text" size="30" maxlength="50" name="url"
								required="required" class="form-control"
								value="${sessionScope.user.data.url}">
						</div>
					</div>

				</c:if>
				<div class="form-group">
					<label for="name" class="col-sm-2 control-label">Contact
						Phone: </label>
					<div class="col-sm-6">
						<input type="text" size="30" name="phone" class="form-control"
							required="required" value="${sessionScope.user.data.phone}">
					</div>
				</div>
				<div class="form-group">
					<label for="name" class="col-sm-2 control-label">Street 1:
					</label>

					<div class="col-sm-6">
						<input type="text" size="30" maxlength="50" name="street1"
							class="form-control" value="${sessionScope.user.data.street1}">
					</div>
				</div>
				<div class="form-group">
					<label for="name" class="col-sm-2 control-label">Street 2:
					</label>

					<div class="col-sm-6">
						<input type="text" size="30" maxlength="50" name="street2"
							class="form-control" value="${sessionScope.user.data.street2}">
					</div>
				</div>
				<div class="form-group">
					<label for="name" class="col-sm-2 control-label">City: </label>

					<div class="col-sm-6">
						<input type="text" size="30" maxlength="50" name="city"
							class="form-control" value="${sessionScope.user.data.city}">
					</div>
				</div>
				<div class="form-group">
					<label for="name" class="col-sm-2 control-label">State: </label>
					<div class="col-sm-6">
						<input size="30" maxlength="50" name="state" class="form-control"
							value="${sessionScope.user.data.state}">
					</div>
				</div>
				<div class="form-group">
					<label for="name" class="col-sm-2 control-label">Zip: </label>

					<div class="col-sm-6">
						<input type="text" size="10" name="zip" maxlength="10"
							class="form-control" value="${sessionScope.user.data.zip}">
					</div>
				</div>

				<button type="submit" class="btn btn-lg btn-primary btn-block">Update
				</button>

			</form>
		</div>
	</div>
</div>