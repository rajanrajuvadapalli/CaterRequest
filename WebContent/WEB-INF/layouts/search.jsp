<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<input type="hidden" name="eventAddress" id="event-address"
	class="event-address" value="${eventLocation}" />

<div class="container">
	<div class="col-sm-12">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">Search for restaurants nearby</h3>
			</div>
			<div class="panel-body">
				<form class="subscribe form-horizontal"
					action="${pageContext.request.contextPath}/search" method="GET"
					role="form">

					<div class="form-group">
						<label for="name" class="col-sm-3 control-label">Zip
							code&nbsp;:</label>
						<div class="col-sm-3">
							<input type="text" size="5" maxlength="5"
								value="${eventLocation}" name="zip_code" id="zip_code"
								required="required" class="form-control">
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-sm-3 control-label">Cuisine
							type&nbsp;:</label>
						<div class="col-sm-3">
							<span id="cuisineType"></span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label"></label>
						<div class="col-sm-3" align="left">
							<span class="input-group-btn">
								<button type="submit" class="btn btn-default">
									Search again<i class="fa fa-angle-right"></i>
								</button>
							</span>
						</div>
					</div>
			</div>
			</form>
		</div>
	</div>
</div>

<div class="container">
	<div class="panel-heading">
		<h3 class="panel-title">RESTAURANTS</h3>
	</div>
	<div class="panel-body" align="left">
		<c:choose>
			<c:when test="${empty restaurants}">Sorry! No <c:out
					value="${cuisine}"></c:out> restaurants registered with us.
				</c:when>
			<c:otherwise>
				<c:forEach items="${restaurants}" var="r">
					<span class="restaurants" style="display: none;"
						data-restaurant-id="${r.id}"
						data-restaurant-address="${r.address.street1} ${r.address.street2}, ${r.address.city}, ${r.address.state} ${r.address.zip}"
						data-restaurant-name="${r.name}"></span>
				</c:forEach>
				<div class="display-restaurants"></div>
			</c:otherwise>
		</c:choose>
	</div>
</div>
<br />
<br />
<br />
<br />

<script>
	$('document').ready(function() {
		populateCuisineTypes();
	});
</script>