<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div>
	<h2 style="text-align: center;">Customer Dashboard</h2>
</div>

<table style="width: 900px;">
	<tr>
		<td style="width: 200px; vertical-align: top;">
			<table class="sideMenuItem">
				<tr>
					<td style="cursor: pointer; cursor: hand;"
						onclick="listCustomerEvents()">My Events
					</td>
				</tr>
				<tr>
					<td style="cursor: pointer; cursor: hand;"
						onclick="showCreateEventForm()">Create Event
					</td>
				</tr>
				
			</table>
		</td>
		
		<!-- padding coulmn -->
		<td width="20px"></td>

		<td id="customerDashboardData"></td>

	</tr>
</table>