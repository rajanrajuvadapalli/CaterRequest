<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="eventsList" class="sideMenuItemsDetail">
	<h2>Quotes</h2>
	<c:choose>
		<c:when test="${empty quotes}">
		You currently do not have any request for quotes.
	</c:when>

		<c:otherwise>
			<table class="list">
				<tr class="list">
					<th width="350px;" class="list">Event&nbsp;Name</th>
					<th width="300px;" class="list">Date/Time</th>
					<th width="200px;" class="list">Customer&nbsp;Name</th>
					<th width="400px;" class="list">Customer Contact&nbsp;Number</th>
					<th width="300px;" class="list">Price per plate</th>
					<th width="300px;" class="list">Number of persons</th>
					<th width="300px;" class="list">Total Budget</th>
					<th width="500px;">Status</th>
					<th width="300px;" class="list">Action</th>
				</tr>
				<c:forEach items="${quotes}" var="q" varStatus="loopStatus">
					<tr class="${loopStatus.index % 2 == 0 ? 'even' : 'odd'} list">
						<td class="list">${q.menu.event.name}</td>
						<td class="list">${q.menu.event.date_time}</td>
						<td class="list">${q.menu.event.customer.name}</td>
						<td class="list">${q.menu.event.customer.contactNumber}</td>
						<td class="list">${q.menu.event.budgetTotal/(q.menu.event.personCount+q.menu.event.kidsCount)}</td>
						<td class="list">${q.menu.event.personCount} adults, ${q.menu.event.kidsCount} kids</td>
						<td class="list"><fmt:setLocale value="en_US" /> <fmt:formatNumber
								value="${q.menu.event.budgetTotal}" type="currency" /></td>
						<td class="list"><c:choose>
								<c:when test="${q.status.toString() == 'CREATED'}">New</c:when>
								<c:when
									test="${q.status.toString() == 'CUSTOMER_UPDATED_BUDGET'}">Customer updated the budget</c:when>
								<c:when test="${q.status.toString() == 'APPROVED'}">Customer accepted your quote</c:when>
								<c:when test="${q.status.toString() == 'DENIED'}">Customer denied</c:when>
							</c:choose></td>
						<td class="list"><c:choose>
								<c:when test="${q.menu.data == null}">
									<a href="${pageContext.request.contextPath}/restaurant/availableMenus">Submit menu</a>
								</c:when>
								<c:otherwise>
								<a href="${q.menu.data}">Menu</a>
								<br>
									<a href="${pageContext.request.contextPath}/restaurant/availableMenus">Update menu</a>
								</c:otherwise>
							</c:choose></td>
					</tr>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
</div>

