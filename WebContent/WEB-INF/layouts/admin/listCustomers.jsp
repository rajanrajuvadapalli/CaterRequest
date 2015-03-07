<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="page-header">
	<h1>Admin Dashboard</h1>
</div>

<div class="col-sm-12">
	<div class="panel panel-success">
		<div class="panel-heading">
			<h3 class="panel-title">Customers</h3>
		</div>
		<div class="panel-body">
			<c:choose>
				<c:when test="${empty customers}">
					There are no customers registered.
				</c:when>
				<c:otherwise>
					<div class="table-responsive">
						<table class="table table-striped table-hover table-bordered">
							<tr>
								<th>Name</th>
								<th>Contact Number</th>
								<th>Contact Email</th>
							</tr>
							<c:forEach items="${customers}" var="cust">
								<tr>
									<td>${cust.name}</td>
									<td>${cust.contactNumber}</td>
									<td>${cust.contactEmail}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>