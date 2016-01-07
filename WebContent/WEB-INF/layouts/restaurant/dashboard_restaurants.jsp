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
	<div align="left">
		<a href="${pageContext.request.contextPath}/restaurant/addBranch"
			role="button" class="btn btn-default">Add a Restaurant / Branch</a>
	</div>
	<br/>
	<div class="grid js-masonry"
		data-masonry-options='{ "itemSelector": ".grid-item", "columnWidth": 240 }'>
		<c:forEach items="${sessionScope.user.restaurants}" var="r"
			varStatus="rloop">
			<div class="grid-item" style="cursor: pointer">
				<p>
					<span class="head">${rloop.index+1}</span><span id="rest"
						class="rest-value"
						data-rest-val="${pageContext.request.contextPath}/restaurant/dashboard/${r.id}">&nbsp;${r.name}</span>
					<br /> ${r.address.getAddressString()}<br />
				<p>
			</div>
		</c:forEach>
	</div>
	<hr class="style-1">
</div>

<script>
	$('document').ready(function() {
		// auto re-ordering of tiles
		$('.grid').masonry();
		// Tiles on click function goes here
		$('.grid-item').each(function() {
			$(this).on('click', function() {
				// examples to get data from the clicked tile //
				// Store unique id in data-event-val to retrieve the data from db for ease of use //
				// Just if you wanna do like this //
				//var eventval = $(this).find('#event').text();
				var dataRestVal = $(this).find('#rest').data('rest-val');
				//console.log(dataQuoteVal);
				if (dataRestVal != "") {
					window.location.replace(dataRestVal);
				}
				// if you want to redirect page
				// window.location.replace(url);
				// window.location.href = url; // we can use any of the 2ways specified
			})
		});
	});
</script>