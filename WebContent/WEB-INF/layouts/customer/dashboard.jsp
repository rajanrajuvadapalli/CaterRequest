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
					<li>${e}</li>
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
					<li>${sm}</li>
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
					<li>${w}</li>
				</c:forEach>
			</ul>
		</div>
	</c:if>
</div>

<div class="col-sm-10 col-sm-offset-1">
	<!-- Guest cannot create an event on the dashboard, if there is already 1 event -->
	<c:if test="${!sessionScope.user.isGuest() or empty events}">
		<div align="center">
			<button class="btn btn-default" type="button" data-toggle="collapse"
				data-target="#flowOptions" aria-expanded="false"
				aria-controls="flowOptions">Start Order</button>
		</div>
		<br />
		<div class="row collapse well" id="flowOptions">
			<div class="search-box">
				<div class="pull-left trans-bg">
					<h3 style="color: #fff;">Find your local restaurant</h3>
					<form method="GET"
						action="${pageContext.request.contextPath}/search"
						enctype="application/x-www-form-urlencoded">
						<input id="zip" name="zip" placeholder="Enter delivery zip"
							type="text" required="required" /> <br />
						<button type="submit" class="btn btn-default">Search</button>
					</form>
				</div>
				<div class="pull-right trans-bg">
					<h3 style="color: #fff;">Request and Compare Quotes</h3>
					<form method="GET"
						action="${pageContext.request.contextPath}/menu/selectMenu"
						enctype="application/x-www-form-urlencoded">
						<input id="zip" name="zip" placeholder="Zip Code" type="text"
							required="required" maxlength="5" /><span id="cuisineType"></span>
						<br />
						<button type="submit" class="btn btn-default">Let's go!</button>
					</form>
					<%-- <form method="GET"
						action="${pageContext.request.contextPath}/customer/createEvent"
						enctype="application/x-www-form-urlencoded">
						<button type="submit" class="btn btn-default">Create
							Event</button>
					</form> --%>
				</div>
				<div class="clr"></div>
			</div>
		</div>
	</c:if>

	<div id="main-content">
		<div class="tabs tabs-topline">
			<nav>
				<ul>
					<li class="pull-left"><a href="#section-upcoming"
						class="icon icon-home">Upcoming (${upcomingEvents.size()})</a></li>
					<li class="pull-left"><a href="#section-past"
						class="icon icon-gift">Past Events (${pastEvents.size()})</a></li>
				</ul>
			</nav>
			<hr class="style-1 no-gap">
			<div class="content-wrap">
				<section id="section-upcoming">
					<!-- Column width : 240 and max width is 1200 to fit max 5 tiles in one row if space exists -->
					<div class="grid js-masonry"
						data-masonry-options='{ "itemSelector": ".grid-item", "columnWidth": 240 }'>
						<c:forEach items="${upcomingEvents}" var="e" varStatus="eloop">
							<div class="grid-item" style="cursor: pointer">
								<p>
									<span class="head">${eloop.index+1}</span><span id="event"
										class="event-value"
										data-event-val="${pageContext.request.contextPath}/menu/view/all?eventId=${e.id}">${e.name}</span><br />
									<span id="date" class="date"><fmt:formatDate
											value="${e.date_time}" pattern="EEE, d MMM yyyy hh:mm aaa" /></span>
								<p>
							</div>

						</c:forEach>
					</div>
				</section>
				<section id="section-past">
					<!-- Column width : 240 and max width is 1200 to fit max 5 tiles in one row if space exists -->
					<div class="grid js-masonry"
						data-masonry-options='{ "itemSelector": ".grid-item", "columnWidth": 240 }'>
						<c:forEach items="${pastEvents}" var="e" varStatus="eloop">
							<div class="grid-item" style="cursor: pointer">
								<p>
									<span class="head">${eloop.index+1}</span><span id="event"
										class="event-value"
										data-event-val="${pageContext.request.contextPath}/menu/view/all?eventId=${e.id}">${e.name}</span><br />
									<span id="date" class="date"><fmt:formatDate
											value="${e.date_time}" pattern="EEE, d MMM yyyy hh:mm aaa" /></span>
								<p>
							</div>
						</c:forEach>
					</div>
				</section>
			</div>
		</div>
		<hr class="style-1">
	</div>
</div>

<script>
$('document').ready(function() {
	populateCuisineTypesDrowpdown();
});

	(function() {
		// Menu for smaller devices
		$('#menu').menu();
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
				var dataEventVal = $(this).find('#event').data('event-val');
				//console.log(dataEventVal);
				if (dataEventVal != "") {
					window.location.replace(dataEventVal);
				}
				// if you want to redirect page
				// window.location.replace(url);
				// window.location.href = url; // we can use any of the 2ways specified
			})
		});
	})();
</script>
