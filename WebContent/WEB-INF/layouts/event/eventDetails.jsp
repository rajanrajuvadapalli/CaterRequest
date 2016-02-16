<%@ page import="java.util.Date"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Locale"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="col-sm-10 col-sm-offset-1 page-header">
	<h1>${event.name}</h1>
</div>

<c:set var="now" value="<%=new Date()%>" />
<%
	Calendar calendar = Calendar.getInstance(Locale.US);
	calendar.add(Calendar.HOUR, 72);
	Date d72 = calendar.getTime();
%>
<c:set var="seventy_two_hours_from_now" value="<%=d72%>" />

<input type="text" hidden="hidden" name="event_date_time"
	value="${event.date_time}" />

<div class="row">
	<div class="col-sm-5 col-sm-offset-1">
		<div class="panel panel-success">
			<div class="panel-heading">
				<h3 class="panel-title">
					Event details
					<c:if test="${event.date_time <= now}">
						<span style="color: red">&nbsp;&nbsp;Past Event!</span>
					</c:if>
					<c:if test="${event.status eq 'ACTIVE' && event.date_time > now}">
						<a
							href="${pageContext.request.contextPath}/customer/event/edit/${event.id}"
							class="pull-right"> <span class="glyphicon glyphicon-edit"></span>
							Edit
						</a>
					</c:if>
				</h3>
			</div>
			<div class="panel-body" align="left">
				<c:if test="${event.date_time > now}">
					<div id="countdowntimer">
						<span id="future_date"></span>
					</div>
					<br />
				</c:if>
				<b>Event name:</b> ${event.name}<br /> <b>Time:</b>
				<fmt:formatDate value="${event.date_time}"
					pattern="EEE, d MMM yyyy hh:mm aaa" />
				<br /> <b>Location: </b> ${event.location.getAddressString()} <br />
				<b>Number of Adults:</b> <span class="badge">${event.personCount}</span><br />
				<b>Number of Kids:</b> <span class="badge">${event.kidsCount}</span><br />
				<b>Delivery Option:</b> <span class="badge">${event.isPickUp()?'Pick Up':'Delivered'}</span><br />
				<b>Customer name:</b> ${event.customer.name}<br />
				<c:if
					test="${q.status.toString() == 'CUSTOMER_ORDER_CONFIRMED' || q.status.toString() == 'PAID'}">
					<b>Customer contact number:</b>
					<c:out
						value="(${fn:substring(event.customer.contactNumber, 0, 3)}) ${fn:substring(event.customer.contactNumber, 3, 6)}-${fn:substring(event.customer.contactNumber, 6, 10)}" />
				</c:if>
				<br />
				<!-- Allow to add only 1 menu -->
				<c:if test="${event.date_time > seventy_two_hours_from_now }">
					<c:if test="${menus == null || menus.size() < 1}">
						<a class="popup-with-form" href="#${event.id}"><span
							class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add
							Menu</a>
					</c:if>
				</c:if>
			</div>
		</div>
	</div>

	<div class="col-sm-5">
		<div class="panel panel-success">
			<div class="panel-heading">
				<h3 class="panel-title">Available Quotes</h3>
			</div>
			<div class="panel-body" align="left">
				<c:choose>
					<c:when test="${empty menus}">Please select a menu and submit your request for quotes.</c:when>
					<c:when test="${empty groupedQuotes}">-&nbsp;None&nbsp;-</c:when>
					<c:otherwise>
						<c:choose>
							<c:when
								test="${(event.status eq 'ACTIVE') && (event.date_time > now)}">
								<form class="form-horizontal" method="POST"
									id="order-confirm-form"
									action="${pageContext.request.contextPath}/customer/orderConfirmation"
									enctype="application/x-www-form-urlencoded" autocomplete="off">
									<input type="hidden" name="xeventId" value="${event.id}">
									<input type="hidden" name="xquoteId" value="">
									<c:forEach items="${groupedQuotes}" var="q2c">
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
																		${q.restaurant.name} <c:if test="${not empty q.price}">
																		</c:if></label>
																</div>
																<c:choose>
																	<c:when test="${empty q.price}">Not responded</c:when>
																	<c:otherwise>
																		<fmt:setLocale value="en_US" />
																		<b><fmt:formatNumber value="${q.price}"
																				type="currency" /></b>
																		<c:choose>
																			<c:when test="${q.canDeliver()}">
																				<span style="color: green">FREE delivery</span>
																			</c:when>
																			<c:otherwise>
																				<span style="color: red">NO delivery</span>
																			</c:otherwise>
																		</c:choose>
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
								<c:forEach items="${groupedQuotes}" var="q2c">
									<c:forEach items="${q2c.value}" var="q">
										<c:if
											test="${ (q.status eq 'APPROVED') || (q.status eq 'PAID') }">
											<b>${q.restaurant.name}:</b> &nbsp;
																<fmt:setLocale value="en_US" />
											<a
												href="${pageContext.request.contextPath}/menu/view/${q.menu.id}"><b><fmt:formatNumber
														value="${q.price}" type="currency" /></b></a>
											<c:choose>
												<c:when test="${ q.status eq 'PAID'}">
													<label style="color: green">Paid</label>

												</c:when>
												<c:otherwise>
													<label style="color: green">Order confirmed, pay at
														restaurant!</label>
												</c:otherwise>
											</c:choose>
										</c:if>
									</c:forEach>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</div>

