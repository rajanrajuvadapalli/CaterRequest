<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<div class="page-header">
	<h1>${sessionScope.eventName}/${cuisineType}menu</h1>
	<input type="hidden" name="eventAddress" id="event-address"
		class="event-address"
		value="${eventLocation.street1} ${eventLocation.street2}, ${eventLocation.city}, ${eventLocation.state} ${eventLocation.zip}" />
</div>


<div class="col-sm-12">
	<h2>Select restaurants you are interested in</h2>
	<div class="panel panel-warning">
		<div class="panel-heading">
			<h3 class="panel-title">Restaurants</h3>
		</div>
		<div class="panel-body" align="left">
			<c:choose>
				<c:when test="${empty restaurants}">Sorry! No <c:out
						value="${cuisine}"></c:out> restaurants registered with us.
				</c:when>
				<c:otherwise>
					<form class="form-horizontal" method="POST"
						id="select-restaurant-form"
						action="${pageContext.request.contextPath}/customer/event/requestQuote"
						onsubmit="return validateSelectRestaurantForm()"
						ectype="application/x-www-form-urlencoded" autocomplete="off">
						<c:forEach items="${restaurants}" var="r">
							<input type="checkbox" value="${r.id}" class="restaurant-address"
								name="restaurantId" ${prevR.contains(r.id)?"checked":""}
								data-restaurant-address="${r.address.street1} ${r.address.street2}, ${r.address.city}, ${r.address.state} ${r.address.zip}"
								data-restaurant-name="${r.name}">
							<br />
						</c:forEach>
						<br>
						<div class="col-sm-2">
							<button type="submit" class="btn btn-default">Next</button>
						</div>
						<input type="hidden" name="cuisineType" value="${menu.cuisine}">
					</form>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>
