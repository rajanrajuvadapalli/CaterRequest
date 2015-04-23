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
		<button type="button" class="close btn-lg" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<ul>
			<c:forEach items="${errors}" var="e">
				<li align="left">${e}</li>
			</c:forEach>
		</ul>

	</div>
</c:if>

<c:if test="${not empty successMessages}">
	<div class="alert alert-success">
		<button type="button" class="close btn-lg" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<ul>
			<c:forEach items="${successMessages}" var="sm">
				<li align="left">${sm}</li>
			</c:forEach>
		</ul>

	</div>
</c:if>

<c:if test="${not empty warnings}">
	<div class="alert alert-warning">
		<button type="button" class="close btn-lg" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<ul>
			<c:forEach items="${warnings}" var="w">
				<li align="left">${w}</li>
			</c:forEach>
		</ul>
	</div>
</c:if>

<div class="col-sm-12">
	<div class="panel panel-success">
		<div class="panel-heading">
			<h3 class="panel-title">Quotes</h3>
		</div>
		<div class="panel-body">

			<c:choose>
				<c:when test="${empty restaurant.quotes}">
				You currently do not have any request for quotes.
				</c:when>

				<c:otherwise>
					<div class="table-responsive">
						<table class="table table-striped table-bordered">
							<tr>
								<th class="col-sm-2">Customer Name <br>and Contact
									Number
								</th>
								<th class="col-sm-2">Event Name</th>
								<th class="col-sm-2">Date/Time</th>
								<th class="col-sm-1">Number of persons</th>
								<th class="col-sm-2">Status</th>
								<th class="col-sm-2">Your quote</th>
							</tr>
							<c:forEach items="${restaurant.quotes}" var="q">
								<tr>
									<td>${q.menu.event.customer.name}<br>
										${q.menu.event.customer.contactNumber}
									</td>
									<td>${q.menu.event.name}<br> <a
										href="${pageContext.request.contextPath}/menu/view/${q.menu.id}">See
											Menu</a>
									</td>
									<td>${q.menu.event.date_time}</td>
									<td>${q.menu.event.personCount}</td>
									<td><c:choose>
											<c:when test="${q.status.toString() == 'CREATED'}">New Event.</c:when>
											<c:when
												test="${q.status.toString() == 'CUSTOMER_UPDATED_MENU'}">
												Customer has updated the menu. <span class="badge"
													style="background-color: #FF3300;">&nbsp;&#134;&nbsp;</span>
											</c:when>
											<c:when
												test="${q.status.toString() == 'CUSTOMER_UPDATED_COUNT'}">
												Customer has updated the person count. <span class="badge"
													style="background-color: #FF3300;">&nbsp;&#134;&nbsp;</span>
											</c:when>
											<c:when
												test="${q.status.toString() == 'CUSTOMER_UPDATED_DATE'}">
												Customer has updated the date and/or time of the event. <span class="badge"
													style="background-color: #FF3300;">&nbsp;&#134;&nbsp;</span>
											</c:when>
											<c:when
												test="${q.status.toString() == 'RESTAURANT_SUBMITTED_PRICE'}">Customer is reviewing your price quote.</c:when>
											<c:when
												test="${q.status.toString() == 'RESTAURANT_UPDATED_PRICE'}">Customer is reviewing your updated price quote.</c:when>
											<c:when test="${q.status.toString() == 'APPROVED'}">Customer accepted your quote.
											<span class="badge" style="background-color: #009933;">&nbsp;&#x2713;&nbsp;</span>
											</c:when>
											<c:when test="${q.status.toString() == 'DENIED'}">Customer denied your quote.</c:when>
											<c:when test="${q.status.toString() == 'PAID'}">Customer has paid.</c:when>
											<c:when test="${q.status.toString() == 'CUSTOMER_ORDER_CONFIRMED'}">Customer has confirmed the order.</c:when>
										</c:choose></td>
									<td><fmt:setLocale value="en_US" /> <fmt:formatNumber
											value="${q.price}" type="currency" /> <c:if
											test="${not empty bargain && bargain.containsKey(q.id)}">
											<span class="label label-warning"
												title="Your quote is higher than the best quote received for this event.">
												<fmt:formatNumber value="${bargain.get(q.id)}"
													type="percent" />
											</span>
										</c:if></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>