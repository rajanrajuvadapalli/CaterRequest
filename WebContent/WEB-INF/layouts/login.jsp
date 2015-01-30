<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${not empty errors}">
	<div class="alert alert-danger">
		<ul>
			<c:forEach items="${errors}" var="e">
				<li>${e}</li>
			</c:forEach>
		</ul>

	</div>
</c:if>

<c:if test="${not empty successMessages}">
	<div class="alert alert-success">
		<ul>
			<c:forEach items="${successMessages}" var="sm">
				<li>${sm}</li>
			</c:forEach>
		</ul>

	</div>
</c:if>

<c:if test="${not empty warnings}">
	<div class="alert alert-warning">
		<ul>
			<c:forEach items="${warnings}" var="w">
				<li>${w}</li>
			</c:forEach>
		</ul>
	</div>
</c:if>

<div class="container theme-showcase" role="main">
	<form class="form-signin" method="POST" id="loginForm"
		action="${pageContext.request.contextPath}/login" novalidate
		ectype="application/x-www-form-urlencoded" autocomplete="off">

		<h2 class="form-signin-heading">Please sign in</h2>
		<label for="inputEmail" class="sr-only">Email address</label> <input
			type="email" name="username" id="username" class="form-control"
			placeholder="Email address" required autofocus> <label
			for="inputPassword" class="sr-only">Password</label> <input
			type="password" name="pwd" id="pwd" class="form-control"
			placeholder="Password" required>
		<!-- <div class="checkbox">
			<label> <input type="checkbox" value="remember-me">
				Remember me
			</label>
		</div> -->
		<button class="btn btn-lg btn-primary btn-block" type="submit">Sign
			in</button>
	</form>
</div>
<!-- /container -->
