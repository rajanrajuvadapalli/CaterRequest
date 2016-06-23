<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<section class="rest-top">
	<div class="clearfix"></div>
</section>

<section class="rest-address">
	<div class="row">
		<div class="col-md-9 rest-left">
			<div class="beach-img">
				<c:if test="${sessionScope.env.isProd()}">
					<img src="https://s3-us-west-2.amazonaws.com/caterrequest-restaurant-profile-pics/Restaurant_${r.restaurant.id}" alt="">
				</c:if>
				<c:if test="${sessionScope.env.isUat()}">
					<img src="https://s3-us-west-2.amazonaws.com/rajrv-caterrequest-profile-pics/Restaurant_${r.restaurant.id}" alt="">
				</c:if>
			</div>
			<h3>${r.restaurant.name}</h3>
			<c:choose>
				<c:when test="${r.reviewImage != null}">
					<a onclick="window.open('${r.websiteUrl}', ''); return false;" href="javascript:void(0);">
						<img src="${r.reviewImage}" width="100" height="20">
							&nbsp;&nbsp;${r.numberOfReviews}
							<c:out value="reviews" />
					</a>
				</c:when>
				<c:otherwise>
					<i>Reviews not available</i>
				</c:otherwise>
			</c:choose>
			<p><strong>${r.restaurant.address.street1}&nbsp;${r.restaurant.address.street2},&nbsp;${r.restaurant.address.city},&nbsp;${r.restaurant.address.state},&nbsp;${r.restaurant.address.zip}</strong></p>
		</div>
		<div class="clearfix"></div>
		<div class="rest-menu">
			<div class="row">
				<div class="col-md-6 rest-menu-right">
					<ul class="nav nav-tabs" role="tablist">
						<li class="active">
							<a href="#menu" aria-controls="menu" role="tab" data-toggle="tab">Menu</a>
						</li>
						<li>
							<a href="#info" aria-controls="info" role="tab" data-toggle="tab">Info</a>
						</li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</section>

<section class="rest-main-content">
	<div id="accordion" class="menu-sidebar" aria-multiselectable="true" role="tablist"></div>
	<div class="tab-content">
		<div id="menu" role="tabpanel" class="tab-pane active">
			<div class="menu-tab-content">
				<ul class="nav nav-tabs" role="tablist">
					<li class="active">
						<a href="#full-menu" aria-controls="full-menu" role="tab" data-toggle="tab">Full Menu</a>
					</li>
				</ul>
				<div class="clearfix"></div>
				<div class="tab-content col-md-8">
					<div id="full-menu" role="tabpanel" class="tab-pane active full-menu-content"></div>
				</div>
				<div class="col-md-4 rest-sidebar">
					<div class="hut-sec">

						<h3>Selected Items</h3>

						<div id="shopping_cart" class="slide"></div>

						<div class="pick-deliver">
							<div class="checkout">
								<form action="/menu/saveMenu" id="california_kabob_restaurant_target" method="post">
									<input id="full_menu_items" type="hidden" name="full_menu_items">
									<input type="hidden" name="cuisineType" value="MIDDLE_EASTERN">
									<textarea rows="4" cols="50" name="comments" placeholder="Enter your comments to restaurant here" class="form-control"></textarea>
									<br>
									<div id="shopping_cart_summary" class="shopping-cart-summary ta-right" style="display:none;">
										Sub-total: $<span id="shopping_cart_summary_subtotal" style="padding:0;"></span>
										<br>
										Tax: $<span id="shopping_cart_summary_tax" style="padding:0;"></span>
										<br>
										Total: $<span id="shopping_cart_summary_total" style="padding:0;"></span>
									</div>
									<br>
									<a href="javascript:california_kabob_restaurant_menu_submit();">Next</a>
								</form>
							</div>
							<p></p>
						</div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript">

	/*
	function remove_california_kabob_restaurant_item(div_id) {
		var divToRemove = $("div[id=" + div_id + "]");
		var name = divToRemove.children().children().prev().text();
		var desc = divToRemove.children().children().next().text();
		var data = name + "+" + desc;
		console.log("Removing " + data);
		california_kabob_restaurant_menu_items.splice($.inArray(data,
				california_kabob_restaurant_menu_items), 1);
		divToRemove.remove();
	}

	function california_kabob_restaurant_menu_submit() {
		if (california_kabob_restaurant_menu_items.length == 0) {
			alert("Please select at least 1 item to proceed.");
			return false;
		}
		console.log(california_kabob_restaurant_menu_items);
		//console.log(JSON.stringify(california_kabob_restaurant_menu_items));
		$("#full_menu_items").val(
				JSON.stringify(california_kabob_restaurant_menu_items));
		$("#california_kabob_restaurant_target").submit();
	}
	*/

	$(window).load( function() {
		var rtl = false; // Use RTL
		initializeOwl(rtl);
	});

	/*
	$('document').ready( function() {
		$('.slide .full-menu-list-item').each( function() {
			var name = $(this).children().prev().text();
			var desc = $(this).children().next().next().text();
			console.log("Title: " + name);
			console.log("Desc: " + desc);
			california_kabob_restaurant_menu_items.push(name + "+" + desc); // california_kabob_restaurant_menu_items is in california_kabob_restaurant_95827.js
		});
	});
	*/

	$(document).ready( function() {

		var offset = $(".rest-sidebar").offset();
		var topPadding = 15;

		$(window).scroll( function() {

			if ( $(window).scrollTop() > offset.top ) {
				$(".rest-sidebar").stop().animate({
					//marginTop : $(window).scrollTop() - offset.top + topPadding,
					marginTop : ($(window).scrollTop() - offset.top + topPadding) / 4,
					//marginTop : 0,
					//marginBottom : ($(window).scrollTop() - offset.top + topPadding)/4,
				});
			}
			else {
				$(".rest-sidebar").stop().animate({
					marginTop : 0
				});
			}
		});
	});
</script>

<!-- Menu Generator -->
<link rel="stylesheet" href="/cater4party/resources/assets/cl-css/styles.css" type="text/css">
<script type="text/javascript">var menu_source_url = "/cater4party/resources/${menu_source_url}";</script>
<script src="/cater4party/resources/assets/cl-js/app.js?v5" type="text/javascript"></script>
