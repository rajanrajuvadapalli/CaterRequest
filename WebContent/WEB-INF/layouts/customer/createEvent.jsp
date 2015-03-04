<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="page-header">
	<h1>Create Event</h1>
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

<form class="form-horizontal" method="POST" id="event-form"
	action="${pageContext.request.contextPath}/customer/createEvent"
	ectype="application/x-www-form-urlencoded" autocomplete="off">
	<div class="col-sm-10">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">The Basics</h3>
			</div>
			<div class="panel-body">

				<div class="form-group">
					<label for="name" class="col-sm-2 control-label">Event Name
						:</label>
					<div class="col-sm-6">
						<input type="text" size="50" maxlength="250" name="name"
							required="required" placeholder="Ex.: Victoria's Birthday party"
							class="form-control">
					</div>
				</div>

				<div class="form-group">
					<label for="datetimepicker" class="col-sm-2 control-label">Date/Time
						:</label>
					<div class="col-sm-6">
						<input type="text" size="30" maxlength="50" name="datetimepicker"
							id="datetimepicker" required="required" class="form-control">
					</div>
				</div>

				<div class="form-group">
					<label for="person_count" class="col-sm-2 control-label">Number
						of Persons :</label>
					<div class="col-sm-6">
						<input type="text" size="20" maxlength="20" name="person_count"
							required="required" pattern="[0-9]+" title="Must be a Number"
							class="form-control">
					</div>
				</div>

				<div class="form-group">
					<label for="budget_total" class="col-sm-2 control-label">Total
						Budget :</label>
					<div class="col-sm-6">
						<input type="text" size="20" maxlength="20" name="budget_total"
							required="required" pattern="[0-9]+" title="Must be a Number"
							class="form-control">
					</div>
				</div>
			</div>
		</div>

		<div class="col-sm-10">
			<div class="panel panel-success">
				<div class="panel-heading">
					<h3 class="panel-title">Event Location</h3>
				</div>
				<div class="panel-body">

					<div class="form-group">
						<label for="street1" class="col-sm-2 control-label">Street
							1 :</label>
						<div class="col-sm-6">
							<input type="text" size="30" maxlength="50" name="street1"
								required="required" placeholder="Line 1" class="form-control">
						</div>
					</div>

					<div class="form-group">
						<label for="street2" class="col-sm-2 control-label">Street
							2 :</label>
						<div class="col-sm-6">
							<input type="text" size="30" maxlength="50" name="street2"
								placeholder="Line 2" class="form-control">
						</div>
					</div>

					<div class="form-group">
						<label for="city" class="col-sm-2 control-label">City :</label>
						<div class="col-sm-6">
							<input type="text" size="30" name="city" required="required"
								placeholder="City" class="form-control">
						</div>
					</div>

					<div class="form-group">
						<label for="state" class="col-sm-2 control-label">State :</label>
						<div class="col-sm-6">
							<select id="state" name="state" class="form-control bfh-states"></select>
						</div>
					</div>

					<div class="form-group">
						<label for="zip" class="col-sm-2 control-label">Zip :</label>
						<div class="col-sm-6">
							<input type="text" size="10" name="zip" maxlength="10"
								required="required" placeholder="Ex.: xxxxx"
								class="form-control">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-4">
			<button type="submit" class="btn btn-lg btn-primary btn-block">Create
				Event</button>
		</div>
</form>
