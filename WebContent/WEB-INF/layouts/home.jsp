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
		<section class="hero-image search-filter-middle height-500">
			<div class="inner">
				<div class="container">
					<h1>Order food for your party in just one click!</h1>
				</div>

				<a class="popup-youtube btn btn-default"
					href="http://www.youtube.com/watch?v=vMZ7oYs3cfY">How it Works</a>
				<br /><br />
				<form class="form-horizontal" method="GET"
					id="customer-register-form"
					action="${pageContext.request.contextPath}/customer/createEvent"
					enctype="application/x-www-form-urlencoded" autocomplete="off">
					<!-- <input type="hidden" name="as" value="customer"> -->
					<button type="submit" class="btn btn-default">
						Lets get started
					</button>
				</form>
				<%-- <form class="form-horizontal" method="GET"
					id="customer-register-form"
					action="${pageContext.request.contextPath}/customer/createEvent"
					enctype="application/x-www-form-urlencoded" autocomplete="off">
					<input type="hidden" name="as" value="restautant">
					<button type="submit" class="btn btn-default">Lets get
						started <br/> <span class="glyphicon glyphicon-cutlery"> [Restaurant]</span></button>
				</form> --%>
			</div>
			<div class="background">
				<!-- img
					src="${pageContext.request.contextPath}/resources/assets/img/restaurant-bg.jpg"
					alt="" -->
			</div>
		</section>
		<!--end Hero Image-->
		<!--How CaterRequest works-->
		<section id="how-it-works" class="block">
			<div class="container" align="center">
				<header>
					<h2>Steps</h2>
				</header>
				<div class="row">
					<div class="feature-box">
						<img alt="how-it-works"
							src="${pageContext.request.contextPath}/resources/images/home_how.png">
					</div>
					<!--/.feature-box-->
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
					<h2>Our services are currently limited to indian restaurants
						in the following cities</h2>
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
					<div class="col-sm-3">
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
					</div>
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
					<div class=" col-sm-4">
						<div class="feature-box">
							<i class='fa fa-comments-o fa-5x'></i>
							<div class="description">
								<h3>Easy communication</h3>
								<p>On-line messaging makes it easy to stay in touch with the
									restaurant.</p>
							</div>
						</div>
						<!--/.feature-box-->
					</div>
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
		<!-- Testimonials -->
		<section class="block background-color-white" id="testimonials">
			<div class="container">
				<div class="owl-carousel testimonials">
					<blockquote>
						<figure>
							<img
								src="${pageContext.request.contextPath}/resources/images/people/VijayBhupathi.jpg"
								alt="">
						</figure>
						<div class="description">
							<p>This is an awesome service. You make ordering food for
								parties easy and simple. Saved me a lot of time. Did not have to
								dial up each and every restaurant and find out the prices. I am
								one happy customer.</p>
							<footer>Vijay Bhupathi</footer>
						</div>
					</blockquote>
					<blockquote>
						<figure></figure>
						<div class="description">
							<p>The experience was fantastic! Being a working women and a
								mother of 3yr old, finding time to talk to restaurants and
								finalize the order was the tough part. Glad to have
								CaterRequest, which made the whole process smooth and simple.</p>
							<footer>Sarvani Sarangam</footer>
						</div>
					</blockquote>
				</div>
			</div>
		</section>
		<!--/.testimonials-->
		<%-- <section id="image">
			<div class="container bg-container-1">
				<div class="col-sm-8 col-sm-offset-2">
					<div class="text-banner">
						<figure>
							<img
								src="${pageContext.request.contextPath}/resources/assets/img/marker.png"
								alt="">
						</figure>
						<div class="description">
							<h2>Get the best value for money</h2>
							<p>CaterRequest is a price comparison tool. You submit your
								catering request to the restaurants in your location only once.
								Restaurants compete to win your business with their best
								possible quote. Once you have the quotes from the restaurants
								you can compare and choose the one at a price that's right for
								your event. There is no confusion over the menu items, since
								every selection is recorded.</p>
						</div>
					</div>
				</div>
			</div>
			<!--/.container-->
			<!-- div class="background">
				<img
					src="${pageContext.request.contextPath}/resources/assets/img/about-us-bg2.jpg"
					alt="">
			</div>
			<!--/.bakcground-->
		</section> --%>
		<!-- End about 1 -->
	</div>
</div>

<script>
	$('document').ready(function() {
		populateCuisineTypes();
	});
</script>