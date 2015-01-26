<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="${pageContext.request.contextPath}/resources/js/customer.js"></script>

<div>
	<h2 style="text-align: center;">Customer Dashboard</h2>
</div>

<c:if test="${not empty errors}">
	<div class="alert alert-danger">
		<ul>
			<c:forEach items="${errors}" var="e"><li>${e}</li></c:forEach>
		</ul>
		
	</div>
</c:if>

<c:if test="${not empty successMessages}">
	<div class="alert alert-success">
		<ul>
			<c:forEach items="${successMessages}" var="sm"><li>${sm}</li></c:forEach>
		</ul>
		
	</div>
</c:if>

<c:if test="${not empty warnings}">
	<div class="alert alert-warning">
		<ul>
			<c:forEach items="${warnings}" var="w"><li>${w}</li></c:forEach>
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