<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="eventsList" class="sideMenuItemsDetail">
	<h2>Events</h2>
	<c:choose>
		<c:when test="${empty events}">
		There are 0 events in the database.
	</c:when>

		<c:otherwise>
			<table class="list">
				<tr class="list">
					<th width="200px;" class="list">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Event&nbsp;Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
					<th width="400px;" class="list">Date/Time</th>
					<th width="200px;" class="list">Customer&nbsp;Name</th>
					<th width="400px;" class="list">Customer Contact&nbsp;Number</th>
					<c:if test="${user.role == 'CUSTOMER'}">
						<th></th>
					</c:if>
				</tr>
				<c:forEach items="${events}" var="e" varStatus="loopStatus">
					<tr class="${loopStatus.index % 2 == 0 ? 'even' : 'odd'} list">
						<td class="list">${e.name}</td>
						<td class="list">${e.date_time}</td>
						<td class="list">${e.customer.name}</td>
						<td class="list">${e.customer.contactNumber}</td>
						<c:if test="${user.role == 'CUSTOMER'}">
							<td class="list"><button onclick="showMenuOptions(${e.id})"
									width="50px" class="button">Select Menu</button></td>
						</c:if>
					</tr>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
</div>

