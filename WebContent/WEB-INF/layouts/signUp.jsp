<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="page-header">
	<h1>Registration</h1>
</div>

<c:if test="${not empty errors}">
	<div class="alert alert-danger">
		<ul>
			<c:forEach items="${errors}" var="e">
				<li align="left">${e}</li>
			</c:forEach>
		</ul>

	</div>
</c:if>

<c:if test="${not empty successMessages}">
	<div class="alert alert-success">
		<ul>
			<c:forEach items="${successMessages}" var="sm">
				<li align="left">${sm}</li>
			</c:forEach>
		</ul>

	</div>
</c:if>

<c:if test="${not empty warnings}">
	<div class="alert alert-warning">
		<ul>
			<c:forEach items="${warnings}" var="w">
				<li align="left">${w}</li>
			</c:forEach>
		</ul>
	</div>
</c:if>

<div class="container container-fluid">
	<div id="register-options">
		<h3 class="text-muted">Would you like to register as</h3>
		<br> <br> <br>
		<div class="row" align="center">
			<div class="col-sm-4 col-sm-offset-2 image-button img-rounded">
				<img
					src="${pageContext.request.contextPath}/resources/images/individual.png"
					alt="customer" onclick="showRegistrationFormFor('customer')" />
			</div>
			<div class="col-sm-4 image-button img-rounded">
				<img
					src="${pageContext.request.contextPath}/resources/images/chef.jpg"
					alt="restaurant" onclick="showRegistrationFormFor('restaurant')" />
			</div>
		</div>
	</div>

	<form class="form-horizontal" method="POST" id="register-form"
		action="${pageContext.request.contextPath}/register" novalidate
		ectype="application/x-www-form-urlencoded" autocomplete="off">
		<div class="col-sm-12">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">Personal Info</h3>
				</div>
				<div class="panel-body">
					<div class="form-group" id="customer">
						<label for="name" class="col-sm-2 control-label">Name&nbsp;:</label>
						<div class="col-sm-6">
							<input type="text" size="30" maxlength="50" name="name"
								required="required" placeholder="First   Last"
								class="form-control">
						</div>
					</div>
					<div class="form-group" id="restaurant">
						<label for="restaurantName" class="col-sm-2 control-label">Restaurant&nbsp;Name&nbsp;:</label>
						<div class="col-sm-6">
							<input type="text" size="30" maxlength="50" name="restaurantName"
								required="required" placeholder="Restaurant Name"
								class="form-control">
						</div>
					</div>
					<div class="form-group" id="restaurant">
						<label for="cuisineType" class="col-sm-2 control-label">Cuisine
							Type&nbsp;:</label>
						<div class="col-sm-6">
							<span id="cuisineType"></span>
						</div>
					</div>
					<div class="form-group" id="restaurant">
						<label for="url" class="col-sm-2 control-label">Website
							URL :</label>
						<div class="col-sm-6">
							<input type="url" size="50" name="url"
								placeholder="Ex.: http://www.example.com" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="email" class="col-sm-2 control-label">Email&nbsp;:</label>
						<div class="col-sm-6">
							<input type="email" size="30" name="email" required="required"
								placeholder="Ex.: jenny@gmail.com" class="form-control"><br>
						</div>
						<div class="col-sm-6 col-sm-offset-2" align="left">
							<i>(This will be your username for login)</i>
						</div>
					</div>
					<div class="form-group">
						<label for="pwd1" class="col-sm-2 control-label">Password&nbsp;:</label>
						<div class="col-sm-6">
							<input type="password" size="30" name="pwd1" id="pwd1"
								required="required" placeholder="Password" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="pwd2" class="col-sm-2 control-label">Confirm
							Password&nbsp;:</label>
						<div class="col-sm-6">
							<input type="password" size="30" name="pwd2" id="pwd2"
								required="required" placeholder="Re-enter Password"
								class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="phone" class="col-sm-2 control-label">Contact
							Phone&nbsp;:</label>
						<div class="col-sm-6">
							<input type="text" size="30" name="phone" required="required"
								placeholder="Ex.: xxx-xxx-xxxx" class="form-control">
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
						<label for="street1" class="col-sm-2 control-label">Street
							1&nbsp;:</label>
						<div class="col-sm-6">
							<input type="text" size="30" maxlength="50" name="street1"
								required="required" placeholder="Line 1" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="street2" class="col-sm-2 control-label">Street
							2&nbsp;:</label>
						<div class="col-sm-6">
							<input type="text" size="30" maxlength="50" name="street2"
								placeholder="Line 2" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="city" class="col-sm-2 control-label">City&nbsp;:</label>
						<div class="col-sm-6">
							<input type="text" size="30" name="city" required="required"
								placeholder="City" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="state" class="col-sm-2 control-label">State&nbsp;:</label>
						<div class="col-sm-6">
							<select id="state" name="state"
								class="form-control bfh-states inputs"></select>
						</div>
					</div>
					<div class="form-group">
						<label for="zip" class="col-sm-2 control-label">Zip&nbsp;:</label>
						<div class="col-sm-6">
							<input type="text" size="10" name="zip" maxlength="10"
								required="required" placeholder="Ex.: xxxxx"
								class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label"></label>
						<div class="col-sm-6" align="left">
							<button type="submit" class="btn btn-lg btn-primary">Register</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>


