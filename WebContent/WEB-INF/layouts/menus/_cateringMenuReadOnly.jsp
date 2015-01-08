<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div>
	<div class="caterMenuTitle ${menu.cuisine}">
		<h2>
			<c:out value="${menu.cuisine}"></c:out>
		</h2>
	</div>
	<table class="caterMenu">
		<c:forEach items="${menu.categories}" var="category">
			<c:if test="${not empty category.items}">
				<tr class="category">
					<td><c:out value="${category.name}"></c:out></td>
				</tr>
				<c:forEach items="${category.items}" var="item">
					<c:if test="${item.isSelected()}">
						<tr class="item">
							<td><c:out value="${item.name}"></c:out></td>
						</tr>
					</c:if>
				</c:forEach>
			</c:if>
		</c:forEach>
	</table>
	<input type="hidden" name="cuisine" value="${menu.cuisine}">
</div>