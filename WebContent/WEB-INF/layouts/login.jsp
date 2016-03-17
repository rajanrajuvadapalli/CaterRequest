<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="col-sm-11">
	<div class="col-sm-4 col-sm-offset-4">
		<c:if test="${not empty errors}">
			<div class="alert alert-danger">
				<button type="button" class="close btn-lg" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>

				<ul>
					<c:forEach items="${errors}" var="e">
						<li>${e}</li>
					</c:forEach>
				</ul>

			</div>
		</c:if>

		<c:if test="${not empty successMessages}">
			<div class="alert alert-success">
				<button type="button" class="close btn-lg" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<ul>
					<c:forEach items="${successMessages}" var="sm">
						<li>${sm}</li>
					</c:forEach>
				</ul>

			</div>
		</c:if>

		<c:if test="${not empty warnings}">
			<div class="alert alert-warning">
				<button type="button" class="close btn-lg" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<ul>
					<c:forEach items="${warnings}" var="w">
						<li>${w}</li>
					</c:forEach>
				</ul>
			</div>
		</c:if>

		<form class="form-signin" method="POST" id="loginForm"
			action="${pageContext.request.contextPath}/login"
			enctype="application/x-www-form-urlencoded"
			onsubmit="return validateLoginForm();">

			<h2>Please sign in</h2>
			<div style="padding-top: 10px;">
				Email address:<br /> <input type="email" name="username"
					id="username" class="form-control" placeholder="Email address"
					required autofocus>
			</div>
			<div style="padding-top: 10px;">
				Password:<br /> <input type="password" name="pwd" id="pwd"
					class="form-control" placeholder="Password" required="required">
			</div>
			<div style="padding-top: 10px;">
				<a class="popup-with-form" style="font-size: 13px;"
					href="#forgot-pwd-form">Forgot Password?</a>
			</div>
			<br />
			<button class="btn btn-default" type="submit">Sign in</button>
		</form>
		<br />

		<form class="mfp-hide white-popup-block forgotPasswordPopup"
			method="POST" id="forgot-pwd-form"
			action="${pageContext.request.contextPath}/forgotPassword"
			enctype="application/x-www-form-urlencoded">
			<h2 class="form-signin-heading">Forgot Password</h2>
			<label for="inputEmail" class="sr-only">Email address</label> <input
				type="email" name="username" id="username" class="form-control"
				placeholder="Email address" required autofocus> <br />
			<button type="submit" class="btn btn-default">Reset</button>
		</form>

	</div>
</div>
<!-- /container -->
