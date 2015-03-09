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
						<table class="table table-striped table-bordered sortable">
							<tr>
								<th class="col-sm-2">Event Name</th>
								<th class="col-sm-2">Date/Time</th>
								<th class="col-sm-2">Location</th>
								<th class="col-sm-2">Menu(s)</th>
								<th class="col-sm-2">Quotes(s)</th>
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
													href="${pageContext.request.contextPath}/menu/selectMenu?eventId=${e.id}&cuisineType=${cuisine}">
													<img alt="edit"
													src="${pageContext.request.contextPath}/resources/images/edit.png">
												</a>

											</c:forEach>
											<hr>
										</c:if>
										<form class="form-horizontal" method="GET" id="event-form"
											action="${pageContext.request.contextPath}/menu/selectMenu"
											ectype="application/x-www-form-urlencoded">

											<input type="text" hidden="true" name="eventId"
												value="${e.id}"> <span id="cuisineType"></span>
											<button type="submit" class="btn btn-sm btn-warning">Select
												Menu</button>
										</form></td>
									<td><c:choose>
											<c:when test="${empty e2m.get(e.id)}">Please select a menu and create your request.</c:when>
											<c:when test="${empty e2q.get(e.id)}">
											0 restaurants have responded to your request.
											</c:when>
											<c:otherwise>
												<c:forEach items="${e2q.get(e.id)}" var="q">
												${q.restaurant.name}: &nbsp;
												<c:choose>
														<c:when test="${empty q.price}">Not responded</c:when>
														<c:otherwise>
															<fmt:setLocale value="en_US" />
															<fmt:formatNumber value="${q.price}" type="currency" />
														</c:otherwise>
													</c:choose>
													<br>
												</c:forEach>
											</c:otherwise>
										</c:choose></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</c:otherwise>
			</c:choose>

		</div>
	</div>
</div>
