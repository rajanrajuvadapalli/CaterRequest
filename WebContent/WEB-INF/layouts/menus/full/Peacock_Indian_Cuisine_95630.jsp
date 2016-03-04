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
<header>
	<%-- <img src="${pageContext.request.contextPath}/resources/assets/img/header-img.png" alt="" /> --%>
</header>
<section class="container">
	<section class="rest-top">
		<p>Your Address: Not Defined</p>
		<p>
			<a href="#">Food Delivery » Rancho Cordova » American » Beach Hut
				Deli</a>
		</p>
		<div class="clearfix"></div>
	</section>
	<section class="rest-address">
		<div class="row">
			<div class="col-md-9 rest-left">
				<div class="beach-img">
					<img
						src="${pageContext.request.contextPath}/resources/assets/img/beach-hut.jpg"
						alt="" />
				</div>
				<h3>
					<a href="#">Beach Hut Deli</a>
				</h3>
				<img
					src="${pageContext.request.contextPath}/resources/assets/img/stars.png"
					alt="" /> <span>53 reviews</span>
				<p>
					<strong>| 2095 Golden Centre Ln, Rancho Cordova, CA 95670</strong>
					<a href="#">Get Directions</a>
				</p>
				<p>
					Estimated delivery time: <strong>60-90 min</strong>
				</p>
			</div>
			<div class="col-md-3 rest-right">
				<a href="#"><img
					src="${pageContext.request.contextPath}/resources/assets/img/img_open_in_app.png"
					alt="" /></a>
			</div>
			<div class="clearfix"></div>
			<div class="rest-menu">
				<div class="row">
					<div class="col-md-6 rest-menu-left">
						<p>
							<img
								src="${pageContext.request.contextPath}/resources/assets/img/carot.png"><a
								href="#">Back To Restaurants List</a>
						</p>
					</div>
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
							<p>
								Menu Hours: <strong>10:00 AM to 2:00 PM and 4:00 PM to
									7:00 PM</strong> <span>Currently Not Available - Order in Advance</span>
							</p>

							<!-- Collapse start -->
							<div class="panel-group" id="accordion" role="tablist"
								aria-multiselectable="true">
								<div class="panel panel-default">
									<div class="panel-heading" role="tab" id="headingOne">
										<a role="button" data-toggle="collapse"
											data-parent="#accordion" href="#BeachMunchies"
											aria-expanded="true" aria-controls="BeachMunchies"> Beach
											Munchies </a>
									</div>
									<div id="BeachMunchies" class="panel-collapse collapse in"
										role="tabpanel" aria-labelledby="headingOne">
										<div class="panel-body">
											<button type="button" class="btn btn-primary"
												data-toggle="modal" data-target="#chips"
												data-whatever="Chips">
												<span>Chips</span><span>$1.95</span>
											</button>
											<div class="modal fade" id="chips" tabindex="-1"
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
								<div class="panel panel-default">
									<div class="panel-heading" role="tab" id="headingBeachHutDeli">
										<a role="button" data-toggle="collapse"
											data-parent="#accordion" href="#BeachHutDeli"
											aria-expanded="true" aria-controls="BeachHutDeli"> Beach
											Hut Deli Salads </a>
									</div>
									<div id="BeachHutDeli" class="panel-collapse collapse in"
										role="tabpanel" aria-labelledby="headingBeachHutDeli">
										<div class="panel-body">
											<button type="button" class="btn btn-primary"
												data-toggle="modal" data-target="#chips"
												data-whatever="Chips">
												<span>Chips</span><span>$1.95</span>
											</button>
											<div class="modal fade" id="chips" tabindex="-1"
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
								<div class="panel panel-default">
									<div class="panel-heading" role="tab"
										id="headingGourmetSandwiches">
										<a role="button" data-toggle="collapse"
											data-parent="#accordion" href="#GourmetSandwiches"
											aria-expanded="true" aria-controls="GourmetSandwiches">Gourmet
											Sandwiches</a>
									</div>
									<div id="GourmetSandwiches" class="panel-collapse collapse in"
										role="tabpanel" aria-labelledby="headingGourmetSandwiches">
										<div class="panel-body">
											<button type="button" class="btn btn-primary"
												data-toggle="modal" data-target="#chips"
												data-whatever="Chips">
												<span>Chips</span><span>$1.95</span>
											</button>
											<div class="modal fade" id="chips" tabindex="-1"
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
																		data-toggle="tab"><img src="${pageContext.request.contextPath}/resources/assets/img/icon_photo.png"
																			alt="" /></a></li>
																	<li role="presentation"><a href="#tab-notes"
																		aria-controls="tab-notes" role="tab" data-toggle="tab"><img
																			src="${pageContext.request.contextPath}/resources/assets/img/icon_notes.png" alt="" /></a></li>
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
						</div>
						<div role="tabpanel" class="tab-pane full-menu-content"
							id="extra-items">
							<p>
								Menu Hours: <strong>10:00 AM to 2:00 PM and 4:00 PM to
									7:00 PM</strong><span>Currently Not Available - Order in Advance</span>
							</p>

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
						</div>
					</div>
					<div class="col-md-4 rest-sidebar">
						<div class="add-cart">
							<h4>Share Your Cart:</h4>
							<a href="#">Start Group Order<i class="fa fa-anchor"></i></a>
						</div>
						<div class="hut-sec">
							<h3>Beach Hut Deli</h3>
							<div class="cart-main">
								<div class="cart-item">Item</div>
								<div class="cart-qty">Qty</div>
								<div class="cart-price">Price</div>
								<div class="clearfix"></div>
							</div>
							<p>Your cart is hungry</p>
							<div class="cart-total">
								<ul>
									<li>Subtotal: <span>0.00</span></li>
									<li>Tax: <span>0.52</span></li>
									<li>Delivery Charge: <span>5.99</span></li>
									<li><strong>Total: <span>$6.51</span></strong></li>
								</ul>
							</div>
							<div class="pick-deliver">
								<div class="pick">
									<img
										src="${pageContext.request.contextPath}/resources/assets/img/icon_radial_off.png"
										alt="" /> <span>PICKUP</span> <img
										src="${pageContext.request.contextPath}/resources/assets/img/icon_pickup_off.png"
										alt="" />
								</div>
								<div class="delivery">
									<img
										src="${pageContext.request.contextPath}/resources/assets/img/icon_radial_on.png"
										alt="" /> <span>PICKUP</span> <img
										src="${pageContext.request.contextPath}/resources/assets/img/icon_delivery_on.png"
										alt="" />
								</div>
								<div class="clearfix"></div>
								<div class="quote">Delivery Minimum: $20.00 (Before tax)
									No minimum on Pickup orders</div>
								<div class="checkout">
									<a href="#">CHECKOUT</a>
								</div>
								<p>
									<a href="#">Cart, Don't Follow Me!</a>
								</p>
							</div>
						</div>
						<div class="eat-stamp">
							<img
								src="${pageContext.request.contextPath}/resources/assets/img/icon_eat24_stamp.png"
								alt="" />
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
</section>
</body>
<%-- 
<footer>
	<img
		src="${pageContext.request.contextPath}/resources/assets/img/footer-img.png"
		alt="" />
</footer>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/jquery.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
 --%>
<script type="text/javascript">
	// Tab slide Effect

	$('.menu-tab-content a[data-toggle="tab"]').on('shown.bs.tab', function(e) {
		var target = $(this).attr('href');

		$(target).css('left', '-' + $(window).width() + 'px');
		var left = $(target).offset().left;
		$(target).css({
			left : left
		}).animate({
			"left" : "0px"
		}, "10");
	})
</script>


