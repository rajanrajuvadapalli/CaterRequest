<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	function remove_california_kabob_item(div_id) {
		var divToRemove = $("div[id=" + div_id + "]");
		var name = divToRemove.children().children().prev().text();
		var desc = divToRemove.children().children().next().text();
		var data = name + "+" + desc;
		console.log("Removing " + data);
		california_kabob_menu_items.splice($.inArray(data,
				california_kabob_menu_items), 1);
		divToRemove.remove();
	}

	function california_kabob_menu_submit() {
		if (california_kabob_menu_items.length == 0) {
			alert("Please select at least 1 item to proceed.");
			return false;
		}
		console.log(california_kabob_menu_items);
		//console.log(JSON.stringify(california_kabob_menu_items));
		$("#full_menu_items").val(JSON.stringify(california_kabob_menu_items));
		$("#california_kabob_target").submit();
	}
</script>

<section class="rest-top">
	<div class="clearfix"></div>
</section>
<section class="rest-address">
	<div class="row">
		<div class="col-md-9 rest-left">
			<div class="beach-img">
				<img
					src="https://s3-us-west-2.amazonaws.com/caterrequest-restaurant-profile-pics/Restaurant_10"
					alt="">
				<c:if test="${sessionScope.env.isProd()}">
					<img
						src="https://s3-us-west-2.amazonaws.com/caterrequest-restaurant-profile-pics/Restaurant_${r.restaurant.id}"
						alt="">
				</c:if>
				<c:if test="${sessionScope.env.isUat()}">
					<img
						src="https://s3-us-west-2.amazonaws.com/rajrv-caterrequest-profile-pics/Restaurant_${r.restaurant.id}"
						alt="">
				</c:if>
			</div>
			<h3>${r.restaurant.name}</h3>
			<c:choose>
				<c:when test="${r.reviewImage != null}">
					<a onclick="window.open ('${r.websiteUrl}', ''); return false"
						href="javascript:void(0);"> <img src="${r.reviewImage}"
						width="100" height="20">&nbsp;&nbsp;${r.numberOfReviews} <c:out
							value="reviews" /></a>
				</c:when>
				<c:otherwise>
					<i>Reviews not available</i>
				</c:otherwise>
			</c:choose>
			<p>
				<strong>${r.restaurant.address.street1}${r.restaurant.address.street2},&nbsp;${r.restaurant.address.city},&nbsp;${r.restaurant.address.state},&nbsp;${r.restaurant.address.zip}</strong>
				<!-- <a href="#">Get Directions</a> -->
			</p>
			<!-- <p>
					Estimated delivery time: <strong>60-90 min</strong>
				</p> -->
		</div>
		<div class="clearfix"></div>
		<div class="rest-menu">
			<div class="row">
				<%-- <div class="col-md-6 rest-menu-left">
						<p>
							<img
								src="${pageContext.request.contextPath}/resources/assets/img/carot.png"><a
								href="#">Back To Restaurants List</a>
						</p>
					</div> --%>
				<div class="col-md-6 rest-menu-right">
					<ul class="nav nav-tabs" role="tablist">
						<li class="active"><a href="#menu" aria-controls="menu"
							role="tab" data-toggle="tab">Menu</a></li>
						<li><a href="#info" aria-controls="info" role="tab"
							data-toggle="tab">Info</a></li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</section>
