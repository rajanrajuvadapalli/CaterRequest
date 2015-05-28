<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="page-header">
	<h1>Settings</h1>
</div>

<c:if test="${not empty errors}">
	<div class="alert alert-danger">
		<ul>
			<c:forEach items="${errors}" var="e">
				<li align="left">${e}</li>
			</c:forEach>
		</ul>

	</div>
</c:if>

<c:if test="${not empty successMessages}">
	<div class="alert alert-success">
		<ul>
			<c:forEach items="${successMessages}" var="sm">
				<li align="left">${sm}</li>
			</c:forEach>
		</ul>

	</div>
</c:if>

<c:if test="${not empty warnings}">
	<div class="alert alert-warning">
		<ul>
			<c:forEach items="${warnings}" var="w">
				<li align="left">${w}</li>
			</c:forEach>
		</ul>
	</div>
</c:if>


<div class="col-sm-12">
	<div class="panel panel-info">
		<div class="panel-heading">
			<h3 class="panel-title">Change Password</h3>
		</div>
		<div class="panel-body">
			<form class="form-horizontal" method="POST" id="accountSettingsForm"
				action="${pageContext.request.contextPath}/settings/changePassword"
				novalidate ectype="application/x-www-form-urlencoded"
				autocomplete="off"
				onsubmit="return validateAccountSettingsForm();">
				<div class="form-group">
					<label for="currPwd" class="col-sm-3 control-label">Current
						Password: </label>

					<div class="col-sm-6">
						<input type="password" size="30" id="currPwd" name="currPwd"
							class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label for="newPwd1" class="col-sm-3 control-label">New
						Password: </label>

					<div class="col-sm-6">
						<input type="password" size="30" id="newPwd1" name="newPwd1"
							class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label for="newPwd2" class="col-sm-3 control-label">Retype
						New Password: </label>
					<div class="col-sm-6">
						<input type="password" size="30" id="newPwd2" name="newPwd2"
							class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label"></label>

					<div class="col-sm-6" align="left">
						<button type="submit" class="btn btn-default">Update
						</button>
					</div>
				</div>

			</form>
		</div>
	</div>
</div>
