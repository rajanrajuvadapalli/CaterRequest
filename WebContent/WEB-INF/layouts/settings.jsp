<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
		<div id="profile">
			<h2>Profile</h2>
			<form method="POST" id="profileForm"
				action="${pageContext.request.contextPath}/login" novalidate
				ectype="application/x-www-form-urlencoded" autocomplete="off">
				<table>
					<c:if test="${sessionScope.user.role.value == 'CUSTOMER'}">
						<tr>
							<td>Name</td>
						</tr>
						<tr>
							<td><input type="text" size="30" maxlength="50" name="name"
								required="required" class="inputs"
								value="${sessionScope.user.data.name}"></td>
						</tr>
					</c:if>
					<c:if test="${sessionScope.user.role.value == 'RESTAURANT'}">
						<tr>
							<td>Restaurant Name</td>
						</tr>
						<tr>
							<td><input type="text" size="30" maxlength="50" name="name"
								required="required" class="inputs"
								value="${sessionScope.user.data.restaurantName}"></td>
						</tr>
						<tr>
							<td>Cuisine Type</td>
						</tr>
						<tr>
							<td><input type="text" size="30" maxlength="30"
								name="cuisineType" id="cuisineType" required="required"
								class="inputs" value="${sessionScope.user.data.cuisineType}"></td>
						</tr>
						<tr>
							<td>Website URL</td>
						</tr>
						<tr>
							<td><input type="text" size="30" maxlength="50" name="name"
								required="required" class="inputs"
								value="${sessionScope.user.data.url}"></td>
						</tr>

					</c:if>
					<tr>
						<td>Contact Phone</td>
					</tr>
					<tr>
						<td><input type="text" size="30" name="phone" class="inputs"
							required="required" value="${sessionScope.user.data.phone}"></td>
					</tr>
					<tr>
						<td>Street 1</td>
					</tr>
					<tr>
						<td><input type="text" size="30" maxlength="50"
							name="street1" class="inputs"
							value="${sessionScope.user.data.street1}"></td>
					</tr>
					<tr>
						<td>Street 2</td>
					</tr>
					<tr>
						<td><input type="text" size="30" maxlength="50"
							name="street2" class="inputs"
							value="${sessionScope.user.data.street2}"></td>
					</tr>
					<tr>
						<td>City</td>
					</tr>
					<tr>
						<td><input type="text" size="30" maxlength="50" name="city"
							class="inputs" value="${sessionScope.user.data.city}"></td>
					</tr>
					<tr>
						<td>State</td>
					</tr>
					<tr>
						<td><input size="30" maxlength="50" name="state"
							class="inputs" value="${sessionScope.user.data.state}"></td>
					</tr>
					<tr>
						<td>Zip</td>
					</tr>
					<tr>
						<td><input type="text" size="10" name="zip" maxlength="10"
							class="inputs" value="${sessionScope.user.data.zip}"></td>
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

	</tr>
</table>