<section class="rest-main-content">
	<div class="menu-sidebar" id="accordion" aria-multiselectable="true"
		role="tablist"></div>
	<div class="tab-content">
		<div role="tabpanel" class="tab-pane active" id="menu">
			<div class="menu-tab-content">
				<ul class="nav nav-tabs" role="tablist">
					<li class="active"><a href="#full-menu"
						aria-controls="full-menu" role="tab" data-toggle="tab">Full
							Menu</a></li>
					<li><a href="#extra-items" aria-controls="extra-items"
						role="tab" data-toggle="tab">Extra Items</a></li>
				</ul>
				<div class="clearfix"></div>
				<div class="tab-content col-md-8">
					<div role="tabpanel" class="tab-pane active full-menu-content"
						id="full-menu">
						<p></p>

						<!-- Collapse start -->
						<div class="panel-group" id="accordion" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion" href="#BeachMunchies"
										aria-expanded="true" aria-controls="BeachMunchies"> Menu </a>
								</div>
								<div id="BeachMunchies" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#chips"
											data-whatever="Chips">
											<span>Sarma Dolme</span>
										</button>
										<div class="modal fade" id="chips" tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Sarma Dolme</h3>
														</div>
														<div class="modal-desc">
															<form id="popup_0_0" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="SarmaDolmeCount"
																		maxlength="20" required="required" pattern="^\d+$">

																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>

																	<input type="text" size="60" name="SarmaDolmeSpl"
																		maxlength="20">

																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<!-- <button type="submit" class="btn btn-default">Add</button> -->
																		<input type="button" name="" value="Add to Cart"
																			onclick="populateFullMenuSarmaDolmeSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>


						</div>
					</div>
					<%-- <div role="tabpanel" class="tab-pane full-menu-content"
							id="extra-items">
							<!-- Collapse start -->
							<div class="panel-group" id="accordion" role="tablist"
								aria-multiselectable="true">
								<div class="panel panel-default">
									<div class="panel-heading" role="tab"
										id="headingPlatesSilverware">
										<a role="button" data-toggle="collapse"
											data-parent="#accordion" href="#PlatesSilverware"
											aria-expanded="true" aria-controls="PlatesSilverware">Plates,
											Silverware Packets &amp; Extras</a>
									</div>
									<div id="PlatesSilverware" class="panel-collapse collapse in"
										role="tabpanel" aria-labelledby="headingPlatesSilverware">
										<div class="panel-body">
											<button type="button" class="btn btn-primary"
												data-toggle="modal" data-target="#Silverware"
												data-whatever="Chips">
												<span>Silverware</span><span>$0.29</span>
											</button>
											<div class="modal fade" id="Silverware" tabindex="-1"
												role="dialog" aria-labelledby="exampleModalLabel">
												<div class="modal-dialog" role="document">
													<div class="modal-content">
														<div class="modal-box-left">
															<div class="modal-head">
																<h3>
																	Chips<span>$1.95</span>
																</h3>
															</div>
															<div class="modal-desc">
																<h4>quantity</h4>
																<div class="modal-textarea">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<form>
																		<textarea></textarea>
																	</form>
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" name="" value="Add to Cart" />
																	</div>
																</div>
															</div>
														</div>
														<div class="modal-box-right">
															<div class="modal-head">
																<span>Be the first to order</span>
																<ul class="nav nav-tabs" role="tablist">
																	<li role="presentation" class="active"><a
																		href="#tab-photo" aria-controls="tab-photo" role="tab"
																		data-toggle="tab"><img
																			src="${pageContext.request.contextPath}/resources/assets/img/icon_photo.png"
																			alt="" /></a></li>
																	<li role="presentation"><a href="#tab-notes"
																		aria-controls="tab-notes" role="tab" data-toggle="tab"><img
																			src="${pageContext.request.contextPath}/resources/assets/img/icon_notes.png"
																			alt="" /></a></li>
																</ul>
																<div class="clearfix"></div>
															</div>
															<div class="tab-content">
																<div role="tabpanel" class="tab-pane active"
																	id="tab-photo">
																	<img
																		src="${pageContext.request.contextPath}/resources/assets/img/img_addphoto.png"
																		alt="" />
																</div>
																<div role="tabpanel" class="tab-pane" id="tab-notes">
																	<img
																		src="${pageContext.request.contextPath}/resources/assets/img/notes_instructN.jpg"
																		alt="" />
																	<div class="note-btn">
																		<input type="button" name="" value="Note it" />
																	</div>
																</div>
															</div>
														</div>
														<div class="clearfix"></div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div> --%>
				</div>
				<div class="col-md-4 rest-sidebar">
					<div class="hut-sec">
						<h3>Selected Items</h3>
						<div class="slide"></div>
						<!-- <div class="cart-main">
							<div class="cart-item">Item</div>
							<div class="cart-qty">Qty</div>
							<div class="cart-price">Price</div>
							<div class="clearfix"></div>
						</div> -->
						<!-- <p>Your cart is hungry</p> -->
						<!-- <div class="cart-total">
							<ul>
								<li>Subtotal: <span>0.00</span></li>
								<li>Tax: <span>0.52</span></li>
								<li>Delivery Charge: <span>5.99</span></li>
								<li><strong>Total: <span>$6.51</span></strong></li>
							</ul>
						</div> -->
						<div class="pick-deliver">
							<!-- <div class="pick">
								<img src="img/icon_radial_off.png" alt="" /> <span>PICKUP</span>
								<img src="img/icon_pickup_off.png" alt="" />
							</div>
							<div class="delivery">
								<img src="img/icon_radial_on.png" alt="" /> <span>PICKUP</span>
								<img src="img/icon_delivery_on.png" alt="" />
							</div>
							<div class="clearfix"></div>
							<div class="quote">Delivery Minimum: $20.00 (Before tax) No
								minimum on Pickup orders</div> -->
							<div class="checkout">
								<form action="${pageContext.request.contextPath}/menu/saveMenu"
									id="california_kabob_target" method="post">
									<input type="hidden" name="full_menu_items"
										id="full_menu_items"> <input type="hidden"
										name="cuisineType" value="${menu.cuisine}">
									<textarea rows="4" cols="50" name="comments"
										placeholder="Enter your comments to restaurant here"
										class="form-control">${menu.comments}</textarea>
									<br />
									<!-- <button type="button" onclick="california_kabob_menu_submit();"
										class="btn btn-default">Next</button> -->
									<a href="javascript:california_kabob_menu_submit();">Next</a>
								</form>
								<!-- <a href="#">CHECKOUT</a> -->
							</div>
							<p>
								<!-- <a href="#">Cart, Don't Follow Me!</a> -->
							</p>
						</div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<div role="tabpanel" class="tab-pane" id="info">
			<div class="info-tab-content">test1</div>
		</div>
	</div>
</section>

<script>
	$(window).load(function() {
		var rtl = false; // Use RTL
		initializeOwl(rtl);
	});

	$('document').ready(function() {
		/* $('.slide .list-item .left').each(function() {
			var name = $(this).children().prev().text();
			var desc = $(this).children().next().text();
			console.log("Title: " + name);
			console.log("Desc: " + desc);
			california_kabob_menu_items.push(name + "+" + desc); //california_kabob_menu_items is in California_Kabob_Restaurant_95827.js 
		}); */
	});
</script>
<!-- Sidebar Scrolling -->
<script type="text/javascript">
	$(function() {
		var offset = $(".rest-sidebar").offset();
		var topPadding = 15;
		$(window).scroll(function() {
			if ($(window).scrollTop() > offset.top) {
				$(".rest-sidebar").stop().animate({
					marginTop : $(window).scrollTop() - offset.top + topPadding
				});
			} else {
				$(".rest-sidebar").stop().animate({
					marginTop : 0
				});
			}
			;
		});
	});
</script>
