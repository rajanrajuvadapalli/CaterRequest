<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="browserwarning" class="browserwarning hidden">This
	website is optimized for Chrome browser. Please use Chrome browser for
	better user experience.</div>

<c:if test="${not empty sessionScope.user}">
	<c:choose>
		<c:when test="${not empty sessionScope.user.name}">
			<c:set var="sessionUserName" scope="session"
				value="${sessionScope.user.name}" />
		</c:when>
		<c:otherwise>
			<c:set var="sessionUserName" scope="session"
				value="${sessionScope.user.username}" />
		</c:otherwise>
	</c:choose>
</c:if>

<!-- Navigation-->
<div class="header">
	<div class="wrapper">
		<div class="brand">
			<a href="${pageContext.request.contextPath}/home"><img
				src="${pageContext.request.contextPath}/resources/assets/img/logo.png"
				alt="logo"></a>
		</div>
		<nav class="navigation-items">
			<div class="wrapper">
				<ul class="main-navigation navigation-top-header"></ul>
				<ul class="user-area">
					<c:choose>
						<c:when test="${empty sessionScope.user}">
							<li><a href="${pageContext.request.contextPath}/login">Sign
									In</a></li>
							<li><a
								href="${pageContext.request.contextPath}/register?as=customer"><strong>Register</strong></a></li>
							<li>
								<form class="form-horizontal" method="GET"
									id="restaurant-register-form"
									action="${pageContext.request.contextPath}/register"
									enctype="application/x-www-form-urlencoded" autocomplete="off">
									<input type="hidden" name="as" value="restaurant">
									<button type="submit" class="btn btn-default">List
										Your Restaurant</button>
								</form>
							</li>
						</c:when>
						<c:otherwise>
							<span style="padding-right: 15px;"><span
								class="glyphicon glyphicon-user"></span> Hi, ${sessionUserName}!</span>
							<c:if test="${!sessionScope.user.isGuest()}">
								<span style="padding-right: 15px;"><a
									href="${pageContext.request.contextPath}/settings/personalInfo">
										<span class="glyphicon glyphicon-cog"></span> Settings
								</a></span>
							</c:if>

							<c:if test="${sessionScope.user.role == 'ADMIN'}">
								<span style="padding-right: 15px;"><li class="dropdown"><a
										href="#" class="dropdown-toggle" data-toggle="dropdown"
										role="button" aria-expanded="false">Counts <span
											class="caret"></span></a>
										<ul class="dropdown-menu" role="menu">
											<li><a
												href="${pageContext.request.contextPath}/admin/listCustomers">
													List Customers <span class="badge">${nCustomers}</span>
											</a></li>
											<li><a
												href="${pageContext.request.contextPath}/admin/listEvents">
													List Events <span class="badge">${nEvents}</span>
											</a></li>
											<li><a
												href="${pageContext.request.contextPath}/admin/listRestaurants">
													List Restaurants <span class="badge">${nRestaurants}</span>
											</a></li>
										</ul></li></span>
							</c:if>

							<span style="padding-right: 15px;"><a
								href="${pageContext.request.contextPath}/dashboard"> <span
									class="glyphicon glyphicon-home"></span> My Dashboard
							</a></span>
							<span style="padding-right: 15px;"> <a
								href="${pageContext.request.contextPath}/logout"> <span
									class="glyphicon glyphicon-off"></span> Logout
							</a></span>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</nav>
	</div>
</div>
<!-- end Navigation-->

<script>
	$('document').ready(function() {
		populateCuisineTypes();
	});
</script>