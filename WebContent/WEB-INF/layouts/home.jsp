<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				<form class="form-horizontal" method="GET" id="register-form"
					action="${pageContext.request.contextPath}/register"
					enctype="application/x-www-form-urlencoded" autocomplete="off">
					<input type="hidden" name="as" value="customer">
					<button type="submit" class="btn btn-default">Lets get
						started</button>
				</form>
			</div>
			<div class="background">
				<img
					src="${pageContext.request.contextPath}/resources/assets/img/restaurant-bg.jpg"
					alt="">
			</div>
		</section>
		<!--end Hero Image-->
		<!--How CaterRequest works-->
		<section id="how-it-works" class="block">
			<div class="container">
				<header>
					<h2>How CaterRequest works?</h2>
				</header>
				<div class="row">
					<div class=" col-sm-4">
						<div class="feature-box">
							<i class='fa fa-pencil fa-5x'></i>
							<div class="description">
								<h3>Register with Cater Request</h3>
								<p>Register to Cater Request Website!</p>
							</div>
						</div>
						<!--/.feature-box-->
					</div>
					<!--/.col-md-4-->
					<div class=" col-sm-4">
						<div class="feature-box">
							<i class='fa fa-calendar fa-5x'></i>
							<div class="description">
								<h3>Create Event</h3>
								<p>Create Event, time, location, number of people attending
									the event.</p>
							</div>
						</div>
						<!--/.feature-box-->
					</div>
					<!--/.col-md-4-->
					<div class=" col-sm-4">
						<div class="feature-box">
							<i class='fa fa-cutlery fa-5x'></i>
							<div class="description">
								<h3>Menu selection</h3>
								<p>Make a selection of the cuisine you are interested in and
									select the menu.</p>
							</div>
						</div>
						<!--/.feature-box-->
					</div>
					<div class=" col-sm-4">
						<div class="feature-box">
							<i class='fa fa-building fa-5x'></i>
							<div class="description">
								<h3>Restaurant selection</h3>
								<p>Select the nearby restaurants you want to request the
									price quote for the menu you selected.</p>
							</div>
						</div>
						<!--/.feature-box-->
					</div>
					<!--/.col-md-4-->
					<div class=" col-sm-4">
						<div class="feature-box">
							<i class='fa fa-building fa-5x'></i>
							<div class="description">
								<h3>Confirm restaurant</h3>
								<p>Restaurants will send you the price quote for your
									request within hours. Select and confirm the restaurant that's
									right for you which suits your budget and your party.</p>
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
								<p>Once you have confirmed the restaurant you can either
									make payment on CaterRequest or pay directly to the restaurant.
									The restaurant will be notified immediately. Your food will be
									delivered for you party.</p>
							</div>
						</div>
						<!--/.feature-box-->
					</div>
					<!--/.col-md-4-->
				</div>
			</div>
		</section>
		<!--end How CaterRequest works-->
		<!--Subscribe-->
		<section id="main-search" class="block">
			<div class="container">
				<header>
					<h2><span class="glyphicon glyphicon-search"></span> Search for restaurants nearby</h2>
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
		</section>
		<!--end Subscribe-->
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
		<section id="image">
			<div class="container">
				<div class="col-sm-8 col-sm-offset-2">
					<div class="text-banner">
						<figure>
							<img
								src="${pageContext.request.contextPath}/resources/assets/img/marker2.png"
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
			<div class="background">
				<img
					src="${pageContext.request.contextPath}/resources/assets/img/about-us-bg2.jpg"
					alt="">
			</div>
			<!--/.bakcground-->
		</section>
		<!-- End about 1 -->
	</div>
</div>

<script>
	$('document').ready(function() {
		populateCuisineTypes();
	});
</script>