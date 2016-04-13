<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	function remove_chicagos_pizza_with_a_twist_item(div_id) {
		var divToRemove = $("div[id=" + div_id + "]");
		var name = divToRemove.children().children().prev().text();
		var desc = divToRemove.children().children().next().text();
		var data = name + "+" + desc;
		console.log("Removing " + data);
		chicagos_pizza_with_a_twist_menu_items.splice($.inArray(data,
				chicagos_pizza_with_a_twist_menu_items), 1);
		divToRemove.remove();
	}

	function chicagos_pizza_with_a_twist_menu_submit() {
		if (chicagos_pizza_with_a_twist_menu_items.length == 0) {
			alert("Please select at least 1 item to proceed.");
			return false;
		}
		console.log(chicagos_pizza_with_a_twist_menu_items);
		//console.log(JSON.stringify(chicagos_pizza_with_a_twist_menu_items));
		$("#full_menu_items").val(
				JSON.stringify(chicagos_pizza_with_a_twist_menu_items));
		$("#chicagos_pizza_with_a_twist_target").submit();
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
				<strong>${r.restaurant.address.street1}&nbsp;${r.restaurant.address.street2},&nbsp;${r.restaurant.address.city},&nbsp;${r.restaurant.address.state},&nbsp;${r.restaurant.address.zip}</strong>
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
																id="HotNSpicyTandooriWingsCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Hot-N-Spicy Tandoori Wings</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_1" class="form-horizontal"
																onsubmit="return populateFullMenuHotNSpicyTandooriWingsSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="HotNSpicyTandooriWingsCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="HotNSpicyTandooriWingsSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="submit" value="Add to Cart" />
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
																id="HoneyBBQTequilaLimeCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Honey BBQ Tequila-Lime</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_2" class="form-horizontal"
																onsubmit="return populateFullMenuHoneyBBQTequilaLimeSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="HoneyBBQTequilaLimeCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="HoneyBBQTequilaLimeSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="submit" value="Add to Cart" />
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
																id="GarlicBreadsticksCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Garlic Breadsticks</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_3" class="form-horizontal"
																onsubmit="return populateFullMenuGarlicBreadsticksSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="GarlicBreadsticksCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="GarlicBreadsticksSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="submit" value="Add to Cart" />
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
																id="CheeseBreadsticksCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Cheese Breadsticks</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_4" class="form-horizontal"
																onsubmit="return populateFullMenuCheeseBreadsticksSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="CheeseBreadsticksCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="CheeseBreadsticksSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="submit" value="Add to Cart" />
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
																id="BaconBreadsticksCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Bacon Breadsticks</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_5" class="form-horizontal"
																onsubmit="return populateFullMenuBaconBreadsticksSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="BaconBreadsticksCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="BaconBreadsticksSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="submit" value="Add to Cart" />
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
																id="IndianStyleBreadsticksCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Indian Style Breadsticks</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_6" class="form-horizontal"
																onsubmit="return populateFullMenuIndianStyleBreadsticksSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="IndianStyleBreadsticksCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="IndianStyleBreadsticksSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="submit" value="Add to Cart" />
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
						<div class="panel-group" id="accordion-Salads" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-Salads" href="#Salads"
										aria-expanded="true" aria-controls="Salads"> Salads </a>
								</div>
								<div id="Salads" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
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
																id="GardenSaladCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Garden Salad</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup_2_1" class="form-horizontal"
																onsubmit="return populateFullMenuGardenSaladSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="GardenSaladCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="GardenSaladSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="submit" value="Add to Cart" />
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
																id="ChickenSaladCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chicken Salad</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup_2_2" class="form-horizontal"
																onsubmit="return populateFullMenuChickenSaladSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="ChickenSaladCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ChickenSaladSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="submit" value="Add to Cart" />
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
											data-toggle="modal" data-target="#CombinationPizzaLarge"
											data-whatever="CombinationPizzaLarge">
											<span>Combination Pizza(Large)</span> <br /> <span
												style="font-size: 12px;">Large Pizza with Cheese,
												Pepperoni, Salami, Beef, Canadian Bacon, Italian Sausage,
												Mushrooms, Black Olives, Green Peppers and Onions.</span>
										</button>
										<div class="modal fade" id="CombinationPizzaLarge"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="CombinationPizzaLargeCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Combination Pizza(Large)</h3>
															<span>Large Pizza with Cheese, Pepperoni, Salami,
																Beef, Canadian Bacon, Italian Sausage, Mushrooms, Black
																Olives, Green Peppers and Onions.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_1" class="form-horizontal"
																onsubmit="return populateFullMenuCombinationPizzaLargeSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="CombinationPizzaLargeCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="CombinationPizzaLargeSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="submit" value="Add to Cart" />
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
											data-toggle="modal" data-target="#VegetarianPizzaLarge"
											data-whatever="VegetarianPizzaLarge">
											<span>Vegetarian Pizza (Large)</span> <br /> <span
												style="font-size: 12px;">Large Pizza with Cheese,
												Mushrooms, Onions, Black Olives, Green Peppers, Artichokes
												Hearts and Fresh Tomatoes.</span>
										</button>
										<div class="modal fade" id="VegetarianPizzaLarge"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="VegetarianPizzaLargeCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Vegetarian Pizza (Large)</h3>
															<span>Large Pizza with Cheese, Mushrooms, Onions,
																Black Olives, Green Peppers, Artichokes Hearts and Fresh
																Tomatoes.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_2" class="form-horizontal"
																onsubmit="return populateFullMenuVegetarianPizzaLargeSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="VegetarianPizzaLargeCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="VegetarianPizzaLargeSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="submit" value="Add to Cart" />
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
											data-toggle="modal" data-target="#AllMeatPizzaLarge"
											data-whatever="AllMeatPizzaLarge">
											<span>All Meat Pizza (Large)</span> <br /> <span
												style="font-size: 12px;">Large Pizza with Cheese,
												Salami, Pepperoni, Canadian Bacon, Ground Beef and Italian
												Sausage.</span>
										</button>
										<div class="modal fade" id="AllMeatPizzaLarge" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="AllMeatPizzaLargeCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>All Meat Pizza (Large)</h3>
															<span>Large Pizza with Cheese, Salami, Pepperoni,
																Canadian Bacon, Ground Beef and Italian Sausage.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_3" class="form-horizontal"
																onsubmit="return populateFullMenuAllMeatPizzaLargeSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="AllMeatPizzaLargeCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="AllMeatPizzaLargeSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="submit" value="Add to Cart" />
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
											data-toggle="modal" data-target="#AllStarsorDeluxePizzaLarge"
											data-whatever="AllStarsorDeluxePizzaLarge">
											<span>All Stars or Deluxe Pizza (Large)</span> <br /> <span
												style="font-size: 12px;">Large Pizza with Cheese,
												Pepperoni, Italian Sausage, Mushrooms, Onions and Green
												Peppers.</span>
										</button>
										<div class="modal fade" id="AllStarsorDeluxePizzaLarge"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="AllStarsorDeluxePizzaLargeCloseBtn"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>All Stars or Deluxe Pizza (Large)</h3>
															<span>Large Pizza with Cheese, Pepperoni, Italian
																Sausage, Mushrooms, Onions and Green Peppers.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_4" class="form-horizontal"
																onsubmit="return populateFullMenuAllStarsorDeluxePizzaLargeSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="AllStarsorDeluxePizzaLargeCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="AllStarsorDeluxePizzaLargeSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="submit" value="Add to Cart" />
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
											data-toggle="modal" data-target="#HawaiianPizzaLarge"
											data-whatever="HawaiianPizzaLarge">
											<span>Hawaiian Pizza (Large)</span> <br /> <span
												style="font-size: 12px;">Large Pizza with Cheese, Ham
												and Pineapple.</span>
										</button>
										<div class="modal fade" id="HawaiianPizzaLarge" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="HawaiianPizzaLargeCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Hawaiian Pizza (Large)</h3>
															<span>Large Pizza with Cheese, Ham and Pineapple.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_5" class="form-horizontal"
																onsubmit="return populateFullMenuHawaiianPizzaLargeSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="HawaiianPizzaLargeCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="HawaiianPizzaLargeSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="submit" value="Add to Cart" />
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
											data-toggle="modal" data-target="#LatinoStylePizzaLarge"
											data-whatever="LatinoStylePizzaLarge">
											<span>Latino Style Pizza (Large)</span> <br /> <span
												style="font-size: 12px;">Large Pizza with Pepperoni,
												Italian Sausage, Ham, White Onions, Pineapple and Jalapeno.</span>
										</button>
										<div class="modal fade" id="LatinoStylePizzaLarge"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="LatinoStylePizzaLargeCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Latino Style Pizza (Large)</h3>
															<span>Large Pizza with Pepperoni, Italian Sausage,
																Ham, White Onions, Pineapple and Jalapeno.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_6" class="form-horizontal"
																onsubmit="return populateFullMenuLatinoStylePizzaLargeSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="LatinoStylePizzaLargeCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="LatinoStylePizzaLargeSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="submit" value="Add to Cart" />
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
											data-toggle="modal" data-target="#ItalianGarlicPizzaLarge"
											data-whatever="ItalianGarlicPizzaLarge">
											<span>Italian Garlic Pizza (Large)</span> <br /> <span
												style="font-size: 12px;">Large Pizza with Garlic
												Sauce, Pepperoni, Italian Sausage, Mushrooms, Tomatoes, Red
												Onions, Chopped Garlic and Green Onion.</span>
										</button>
										<div class="modal fade" id="ItalianGarlicPizzaLarge"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="ItalianGarlicPizzaLargeCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Italian Garlic Pizza (Large)</h3>
															<span>Large Pizza with Garlic Sauce, Pepperoni,
																Italian Sausage, Mushrooms, Tomatoes, Red Onions,
																Chopped Garlic and Green Onion.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_7" class="form-horizontal"
																onsubmit="return populateFullMenuItalianGarlicPizzaLargeSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="ItalianGarlicPizzaLargeCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="ItalianGarlicPizzaLargeSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="submit" value="Add to Cart" />
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
											data-toggle="modal" data-target="#BBQChickenPizzaLarge"
											data-whatever="BBQChickenPizzaLarge">
											<span>BBQ Chicken Pizza (Large)</span> <br /> <span
												style="font-size: 12px;">Large Pizza with White
												Garlic Sauce, Cheese, Garlic Chicken, Tomatoes, Mushrooms,
												Red Onions and Chopped Garlic.</span>
										</button>
										<div class="modal fade" id="BBQChickenPizzaLarge"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="BBQChickenPizzaLargeCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>BBQ Chicken Pizza (Large)</h3>
															<span>Large Pizza with White Garlic Sauce, Cheese,
																Garlic Chicken, Tomatoes, Mushrooms, Red Onions and
																Chopped Garlic.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_8" class="form-horizontal"
																onsubmit="return populateFullMenuBBQChickenPizzaLargeSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="BBQChickenPizzaLargeCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="BBQChickenPizzaLargeSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="submit" value="Add to Cart" />
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
											data-toggle="modal"
											data-target="#ChickenBaconRanchPizzaLarge"
											data-whatever="ChickenBaconRanchPizzaLarge">
											<span>Chicken Bacon Ranch Pizza (Large)</span> <br /> <span
												style="font-size: 12px;">Large Pizza with Ranch,
												Garlic Chicken and Crunchy Bacon.</span>
										</button>
										<div class="modal fade" id="ChickenBaconRanchPizzaLarge"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="ChickenBaconRanchPizzaLargeCloseBtn"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chicken Bacon Ranch Pizza (Large)</h3>
															<span>Large Pizza with Ranch, Garlic Chicken and
																Crunchy Bacon.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_9" class="form-horizontal"
																onsubmit="return populateFullMenuChickenBaconRanchPizzaLargeSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="ChickenBaconRanchPizzaLargeCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="ChickenBaconRanchPizzaLargeSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="submit" value="Add to Cart" />
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
											data-toggle="modal" data-target="#ChicagosFavoritePizzaLarge"
											data-whatever="ChicagosFavoritePizzaLarge">
											<span>Chicagoâ€™s Favorite Pizza (Large)</span> <br />
											<span style="font-size: 12px;">Large Pizza with
												Cheese, Chicken, Italian Sausage, Mushrooms, Pepperoni,
												Black, Olives, Green Peppers, Red Onions and Green Onions.</span>
										</button>
										<div class="modal fade" id="ChicagosFavoritePizzaLarge"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="ChicagosFavoritePizzaLargeCloseBtn"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chicagoâ€™s Favorite Pizza (Large)</h3>
															<span>Large Pizza with Cheese, Chicken, Italian
																Sausage, Mushrooms, Pepperoni, Black, Olives, Green
																Peppers, Red Onions and Green Onions.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_10" class="form-horizontal"
																onsubmit="return populateFullMenuChicagosFavoritePizzaLargeSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="ChicagosFavoritePizzaLargeCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="ChicagosFavoritePizzaLargeSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="submit" value="Add to Cart" />
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
											data-toggle="modal" data-target="#GarlicVeggiePizzaLarge"
											data-whatever="GarlicVeggiePizzaLarge">
											<span>Garlic Veggie Pizza (Large)</span> <br /> <span
												style="font-size: 12px;">Large Pizza with Garlic
												Sauce, Cheese, Mushrooms, Small Sliced Broccoli, Tomatoes,
												Black Olives and Chopped Garlic.</span>
										</button>
										<div class="modal fade" id="GarlicVeggiePizzaLarge"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="GarlicVeggiePizzaLargeCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Garlic Veggie Pizza (Large)</h3>
															<span>Large Pizza with Garlic Sauce, Cheese,
																Mushrooms, Small Sliced Broccoli, Tomatoes, Black Olives
																and Chopped Garlic.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_11" class="form-horizontal"
																onsubmit="return populateFullMenuGarlicVeggiePizzaLargeSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="GarlicVeggiePizzaLargeCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="GarlicVeggiePizzaLargeSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="submit" value="Add to Cart" />
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
											data-toggle="modal"
											data-target="#TikkaMasalaVeggiePizzaLarge"
											data-whatever="TikkaMasalaVeggiePizzaLarge">
											<span>Tikka Masala Veggie Pizza (Large)</span> <br /> <span
												style="font-size: 12px;">Large Pizza with Tikka
												Sauce, Mozzarella Cheese, Mushrooms, Red Onion, Tomatoes,
												Bell Pepper, Garlic, Ginger, Fresh Cilantro, Green Chilies
												and Jalapeno.</span>
										</button>
										<div class="modal fade" id="TikkaMasalaVeggiePizzaLarge"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="TikkaMasalaVeggiePizzaLargeCloseBtn"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Tikka Masala Veggie Pizza (Large)</h3>
															<span>Large Pizza with Tikka Sauce, Mozzarella
																Cheese, Mushrooms, Red Onion, Tomatoes, Bell Pepper,
																Garlic, Ginger, Fresh Cilantro, Green Chilies and
																Jalapeno.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_1" class="form-horizontal"
																onsubmit="return populateFullMenuTikkaMasalaVeggiePizzaLargeSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="TikkaMasalaVeggiePizzaLargeCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="TikkaMasalaVeggiePizzaLargeSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="submit" value="Add to Cart" />
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
											data-toggle="modal" data-target="#TandooriVeggiePizzaLarge"
											data-whatever="TandooriVeggiePizzaLarge">
											<span>Tandoori Veggie Pizza (Large)</span> <br /> <span
												style="font-size: 12px;">Large Pizza with Tandoori
												Sauce, Mozzarella Cheese, Mushrooms, Red Onion,Tomatoes,
												Garlic, Ginger, Fresh Cilantro, Green Chilies and Jalapeno.</span>
										</button>
										<div class="modal fade" id="TandooriVeggiePizzaLarge"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="TandooriVeggiePizzaLargeCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Tandoori Veggie Pizza (Large)</h3>
															<span>Large Pizza with Tandoori Sauce, Mozzarella
																Cheese, Mushrooms, Red Onion,Tomatoes, Garlic, Ginger,
																Fresh Cilantro, Green Chilies and Jalapeno.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_2" class="form-horizontal"
																onsubmit="return populateFullMenuTandooriVeggiePizzaLargeSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="TandooriVeggiePizzaLargeCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="TandooriVeggiePizzaLargeSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="submit" value="Add to Cart" />
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
											data-toggle="modal" data-target="#CurryVeggiePizzaLarge"
											data-whatever="CurryVeggiePizzaLarge">
											<span>Curry Veggie Pizza (Large)</span> <br /> <span
												style="font-size: 12px;">Large Pizza with Curry
												Sauce, Mozzarella Cheese, Mushrooms, Black Olive, Red Onion,
												Tomatoes, Garlic, Ginger, Fresh Cilantro, Green Chilies and
												Jalapeno.</span>
										</button>
										<div class="modal fade" id="CurryVeggiePizzaLarge"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="CurryVeggiePizzaLargeCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Curry Veggie Pizza (Large)</h3>
															<span>Large Pizza with Curry Sauce, Mozzarella
																Cheese, Mushrooms, Black Olive, Red Onion, Tomatoes,
																Garlic, Ginger, Fresh Cilantro, Green Chilies and
																Jalapeno.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_3" class="form-horizontal"
																onsubmit="return populateFullMenuCurryVeggiePizzaLargeSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="CurryVeggiePizzaLargeCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="CurryVeggiePizzaLargeSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="submit" value="Add to Cart" />
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
											data-toggle="modal" data-target="#IndianVeggiePizzaLarge"
											data-whatever="IndianVeggiePizzaLarge">
											<span>Indian Veggie Pizza (Large)</span> <br /> <span
												style="font-size: 12px;">Large Pizza with Red Sauce
												or White Sauce, Mozzarella Cheese, Mushrooms, Black Olive,
												Red onion, Tomatoes, Bell Pepper, Garlic, Ginger, Fresh
												Cilantro, and Green Chilies.</span>
										</button>
										<div class="modal fade" id="IndianVeggiePizzaLarge"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="IndianVeggiePizzaLargeCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Indian Veggie Pizza (Large)</h3>
															<span>Large Pizza with Red Sauce or White Sauce,
																Mozzarella Cheese, Mushrooms, Black Olive, Red onion,
																Tomatoes, Bell Pepper, Garlic, Ginger, Fresh Cilantro,
																and Green Chilies.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_4" class="form-horizontal"
																onsubmit="return populateFullMenuIndianVeggiePizzaLargeSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="IndianVeggiePizzaLargeCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="IndianVeggiePizzaLargeSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="submit" value="Add to Cart" />
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
											data-toggle="modal" data-target="#LimeVeggiePizzaLarge"
											data-whatever="LimeVeggiePizzaLarge">
											<span>Lime Veggie Pizza (Large)</span> <br /> <span
												style="font-size: 12px;">Large Pizza with Red Sauce,
												Mozzarella Cheese, Mushrooms, Black Olive,Fresh Green
												Onions, Red Onion, Tomatoes, Bell Pepper, Garlic, Ginger,
												Fresh Dice Cucumber, Fresh Sliced Lime and Green Chili.</span>
										</button>
										<div class="modal fade" id="LimeVeggiePizzaLarge"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="LimeVeggiePizzaLargeCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Lime Veggie Pizza (Large)</h3>
															<span>Large Pizza with Red Sauce, Mozzarella
																Cheese, Mushrooms, Black Olive,Fresh Green Onions, Red
																Onion, Tomatoes, Bell Pepper, Garlic, Ginger, Fresh Dice
																Cucumber, Fresh Sliced Lime and Green Chili.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_5" class="form-horizontal"
																onsubmit="return populateFullMenuLimeVeggiePizzaLargeSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="LimeVeggiePizzaLargeCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="LimeVeggiePizzaLargeSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="submit" value="Add to Cart" />
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
											data-toggle="modal"
											data-target="#PaneerTikkaMasalaPizzaLarge"
											data-whatever="PaneerTikkaMasalaPizzaLarge">
											<span>Paneer Tikka Masala Pizza (Large)</span> <br /> <span
												style="font-size: 12px;">Large Pizza with Tikka
												Sauce, Cheese, Mushrooms, Bell Pepper, Red Onion, Tomatoes,
												Garlic, Ginger, Green Chilies and Jalapeno (on request),
												Tikka Paneer and Fres Cilantro.</span>
										</button>
										<div class="modal fade" id="PaneerTikkaMasalaPizzaLarge"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="PaneerTikkaMasalaPizzaLargeCloseBtn"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Paneer Tikka Masala Pizza (Large)</h3>
															<span>Large Pizza with Tikka Sauce, Cheese,
																Mushrooms, Bell Pepper, Red Onion, Tomatoes, Garlic,
																Ginger, Green Chilies and Jalapeno (on request), Tikka
																Paneer and Fres Cilantro.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_6" class="form-horizontal"
																onsubmit="return populateFullMenuPaneerTikkaMasalaPizzaLargeSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="PaneerTikkaMasalaPizzaLargeCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="PaneerTikkaMasalaPizzaLargeSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="submit" value="Add to Cart" />
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
											data-toggle="modal" data-target="#TandooriPaneerPizzaLarge"
											data-whatever="TandooriPaneerPizzaLarge">
											<span>Tandoori Paneer Pizza (Large)</span> <br /> <span
												style="font-size: 12px;">Large Pizza with Tandoori
												Sauce, Cheese, Mushrooms, Red Onion, Tomatoes, Garlic,
												Ginger, Green Chilies Or Jalapeno (on request), Tandoori
												Paneer and Fresh Cilantro.</span>
										</button>
										<div class="modal fade" id="TandooriPaneerPizzaLarge"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="TandooriPaneerPizzaLargeCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Tandoori Paneer Pizza (Large)</h3>
															<span>Large Pizza with Tandoori Sauce, Cheese,
																Mushrooms, Red Onion, Tomatoes, Garlic, Ginger, Green
																Chilies Or Jalapeno (on request), Tandoori Paneer and
																Fresh Cilantro.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_7" class="form-horizontal"
																onsubmit="return populateFullMenuTandooriPaneerPizzaLargeSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="TandooriPaneerPizzaLargeCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="TandooriPaneerPizzaLargeSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="submit" value="Add to Cart" />
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
											data-toggle="modal" data-target="#CurryPaneerPizzaLarge"
											data-whatever="CurryPaneerPizzaLarge">
											<span>Curry Paneer Pizza (Large)</span> <br /> <span
												style="font-size: 12px;">Large Pizza with Curry
												Sauce, Cheese, Mushrooms, Bell Pepper, Red Onion, Black
												Olives, Tomatoes, Garlic, Ginger, Green Chilies Or Jalapeno
												(on request), Curry Paneer and Fresh Cilantro.</span>
										</button>
										<div class="modal fade" id="CurryPaneerPizzaLarge"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="CurryPaneerPizzaLargeCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Curry Paneer Pizza (Large)</h3>
															<span>Large Pizza with Curry Sauce, Cheese,
																Mushrooms, Bell Pepper, Red Onion, Black Olives,
																Tomatoes, Garlic, Ginger, Green Chilies Or Jalapeno (on
																request), Curry Paneer and Fresh Cilantro.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_8" class="form-horizontal"
																onsubmit="return populateFullMenuCurryPaneerPizzaLargeSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="CurryPaneerPizzaLargeCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="CurryPaneerPizzaLargeSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="submit" value="Add to Cart" />
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
											data-toggle="modal" data-target="#ChickenTikkaMasalaLarge"
											data-whatever="ChickenTikkaMasalaLarge">
											<span>Chicken Tikka Masala (Large)</span> <br /> <span
												style="font-size: 12px;">Large Pizza with Tikka
												Sauce, Tikka Chicken, Mozzarella Cheese, Mushrooms, Red
												Onion, Bell Pepper, Garlic, Ginger, Fresh Cilantro, Green
												Chilies and Jalapeno.</span>
										</button>
										<div class="modal fade" id="ChickenTikkaMasalaLarge"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="ChickenTikkaMasalaLargeCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chicken Tikka Masala (Large)</h3>
															<span>Large Pizza with Tikka Sauce, Tikka Chicken,
																Mozzarella Cheese, Mushrooms, Red Onion, Bell Pepper,
																Garlic, Ginger, Fresh Cilantro, Green Chilies and
																Jalapeno.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_9" class="form-horizontal"
																onsubmit="return populateFullMenuChickenTikkaMasalaLargeSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="ChickenTikkaMasalaLargeCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="ChickenTikkaMasalaLargeSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="submit" value="Add to Cart" />
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
											data-toggle="modal" data-target="#TandooriChickenPizzaLarge"
											data-whatever="TandooriChickenPizzaLarge">
											<span>Tandoori Chicken Pizza (Large)</span> <br /> <span
												style="font-size: 12px;">Large Pizza with Tandoori
												Sauce, Tandoori Chicken, Mozzarella Cheese, Mushrooms, Red
												Onion, Garlic, Ginger, Fresh Cilantro, Green Chilies and
												Jalapeno.</span>
										</button>
										<div class="modal fade" id="TandooriChickenPizzaLarge"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="TandooriChickenPizzaLargeCloseBtn"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Tandoori Chicken Pizza (Large)</h3>
															<span>Large Pizza with Tandoori Sauce, Tandoori
																Chicken, Mozzarella Cheese, Mushrooms, Red Onion,
																Garlic, Ginger, Fresh Cilantro, Green Chilies and
																Jalapeno.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_10" class="form-horizontal"
																onsubmit="return populateFullMenuTandooriChickenPizzaLargeSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="TandooriChickenPizzaLargeCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="TandooriChickenPizzaLargeSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="submit" value="Add to Cart" />
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
											data-toggle="modal" data-target="#ChickenCurryPizzaLarge"
											data-whatever="ChickenCurryPizzaLarge">
											<span>Chicken Curry Pizza (Large)</span> <br /> <span
												style="font-size: 12px;">Large Pizza with Curry
												Sauce, Curry Chicken, Mozzarella Cheese, Mushrooms, Black
												Olive, Red Onion, Garlic, Ginger, Fresh Cilantro, Green
												Chilies and Jalapeno.</span>
										</button>
										<div class="modal fade" id="ChickenCurryPizzaLarge"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="ChickenCurryPizzaLargeCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chicken Curry Pizza (Large)</h3>
															<span>Large Pizza with Curry Sauce, Curry Chicken,
																Mozzarella Cheese, Mushrooms, Black Olive, Red Onion,
																Garlic, Ginger, Fresh Cilantro, Green Chilies and
																Jalapeno.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_11" class="form-horizontal"
																onsubmit="return populateFullMenuChickenCurryPizzaLargeSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="ChickenCurryPizzaLargeCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="ChickenCurryPizzaLargeSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="submit" value="Add to Cart" />
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
											data-toggle="modal" data-target="#ButterChickenPizzaLarge"
											data-whatever="ButterChickenPizzaLarge">
											<span>Butter Chicken Pizza (Large)</span> <br /> <span
												style="font-size: 12px;">Large Pizza with Butter
												Sauce, Cheese, Red Onion, Tomatoes, Chopped Garlic, Ginger,
												Butter Chicken, Fresh Cilantro, Green Chili.</span>
										</button>
										<div class="modal fade" id="ButterChickenPizzaLarge"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="ButterChickenPizzaLargeCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Butter Chicken Pizza (Large)</h3>
															<span>Large Pizza with Butter Sauce, Cheese, Red
																Onion, Tomatoes, Chopped Garlic, Ginger, Butter Chicken,
																Fresh Cilantro, Green Chili.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_12" class="form-horizontal"
																onsubmit="return populateFullMenuButterChickenPizzaLargeSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="ButterChickenPizzaLargeCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="ButterChickenPizzaLargeSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="submit" value="Add to Cart" />
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
										onclick="remove_chicagos_pizza_with_a_twist_item('m_${loop.index}');">X</span>
									<figure>${m.value}</figure>
								</div>
							</c:forEach>
						</div>
						<div class="pick-deliver">
							<div class="checkout">
								<form action="${pageContext.request.contextPath}/menu/saveMenu"
									id="chicagos_pizza_with_a_twist_target" method="post">
									<input type="hidden" name="full_menu_items"
										id="full_menu_items"> <input type="hidden"
										name="cuisineType" value="${menu.cuisine}">
									<textarea rows="4" cols="50" name="comments"
										placeholder="Enter your comments to restaurant here"
										class="form-control">${menu.comments}</textarea>
									<br />
									<!-- <button type="button" onclick="chicagos_pizza_with_a_twist_menu_submit();"
										class="btn btn-default">Next</button> -->
									<a href="javascript:chicagos_pizza_with_a_twist_menu_submit();">Next</a>
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
			chicagos_pizza_with_a_twist_menu_items.push(name + "+" + desc); //chicagos_pizza_with_a_twist_menu_items is in chicago's_pizza_with_a_twist_95630.js 
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
