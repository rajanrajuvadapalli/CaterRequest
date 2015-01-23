<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h2 style="text-align: center;">Registration</h2>

<c:if test="${not empty errors}">
	<div class="errorMsg">
		<ul>
			<c:forEach items="${errors}" var="e"><li>${e}</li></c:forEach>
		</ul>
		
	</div>
</c:if>

<c:if test="${not empty successMessages}">
	<div class="successMsg">
		<ul>
			<c:forEach items="${successMessages}" var="sm"><li>${sm}</li></c:forEach>
		</ul>
		
	</div>
</c:if>

<c:if test="${not empty warnings}">
	<div class="warningMsg">
		<ul>
			<c:forEach items="${warnings}" var="w"><li>${w}</li></c:forEach>
		</ul>
	</div>
</c:if>

<div align="center" id="register-options">
	<h3 style="text-align: center; color: silver;">Would you like to
		register as</h3>
	<table>
		<tr>
			<td class="image-button"><img
				src="${pageContext.request.contextPath}/resources/images/individual.png"
				alt="customer" onclick="showRegistrationFormFor('customer')" /></td>
			<td>&nbsp;&nbsp;&nbsp;</td>
			<td class="image-button"><img
				src="${pageContext.request.contextPath}/resources/images/chef.jpg"
				alt="restaurant" onclick="showRegistrationFormFor('restaurant')" /></td>
		</tr>
	</table>
	<br> <br> <br>
</div>

<div>
	<form method="POST" id="register-form"
		action="${pageContext.request.contextPath}/register" novalidate
		ectype="application/x-www-form-urlencoded" autocomplete="off">
		<table>
			<tr id="customer">
				<td class="field-name">Name :</td>
				<td class="field-value"><input type="text" size="30"
					maxlength="50" name="name" required="required"
					placeholder="First   Last" class="inputs">
			</tr>
			<tr id="restaurant">
				<td class="field-name">Restaurant Name :</td>
				<td class="field-value"><input type="text" size="30"
					maxlength="50" name="restaurantName" required="required"
					placeholder="Restaurant Name" class="inputs"></td>
			</tr>
			<tr id="restaurant">
				<td class="field-name">Cuisine Type :</td>
				<td class="field-value"><span id="cuisineType"></span></td>
			</tr>
			<tr id="restaurant">
				<td class="field-name">Website URL :</td>
				<td class="field-value"><input type="url" size="50" name="url"
					 placeholder="Ex.: http://www.example.com"
					class="inputs"></td>
			</tr>
			<tr>
				<td class="field-name">Email :</td>
				<td class="field-value"><input type="email" size="30"
					name="email" required="required" placeholder="Ex.: jenny@gmail.com"
					class="inputs"><br> <i>(This will be your username
						for login)</i></td>
			</tr>
			<tr>
				<td class="field-name">Password :</td>
				<td class="field-value"><input type="password" size="30"
					name="pwd1" id="pwd1" required="required" placeholder="Password"
					class="inputs"></td>
			</tr>
			<tr>
				<td class="field-name">Confirm Password :</td>
				<td class="field-value"><input type="password" size="30"
					name="pwd2" id="pwd2" required="required"
					placeholder="Re-enter Password" class="inputs"></td>
			</tr>
			<tr>
				<td class="field-name">Contact Phone :</td>
				<td class="field-value"><input type="text" size="30"
					name="phone" required="required" placeholder="Ex.: xxx-xxx-xxxx"
					class="inputs"></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;"><br>Address</td>
			</tr>
			<tr>
				<td class="field-name">Street 1 :</td>
				<td class="field-value"><input type="text" size="30"
					maxlength="50" name="street1" required="required"
					placeholder="Line 1" class="inputs"></td>
			</tr>
			<tr>
				<td class="field-name">Street 2 :</td>
				<td class="field-value"><input type="text" size="30"
					maxlength="50" name="street2" placeholder="Line 2" class="inputs"></td>
			</tr>
			<tr>
				<td class="field-name">City :</td>
				<td class="field-value"><input type="text" size="30"
					name="city" required="required" placeholder="City" class="inputs"></td>
			</tr>
			<tr>
				<td class="field-name">State :</td>
				<td class="field-value"><select id="state" name="state"
					class="form-control bfh-states inputs"></select></td>
			</tr>
			<tr>
				<td class="field-name">Zip :</td>
				<td class="field-value"><input type="text" size="10" name="zip"
					maxlength="10" required="required" placeholder="Ex.: xxxxx"
					class="inputs"></td>
			</tr>
			<tr>
				<td></td>
				<td><button type="submit" width="50px" class="button">Register</button></td>
			</tr>
		</table>
	</form>
</div>