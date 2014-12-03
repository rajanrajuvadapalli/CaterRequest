<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div>
	<div class="caterMenuTitle ${menu.cuisine}">
		<h2>
			<c:out value="${menu.cuisine}"></c:out>
		</h2>
	</div>
	<form method="POST" id="menu-form"
		action="${pageContext.request.contextPath}/menu" novalidate
		ectype="application/x-www-form-urlencoded" autocomplete="off">
		<table class="caterMenu">
			<c:forEach items="${menu.categories}" var="category">
				<tr class="category">
					<td colspan="2"><c:out value="${category.name}"></c:out></td>
				</tr>
				<c:forEach items="${category.items}" var="item">
					<tr class="item">
						<td><input type="checkbox" value="${item.name}"
							name="${item.name}" checked="${item.isSelected()?true:false}"></td>
						<td><c:out value="${item.name}"></c:out></td>
					</tr>
					<tr class="itemDescription">
						<td></td>
						<td>(<c:out value="${item.description}"></c:out>)
						</td>
					</tr>
				</c:forEach>
			</c:forEach>

		</table>
	</form>
</div>