<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="col-sm-10 col-sm-offset-1 page-header">
	<h1>Admin Dashboard</h1>
</div>

<div class="row">
	<div class="col-sm-5 col-sm-offset-1">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">Restaurant Search</h3>
			</div>
			<div class="panel-body" align="left">
				<form class="form-horizontal" id="start-new-search-form"
					action="${pageContext.request.contextPath}/admin/restaurantSearch"
					method="GET">
					<div class="form-group">
						<label for="name" class="col-sm-3 control-label">Restaurant
							Email :</label>
						<div class="col-sm-4" align="left">
							<input type="text" name="rest_email" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-4 col-sm-offset-3">- OR -</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-sm-3 control-label">From Date
							:</label>
						<div class="col-sm-4" align="left">
							<input type="text" name="fromDate" id="fromDate"
								class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-sm-3 control-label">To Date :</label>
						<div class="col-sm-4" align="left">
							<input type="text" name="toDate" id="toDate" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-4 col-sm-offset-3" align="left">
							<button type="submit" class="btn btn-default">Search</button>
						</div>
					</div>
					</span>
				</form>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-sm-10 col-sm-offset-1">
		<div class="panel panel-success">
			<div class="panel-heading">
				<h3 class="panel-title">Restaurants</h3>
			</div>
			<div class="panel-body">
				<c:choose>
					<c:when test="${empty rbsDtos}">
					There are no restaurants registered.
				</c:when>
					<c:otherwise>
						<div class="table-responsive">
							<table class="table table-striped table-hover table-bordered">
								<tr>
									<th>Email ID</th>
									<th>Name</th>
									<th>Contact Number</th>
									<th>Location</th>
									<th>Event Name</th>
									<th>Event Location</th>
									<th>Order Status</th>
									<th>Price</th>
									<th>Event Time</th>
								</tr>
								<c:forEach items="${rbsDtos}" var="rbsDto">
									<tr>
										<td>${rbsDto.emailId}</td>
										<td>${rbsDto.restaurantName}</td>
										<td>${rbsDto.restaurantNumber}</td>
										<td>${rbsDto.rStreet1}${rbsDto.rStreet2},${rbsDto.rCity},${rbsDto.rState},
											${rbsDto.rZip}</td>
										<td>${rbsDto.eventName}</td>
										<td>${rbsDto.eventStreet1}${rbsDto.eventStreet1},${rbsDto.eventCity},
											${rbsDto.eventState}, ${rbsDto.eventZip}</td>
										<td>${rbsDto.status}</td>
										<td>${rbsDto.price}</td>
										<td>${rbsDto.date_time}</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</div>

<script>
	$('document').ready(function() {
		populateStateDropDown();
		$("input[id=fromDate]").datetimepicker({
			dayOfWeekStart : 1,
			lang : 'en'
		});
	});
	$('document').ready(function() {
		populateStateDropDown();
		$("input[id=toDate]").datetimepicker({
			dayOfWeekStart : 1,
			lang : 'en'
		});
	});
</script>