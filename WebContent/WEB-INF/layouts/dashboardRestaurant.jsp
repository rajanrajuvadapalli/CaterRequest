<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="${pageContext.request.contextPath}/resources/js/restaurant.js"></script>

<div>
	<h2 style="text-align: center;">Restaurant Dashboard</h2>
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

<table style="width: 1200px;">
	<tr>
		<td style="width: 200px; vertical-align: top;">
			<table class="sideMenuItem">
				<tr>
					<td style="cursor: pointer; cursor: hand;"
						onclick="listRestaurantQuotes()">Quotes
					</td>
				</tr>				
			</table>
		</td>
		
		<!-- padding coulmn -->
		<td width="20px"></td>

		<td id="restaurantDashboardData"></td>

	</tr>
</table>