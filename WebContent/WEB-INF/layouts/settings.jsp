<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${not empty errors}">
	<div class="errorMsg">
		<ul>
			<li><c:forEach items="${errors}" var="e">${e}</c:forEach></li>
		</ul>

	</div>
</c:if>

<c:if test="${status == 'success'}">
	<div class="successMsg">Profile successfully updated.</div>
</c:if>

<table style="width: 900px;">
	<tr>
		<td style="width: 200px; vertical-align: top;">
			<table class="settings">
				<tr>
					<th>Personal Settings</th>
				</tr>
				<tr>
					<td>Profile</td>
				</tr>
				<tr>
					<td>Account Settings</td>
				</tr>
				<tr>
					<td>Payment Info</td>
				</tr>
			</table>
		</td>

		<td width="20px"></td>

		<td align="left"
			style="padding: 10px 10px 10px 20px; border: 1px solid #B1B1BA; border-radius: 5px;">
			<c:import url="settings/_profile.jsp"></c:import> <c:import
				url="settings/_accountSettings.jsp"></c:import>

		</td>

	</tr>
</table>