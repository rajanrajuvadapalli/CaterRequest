<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="col-sm-10 col-sm-offset-1 page-header">
	<h1>Registration</h1>
</div>

<div class="col-sm-10 col-sm-offset-1">
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
</div>

<div>
	<div class="row">
		<div class="col-sm-4">
			<form class="form-horizontal"
				action="${pageContext.request.contextPath}/login" method="POST"
				enctype="application/x-www-form-urlencoded"
				onsubmit="return validateLoginForm();">
				<div class="panel panel-warning">
					<div class="panel-heading">
						<h3 class="panel-title">Already have an account?</h3>
					</div>
					<div class="panel-body">
						<div class="form-group" id="customer">
							<label for="inputEmail" class="col-sm-3 control-label">Email
								<span style="color: red">*</span>&nbsp;:
							</label>
							<div class="col-sm-6">
								<input type="email" size="20" name="username"
									class="form-control" placeholder="Email address"
									required="required">
							</div>
						</div>
						<div class="form-group" id="customer">
							<label for="inputPassword" class="col-sm-3 control-label">Password<span
								style="color: red">*</span>&nbsp;:
							</label>
							<div class="col-sm-6">
								<input type="password" name="pwd" id="pwd" class="form-control"
									placeholder="Password" required="required">
							</div>
						</div>
						<div class="form-group" id="customer">
							<label class="col-sm-3 control-label"></label>
							<div class="col-sm-1">
								<button type="submit" class="btn btn-default">Sign in</button>
							</div>
						</div>

					</div>
				</div>
			</form>
		</div>
		<div class="col-sm-8">
			<form class="form-horizontal" method="POST"
				id="customer-register-form"
				action="${pageContext.request.contextPath}/register"
				enctype="multipart/form-data"
				onsubmit="return validateRegistrationFormOnSubmit();">
				<input type="hidden" name="as" value="customer">

				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">Sign up for a new account</h3>
					</div>
					<div class="panel-body">
						<div class="form-group" id="customer">
							<label for="name" class="col-sm-4 control-label">Name<span
								style="color: red">*</span>&nbsp;:
							</label>
							<div class="col-sm-6">
								<input type="text" size="30" maxlength="50" name="name"
									required="required" placeholder="First   Last"
									class="form-control" autofocus="autofocus">
							</div>
						</div>
						<div class="form-group">
							<label for="email" class="col-sm-4 control-label">Email/Username<span
								style="color: red">*</span>&nbsp;:
							</label>
							<div class="col-sm-6">
								<input type="email" size="30" name="email" required="required"
									placeholder="Ex.: jenny@gmail.com" class="form-control">
							</div>
						</div>
						<div class="form-group">
							<label for="pwd1" class="col-sm-4 control-label">Password<span
								style="color: red">*</span>&nbsp;:
							</label>
							<div class="col-sm-6">
								<input type="password" size="30" name="pwd1" id="pwd1"
									required="required" placeholder="Password" class="form-control"
									autocomplete="off">
							</div>
						</div>
						<div class="form-group">
							<label for="pwd2" class="col-sm-4 control-label">Confirm
								Password<span style="color: red">*</span>&nbsp;:
							</label>
							<div class="col-sm-6">
								<input type="password" size="30" name="pwd2" id="pwd2"
									required="required" placeholder="Re-enter Password"
									class="form-control" autocomplete="off">
							</div>
						</div>
						<div class="form-group">
							<label for="phone" class="col-sm-4 control-label">Contact
								Phone<span style="color: red">*</span>&nbsp;:
							</label>
							<div class="col-sm-6" align="left">
								<input type="text" size="30" name="phone" required="required"
									placeholder="Ex.: xxxxxxxxxx" pattern="\d{10}"
									class="form-control"><br />&nbsp;<input
									type="checkbox" name="smsOk" id="customer"
									style="-webkit-transform: scale(1.5); -o-transform: scale(1.5); -ms-transform: scale(1.5); -moz-transform: scale(1.5); padding: 10px;">&nbsp;&nbsp;<span
									id="customer">Send me text alerts <span
									class="glyphicon glyphicon-question-sign"
									style="color: #00b6e6" data-toggle="tooltip"
									title="Carrier charges may apply."></span></span>
							</div>
						</div>
						<div class="form-group" id="customer">
							<label for="pwd2" class="col-sm-4 control-label">How did
								you hear about us&nbsp;?<span style="color: red">*</span>
							</label>
							<div class="col-sm-6">
								<span id="hearAboutUs"></span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label"></label>
							<div class="col-sm-6" align="left">
								<button type="submit" class="btn btn-default">Register</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
	$('document').ready(function() {
		//populateStateDropDown();
		populateHearAboutUs();
		populateAptSuite();
	});
</script>
