<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="eventsList" class="sideMenuItemsDetail">
	<h2>Quotes</h2>
	<c:choose>
		<c:when test="${empty quotes}">
		There are 0 quotes in the database.
	</c:when>

		<c:otherwise>
			<table class="list">
				<tr class="list">
					<th width="350px;" class="list">Event&nbsp;Name</th>
					<th width="300px;" class="list">Date/Time</th>
					<th width="300px;" class="list">Menu</th>
					<th width="300px;" class="list">Price</th>
					<th width="200px;" class="list">Customer&nbsp;Name</th>
					<th width="400px;" class="list">Customer Contact&nbsp;Number</th>

				</tr>
				<c:forEach items="${quotes}" var="q" varStatus="loopStatus">
					<tr class="${loopStatus.index % 2 == 0 ? 'even' : 'odd'} list">
						<td class="list">${q.menu.event.name}</td>
						<td class="list">${q.menu.event.date_time}</td>
						<td width="300px;" class="list">
							<%-- <button onclick="displayMenu(${q.menu.id})" width="50px"
								class="button">Menu</button> --%> <a
							href="${pageContext.request.contextPath}/menu/view/${q.menu.id}"
							onclick="displayMenu(this)"><u>Menu</u></a>
						</td>
						<td width="300px;" class="list"><c:if
								test="${q.price != null}">
								&#36;${q.price}
							</c:if></td>
						<td class="list">${q.menu.event.customer.name}</td>
						<td class="list">${q.menu.event.customer.contactNumber}</td>
					</tr>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
</div>

