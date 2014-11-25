<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${not empty errors}">
	<div class="errorMsg">
		<ul>
			<li><c:forEach items="${errors}" var="e">${e}</c:forEach></li>
		</ul>
		
	</div>
</c:if>
	
<div class="homePageBanner">
	<table>
		<tr>
			<td class="homePageBanner-left">
				<h2 class="heading">Got a Party?</h2>

				<h2 class="subheading">
					Create Event<br> Select Menu<br> Get Quotes<br>
					Finalize & Order
				</h2>
			</td>
			<td class="homePageBanner-right">
				<form method="POST" id="loginForm"
					action="${pageContext.request.contextPath}/login" novalidate
					ectype="application/x-www-form-urlencoded" autocomplete="off">
					<table>
						<tr>
							<td><input type="email" size="30" name="username" id="username"
								required="required" placeholder="Your email" class="inputs"></td>
						</tr>
						<tr><td></td></tr>
						<tr>
							<td><input type="password" size="30" name="pwd" id="pwd"
								required="required" placeholder="Password" class="inputs"></td>
						</tr>
						<tr><td></td></tr>
						<tr>
							<td><button type="submit" width="50px" class="button">Sign
									In</button></td>
						</tr>
					</table>
					<br> <br>
				</form>
			</td>
		</tr>
	</table>
</div>