<form class=" mfp-hide white-popup-block popupOptions" method="GET"
	id="${event.id}"
	action="${pageContext.request.contextPath}/menu/selectMenu"
	enctype="application/x-www-form-urlencoded">
	<br /> <input type="text" hidden="true" name="eventId"
		value="${event.id}"> <span id="cuisineType"></span><br />
	<button type="submit" class="btn btn-default">Select Menu</button>
</form>

<c:forEach items="${menus}" var="menu">
	<div class="row">
		<div class="col-sm-10 col-sm-offset-1">
			<div class="panel panel-warning">
				<div class="panel-heading">
					<h3 class="panel-title">${menu.cuisine}&nbsp;Menu</h3>
				</div>
				<div class="panel-body" align="left">
					<div class="pull-right" align="right">
						<c:if
							test="${event.status == 'ACTIVE' && user.role == 'CUSTOMER' && (event.date_time > now)}">
							<c:choose>
								<c:when test="${empty groupedQuotes && sessionScope.full_menu_flow}">
									<form class="form-horizontal" method="POST"
										action="${pageContext.request.contextPath}/customer/event/requestQuote"
										enctype="application/x-www-form-urlencoded" autocomplete="off">
										<input type="hidden" name="rId"
											value="${sessionScope.full_menu_flow_rid}" /> <b>${sessionScope.full_menu_flow_rname}</b>
										<br />
										<br />
										<button type="submit" class="btn btn-default">Request
											Price</button>
									</form>
								</c:when>
								<c:otherwise>
									<a
										href="${pageContext.request.contextPath}/menu/selectMenu?eventId=${event.id}&cuisineType=${menu.cuisine}"
										role="button"
										class="btn btn-default ${event.date_time > seventy_two_hours_from_now?'':'disabled'}"><span
										class="glyphicon glyphicon-edit"></span> Edit Menu</a>
								</c:otherwise>
							</c:choose>
						</c:if>

						<br />
						<c:if
							test="${(event.date_time > now) && (event.date_time <= seventy_two_hours_from_now)}">
							<i style="color: red;">Cannot make changes.<br />Less than
								72 hrs left until the event.
							</i>
							<br />
						</c:if>
					</div>
					<div class="pull-left">
						<c:forEach items="${menu.categories}" var="category">
							<c:if test="${not empty category.items}">
								<div class="col-sm-12">
									<ul>
										<li><b>${category.name}</b></li>
										<ol>
											<c:forEach items="${category.items}" var="item">
												<li>${item.name}</li>
											</c:forEach>
										</ol>
									</ul>
								</div>
							</c:if>
						</c:forEach>
						<c:if test="${menu.cuisine == 'PIZZA'}">
							<c:forEach items="${pizza_items}" var="pi">
								<div class="col-sm-12">
									<c:choose>
										<c:when test="${pi.key.contains('#')}">
											<ul>
												<li><b>${fn:substringBefore(pi.key, ' #')}</b>
													&nbsp;&nbsp; ${pi.value}</li>
											</ul>
										</c:when>
										<c:otherwise>
											<ul>
												<li><b>${pi.key}</b> &nbsp;&nbsp; ${pi.value}</li>
											</ul>
										</c:otherwise>
									</c:choose>


								</div>
							</c:forEach>
						</c:if>
						<c:if test="${menu.cuisine == 'MEXICAN'}">
							<c:forEach items="${mexican_items}" var="m">
								<div class="col-sm-12">
									<ul>
										<li><b>${m.key}</b> &nbsp;&nbsp; ${m.value}</li>
									</ul>
								</div>
							</c:forEach>
						</c:if>
						<c:if test="${menu.cuisine == 'THAI'}">
							<c:forEach items="${thai_items}" var="m">
								<div class="col-sm-12">
									<ul>
										<li><b>${m.key}</b> &nbsp;&nbsp; ${m.value}</li>
									</ul>
								</div>
							</c:forEach>
						</c:if>
						<c:if test="${menu.cuisine == 'SANDWICH'}">
							<c:forEach items="${sandwich_items}" var="m">
								<div class="col-sm-12">
									<ul>
										<li><b>${m.key}</b> &nbsp;&nbsp; ${m.value}</li>
									</ul>
								</div>
							</c:forEach>
						</c:if>
						<c:if test="${menu.cuisine == 'MIDDLE_EASTERN'}">
							<c:forEach items="${middle_eastern_items}" var="m">
								<div class="col-sm-12">
									<ul>
										<li><b>${m.key}</b> &nbsp;&nbsp; ${m.value}</li>
									</ul>
								</div>
							</c:forEach>
						</c:if>
						<c:if test="${not empty menu.comments}">
							<c:choose>
								<c:when test="${user.role == 'RESTAURANT'}">
									<b>Comments from Customer:</b>
									<br />
								</c:when>
								<c:otherwise>
									<b>Your comments:</b>
									<br />
								</c:otherwise>
							</c:choose>
							<pre>${menu.comments}</pre>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:forEach>

