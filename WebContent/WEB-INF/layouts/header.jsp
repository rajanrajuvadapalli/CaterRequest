<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand"
				href="${pageContext.request.contextPath}/home">CaterRequest</a>
		</div>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a
					href="${pageContext.request.contextPath}/home">Home</a></li>
				<li><a href="${pageContext.request.contextPath}/aboutUs">About</a></li>
				<li><a href="${pageContext.request.contextPath}/contactUs">Contact</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<c:choose>
					<c:when test="${empty sessionScope.user}">
						<li><a href="${pageContext.request.contextPath}/home">Login</a></li>
						<li><a href="${pageContext.request.contextPath}/register">Sign
								Up</a></li>
					</c:when>
					<c:otherwise>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false">Settings
								<span class="caret"></span>
						</a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="${pageContext.request.contextPath}/settings/personalInfo">Personal Info</a></li>
								<li><a href="${pageContext.request.contextPath}/settings/changePassword">Change Password</a></li>
								<li><a href="${pageContext.request.contextPath}/settings/paymentInfo">Payment Info</a></li>
								<!-- <li class="divider"></li>
								<li class="dropdown-header">Nav header</li>
								<li><a href="#">Separated link</a></li>
								<li><a href="#">One more separated link</a></li> -->
							</ul></li>


						<li><a href="${pageContext.request.contextPath}/logout">
								Logout </a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
</nav>

<div style="align: right;">
	<c:if test="${not empty sessionScope.user}">
		<span style="text-align: right; color: #52525A;"> Welcome <b>${sessionScope.user.username}</b>!
		</span>
	</c:if>
</div>


