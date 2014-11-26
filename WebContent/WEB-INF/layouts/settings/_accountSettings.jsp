<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id=accountSettings>
	<h2>Account Settings</h2>
	<form method="POST" id="accountSettingsForm"
		action="${pageContext.request.contextPath}/settings/accountSettings"
		novalidate ectype="application/x-www-form-urlencoded"
		autocomplete="off">
		<table>
			<tr>
				<td>Current Password</td>
			</tr>
			<tr>
				<td><input type="password" size="30" id="currPwd"
					name="currPwd" class="inputs"></td>
			</tr>
			<tr>
				<td>New Password</td>
			</tr>
			<tr>
				<td><input type="password" size="30" id="newPwd1"
					name="newPwd1" class="inputs"></td>
			</tr>
			<tr>
				<td>Retype New Password</td>
			</tr>
			<tr>
				<td><input type="password" size="30" id="newPwd2"
					name="newPwd2" class="inputs"></td>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>

				<td><button type="submit" width="50px" class="button">Update
						Profile</button></td>
			</tr>
		</table>
	</form>
</div>