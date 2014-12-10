<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="${pageContext.request.contextPath}/resources/js/customer.js"></script>

<div>
	<h2 style="text-align: center;">Customer Dashboard</h2>
</div>

<c:if test="${not empty errors}">
	<div class="errorMsg">
		<ul>
			<li><c:forEach items="${errors}" var="e">${e}</c:forEach></li>
		</ul>
		
	</div>
</c:if>

<c:if test="${not empty successMessages}">
	<div class="successMsg">
		<ul>
			<li><c:forEach items="${successMessages}" var="sm">${sm}</c:forEach></li>
		</ul>
		
	</div>
</c:if>

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