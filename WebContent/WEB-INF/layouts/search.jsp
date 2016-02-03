<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="col-sm-10 col-sm-offset-1 page-header">
	<h1>
		<span class="glyphicon glyphicon-search"></span> Search Restaurants
		for Order delivery
	</h1>
</div>

<input type="hidden" name="eventAddress" id="event-address"
	class="event-address" value="${eventLocation}" />
<input type="hidden" name="cuisineType" value="${cuisineType}" />

<div class="container container-fluid">
	<div class="row">
		<div class="col-sm-3">
			<div class="panel panel-warning">
				<div class="panel-heading">
					<h3 class="panel-title">Cuisines Filter</h3>
				</div>
				<div class="panel-body">
					<span id="cuisineType_sec"></span>
				</div>
			</div>
		</div>
		<div class="col-sm-9">
			<c:choose>
				<c:when test="${empty restaurants}">Sorry! No <c:out
						value="${cuisineType}"></c:out> restaurants registered with us.
				</c:when>
				<c:otherwise>
					<c:forEach items="${restaurants}" var="r">
						<h3>${r.restaurant.name}-${r.distance}</h3>
						<c:if test="${sessionScope.env.isProd()}">
							<img width="120px"
								src="https://s3-us-west-2.amazonaws.com/caterrequest-restaurant-profile-pics/Restaurant_${r.restaurant.id}"
								alt="">
						</c:if>
						<c:if test="${sessionScope.env.isUat()}">
							<img width="120px"
								src="https://s3-us-west-2.amazonaws.com/rajrv-caterrequest-profile-pics/Restaurant_${r.restaurant.id}"
								alt="">
						</c:if>
						<br />
								${r.restaurant.address.street1}${r.restaurant.address.street2},${r.restaurant.address.city},${r.restaurant.address.state},${r.restaurant.address.zip}<br />
						<img src="${r.reviewImage}" width="100" height="20">-
								${r.numberOfReviews}
								<c:out value="reviews" />
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>

<script>
	$('document').ready(
			function() {
				populateCuisineTypesCheckbox();
				var cuisineType = $("input[name=cuisineType]").val();
				$("input[name=cuisineType_sec][value='" + cuisineType + "']")
						.attr("checked", true);
			});
</script>