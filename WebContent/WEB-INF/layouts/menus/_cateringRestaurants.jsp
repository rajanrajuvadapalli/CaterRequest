<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="col-sm-10 col-sm-offset-1 page-header">
	<h1>${sessionScope.eventName}/${cuisineType}&nbsp;menu</h1>
	<input type="hidden" name="eventAddress" id="event-address"
		class="event-address" value="${eventLocation.zip}" />
</div>

<div class="col-sm-10 col-sm-offset-1">
	<div class="panel panel-warning">
		<div class="panel-heading">
			<h3 class="panel-title">Select restaurants you are interested in</h3>
		</div>
		<div class="panel-body" align="left">
			<c:choose>
				<c:when test="${empty restaurants}">Sorry! No restaurants (of cuisine type <c:out
						value="${cuisineType}"></c:out>) are registered with us.
				</c:when>
				<c:otherwise>
					<form class="form-horizontal" method="POST"
						id="select-restaurant-form"
						action="${pageContext.request.contextPath}/customer/event/requestQuote"
						onsubmit="return validateSelectRestaurantForm()"
						enctype="application/x-www-form-urlencoded" autocomplete="off">
						<c:forEach items="${restaurants}" var="r">
							<div class="row">
								<div class="col-sm-2">
									<img width="120px"
										src="https://s3-us-west-2.amazonaws.com/caterrequest-restaurant-profile-pics/Restaurant_${r.restaurant.id}"
										alt="">
								</div>
								<div class="col-sm-4">
									<br /> <input type="checkbox"
										(${sessionScope.user.isGuest()}? 'disabled':'')
                                    ${prevR.contains(r.restaurant.id)?'checked':''}
                                     name="restaurantId"
										value="${r.restaurant.id}" /> <b> ${r.restaurant.name } -
										${r.distance} </b> <br>
									${r.restaurant.address.street1} ${r.restaurant.address.street2}, ${r.restaurant.address.city}, ${r.restaurant.address.state}, ${r.restaurant.address.zip}
									<br>
									<c:choose>
										<c:when test="${r.reviewImage ne null }">
											<a href="${r.websiteUrl}" target="_blank"> <img src="${r.reviewImage}"
												width="100" height="20" /></a> - ${r.numberOfReviews} <c:out
												value="reviews" />

										</c:when>
										<c:otherwise>
											<c:out value="No Yelp Reviews"></c:out>
										</c:otherwise>



									</c:choose>

									<c:if test="${r.reviewImage eq null }">

									</c:if>

								</div>
							</div>
							<br />
						</c:forEach>
						<div class="display-restaurants" data-page='catering'></div>
						<br>
						<div class="col-sm-2">
							<c:choose>
								<c:when test="${sessionScope.user.isGuest()}">
									<button class="popup-with-form-modal btn btn-default"
										name="nologin" href="#nologin-form">Next</button>
								</c:when>
								<c:otherwise>
									<button type="submit" class="btn btn-default">Next</button>
								</c:otherwise>
							</c:choose>
						</div>
						<input type="hidden" name="cuisineType" value="${cuisineType}">
					</form>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>

<div id="nologin-form" class="mfp-hide white-popup-block nologinPopup">
	<h2>You need to be a registered user to continue.</h2>
	<form class="form-horizontal loginPopup"
		action="${pageContext.request.contextPath}/register" method="GET">
		<input type="hidden" name="as" value="customer">
		<button class="btn btn-default" type="submit">Register</button>
	</form>
	<hr />
	<form class="form-horizontal"
		action="${pageContext.request.contextPath}/login" method="POST"
		enctype="application/x-www-form-urlencoded"
		onsubmit="return validateLoginForm();">
		<h2 class="form-signin-heading">Already have an account?</h2>
		<label for="inputEmail" class="sr-only">Email address</label> <input
			type="email" name="username" id="username" class="form-control"
			placeholder="Email address" required autofocus> <label
			for="inputPassword" class="sr-only">Password</label> <input
			type="password" name="pwd" id="pwd" class="form-control"
			placeholder="Password" required="required"> <span
			class="input-group-btn">
			<button type="submit" class="btn btn-default">Sign in</button>
		</span>
	</form>
</div>

<script>
	$('document').ready(function() {
		$("button[name=nologin]").click();
	});
</script>
