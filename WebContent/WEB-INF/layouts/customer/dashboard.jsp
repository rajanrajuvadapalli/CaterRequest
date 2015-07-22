<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div>
	<div class="page-header col-sm-9 col-sm-offset-1">
		<h1>My Dashboard</h1>
	</div>

	<div class="col-sm-9 col-sm-offset-1">
		<c:if test="${not empty errors}">
			<div class="alert alert-danger">
				<button type="button" class="close btn-lg" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<ul>
					<c:forEach items="${errors}" var="e">
						<li align="left">${e}</li>
					</c:forEach>
				</ul>
			</div>
		</c:if>
		<c:if test="${not empty successMessages}">
			<div class="alert alert-success">
				<button type="button" class="close btn-lg" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<ul>
					<c:forEach items="${successMessages}" var="sm">
						<li align="left">${sm}</li>
					</c:forEach>
				</ul>
			</div>
		</c:if>
		<c:if test="${not empty warnings}">
			<div class="alert alert-warning">
				<button type="button" class="close btn-lg" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<ul>
					<c:forEach items="${warnings}" var="w">
						<li align="left">${w}</li>
					</c:forEach>
				</ul>
			</div>
		</c:if>
	</div>

	<div class="col-sm-10">
		<br />
		<div align="right">
			<a href="${pageContext.request.contextPath}/customer/createEvent"
				role="button" class="btn btn-default"> Create Event</a>
		</div>
		<br />

		<!-- Ajax Tabs Left -->
		<div class='tabs-x tabs-left tab-bordered col-sm-offset-1'>
			<ul id="myTab" class="nav nav-tabs" role="tablist">
				<li class="active"><a href="#home" role="tab" data-toggle="tab">Home</a></li>
				<c:forEach items="${events}" var="e" varStatus="loop">
					<li><a href="#event_${loop.index}" role="tab-kv"
						data-toggle="tab">${e.name}</a></li>
				</c:forEach>
			</ul>
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade in active" id="home">
					Welcome to your dashboard. <br /> Click "Create Event" button on
					the top to get started.
				</div>
				<c:forEach items="${events}" var="e" varStatus="loop">
					<div class="tab-pane fade" id="event_${loop.index}">
						<h2>${e.name}</h2>

						<c:if test="${e.status eq 'ACTIVE'}">
							<a
								href="${pageContext.request.contextPath}/customer/event/edit/${e.id}"
								role="button" class="btn btn-default">Edit Event</a>
						</c:if>

						<br /> <br /> <b>When:</b>
						<fmt:formatDate value="${e.date_time}"
							pattern="EEE, d MMM yyyy hh:mm aaa" />
						<br /> <br /> <b>Where: </b>${e.location.street1}${e.location.street2},
						${e.location.city}, ${e.location.state} - ${e.location.zip} <br />
						<br /> <b>How many:</b> ${e.personCount} <br /> <br /> <b>Quote(s):</b>
						<c:choose>
							<c:when test="${empty e2m.get(e.id)}">Please select a menu and create your request.</c:when>
							<c:when test="${empty e2q.get(e.id)}">	0 restaurants have responded to your request.
										</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${e.status eq 'ACTIVE'}">
										<form class="form-horizontal" method="POST"
											id="order-confirm-form"
											action="${pageContext.request.contextPath}/customer/orderConfirmation"
											enctype="application/x-www-form-urlencoded"
											autocomplete="off">
											<input type="hidden" name="xeventId" value="${e.id}">
											<input type="hidden" name="xquoteId" value="">
											<c:forEach items="${e2q.get(e.id)}" var="q2c">
												<c:if test="${not empty q2c}">
													<div>
														<div class="panel panel-info">
															<div class="panel-heading">
																<h3 class="panel-title">${q2c.key}</h3>
															</div>
															<div class="panel-body">
																<div>
																	<input type="hidden" name="xcuisineType"
																		value="${cuisine}">
																	<c:forEach items="${q2c.value}" var="q">
																		<div>
																			<label><input type="radio"
																				value="${q.restaurant.id}" required="required"
																				data-quote-id="${q.id}" name="restaurantName">
																				${q.restaurant.name} </label>
																		</div>
																		<c:choose>
																			<c:when test="${empty q.price}">Not responded</c:when>
																			<c:otherwise>
																				<fmt:setLocale value="en_US" />
																				<b><fmt:formatNumber value="${q.price}"
																						type="currency" /></b>
																			</c:otherwise>
																		</c:choose>
																		<br>
																	</c:forEach>
																</div>
															</div>
														</div>
													</div>
												</c:if>
											</c:forEach>
											<class="col-sm-2">
											<button type="submit" width="50px" class="btn btn-default">Confirm
												Order</button>
										</form>
									</c:when>
									<c:otherwise>
										<c:forEach items="${e2q.get(e.id)}" var="q2c">
											<c:forEach items="${q2c.value}" var="q">
												<c:if test="${ q.status eq 'APPROVED'}">
													<b>${q.restaurant.name}:</b> &nbsp;
																<fmt:setLocale value="en_US" />
													<a
														href="${pageContext.request.contextPath}/menu/view/${q.menu.id}"><b><fmt:formatNumber
																value="${q.price}" type="currency" /></b></a>
												</c:if>
											</c:forEach>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
						<br /> <br /> <b>Menu(s):</b>
						<c:if test="${e.status eq 'ACTIVE'}">
							<c:if test="${not empty e2m.get(e.id)}">
								<c:forEach items="${e2m.get(e.id)}" var="cuisine"
									varStatus="loop">
									<a
										href="${pageContext.request.contextPath}/menu/view/${e2mid.get(e.id).get(loop.index)}"
										role="button" class="btn btn-sm btn-primary">${cuisine}</a>
								</c:forEach>
							</c:if>
							<a href="#" onclick="showForm(${e.id})" role="button"
								class="btn btn-sm btn-primary"><span
								class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add
								Menu</a>

							<form class="hidden" method="GET" id="${e.id}"
								action="${pageContext.request.contextPath}/menu/selectMenu"
								onsubmit="return validateCuisine(${e.id});"
								enctype="application/x-www-form-urlencoded">
								<br /> <input type="text" hidden="true" name="eventId"
									value="${e.id}"> <span id="cuisineType"></span><br />
								<button type="submit" class="btn btn-default">Select
									Menu</button>
							</form>

						</c:if>
						<br />
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
<script>
	$('document').ready(function() {
		populateCuisineTypes();
	});
	function showForm(id) {
		$("form[id="+id+"]").removeClass("hidden");
	}
	// Bind the 'onClick' event for the 'restaurantName' input field
	$('input[name=restaurantName]').on('click', function(e) {
		var $restaurantNameInputField = $(this);
		var $containerForm = $restaurantNameInputField.closest('form');
		var quoteId = $restaurantNameInputField.data('quote-id');
		$containerForm.find('input[name=xquoteId]').val(quoteId);
	});
</script>