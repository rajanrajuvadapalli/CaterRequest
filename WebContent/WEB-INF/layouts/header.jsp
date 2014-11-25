<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div>
	<div class="top_menu pull-left" align="center">
		<table>
			<tr>
				<td><a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="C4P" width="80px" /></a></td>
				<td><a href="${pageContext.request.contextPath}/home"><span class="top_menu_item">Home</span></a></td>
				<td><a href="${pageContext.request.contextPath}/aboutUs"><span class="top_menu_item">About Us</span></a></td>
				<td><a href="${pageContext.request.contextPath}/contactUs"><span class="top_menu_item">Contact Us</span></a></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<c:choose>
					<c:when test="${empty sessionScope.user}">
						<td><a href="${pageContext.request.contextPath}/home"><span class="top_menu_item">Login</span></a></td>
					</c:when>
					<c:otherwise>
						<td><a href="${pageContext.request.contextPath}/logout"><span class="top_menu_item">Logout</span></a></td>
					</c:otherwise>
				</c:choose>
				<td><a href="${pageContext.request.contextPath}/signUp"><span class="top_menu_item">Sign Up</span></a></td>
			</tr>
		</table>
	</div>
	<c:if test="${not empty sessionScope.user}">
		<div style="text-align:right;color:#52525A;">Welcome <b>${sessionScope.user.username}</b>!</div>
	</c:if>
</div>

