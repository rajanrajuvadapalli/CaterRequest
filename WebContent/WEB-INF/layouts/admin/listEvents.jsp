<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="col-sm-10 col-sm-offset-1 page-header">
	<h1>Admin Dashboard</h1>
</div>

<div class="row">
	<div class="col-sm-10 col-sm-offset-1">
		<div class="panel panel-success">
			<div class="panel-heading">
				<h3 class="panel-title">Events</h3>
			</div>
			<div class="panel-body">
				<c:choose>
					<c:when test="${empty events}">
					There are no events created.
				</c:when>
					<c:otherwise>
						<div class="table-responsive">
							<table class="table table-striped table-hover table-bordered">
								<tr>
									<th>Event Name</th>
									<th>Date/Time</th>
									<th>Location</th>
									<th>Customer&nbsp;Name</th>
									<th>Customer Contact&nbsp;Number</th>
								</tr>
								<c:forEach items="${events}" var="e">
									<tr>
										<td>${e.name}</td>
										<td>${e.date_time}</td>
										<td>${e.location.street1}${e.location.street2},
											${e.location.city}, ${e.location.state} - ${e.location.zip}</td>
										<td>${e.customer.name}</td>
										<td>${e.customer.contactNumber}</td>
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
