<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<td align="left">
	<div id="accountSettings" class="sideMenuItemsDetail">
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
</td>