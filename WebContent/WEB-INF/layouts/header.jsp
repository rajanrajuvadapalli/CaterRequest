<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div>
	<div class="top_menu pull-left" align="center">
		<table>
			<tr>
				<td><a href="${pageContext.request.contextPath}"><img
						src="${pageContext.request.contextPath}/resources/images/logo.png"
						alt="C4P" width="80px" /></a></td>
				<td><a href="${pageContext.request.contextPath}/home"><span
						class="top_menu_item">Home</span></a></td>
				<td><a href="${pageContext.request.contextPath}/aboutUs"><span
						class="top_menu_item">About Us</span></a></td>
				<td><a href="${pageContext.request.contextPath}/contactUs"><span
						class="top_menu_item">Contact Us</span></a></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<c:choose>
					<c:when test="${empty sessionScope.user}">
						<td><a href="${pageContext.request.contextPath}/home"><span
								class="top_menu_item">Login</span></a></td>
						<td><a href="${pageContext.request.contextPath}/register"><span
								class="top_menu_item">Sign Up</span></a></td>
					</c:when>
					<c:otherwise>
						<td><a href="${pageContext.request.contextPath}/settings">
								<img
								src="${pageContext.request.contextPath}/resources/images/settings-24-512.png"
								alt="Settings" class="top_menu_icon" />
						</a></td>
						<td><a href="${pageContext.request.contextPath}/logout">
								<img
								src="${pageContext.request.contextPath}/resources/images/logout-512.png"
								alt="Logout" class="top_menu_icon" />
						</a></td>
					</c:otherwise>
				</c:choose>
			</tr>
		</table>
	</div>
	<c:if test="${not empty sessionScope.user}">
		<div style="text-align: right; color: #52525A;">
			Welcome <b>${sessionScope.user.username}</b>!
		</div>
	</c:if>
</div>

