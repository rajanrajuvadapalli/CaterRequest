<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="page-header">
	<h1>My Dashboard</h1>
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


<div class="col-sm-10">
	<div align="right">
		<a href="${pageContext.request.contextPath}/customer/createEvent"
			role="button" class="btn btn-lg btn-primary"> Create Event</a>
	</div>
	<br>
	<div class="panel panel-success">
		<div class="panel-heading">
			<h3 class="panel-title">Events</h3>
		</div>
		<div class="panel-body">

			<c:choose>
				<c:when test="${empty events}">
		Welcome to your dashboard. <br>
					<br>
		Looks like this is your first time here.<br>
					<br>
		To get started, click on the "Create Event" button on the top.
				</c:when>
				<c:otherwise>
					<div class="table-responsive">
						<table class="table table-striped table-hover table-bordered">
							<tr>
								<th>Event Name</th>
								<th>Date/Time</th>
								<th>Location</th>
								<%-- <c:if test="${user.role == 'ADMIN'}">
									<th width="200px;">Customer&nbsp;Name</th>
									<th width="400px;">Customer Contact&nbsp;Number</th>
								</c:if> --%>

								<%-- <th></th> --%>

							</tr>
							<c:forEach items="${events}" var="e">
								<tr>
									<td>${e.name}</td>
									<td>${e.date_time}</td>
									<td>${e.location.street1} ${e.location.street2}, ${e.location.city},
										${e.location.state} - ${e.location.zip}
									</td>
									<%-- <c:if test="${user.role == 'ADMIN'}">
										<td ${e.customer.name}</td>
										<td ${e.customer.contactNumber}</td>
									</c:if> --%>

									<%-- <td
										<button
												onclick="showCuisineOptions(${e.id})"
												class="btn btn-lg btn-primary btn-block">A</button></td> --%>

								</tr>
							</c:forEach>
						</table>
					</div>
				</c:otherwise>
			</c:choose>

		</div>
	</div>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>