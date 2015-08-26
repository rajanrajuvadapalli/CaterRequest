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
							<button class="popup-with-form btn btn-default"
								    href="#selectcuisine-form">List Your Restaurant</button>
										
								<form class="mfp-hide white-popup-block selectCuisinePopupOptions" method="GET"
									id="selectcuisine-form"
									action="${pageContext.request.contextPath}/register"
									enctype="application/x-www-form-urlencoded" autocomplete="off">
									<br/>
									<input type="hidden" name="as" value="restaurant">
									<span id="cuisineType"></span>
									<br/>
									<button type="submit" class="btn btn-default">Next</button>
								</form>
							</li>
						</c:when>
						<c:otherwise>
							<c:if test="${!sessionScope.user.isGuest()}">
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-expanded="false">
										<span class="glyphicon glyphicon-cog"></span> Settings <span
										class="caret"></span>
								</a>
									<ul class="dropdown-menu" role="menu">
										<li><a
											href="${pageContext.request.contextPath}/settings/personalInfo">Personal
												Info</a></li>
										<li><a
											href="${pageContext.request.contextPath}/settings/changePassword">Change
												Password</a></li>
										<li><a
											href="${pageContext.request.contextPath}/settings/paymentInfo">Payment
												Info</a></li>
										<!-- <li class="divider"></li>
							<li class="dropdown-header">Nav header</li>
							<li><a href="#">Separated link</a></li>
							<li><a href="#">One more separated link</a></li> -->
									</ul></li>
							</c:if>

							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-expanded="false">
									<span class="glyphicon glyphicon-user"></span>
									${sessionUserName} <span class="caret"></span>
							</a>
								<ul class="dropdown-menu" role="menu">
									<li><a href="${pageContext.request.contextPath}/dashboard">
											<span class="glyphicon glyphicon-home"></span> My Dashboard
									</a></li>

									<c:if test="${sessionScope.user.role == 'ADMIN'}">
										<li class="divider"></li>
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
									</c:if>
									<li class="divider"></li>
									<li><a href="${pageContext.request.contextPath}/logout">
											<span class="glyphicon glyphicon-off"></span> Logout
									</a></li>
								</ul></li>
							<li></li>
							<li></li>
							<li></li>
							<li></li>
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
