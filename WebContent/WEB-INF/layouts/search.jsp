<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="col-sm-10 col-sm-offset-1 page-header">
	<h1>
		<span class="glyphicon glyphicon-search"></span> Search Restaurants
	</h1>
</div>

<input type="hidden" name="eventAddress" id="event-address"
	class="event-address" value="${eventLocation}" />

<div class="col-sm-10 col-sm-offset-1">
	<div class="col-sm-2 right">
		<button class="popup-with-form btn btn-default"
			href="#start-new-search-form">Start new search</button>
		<br />
	</div>
	<div class="col-sm-12">
		<c:choose>
			<c:when test="${empty restaurants}">Sorry! No <c:out
					value="${cuisine}"></c:out> restaurants registered with us.
				</c:when>
			<c:otherwise>
				<c:forEach items="${restaurants}" var="r">
					<div class="col-sm-3">
						<div class="panel panel-warning">
							<div class="panel-heading">
								<h3 class="panel-title">${r.restaurant.name}- ${r.distance}</h3>
							</div>
							<div class="panel-body">
								<img width="120px"
									src="https://s3-us-west-2.amazonaws.com/rajrv-caterrequest-profile-pics/Restaurant_${r.restaurant.id}"
									alt=""> <br />
								${r.restaurant.address.street1}${r.restaurant.address.street2},${r.restaurant.address.city},${r.restaurant.address.state},${r.restaurant.address.zip}<br />
								<img src="${r.reviewImage}" width="100" height="20">-
								${r.numberOfReviews}
								<c:out value="reviews" />
							</div>
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</div>

<form
	class="mfp-hide white-popup-block form-horizontal searchRestaurantPopup"
	id="start-new-search-form"
	action="${pageContext.request.contextPath}/search" method="GET">
	<h2>Search for restaurants</h2>
	<label for="name" class="col-sm-2 control-label">Zip
		code&nbsp;:</label> <input type="text" size="5" maxlength="5"
		value="${eventLocation}" name="zip_code" id="zip_code"
		required="required" class="form-control"><br /> <label
		for="name" class="col-sm-2 control-label">Cuisine type&nbsp;:</label>
	<span id="cuisineType"></span> <label class="col-sm-3 control-label"></label>
	<br /> <span class="input-group-btn">
		<button type="submit" class="btn btn-default">
			Search again<i class="fa fa-angle-right"></i>
		</button>
	</span>
</form>

<script>
	$('document').ready(function() {
		populateCuisineTypes();
	});
</script>