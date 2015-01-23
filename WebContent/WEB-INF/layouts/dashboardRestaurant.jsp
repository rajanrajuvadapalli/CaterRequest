<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="${pageContext.request.contextPath}/resources/js/restaurant.js"></script>

<div>
	<h2 style="text-align: center;">Restaurant Dashboard</h2>
</div>

<c:if test="${not empty errors}">
	<div class="errorMsg">
		<ul>
			<c:forEach items="${errors}" var="e"><li>${e}</li></c:forEach>
		</ul>
		
	</div>
</c:if>

<c:if test="${not empty successMessages}">
	<div class="successMsg">
		<ul>
			<c:forEach items="${successMessages}" var="sm"><li>${sm}</li></c:forEach>
		</ul>
		
	</div>
</c:if>

<c:if test="${not empty warnings}">
	<div class="warningMsg">
		<ul>
			<c:forEach items="${warnings}" var="w"><li>${w}</li></c:forEach>
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