<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:choose>
	<c:when test="${empty restaurants}">
	No <c:out value="${cuisine}"></c:out> restaurants registered with us.
	</c:when>

	<c:otherwise>
		<div>
			<div>
				<h2>
					Please select 1 or more restaurants you are interested in.
				</h2>
			</div>
			<form method="POST" id="menu-form"
				action="${pageContext.request.contextPath}/menu/requestQuote" novalidate
				ectype="application/x-www-form-urlencoded" autocomplete="off">
				<table>
					<c:forEach items="${restaurants}" var="r">
							<tr>
								<td><input type="checkbox" value="${r.id}" name="restaurantId"}><c:out value="${r.name}"></c:out></td>
							</tr>
					</c:forEach>
					<tr><td><button type="submit" width="50px" class="button">Next</button></td></tr>
				</table>
				<input type="hidden" name="cuisine" value="${menu.cuisine}">
			</form>
		</div>
	</c:otherwise>
</c:choose>