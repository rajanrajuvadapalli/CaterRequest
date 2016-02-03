<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/colors/brown.css"
	type="text/css">
<!-- Page Canvas-->
<div id="page-canvas">
	<!--Off Canvas Navigation-->
	<nav class="off-canvas-navigation">
		<header>Navigation</header>
		<div class="main-navigation navigation-off-canvas"></div>
	</nav>
	<!--end Off Canvas Navigation-->
	<!--Page Content-->
	<div id="page-content">
		<!--Hero Image-->
		<section class="hero-image search-filter-middle height-750">
			<div class="inner">
				<div class="container">
					<h1>The smart way to order food for your event!</h1>
				</div>
				<div class="container">
					<h1>Request, Compare and Confirm Quote</h1>
				</div>
				<div class="container">
					<h1>Restaurants compete and bid to win your business</h1>
				</div>
				<form class="form-horizontal" method="GET"
					id="customer-register-form" action=""
					enctype="application/x-www-form-urlencoded" autocomplete="off">
					<input type="text" hidden="true"
						value="${pageContext.request.contextPath}" id="contextpath">
					<div class="row"
						style="background-color: rgba(0, 0, 0, 0.5); border-radius: 5px; margin-bottom: 40px; margin-top: 50px; padding: 10px;">
						<div class="col-sm-4 col-sm-offset-1" id="locationField">
							<input id="autocomplete" name="addressString"
								placeholder="Enter event address" onFocus="geolocate()"
								type="text" class="form-control" required="required">
						</div>
						<div class="col-sm-3">
							<span id="cuisineType"></span>
						</div>
						<div class="col-sm-1">
							<button type="submit" class="btn btn-default"
								id="startBiddingBtn">Let's go!</button>
						</div>
						<div class="col-sm-1">
							<button type="submit" class="btn btn-default" id="startSearchBtn">Search</button>
						</div>
					</div>
				</form>
			</div>
			<div class="background"></div>
		</section>
		<!--end Hero Image-->
		<!--How CaterRequest works-->
		<section id="how-it-works-video" class="block center">
			<div class="container">
				<header>
					<h2>How CaterRequest works?</h2>
				</header>
				<div class="row">
					<div class="videowrapper">
						<iframe width="650" height="400"
							src="https://www.youtube.com/embed/dU3nZSqaI3k?rel=0;&autoplay=0"
							allowfullscreen="" frameborder="0"></iframe>
					</div>
					<%-- <div class="feature-box">
						<img alt="how-it-works"
							src="${pageContext.request.contextPath}/resources/images/home_how.png">
					</div> --%>
				</div>
			</div>
		</section>
		<section id="how-it-works-steps" class="block equal-height">
			<div class="container">
				<header>
					<h2>Three Simple Steps</h2>
				</header>
				<div class="row">
					<div class=" col-sm-4">
						<img
							src="${pageContext.request.contextPath}/resources/images/home/1.png"
							alt=""> </a>
					</div>
					<div class=" col-sm-4">
						<img
							src="${pageContext.request.contextPath}/resources/images/home/2.png"
							alt=""> </a>
					</div>
					<div class=" col-sm-4">
						<img
							src="${pageContext.request.contextPath}/resources/images/home/3.png"
							alt=""> </a>
					</div>
				</div>
			</div>
		</section>
		<!--end How CaterRequest works-->
		<!--Subscribe-->
		<%-- <section id="main-search" class="block">
			<div class="container">
				<header>
					<h2>
						<span class="glyphicon glyphicon-search"></span> Search for
						restaurants nearby
					</h2>
				</header>
				<form class="form-inline"
					action="${pageContext.request.contextPath}/search" method="GET"
					role="form">
					<div class="row">
						<div class="col-sm-2">

							<input type="text" id="main-search" size="5" maxlength="5"
								name="zip_code" id="zip_code" required="required"
								placeholder="Enter ZIP Code">
						</div>
						<div class="col-sm-2">
							<span id="cuisineType"></span>
						</div>
						<div class="col-sm-2">
							<span class="input-group-btn">
								<button type="submit" class="btn btn-default">
									Search<i class="fa fa-angle-right"></i>
								</button>
							</span>
						</div>
					</div>
				</form>
				<!--/.subscribe-->
			</div>
			<!--/.container-->
		</section> --%>
		<!--end Subscribe-->

		<section class="block">
			<div class="container">
				<header>
					<h2>Our services are currently limited to the following cities</h2>
				</header>

				<div class="row">
					<div class="col-sm-3">
						<div class="item">
							<div class="image">
								<div class="item-specific">
									<span>Sacramento</span>
								</div>
								<img class="img-rounded"
									src="${pageContext.request.contextPath}/resources/images/cities/tower-bridge-sacramento.jpg"
									alt=""> </a>
							</div>
						</div>
						<!-- /.item-->
					</div>
					<%-- <div class="col-sm-3">
						<div class="item">
							<div class="image">
								<div class="item-specific">
									<span>Seattle</span>
								</div>
								<img class="img-rounded"
									src="${pageContext.request.contextPath}/resources/images/cities/seattle_kerry_park.jpg"
									alt=""> </a>
							</div>
						</div>
						<!-- /.item-->
					</div> --%>
				</div>
			</div>
			<!--/.container-->
		</section>

		<!-- Why choose CaterRequest -->
		<section id="featured" class="block equal-height">
			<div class="container">
				<header>
					<h2>Why choose CaterRequest?</h2>
				</header>
				<div class="row">
					<div class=" col-sm-4">
						<div class="feature-box">
							<i class='fa fa-clock-o fa-5x'></i>
							<div class="description">
								<h3>Saves time</h3>
								<p>You can reach out to multiple restaurants on CaterRequest
									with just a button click.</p>
							</div>
						</div>
						<!--/.feature-box-->
					</div>
					<!--/.col-md-4-->
					<div class=" col-sm-4">
						<div class="feature-box">
							<i class='fa  fa-edit fa-5x'></i>
							<div class="description">
								<h3>Edit your order</h3>
								<p>You can edit your request and submit the request with a
									button click.</p>
							</div>
						</div>
						<!--/.feature-box-->
					</div>
					<!--/.col-md-4-->
					<div class=" col-sm-4">
						<div class="feature-box">
							<i class='fa fa-mobile fa-5x'></i>
							<div class="description">
								<h3>Mobile notifications</h3>
								<p>You are notified (Mobile and Email) when restaurant
									submits price quote for your request.</p>
							</div>
						</div>
						<!--/.feature-box-->
					</div>
					<div class=" col-sm-4">
						<div class="feature-box">
							<i class='fa fa-money fa-5x'></i>
							<div class="description">
								<h3>Price comparison</h3>
								<p>You can compare price quote from restaurants for your
									Catering request and choose the best option.</p>
							</div>
						</div>
						<!--/.feature-box-->
					</div>
					<!--/.col-md-4-->
					<!-- <div class=" col-sm-4">
						<div class="feature-box">
							<i class='fa fa-comments-o fa-5x'></i>
							<div class="description">
								<h3>Easy communication</h3>
								<p>On-line messaging makes it easy to stay in touch with the
									restaurant.</p>
							</div>
						</div>
						/.feature-box
					</div> -->
					<!--/.col-md-4-->
					<!--/.col-md-4-->
					<div class=" col-sm-4">
						<div class="feature-box">
							<i class='fa fa-credit-card fa-5x'></i>
							<div class="description">
								<h3>Make Payment</h3>
								<p>You can make payment through CaterRequest securely once
									the food is delivered.</p>
							</div>
						</div>
						<!--/.feature-box-->
					</div>
					<!--/.col-md-4-->
				</div>
			</div>
		</section>
		<!-- Why choose CaterRequest -->
		<!-- Carousel -->
		<section id="featured" class="block equal-height">
			<div class="container">
				<header>
					<h2>Testimonials</h2>
				</header>
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
					</ol>
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<blockquote>
								<figure>
									<img
										src="${pageContext.request.contextPath}/resources/images/people/VijayBhupathi.jpg"
										alt="">
								</figure>
								<div class="description">
									<p>This is an awesome service. You make ordering food for
										parties easy and simple. Saved me a lot of time. Did not have
										to dial up each and every restaurant and find out the prices.
										I am one happy customer.</p>
									<footer>Vijay Bhupathi</footer>
								</div>
							</blockquote>
						</div>
						<div class="item">
							<blockquote>
								<figure>
									<img
										src="${pageContext.request.contextPath}/resources/images/people/user.png"
										alt="">
								</figure>
								<div class="description">
									<p>The experience was fantastic! Being a working women and
										a mother of 3yr old, finding time to talk to restaurants and
										finalize the order was the tough part. Glad to have
										CaterRequest, which made the whole process smooth and simple.</p>
									<footer>Sarvani Sarangam</footer>
								</div>
							</blockquote>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- /.carousel -->
	</div>
</div>

<script>
	$('document').ready(function() {
		populateCuisineTypesDrowpdown();
		$("select[name=cuisineType]").attr('required', 'required');
		var contextPath = $('input[id=contextpath]').val();
		$('#startBiddingBtn').click(function(e) {
			//console.log("Clicked button1.");
			e.preventDefault();
			var url = contextPath + "/customer/guestPage1";
			console.log("url1: " + url);
			var form = $('#customer-register-form');
			form.attr("action", url);
			form.submit();
		});
		$('#startSearchBtn').click(function(e) {
			//console.log("Clicked button2.");
			e.preventDefault();
			var url = contextPath + "/customer/guestPage2";
			console.log("url2: " + url);
			var form = $('#customer-register-form');
			form.attr("action", url);
			form.submit();
		});
	});
</script>
