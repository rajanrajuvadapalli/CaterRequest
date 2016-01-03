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
	<div id="main-content">
		<div class="tabs tabs-topline">
			<nav>
				<ul>
					<li class="pull-left"><a href="#section-upcoming"
						class="icon icon-home">Upcoming Events
							(${upcomingQuotes.size()})</a></li>
					<li class="pull-left"><a href="#section-past"
						class="icon icon-gift">Past Events (${pastQuotes.size()})</a></li>
					<li class="pull-left"><a href="#section-confirmed"
						class="icon icon-gift">Confirmed Events
							(${confirmedQuotes.size()})</a></li>
				</ul>
			</nav>
			<hr class="style-1 no-gap">
			<div class="content-wrap">
				<section id="section-upcoming">
					<!-- Column width : 240 and max width is 1200 to fit max 5 tiles in one row if space exists -->
					<div class="grid js-masonry"
						data-masonry-options='{ "itemSelector": ".grid-item", "columnWidth": 240 }'>
						<c:if test="${empty upcomingQuotes}">You currently do not have any request for upcoming events.</c:if>
						<c:forEach items="${upcomingQuotes}" var="q" varStatus="qloop">
							<div class="grid-item" style="cursor: pointer">
								<p>
									<span class="head">${qloop.index+1}</span><span id="quote"
										class="quote-value"
										data-quote-val="${pageContext.request.contextPath}/menu/view/${q.menu.id}">&nbsp;${q.menu.event.name}
										(${q.menu.event.customer.name})</span><br /> <span id="date"
										class="date"><fmt:formatDate
											value="${q.menu.event.date_time}"
											pattern="EEE, d MMM yyyy hh:mm aaa" /></span> <br /> Your
									quote:&nbsp;
									<fmt:setLocale value="en_US" />
									<fmt:formatNumber value="${q.price}" type="currency" />
									<c:if test="${not empty bargain && bargain.containsKey(q.id)}">
										<span class="label label-warning"
											title="Your quote is higher than the best quote received for this event.">
											<fmt:formatNumber value="${bargain.get(q.id)}" type="percent" />
										</span>
									</c:if>
								<p>
							</div>
						</c:forEach>
					</div>
				</section>
				<section id="section-past">
					<!-- Column width : 240 and max width is 1200 to fit max 5 tiles in one row if space exists -->
					<div class="grid js-masonry"
						data-masonry-options='{ "itemSelector": ".grid-item", "columnWidth": 240 }'>
						<c:if test="${empty pastQuotes}">You do not have any request for past events.</c:if>
						<c:forEach items="${pastQuotes}" var="q" varStatus="qloop">
							<div class="grid-item" style="cursor: pointer">
								<p>
									<span class="head">${qloop.index+1}</span><span id="quote"
										class="quote-value"
										data-quote-val="${pageContext.request.contextPath}/menu/view/${q.menu.id}">&nbsp;${q.menu.event.name}
										(${q.menu.event.customer.name})</span><br /> <span id="date"
										class="date"><fmt:formatDate
											value="${q.menu.event.date_time}"
											pattern="EEE, d MMM yyyy hh:mm aaa" /></span> <br /> Your
									quote:&nbsp;
									<fmt:setLocale value="en_US" />
									<fmt:formatNumber value="${q.price}" type="currency" />
									<c:if test="${not empty bargain && bargain.containsKey(q.id)}">
										<span class="label label-warning"
											title="Your quote is higher than the best quote received for this event.">
											<fmt:formatNumber value="${bargain.get(q.id)}" type="percent" />
										</span>
									</c:if>
								<p>
							</div>
						</c:forEach>
					</div>
				</section>
				<section id="section-confirmed">
					<!-- Column width : 240 and max width is 1200 to fit max 5 tiles in one row if space exists -->
					<div class="grid js-masonry"
						data-masonry-options='{ "itemSelector": ".grid-item", "columnWidth": 240 }'>
						<c:if test="${empty confirmedQuotes}">You currently do not have any confirmed events.</c:if>
						<c:forEach items="${confirmedQuotes}" var="q" varStatus="qloop">
							<div class="grid-item" style="cursor: pointer">
								<p>
									<span class="head">${qloop.index+1}</span><span id="quote"
										class="quote-value"
										data-quote-val="${pageContext.request.contextPath}/menu/view/${q.menu.id}">&nbsp;${q.menu.event.name}
										(${q.menu.event.customer.name})</span><br /> <span id="date"
										class="date"><fmt:formatDate
											value="${q.menu.event.date_time}"
											pattern="EEE, d MMM yyyy hh:mm aaa" /></span> <br /> Your
									quote:&nbsp;
									<fmt:setLocale value="en_US" />
									<fmt:formatNumber value="${q.price}" type="currency" />
									<c:if test="${not empty bargain && bargain.containsKey(q.id)}">
										<span class="label label-warning"
											title="Your quote is higher than the best quote received for this event.">
											<fmt:formatNumber value="${bargain.get(q.id)}" type="percent" />
										</span>
									</c:if>
								<p>
							</div>
						</c:forEach>
					</div>
				</section>
			</div>
			<!-- End content-wrap -->

		</div>
		<!-- End tabs -->
	</div>
	<!-- End main-content -->
</div>
<!-- End col-sm-10 -->

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