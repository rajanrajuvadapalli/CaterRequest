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
	<div class="col-sm-10 col-sm-offset-1">
		<div class="panel panel-success">
			<div class="panel-heading">
				<h3 class="panel-title">Customers</h3>
			</div>
			<div class="panel-body">
				<c:choose>
					<c:when test="${empty events}">
					There are no customers registered.
				</c:when>
					<c:otherwise>
						<div class="table-responsive">
							<table class="table table-striped table-hover table-bordered">
								<tr>
									<th>Email</th>
									<th>Name</th>
									<th>Contact Number</th>
									<th>SMS indicator</th>
									<th>Event Name</th>
									<th>Event Location</th>
									<th>Restaurant Details</th>
									
									<th>Event Time</th>
								</tr>
								
								    <c:forEach items="${events}" var ="e">
								       <tr>
										<td>${e.customer.contactEmail}</td>
										<td>${e.customer.name}</td>
										<td>${e.customer.contactNumber}</td>
										<td>${e.customer.smsOk}</td>
								        <td>${e.name}</td>
										<td>${e.location.street1}${e.location.street2},
								${e.location.city}, ${e.location.state} - ${e.location.zip}</td>
								        <td>
								          <table class="table table-striped table-hover table-bordered">
								           
								             <c:forEach items="${e2q.get(e.id)}" var="q2c">
								             
								              <tr>
								              <td>${q2c.restaurant.name}</td>
								              <td>${q2c.price}</td>
								              <td>${q2c.status}</td>
								              </tr>
								            
								           </c:forEach>
								         
								           </table>
								         </td>
								     <td>${e.date_time}</td>
								    
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

<script type="text/javascript">
	// When the document is ready
	$(document).ready(function() {

		$('.input-daterange').datepicker({
			todayBtn : "linked"
		});

	});
</script>