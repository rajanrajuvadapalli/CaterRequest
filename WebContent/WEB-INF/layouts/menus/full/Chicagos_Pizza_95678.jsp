<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	function remove_chicagos_pizza_item(div_id) {
		var divToRemove = $("div[id=" + div_id + "]");
		var name = divToRemove.children().children().prev().text();
		var desc = divToRemove.children().children().next().text();
		var data = name + "+" + desc;
		console.log("Removing " + data);
		chicagos_pizza_menu_items.splice($.inArray(data,
				chicagos_pizza_menu_items), 1);
		divToRemove.remove();
	}

	function chicagos_pizza_menu_submit() {
		if (chicagos_pizza_menu_items.length == 0) {
			alert("Please select at least 1 item to proceed.");
			return false;
		}
		console.log(chicagos_pizza_menu_items);
		//console.log(JSON.stringify(chicagos_pizza_menu_items));
		$("#full_menu_items").val(JSON.stringify(chicagos_pizza_menu_items));
		$("#chicagos_pizza_target").submit();
	}
</script>

<section class="rest-top">
	<div class="clearfix"></div>
</section>
<section class="rest-address">
	<div class="row">
		<div class="col-md-9 rest-left">
			<div class="beach-img">
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
					<!-- <li><a href="#extra-items" aria-controls="extra-items"
						role="tab" data-toggle="tab">Extra Items</a></li> -->
				</ul>
				<div class="clearfix"></div>
				<div class="tab-content col-md-8">
					<div role="tabpanel" class="tab-pane active full-menu-content"
						id="full-menu">
						<p></p>
						<!-- Collapse start -->
						<div class="panel-group" id="accordion-Appetizers" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-Appetizers" href="#Appetizers"
										aria-expanded="true" aria-controls="Appetizers">
										Appetizers </a>
								</div>
								<div id="Appetizers" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#HotNSpicyTandooriWings"
											data-whatever="HotNSpicyTandooriWings">
											<span>Hot-N-Spicy Tandoori Wings</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="HotNSpicyTandooriWings"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Hot-N-Spicy Tandoori Wings</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup1_1" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="HotNSpicyTandooriWingsCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="HotNSpicyTandooriWingsSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuHotNSpicyTandooriWingsSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#HoneyBBQTequilaLime"
											data-whatever="HoneyBBQTequilaLime">
											<span>Honey BBQ Tequila-Lime</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="HoneyBBQTequilaLime" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Honey BBQ Tequila-Lime</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup1_2" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="HoneyBBQTequilaLimeCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="HoneyBBQTequilaLimeSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuHoneyBBQTequilaLimeSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#GarlicBreadsticks"
											data-whatever="GarlicBreadsticks">
											<span>Garlic Breadsticks</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="GarlicBreadsticks" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Garlic Breadsticks</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup1_3" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="GarlicBreadsticksCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="GarlicBreadsticksSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuGarlicBreadsticksSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#CheeseBreadsticks"
											data-whatever="CheeseBreadsticks">
											<span>Cheese Breadsticks</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="CheeseBreadsticks" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Cheese Breadsticks</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup1_4" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="CheeseBreadsticksCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="CheeseBreadsticksSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuCheeseBreadsticksSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#BaconBreadsticks"
											data-whatever="BaconBreadsticks">
											<span>Bacon Breadsticks</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="BaconBreadsticks" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Bacon Breadsticks</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup1_5" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="BaconBreadsticksCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="BaconBreadsticksSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuBaconBreadsticksSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#IndianStyleBreadsticks"
											data-whatever="IndianStyleBreadsticks">
											<span>Indian Style Breadsticks</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="IndianStyleBreadsticks"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Indian Style Breadsticks</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup1_6" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="IndianStyleBreadsticksCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="IndianStyleBreadsticksSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuIndianStyleBreadsticksSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#CaesarSalad"
											data-whatever="CaesarSalad">
											<span>Caesar Salad</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="CaesarSalad" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Caesar Salad</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup1_7" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="CaesarSaladCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="CaesarSaladSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuCaesarSaladSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#GardenSalad"
											data-whatever="GardenSalad">
											<span>Garden Salad</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="GardenSalad" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Garden Salad</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup1_8" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="GardenSaladCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="GardenSaladSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuGardenSaladSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#ChickenSalad"
											data-whatever="ChickenSalad">
											<span>Chicken Salad</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="ChickenSalad" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chicken Salad</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup1_9" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="ChickenSaladCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ChickenSaladSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuChickenSaladSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#AllMeatSalad"
											data-whatever="AllMeatSalad">
											<span>All Meat Salad</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="AllMeatSalad" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>All Meat Salad</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup1_10" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="AllMeatSaladCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="AllMeatSaladSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuAllMeatSaladSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#CalzoneVeggie"
											data-whatever="CalzoneVeggie">
											<span>Calzone Veggie</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="CalzoneVeggie" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Calzone Veggie</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup1_11" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="CalzoneVeggieCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="CalzoneVeggieSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuCalzoneVeggieSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#GForceCalzoneallmeat"
											data-whatever="GForceCalzoneallmeat">
											<span>G-Force Calzone (all meat)</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="GForceCalzoneallmeat"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>G-Force Calzone (all meat)</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup1_12" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="GForceCalzoneallmeatCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="GForceCalzoneallmeatSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuGForceCalzoneallmeatSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#SamosasX"
											data-whatever="SamosasX">
											<span>Samosas 4X</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="SamosasX" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Samosas 4X</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup1_13" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="SamosasXCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="SamosasXSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuSamosasXSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#OvenBakedChickenNuggetspc"
											data-whatever="OvenBakedChickenNuggetspc">
											<span>Oven Baked Chicken Nuggets (12pc)</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="OvenBakedChickenNuggetspc"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Oven Baked Chicken Nuggets (12pc)</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup1_14" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="OvenBakedChickenNuggetspcCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="OvenBakedChickenNuggetspcSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuOvenBakedChickenNuggetspcSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#VeggieSandwich"
											data-whatever="VeggieSandwich">
											<span>Veggie Sandwich</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="VeggieSandwich" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Veggie Sandwich</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup1_15" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="VeggieSandwichCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="VeggieSandwichSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuVeggieSandwichSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#ChickenSandwichBBQorSpicy"
											data-whatever="ChickenSandwichBBQorSpicy">
											<span>Chicken Sandwich (BBQ or Spicy)</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="ChickenSandwichBBQorSpicy"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chicken Sandwich (BBQ or Spicy)</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup1_16" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="ChickenSandwichBBQorSpicyCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="ChickenSandwichBBQorSpicySpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuChickenSandwichBBQorSpicySelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#HamSandwich"
											data-whatever="HamSandwich">
											<span>Ham Sandwich</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="HamSandwich" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Ham Sandwich</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup1_17" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="HamSandwichCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="HamSandwichSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuHamSandwichSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#TurkeySandwich"
											data-whatever="TurkeySandwich">
											<span>Turkey Sandwich</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="TurkeySandwich" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Turkey Sandwich</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup1_18" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="TurkeySandwichCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="TurkeySandwichSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuTurkeySandwichSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->

									</div>
								</div>
							</div>
						</div>
						<!-- Collapse start -->
						<div class="panel-group" id="accordion-Speciality_Pizzas"
							role="tablist" aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-Speciality_Pizzas"
										href="#Speciality_Pizzas" aria-expanded="true"
										aria-controls="Speciality_Pizzas"> Speciality Pizzas </a>
								</div>
								<div id="Speciality_Pizzas" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#Combination"
											data-whatever="Combination">
											<span>Combination</span> <br /> <span
												style="font-size: 12px;">Cheese, Pepperoni, Salami,
												Beef, Canadian Bacon, Italian Sausage, Mushrooms, Black
												Olives, Green Peppers and Onions</span>
										</button>
										<div class="modal fade" id="Combination" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Combination</h3>
															<span>Cheese, Pepperoni, Salami, Beef, Canadian
																Bacon, Italian Sausage, Mushrooms, Black Olives, Green
																Peppers and Onions</span>
														</div>
														<div class="modal-desc">
															<form id="popup2_1" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Size</h4>
																	<input type="text" size="20" name="CombinationSize"
																		maxlength="20" required="required">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="CombinationCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="CombinationSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuCombinationSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#Vegetarian"
											data-whatever="Vegetarian">
											<span>Vegetarian</span> <br /> <span
												style="font-size: 12px;">Cheese, Mushrooms, Onions,
												Black Olives, Green Peppers, Artichokes Hearts and Fresh
												Tomatoes</span>
										</button>
										<div class="modal fade" id="Vegetarian" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Vegetarian</h3>
															<span>Cheese, Mushrooms, Onions, Black Olives,
																Green Peppers, Artichokes Hearts and Fresh Tomatoes</span>
														</div>
														<div class="modal-desc">
															<form id="popup2_2" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Size</h4>
																	<input type="text" size="20" name="VegetarianSize"
																		maxlength="20" required="required">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="VegetarianCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="VegetarianSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuVegetarianSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#AllMeat"
											data-whatever="AllMeat">
											<span>All Meat</span> <br /> <span style="font-size: 12px;">Cheese,
												Salami, Pepperoni, Canadian Bacon, Ground Beef and Italian
												Sausage</span>
										</button>
										<div class="modal fade" id="AllMeat" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>All Meat</h3>
															<span>Cheese, Salami, Pepperoni, Canadian Bacon,
																Ground Beef and Italian Sausage</span>
														</div>
														<div class="modal-desc">
															<form id="popup2_3" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Size</h4>
																	<input type="text" size="20" name="AllMeatSize"
																		maxlength="20" required="required">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="AllMeatCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="AllMeatSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuAllMeatSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#AllStarsorDeluxe"
											data-whatever="AllStarsorDeluxe">
											<span>All Stars or Deluxe</span> <br /> <span
												style="font-size: 12px;">Cheese, Pepperoni, Italian
												Sausage, Mushrooms, Onions and Green Peppers</span>
										</button>
										<div class="modal fade" id="AllStarsorDeluxe" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>All Stars or Deluxe</h3>
															<span>Cheese, Pepperoni, Italian Sausage,
																Mushrooms, Onions and Green Peppers</span>
														</div>
														<div class="modal-desc">
															<form id="popup2_4" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Size</h4>
																	<input type="text" size="20"
																		name="AllStarsorDeluxeSize" maxlength="20"
																		required="required">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="AllStarsorDeluxeCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="AllStarsorDeluxeSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuAllStarsorDeluxeSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#Hawaiian"
											data-whatever="Hawaiian">
											<span>Hawaiian</span> <br /> <span style="font-size: 12px;">Cheese,
												Ham and Pineapple</span>
										</button>
										<div class="modal fade" id="Hawaiian" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Hawaiian</h3>
															<span>Cheese, Ham and Pineapple</span>
														</div>
														<div class="modal-desc">
															<form id="popup2_5" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Size</h4>
																	<input type="text" size="20" name="HawaiianSize"
																		maxlength="20" required="required">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="HawaiianCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="HawaiianSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuHawaiianSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#SpicyHawaiian"
											data-whatever="SpicyHawaiian">
											<span>Spicy Hawaiian</span> <br /> <span
												style="font-size: 12px;">Cheese, Ham, Pineapple and
												Jalapeno</span>
										</button>
										<div class="modal fade" id="SpicyHawaiian" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Spicy Hawaiian</h3>
															<span>Cheese, Ham, Pineapple and Jalapeno</span>
														</div>
														<div class="modal-desc">
															<form id="popup2_6" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Size</h4>
																	<input type="text" size="20" name="SpicyHawaiianSize"
																		maxlength="20" required="required">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="SpicyHawaiianCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="SpicyHawaiianSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuSpicyHawaiianSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#LatinoStyle"
											data-whatever="LatinoStyle">
											<span>Latino Style</span> <br /> <span
												style="font-size: 12px;">Pepperoni, Italian Sausage,
												Ham, White Onions, Pineapple and Jalapeno</span>
										</button>
										<div class="modal fade" id="LatinoStyle" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Latino Style</h3>
															<span>Pepperoni, Italian Sausage, Ham, White
																Onions, Pineapple and Jalapeno</span>
														</div>
														<div class="modal-desc">
															<form id="popup2_7" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Size</h4>
																	<input type="text" size="20" name="LatinoStyleSize"
																		maxlength="20" required="required">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="LatinoStyleCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="LatinoStyleSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuLatinoStyleSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#ItalianGarlic"
											data-whatever="ItalianGarlic">
											<span>Italian Garlic</span> <br /> <span
												style="font-size: 12px;">Garlic Sauce, Pepperoni,
												Italian Sausage, Mushrooms, Tomatoes, Red Onions, Chopped
												Garlic and Green Onion</span>
										</button>
										<div class="modal fade" id="ItalianGarlic" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Italian Garlic</h3>
															<span>Garlic Sauce, Pepperoni, Italian Sausage,
																Mushrooms, Tomatoes, Red Onions, Chopped Garlic and
																Green Onion</span>
														</div>
														<div class="modal-desc">
															<form id="popup2_8" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Size</h4>
																	<input type="text" size="20" name="ItalianGarlicSize"
																		maxlength="20" required="required">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="ItalianGarlicCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ItalianGarlicSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuItalianGarlicSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#GarlicChicken"
											data-whatever="GarlicChicken">
											<span>Garlic Chicken</span> <br /> <span
												style="font-size: 12px;">White Garlic Sauce, Cheese,
												Garlic Chicken, Tomatoes, Mushrooms, Red Onions and Chopped
												Garlic</span>
										</button>
										<div class="modal fade" id="GarlicChicken" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Garlic Chicken</h3>
															<span>White Garlic Sauce, Cheese, Garlic Chicken,
																Tomatoes, Mushrooms, Red Onions and Chopped Garlic</span>
														</div>
														<div class="modal-desc">
															<form id="popup2_9" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Size</h4>
																	<input type="text" size="20" name="GarlicChickenSize"
																		maxlength="20" required="required">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="GarlicChickenCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="GarlicChickenSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuGarlicChickenSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#BBQChicken"
											data-whatever="BBQChicken">
											<span>BBQ Chicken</span> <br /> <span
												style="font-size: 12px;">BBQ Sauce, Chicken, Crunchy
												Bacon, Tomatoes and Red Onions</span>
										</button>
										<div class="modal fade" id="BBQChicken" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>BBQ Chicken</h3>
															<span>BBQ Sauce, Chicken, Crunchy Bacon, Tomatoes
																and Red Onions</span>
														</div>
														<div class="modal-desc">
															<form id="popup2_10" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Size</h4>
																	<input type="text" size="20" name="BBQChickenSize"
																		maxlength="20" required="required">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="BBQChickenCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="BBQChickenSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuBBQChickenSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#ChickenBaconRanch"
											data-whatever="ChickenBaconRanch">
											<span>Chicken Bacon Ranch</span> <br /> <span
												style="font-size: 12px;">Ranch, Garlic Chicken and
												Crunchy Bacon</span>
										</button>
										<div class="modal fade" id="ChickenBaconRanch" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chicken Bacon Ranch</h3>
															<span>Ranch, Garlic Chicken and Crunchy Bacon</span>
														</div>
														<div class="modal-desc">
															<form id="popup2_11" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Size</h4>
																	<input type="text" size="20"
																		name="ChickenBaconRanchSize" maxlength="20"
																		required="required">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="ChickenBaconRanchCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="ChickenBaconRanchSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuChickenBaconRanchSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#Cheeseburger"
											data-whatever="Cheeseburger">
											<span>Cheeseburger</span> <br /> <span
												style="font-size: 12px;">Mozzarella Cheese, Hamburger
												and Crunchy Bacon</span>
										</button>
										<div class="modal fade" id="Cheeseburger" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Cheeseburger</h3>
															<span>Mozzarella Cheese, Hamburger and Crunchy
																Bacon</span>
														</div>
														<div class="modal-desc">
															<form id="popup2_12" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Size</h4>
																	<input type="text" size="20" name="CheeseburgerSize"
																		maxlength="20" required="required">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="CheeseburgerCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="CheeseburgerSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuCheeseburgerSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#ChicagosFavorite"
											data-whatever="ChicagosFavorite">
											<span>Chicago&#39;s Favorite</span> <br /> <span
												style="font-size: 12px;">Cheese, Chicken, Italian
												Sausage, Mushrooms, Pepperoni, Black Olives, Green Peppers,
												Red Onions and Green Onions</span>
										</button>
										<div class="modal fade" id="ChicagosFavorite" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chicago&#39;s Favorite</h3>
															<span>Cheese, Chicken, Italian Sausage, Mushrooms,
																Pepperoni, Black Olives, Green Peppers, Red Onions and
																Green Onions</span>
														</div>
														<div class="modal-desc">
															<form id="popup2_13" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Size</h4>
																	<input type="text" size="20"
																		name="ChicagosFavoriteSize" maxlength="20"
																		required="required">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="ChicagosFavoriteCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ChicagosFavoriteSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuChicagosFavoriteSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#ThreeIdiotsTopFavorite"
											data-whatever="ThreeIdiotsTopFavorite">
											<span>Three Idiots * Top Favorite!</span> <br /> <span
												style="font-size: 12px;">BBQ Chicken, Spicy Chicken
												and Garlic Chicken</span>
										</button>
										<div class="modal fade" id="ThreeIdiotsTopFavorite"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Three Idiots * Top Favorite!</h3>
															<span>BBQ Chicken, Spicy Chicken and Garlic
																Chicken</span>
														</div>
														<div class="modal-desc">
															<form id="popup2_14" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Size</h4>
																	<input type="text" size="20"
																		name="ThreeIdiotsTopFavoriteSize" maxlength="20"
																		required="required">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="ThreeIdiotsTopFavoriteCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="ThreeIdiotsTopFavoriteSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuThreeIdiotsTopFavoriteSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#ChickenDelight"
											data-whatever="ChickenDelight">
											<span>Chicken Delight</span> <br /> <span
												style="font-size: 12px;">White Sauce, Chicken,
												Artichoke Hearts and Mushrooms</span>
										</button>
										<div class="modal fade" id="ChickenDelight" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chicken Delight</h3>
															<span>White Sauce, Chicken, Artichoke Hearts and
																Mushrooms</span>
														</div>
														<div class="modal-desc">
															<form id="popup2_15" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Size</h4>
																	<input type="text" size="20" name="ChickenDelightSize"
																		maxlength="20" required="required">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="ChickenDelightCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ChickenDelightSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuChickenDelightSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#GarlicVeggie"
											data-whatever="GarlicVeggie">
											<span>Garlic Veggie</span> <br /> <span
												style="font-size: 12px;">Garlic Sauce, Cheese,
												Mushrooms, Small Sliced Broccoli, Tomatoes, Black Olives and
												Chopped Garlic</span>
										</button>
										<div class="modal fade" id="GarlicVeggie" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Garlic Veggie</h3>
															<span>Garlic Sauce, Cheese, Mushrooms, Small
																Sliced Broccoli, Tomatoes, Black Olives and Chopped
																Garlic</span>
														</div>
														<div class="modal-desc">
															<form id="popup2_16" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Size</h4>
																	<input type="text" size="20" name="GarlicVeggieSize"
																		maxlength="20" required="required">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="GarlicVeggieCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="GarlicVeggieSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuGarlicVeggieSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->

									</div>
								</div>
							</div>
						</div>
						<!-- Collapse start -->
						<div class="panel-group" id="accordion-Indian_Pizzas"
							role="tablist" aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-Indian_Pizzas" href="#Indian_Pizzas"
										aria-expanded="true" aria-controls="Indian_Pizzas"> Indian
										Pizzas </a>
								</div>
								<div id="Indian_Pizzas" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#TikkaMasalaVeggie"
											data-whatever="TikkaMasalaVeggie">
											<span>Tikka Masala Veggie</span> <br /> <span
												style="font-size: 12px;">Tikka Sauce, Mozzarella
												Cheese, Mushrooms, Red Onion, Tomatoes, Bell Pepper, Garlic,
												Ginger, Fresh Cilantro, Green Chilies and Jalapeno (on
												request)</span>
										</button>
										<div class="modal fade" id="TikkaMasalaVeggie" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Tikka Masala Veggie</h3>
															<span>Tikka Sauce, Mozzarella Cheese, Mushrooms,
																Red Onion, Tomatoes, Bell Pepper, Garlic, Ginger, Fresh
																Cilantro, Green Chilies and Jalapeno (on request)</span>
														</div>
														<div class="modal-desc">
															<form id="popup3_1" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Size</h4>
																	<input type="text" size="20"
																		name="TikkaMasalaVeggieSize" maxlength="20"
																		required="required">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="TikkaMasalaVeggieCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="TikkaMasalaVeggieSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuTikkaMasalaVeggieSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#TandooriVeggiePizza"
											data-whatever="TandooriVeggiePizza">
											<span>Tandoori Veggie Pizza</span> <br /> <span
												style="font-size: 12px;">Tandoori Sauce, Mozzarella
												Cheese, Mushrooms, Red Onion,Tomatoes, Garlic, Ginger, Fresh
												Cilantro, Green Chilies and Jalapeno (on request)</span>
										</button>
										<div class="modal fade" id="TandooriVeggiePizza" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Tandoori Veggie Pizza</h3>
															<span>Tandoori Sauce, Mozzarella Cheese,
																Mushrooms, Red Onion,Tomatoes, Garlic, Ginger, Fresh
																Cilantro, Green Chilies and Jalapeno (on request)</span>
														</div>
														<div class="modal-desc">
															<form id="popup3_2" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Size</h4>
																	<input type="text" size="20"
																		name="TandooriVeggiePizzaSize" maxlength="20"
																		required="required">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="TandooriVeggiePizzaCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="TandooriVeggiePizzaSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuTandooriVeggiePizzaSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#CurryVeggiePizza"
											data-whatever="CurryVeggiePizza">
											<span>Curry Veggie Pizza</span> <br /> <span
												style="font-size: 12px;">Curry Sauce, Mozzarella
												Cheese, Mushrooms, Black Olive, Red Onion, Tomatoes, Garlic,
												Ginger, Fresh Cilantro, Green Chilies and Jalapeno (on
												request)</span>
										</button>
										<div class="modal fade" id="CurryVeggiePizza" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Curry Veggie Pizza</h3>
															<span>Curry Sauce, Mozzarella Cheese, Mushrooms,
																Black Olive, Red Onion, Tomatoes, Garlic, Ginger, Fresh
																Cilantro, Green Chilies and Jalapeno (on request)</span>
														</div>
														<div class="modal-desc">
															<form id="popup3_3" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Size</h4>
																	<input type="text" size="20"
																		name="CurryVeggiePizzaSize" maxlength="20"
																		required="required">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="CurryVeggiePizzaCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="CurryVeggiePizzaSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuCurryVeggiePizzaSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#IndianVeggiePizza"
											data-whatever="IndianVeggiePizza">
											<span>Indian Veggie Pizza</span> <br /> <span
												style="font-size: 12px;">Red Sauce or White Sauce,
												Mozzarella Cheese, Mushrooms, Black Olive, Red onion,
												Tomatoes, Bell Pepper, Garlic, Ginger, Fresh Cilantro, and
												Green Chilies (on request)</span>
										</button>
										<div class="modal fade" id="IndianVeggiePizza" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Indian Veggie Pizza</h3>
															<span>Red Sauce or White Sauce, Mozzarella Cheese,
																Mushrooms, Black Olive, Red onion, Tomatoes, Bell
																Pepper, Garlic, Ginger, Fresh Cilantro, and Green
																Chilies (on request)</span>
														</div>
														<div class="modal-desc">
															<form id="popup3_4" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Size</h4>
																	<input type="text" size="20"
																		name="IndianVeggiePizzaSize" maxlength="20"
																		required="required">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="IndianVeggiePizzaCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="IndianVeggiePizzaSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuIndianVeggiePizzaSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#LimeVeggiePizza"
											data-whatever="LimeVeggiePizza">
											<span>Lime Veggie Pizza</span> <br /> <span
												style="font-size: 12px;">Red Sauce, Mozzarella
												Cheese, Mushrooms, Black Olive,Fresh Green Onions, Red
												Onion, Tomatoes, Bell Pepper, Garlic, Ginger, Fresh Dice
												Cucumber, Fresh Sliced Lime and Green Chili (on request)</span>
										</button>
										<div class="modal fade" id="LimeVeggiePizza" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Lime Veggie Pizza</h3>
															<span>Red Sauce, Mozzarella Cheese, Mushrooms,
																Black Olive,Fresh Green Onions, Red Onion, Tomatoes,
																Bell Pepper, Garlic, Ginger, Fresh Dice Cucumber, Fresh
																Sliced Lime and Green Chili (on request)</span>
														</div>
														<div class="modal-desc">
															<form id="popup3_5" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Size</h4>
																	<input type="text" size="20" name="LimeVeggiePizzaSize"
																		maxlength="20" required="required">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="LimeVeggiePizzaCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="LimeVeggiePizzaSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuLimeVeggiePizzaSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#PaneerTikkaMasala"
											data-whatever="PaneerTikkaMasala">
											<span>Paneer Tikka Masala</span> <br /> <span
												style="font-size: 12px;">Tikka Sauce, Cheese,
												Mushrooms, Bell Pepper, Red Onion, Tomatoes, Garlic, Ginger,
												Green Chilies and Jalapeno (on request), Tikka Paneer and
												Fres Cilantro</span>
										</button>
										<div class="modal fade" id="PaneerTikkaMasala" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Paneer Tikka Masala</h3>
															<span>Tikka Sauce, Cheese, Mushrooms, Bell Pepper,
																Red Onion, Tomatoes, Garlic, Ginger, Green Chilies and
																Jalapeno (on request), Tikka Paneer and Fres Cilantro</span>
														</div>
														<div class="modal-desc">
															<form id="popup3_6" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Size</h4>
																	<input type="text" size="20"
																		name="PaneerTikkaMasalaSize" maxlength="20"
																		required="required">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="PaneerTikkaMasalaCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="PaneerTikkaMasalaSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuPaneerTikkaMasalaSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#TandooriPaneer"
											data-whatever="TandooriPaneer">
											<span>Tandoori Paneer</span> <br /> <span
												style="font-size: 12px;">Tandoori Sauce, Cheese,
												Mushrooms, Red Onion, Tomatoes, Garlic, Ginger, Green
												Chilies Or Jalapeno (on request), Tandoori Paneer and Fresh
												Cilantro</span>
										</button>
										<div class="modal fade" id="TandooriPaneer" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Tandoori Paneer</h3>
															<span>Tandoori Sauce, Cheese, Mushrooms, Red
																Onion, Tomatoes, Garlic, Ginger, Green Chilies Or
																Jalapeno (on request), Tandoori Paneer and Fresh
																Cilantro</span>
														</div>
														<div class="modal-desc">
															<form id="popup3_7" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Size</h4>
																	<input type="text" size="20" name="TandooriPaneerSize"
																		maxlength="20" required="required">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="TandooriPaneerCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="TandooriPaneerSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuTandooriPaneerSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#CurryPaneer"
											data-whatever="CurryPaneer">
											<span>Curry Paneer</span> <br /> <span
												style="font-size: 12px;">Curry Sauce, Cheese,
												Mushrooms, Bell Pepper, Red Onion, Black Olives, Tomatoes,
												Garlic, Ginger, Green Chilies Or Jalapeno (on request),
												Curry Paneer and Fresh Cilantro</span>
										</button>
										<div class="modal fade" id="CurryPaneer" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Curry Paneer</h3>
															<span>Curry Sauce, Cheese, Mushrooms, Bell Pepper,
																Red Onion, Black Olives, Tomatoes, Garlic, Ginger, Green
																Chilies Or Jalapeno (on request), Curry Paneer and Fresh
																Cilantro</span>
														</div>
														<div class="modal-desc">
															<form id="popup3_8" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Size</h4>
																	<input type="text" size="20" name="CurryPaneerSize"
																		maxlength="20" required="required">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="CurryPaneerCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="CurryPaneerSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuCurryPaneerSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#PalakPaneer"
											data-whatever="PalakPaneer">
											<span>Palak Paneer</span> <br /> <span
												style="font-size: 12px;">Pesto Sauce, Paneer,
												Spinach, Ginger, Garlic, Red Onions, Green Chilies and
												Cilantro</span>
										</button>
										<div class="modal fade" id="PalakPaneer" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Palak Paneer</h3>
															<span>Pesto Sauce, Paneer, Spinach, Ginger,
																Garlic, Red Onions, Green Chilies and Cilantro</span>
														</div>
														<div class="modal-desc">
															<form id="popup3_9" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Size</h4>
																	<input type="text" size="20" name="PalakPaneerSize"
																		maxlength="20" required="required">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="PalakPaneerCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="PalakPaneerSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuPalakPaneerSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#PaneerVeggie"
											data-whatever="PaneerVeggie">
											<span>Paneer Veggie</span> <br /> <span
												style="font-size: 12px;">Red Sauce, Mozzarella
												Cheese, Mushrooms, Black Olive, Red Onion, Tomatoes, Bell
												Pepper, Garlic, Ginger, Paneer, Fresh Cilantro and Green
												Chilies (on request)</span>
										</button>
										<div class="modal fade" id="PaneerVeggie" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Paneer Veggie</h3>
															<span>Red Sauce, Mozzarella Cheese, Mushrooms,
																Black Olive, Red Onion, Tomatoes, Bell Pepper, Garlic,
																Ginger, Paneer, Fresh Cilantro and Green Chilies (on
																request)</span>
														</div>
														<div class="modal-desc">
															<form id="popup3_10" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Size</h4>
																	<input type="text" size="20" name="PaneerVeggieSize"
																		maxlength="20" required="required">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="PaneerVeggieCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="PaneerVeggieSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuPaneerVeggieSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#ChickenTikkaMasala"
											data-whatever="ChickenTikkaMasala">
											<span>Chicken Tikka Masala</span> <br /> <span
												style="font-size: 12px;">Tikka Sauce, Tikka Chicken,
												Mozzarella Cheese, Mushrooms, Red Onion, Bell Pepper,
												Garlic, Ginger, Fresh Cilantro, Green Chilies and Jalapeno
												(on request)</span>
										</button>
										<div class="modal fade" id="ChickenTikkaMasala" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chicken Tikka Masala</h3>
															<span>Tikka Sauce, Tikka Chicken, Mozzarella
																Cheese, Mushrooms, Red Onion, Bell Pepper, Garlic,
																Ginger, Fresh Cilantro, Green Chilies and Jalapeno (on
																request)</span>
														</div>
														<div class="modal-desc">
															<form id="popup3_11" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Size</h4>
																	<input type="text" size="20"
																		name="ChickenTikkaMasalaSize" maxlength="20"
																		required="required">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="ChickenTikkaMasalaCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="ChickenTikkaMasalaSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuChickenTikkaMasalaSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#TandooriChickenPizza"
											data-whatever="TandooriChickenPizza">
											<span>Tandoori Chicken Pizza</span> <br /> <span
												style="font-size: 12px;">Tandoori Sauce, Tandoori
												Chicken, Mozzarella Cheese, Mushrooms, Red Onion, Garlic,
												Ginger, Fresh Cilantro, Green Chilies and Jalapeno (on
												request)</span>
										</button>
										<div class="modal fade" id="TandooriChickenPizza"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Tandoori Chicken Pizza</h3>
															<span>Tandoori Sauce, Tandoori Chicken, Mozzarella
																Cheese, Mushrooms, Red Onion, Garlic, Ginger, Fresh
																Cilantro, Green Chilies and Jalapeno (on request)</span>
														</div>
														<div class="modal-desc">
															<form id="popup3_12" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Size</h4>
																	<input type="text" size="20"
																		name="TandooriChickenPizzaSize" maxlength="20"
																		required="required">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="TandooriChickenPizzaCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="TandooriChickenPizzaSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuTandooriChickenPizzaSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#ChickenCurryPizza"
											data-whatever="ChickenCurryPizza">
											<span>Chicken Curry Pizza</span> <br /> <span
												style="font-size: 12px;">Curry Sauce, Curry Chicken,
												Mozzarella Cheese, Mushrooms, Black Olive, Red Onion,
												Garlic, Ginger, Fresh Cilantro, Green Chilies and Jalapeno
												(on request)</span>
										</button>
										<div class="modal fade" id="ChickenCurryPizza" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chicken Curry Pizza</h3>
															<span>Curry Sauce, Curry Chicken, Mozzarella
																Cheese, Mushrooms, Black Olive, Red Onion, Garlic,
																Ginger, Fresh Cilantro, Green Chilies and Jalapeno (on
																request)</span>
														</div>
														<div class="modal-desc">
															<form id="popup3_13" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Size</h4>
																	<input type="text" size="20"
																		name="ChickenCurryPizzaSize" maxlength="20"
																		required="required">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="ChickenCurryPizzaCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="ChickenCurryPizzaSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuChickenCurryPizzaSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#IndianGarlicChicken"
											data-whatever="IndianGarlicChicken">
											<span>Indian Garlic Chicken</span> <br /> <span
												style="font-size: 12px;">Garlic Sauce, Cheese,
												Mushrooms, Red Onion, Bell Pepper, Black Olives, Tomatoes,
												Garlic, Ginger, Jalapeno and Green Chilies (on request),
												Garlic Chicken, and Fresh Cilantro</span>
										</button>
										<div class="modal fade" id="IndianGarlicChicken" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Indian Garlic Chicken</h3>
															<span>Garlic Sauce, Cheese, Mushrooms, Red Onion,
																Bell Pepper, Black Olives, Tomatoes, Garlic, Ginger,
																Jalapeno and Green Chilies (on request), Garlic Chicken,
																and Fresh Cilantro</span>
														</div>
														<div class="modal-desc">
															<form id="popup3_14" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Size</h4>
																	<input type="text" size="20"
																		name="IndianGarlicChickenSize" maxlength="20"
																		required="required">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="IndianGarlicChickenCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="IndianGarlicChickenSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuIndianGarlicChickenSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#ButterChicken"
											data-whatever="ButterChicken">
											<span>Butter Chicken</span> <br /> <span
												style="font-size: 12px;">Butter Sauce, Cheese, Red
												Onion, Tomatoes, Chopped Garlic, Ginger, Butter Chicken,
												Fresh Cilantro, Green Chili (on request)</span>
										</button>
										<div class="modal fade" id="ButterChicken" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Butter Chicken</h3>
															<span>Butter Sauce, Cheese, Red Onion, Tomatoes,
																Chopped Garlic, Ginger, Butter Chicken, Fresh Cilantro,
																Green Chili (on request)</span>
														</div>
														<div class="modal-desc">
															<form id="popup3_15" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Size</h4>
																	<input type="text" size="20" name="ButterChickenSize"
																		maxlength="20" required="required">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="ButterChickenCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ButterChickenSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuButterChickenSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->

									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
				<div class="col-md-4 rest-sidebar">
					<div class="hut-sec">
						<h3>Selected Items</h3>
						<div class="slide">
							<c:forEach items="${items}" var="m" varStatus="loop">
								<div class="full-menu-list-item" id="m_${loop.index}">
									<h4>${m.key}</h4>
									<span class="full-menu-remove-item"
										onclick="remove_chicagos_pizza_item('m_${loop.index}');">X</span>
									<figure>${m.value}</figure>
								</div>
							</c:forEach>
						</div>
						<div class="pick-deliver">
							<div class="checkout">
								<form action="${pageContext.request.contextPath}/menu/saveMenu"
									id="chicagos_pizza_target" method="post">
									<input type="hidden" name="full_menu_items"
										id="full_menu_items"> <input type="hidden"
										name="cuisineType" value="${menu.cuisine}">
									<textarea rows="4" cols="50" name="comments"
										placeholder="Enter your comments to restaurant here"
										class="form-control">${menu.comments}</textarea>
									<br />
									<!-- <button type="button" onclick="chicagos_pizza_menu_submit();"
										class="btn btn-default">Next</button> -->
									<a href="javascript:chicagos_pizza_menu_submit();">Next</a>
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


<script>
	$(window).load(function() {
		var rtl = false; // Use RTL
		initializeOwl(rtl);
	});

	$('document').ready(function() {
		$('.slide .full-menu-list-item').each(function() {
			var name = $(this).children().prev().text();
			var desc = $(this).children().next().next().text();
			console.log("Title: " + name);
			console.log("Desc: " + desc);
			chicagos_pizza_menu_items.push(name + "+" + desc); //chicagos_pizza_menu_items is in chicagos_pizza_95678.js 
		});
	});
</script>
<!-- Sidebar Scrolling -->
<script type="text/javascript">
	$(function() {
		var offset = $(".rest-sidebar").offset();
		var topPadding = 15;
		$(window).scroll(
				function() {
					if ($(window).scrollTop() > offset.top) {
						$(".rest-sidebar").stop().animate(
								{
									//marginTop : $(window).scrollTop() - offset.top + topPadding,
									marginTop : ($(window).scrollTop()
											- offset.top + topPadding) / 4,
								//marginTop : 0,
								//marginBottom : ($(window).scrollTop() - offset.top + topPadding)/4,

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