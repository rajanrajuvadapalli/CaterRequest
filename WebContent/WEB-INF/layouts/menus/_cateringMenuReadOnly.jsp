<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
	<c:if test="${user.role == 'RESTAURANT'}">
		<hr>
		<form method="POST" id="submit-price-form"
			action="${pageContext.request.contextPath}/restaurant/submitprice"
			ectype="application/x-www-form-urlencoded" autocomplete="off">
			<table>
				<c:choose>
					<c:when test="${price != null}">
						<tr>
							<td>Price Quoted:</td>
							<td style="color: red;"><b><fmt:setLocale value="en_US" />
									<fmt:formatNumber value="${price}" type="currency" /></b></td>
							<td></td>
						</tr>
						<tr>
							<td>New Price :</td>
							<td><input type="text" size="30" maxlength="50" name="price"
								required="required" pattern="[0-9]+(\.[0-9]{2})?"
								placeholder="0.00" class="inputs"></td>
							<td><button type="submit" width="50px" class="button">Udpate</button></td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td>Price :</td>
							<td><input type="text" size="30" maxlength="50" name="price"
								required="required" pattern="[0-9]+(\.[0-9]{2})?"
								placeholder="0.00" class="inputs"></td>
							<td><button type="submit" width="50px" class="button">Submit</button></td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
		</form>
		<hr>
	</c:if>
</div>