<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div>
	<h2 style="text-align: center;">Admin Dashboard</h2>
</div>

<table style="width: 900px;">
	<tr>
		<td style="width: 200px; vertical-align: top;">
			<table class="sideMenuItem">
				<tr>
					<td style="cursor: pointer; cursor: hand;"
						onclick="listCustomers()">Customers</td>
				</tr>
				<tr>
					<td style="cursor: pointer; cursor: hand;"
						onclick="listRestaurants()">Restaurants</td>
				</tr>
				<tr>
					<td style="cursor: pointer; cursor: hand;" onclick="listEvents()">Events</td>
				</tr>
			</table>
		</td>

		<td width="20px"></td>

		<c:import url="admin/_customersList.jsp"></c:import>
		<c:import url="admin/_restaurantsList.jsp"></c:import>
		<c:import url="admin/_eventsList.jsp"></c:import>

	</tr>
</table>