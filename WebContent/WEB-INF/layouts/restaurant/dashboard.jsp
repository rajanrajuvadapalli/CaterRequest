<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="col-sm-10 col-sm-offset-1 page-header">
	<h1>My Dashboard</h1>
</div>
<div class="col-sm-10 col-sm-offset-1">
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

<div class="col-sm-10 col-sm-offset-1">
	<div align="right">
		<a href="${pageContext.request.contextPath}/restaurant/addBranch"
			role="button" class="btn btn-default">Add a branch</a>
	</div>
	<div id="main-content">
		<div class="tabs tabs-topline">
			<nav>
				<ul>
					<c:forEach items="${restaurant.branches}" var="b" varStatus="bLoop">
						<li class="pull-left"><a
							href="#section-branch-${bLoop.index+1}" class="icon icon-home">Branch
								${bLoop.index+1}</a>&nbsp;</li>
					</c:forEach>
				</ul>
			</nav>
			<hr class="style-1 no-gap">
			<div class="content-wrap">
				<c:forEach items="${restaurant.branches}" var="b" varStatus="bLoop">
					<section id="section-branch-${bLoop.index+1}">
						<c:choose>
							<c:when test="${empty b.quotes}">
				You currently do not have any request for quotes.
				</c:when>
							<c:otherwise>

								<!-- Column width : 240 and max width is 1200 to fit max 5 tiles in one row if space exists -->
								<div class="grid js-masonry"
									data-masonry-options='{ "itemSelector": ".grid-item", "columnWidth": 240 }'>
									<c:forEach items="${b.quotes}" var="q" varStatus="qLoop">
										<div class="grid-item" style="cursor: pointer">
											<p>
												<span class="head">${qLoop.index+1}</span>&nbsp;<span
													id="quote" class="quote-value"
													data-quote-val="${pageContext.request.contextPath}/menu/view/${q.menu.id}?rbid=${q.restaurantBranch.id}"><b>${q.menu.event.name}</b></span>
											</p>
											<p>
												<span><fmt:formatDate
														value="${q.menu.event.date_time}"
														pattern="EEE, d MMM yyyy hh:mm aaa" /></span>
											</p>
											<p>
												<span>${q.menu.event.customer.name} <c:if
														test="${q.status.toString() == 'CUSTOMER_ORDER_CONFIRMED'}">
														<span class="glyphicon glyphicon-phone-alt"
															aria-hidden="true"></span>&nbsp;<c:out
															value="(${fn:substring(q.menu.event.customer.contactNumber, 0, 3)}) ${fn:substring(q.menu.event.customer.contactNumber, 3, 6)}-${fn:substring(q.menu.event.customer.contactNumber, 6, 10)}" />
													</c:if>
												</span>
											</p>
											<p>
												<span> ${q.menu.event.personCount}&nbsp;adults,
													${q.menu.event.kidsCount}&nbsp;kids </span>
											</p>
											<p>
												<c:choose>
													<c:when test="${q.status.toString() == 'CREATED'}">New Event.</c:when>
													<c:when
														test="${q.status.toString() == 'CUSTOMER_UPDATED_MENU'}">
                Customer has updated the menu. <span class="badge"
															style="background-color: #FF3300;">&nbsp;&#134;&nbsp;</span>
													</c:when>
													<c:when
														test="${q.status.toString() == 'CUSTOMER_UPDATED_COUNT'}">
                Customer has updated the person count. <span
															class="badge" style="background-color: #FF3300;">&nbsp;&#134;&nbsp;</span>
													</c:when>
													<c:when
														test="${q.status.toString() == 'CUSTOMER_UPDATED_DATE'}">
                Customer has updated the date and/or time of the event. <span
															class="badge" style="background-color: #FF3300;">&nbsp;&#134;&nbsp;</span>
													</c:when>
													<c:when
														test="${q.status.toString() == 'RESTAURANT_SUBMITTED_PRICE'}">Customer is reviewing your price quote.</c:when>
													<c:when
														test="${q.status.toString() == 'RESTAURANT_UPDATED_PRICE'}">Customer is reviewing your updated price quote.</c:when>
													<c:when test="${q.status.toString() == 'APPROVED'}">Customer accepted your quote.
        <span class="badge" style="background-color: #009933;">&nbsp;&#x2713;&nbsp;</span>
													</c:when>
													<c:when test="${q.status.toString() == 'DENIED'}">Customer denied your quote.</c:when>
													<c:when test="${q.status.toString() == 'PAID'}">Customer has paid.</c:when>
													<c:when
														test="${q.status.toString() == 'CUSTOMER_ORDER_CONFIRMED'}">Customer has confirmed the order.</c:when>
												</c:choose>
											</p>
											<p>
												<fmt:setLocale value="en_US" />
												<fmt:formatNumber value="${q.price}" type="currency" />
												<c:if
													test="${not empty bargain && bargain.containsKey(q.id)}">
													<span class="label label-warning"
														title="Your quote is higher than the best quote received for this event.">
														<fmt:formatNumber value="${bargain.get(q.id)}"
															type="percent" />
													</span>
												</c:if>
											</p>
										</div>
									</c:forEach>
								</div>
							</c:otherwise>
						</c:choose>
					</section>
				</c:forEach>
			</div>
			<!-- end content-wrap -->
		</div>
		<!-- end tabs-topline -->
	</div>
	<!-- end main-content -->
</div>

<script>
	(function() {
		// Menu for smaller devices
		//$('#menu').menu();
		// Tabs navigation function
		[].slice.call(document.querySelectorAll('.tabs')).forEach(function(el) {
			new TabsMenu(el);
		});
		// auto re-ordering of tiles
		$('.grid').masonry();
		// Tiles on click function goes here
		$('.grid-item').each(function() {
			$(this).on('click', function() {
				// examples to get data from the clicked tile //
				// Store unique id in data-event-val to retrieve the data from db for ease of use //
				// Just if you wanna do like this //
				//var eventval = $(this).find('#event').text();
				var dataQuoteVal = $(this).find('#quote').data('quote-val');
				//console.log(dataQuoteVal);
				if (dataQuoteVal != "") {
					window.location.replace(dataQuoteVal);
				}
				// if you want to redirect page
				// window.location.replace(url);
				// window.location.href = url; // we can use any of the 2ways specified
			})
		});
	})();
</script>