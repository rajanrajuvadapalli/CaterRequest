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
				<h3 class="panel-title">Restaurants</h3>
			</div>
			<div class="panel-body">
				<c:choose>
					<c:when test="${empty restaurants}">
					There are no restaurants registered.
				</c:when>
					<c:otherwise>
						<div class="table-responsive">
							<table class="table table-striped table-hover table-bordered">
								<tr>
									<th>Name</th>
									<th>Cuisine Type</th>
									<th>Contact Number</th>
									<th>Contact Email</th>
									<th>URL</th>
								</tr>
								<c:forEach items="${restaurants}" var="rest">
									<tr>
										<td>${rest.name}</td>
										<td>${rest.cuisineType}</td>
										<td>${rest.contactNumber}</td>
										<td>${rest.contactEmail}</td>
										<td>${rest.websiteUrl}</td>
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