<div class="col-sm-1 col-sm-offset-1">
	<button type="button" class="btn btn-default"
		onclick="window.location.href='${pageContext.request.contextPath}/dashboard'">Back</button>
	<br /> <br /> <br /> <br />
</div>

<script>
	function addCountDownTimer(future_date_time) {
		$("#future_date")
				.countdowntimer(
						{
							dateAndTime : future_date_time,
							size : "sm",
							regexpMatchFormat : "([0-9]{1,2}):([0-9]{1,2}):([0-9]{1,2}):([0-9]{1,2})",
							regexpReplaceWith : "$1<sup>days</sup> / $2<sup>hours</sup> / $3<sup>minutes</sup> / $4<sup>seconds</sup>"
						});
	};

	$('document').ready(function() {
		populateCuisineTypesDrowpdown();
		$("select[name=cuisineType]").attr('required', 'required');
		var event_date_time = $('input[name=event_date_time]').val();
		addCountDownTimer(event_date_time);
	});
	// Bind the 'onClick' event for the 'restaurantName' input field
	$('input[name=restaurantName]').on('click', function(e) {
		var $restaurantNameInputField = $(this);
		var $containerForm = $restaurantNameInputField.closest('form');
		var quoteId = $restaurantNameInputField.data('quote-id');
		$containerForm.find('input[name=xquoteId]').val(quoteId);
	});
</script>
