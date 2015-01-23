<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div>
	<h2 style="text-align: center;">Admin Dashboard</h2>
</div>

<table style="width: 900px;">
	<tr>
		<td style="width: 200px; vertical-align: top;">
			<table class="sideMenuItem">
				<tr>
					<td style="cursor: pointer; cursor: hand;"
						onclick="listCustomers()">Customers <c:choose>
							<c:when test="${empty customers}">
								(0)
							</c:when>
							<c:otherwise>(${customers.size()})</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td style="cursor: pointer; cursor: hand;"
						onclick="listRestaurants()">Restaurants <c:choose>
							<c:when test="${empty restaurants}">
								(0)
							</c:when>
							<c:otherwise>(${restaurants.size()})</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td style="cursor: pointer; cursor: hand;" onclick="listEvents()">Events
						<c:choose>
							<c:when test="${empty events}">
								(0)
							</c:when>
							<c:otherwise>(${events.size()})</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</table>
		</td>

		<td width="20px"></td>

		<td align="left"><c:import url="notiles/_customersList.jsp"></c:import>
			<c:import url="notiles/_restaurantsList.jsp"></c:import> <c:import
				url="notiles/_eventsList.jsp"></c:import></td>

	</tr>
</table>