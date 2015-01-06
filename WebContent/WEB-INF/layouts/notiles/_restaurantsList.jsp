<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="restaurantsList" class="sideMenuItemsDetail">
	<h2>Restaurants</h2>
	<c:choose>
		<c:when test="${empty restaurants}">
		There are 0 restaurants in the database.
		</c:when>

		<c:otherwise>
			<table class="list">
				<tr class="list">
					<th width="200px;" class="list">Name</th>
					<th width="200px;" class="list">Cuisine Type</th>
					<th width="200px;" class="list">Contact Number</th>
					<th width="400px;" class="list">Contact Email</th>
					<th width="400px;" class="list">URL</th>
				</tr>
				<c:forEach items="${restaurants}" var="rest" varStatus="loopStatus">
					<tr class="${loopStatus.index % 2 == 0 ? 'even' : 'odd'} list">
						<td class="list">${rest.name}</td>
						<td class="list">${rest.cuisineType}</td>
						<td class="list">${rest.contactNumber}</td>
						<td class="list">${rest.contactEmail}</td>
						<td class="list">${rest.websiteUrl}</td>
					</tr>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
</div>
