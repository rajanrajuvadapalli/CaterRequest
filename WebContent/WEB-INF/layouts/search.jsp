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
	class="event-address" value="${eventZip}" />
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
						value="${cuisineType}"></c:out> restaurants registered with us within 15 miles of ${eventZip}.
				</c:when>
				<c:otherwise>
					<c:forEach items="${restaurants}" var="r">
						<div id="search-rest" class="row"
							style="border-width: 1px; border-style: solid; width: 600px; box-shadow: 10px 10px 5px #888888; padding: 0px 10px">
							<input type="hidden" id="rest-cuisines"
								value="${r.restaurant.cuisineType}" />
							<div class="col-sm-2">
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
							</div>
							<div class="col-sm-8">
								<h3>${r.restaurant.name}&nbsp;(${r.distance})</h3>
								<img src="${r.reviewImage}" width="100" height="20">-
								${r.numberOfReviews}
								<c:out value="reviews" />
								<br /> <br />
								${r.restaurant.address.street1}${r.restaurant.address.street2},${r.restaurant.address.city},${r.restaurant.address.state},${r.restaurant.address.zip}<br />
								<br />
								<form class="form-horizontal" method="GET"
									action="${pageContext.request.contextPath}/menu/view/complete">
									<input type="hidden" name="rName" value="${r.restaurant.name}" />
									<input type="hidden" name="rId" value="${r.restaurant.id}" />
									<input type="hidden" name="rZip"
										value="${r.restaurant.address.zip}" />
									<button type="submit" class="btn btn-default">Select</button>
								</form>
							</div>
						</div>
						<br />
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>

<script>
	function filter(ct, on_off) {
		//console.log(ct + " is " + on_off);
		//Filter the results based on the cuisine type selected in the previous page
		$("div#search-rest").each(function() {
			var restCuisineTypes = $(this).find("#rest-cuisines").val();
			//console.log("restCuisineTypes: " + restCuisineTypes);
			if (restCuisineTypes.indexOf(ct) >= 0) {
				//console.log("Found a restaurant with out cuisineType.");
				if (on_off) {
					$(this).removeClass('hidden');
				} else {
					$(this).addClass('hidden');
				}
			}
		});
	};

	function refreshResults() {
		//console.log("Refreshing results...");
		//First, hide all.
		$("div#search-rest").each(function() {
			$(this).addClass('hidden');
		});
		//Next, show only which are enabled.
		$("input[name=cuisineType_sec]").each(function() {
			var ct = $(this).attr("value");
			var on_off = $(this).prop("checked");
			filter(ct, on_off);
		});
	};

	$('document').ready(function() {
		populateCuisineTypesCheckbox();
		$("input[name=cuisineType_sec]").change(refreshResults);
	});
</script>