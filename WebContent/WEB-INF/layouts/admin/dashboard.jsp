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
		<div class="panel panel-success">
			<div class="panel-heading">
				<h3 class="panel-title">Customer Search</h3>
			</div>
			<div class="panel-body" align="left">
				<form class="form-horizontal" id="start-new-search-form"
					action="${pageContext.request.contextPath}/admin/customerSearch"
					method="GET">
					<div class="form-group">
						<label for="name" class="col-sm-3 control-label">Customer
							Email :</label>
						<div class="col-sm-4" align="left">
							<input type="text" name="customer_email" class="form-control">
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
				</form>
			</div>
		</div>
	</div>
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

<script>
	$('document').ready(function() {
		populateStateDropDown();
		$("input[id=fromDate]").datetimepicker({
			dayOfWeekStart : 1,
			lang : 'en'
		});
		$("input[id=toDate]").datetimepicker({
			dayOfWeekStart : 1,
			lang : 'en'
		});
	});
</script>