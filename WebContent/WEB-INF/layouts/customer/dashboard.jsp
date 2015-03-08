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


<div class="col-sm-12">
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
						<table
							class="table table-striped table-hover table-bordered sortable">
							<tr>
								<th>Event Name</th>
								<th>Date/Time</th>
								<th>Location</th>
								<th>Menu(s)</th>
							</tr>
							<c:forEach items="${events}" var="e">
								<tr>
									<td>${e.name}</td>
									<td>${e.date_time}</td>
									<td>${e.location.street1} ${e.location.street2},
										${e.location.city}, ${e.location.state} - ${e.location.zip}</td>
									<td><c:if test="${not empty e2m.get(e.id)}">
											<c:forEach items="${e2m.get(e.id)}" var="cuisine">
												${cuisine}<a
													href="${pageContext.request.contextPath}/customer/editMenu?eventId=${e.id}&cuisine=${cuisine}">
													<img alt="edit"
													src="${pageContext.request.contextPath}/resources/images/edit.png">
												</a>
												<br>
											</c:forEach>
										</c:if>

										<form class="form-horizontal" method="POST" id="event-form"
											action="${pageContext.request.contextPath}/menu/selectMenu"
											ectype="application/x-www-form-urlencoded">

											<div class="row">
												<input type="text" hidden="true" name="eventId" value="${e.id}">
												<div class="col-sm-4">
													<span id="cuisineType"></span>
												</div>
												<div class="col-sm-1" align="left">
													<button type="submit" class="btn btn-sm btn-warning">Select
														Menu</button>
												</div>
											</div>
										</form></td>
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