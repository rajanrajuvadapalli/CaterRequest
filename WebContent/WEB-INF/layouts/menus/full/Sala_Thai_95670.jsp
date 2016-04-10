<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	function remove_sala_thai_item(div_id) {
		var divToRemove = $("div[id=" + div_id + "]");
		var name = divToRemove.children().children().prev().text();
		var desc = divToRemove.children().children().next().text();
		var data = name + "+" + desc;
		console.log("Removing " + data);
		sala_thai_menu_items.splice($.inArray(data, sala_thai_menu_items), 1);
		divToRemove.remove();
	}

	function sala_thai_menu_submit() {
		if (sala_thai_menu_items.length == 0) {
			alert("Please select at least 1 item to proceed.");
			return false;
		}
		console.log(sala_thai_menu_items);
		//console.log(JSON.stringify(sala_thai_menu_items));
		$("#full_menu_items").val(JSON.stringify(sala_thai_menu_items));
		$("#sala_thai_target").submit();
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
						<div class="panel-group" id="accordion-Appetizer" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-Appetizer" href="#Appetizer"
										aria-expanded="true" aria-controls="Appetizer"> Appetizer
									</a>
								</div>
								<div id="Appetizer" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#FreshRolls"
											data-whatever="FreshRolls">
											<span>Fresh Rolls</span> <br /> <span
												style="font-size: 12px;">Combination of vegetables,
												alfalfa sprout, mint leaves, cilantro and tofu wrapped in
												rice paper served with peanut sauce and honey plum sauce.</span>
										</button>
										<div class="modal fade" id="FreshRolls" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="FreshRollsCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Fresh Rolls</h3>
															<span>Combination of vegetables, alfalfa sprout,
																mint leaves, cilantro and tofu wrapped in rice paper
																served with peanut sauce and honey plum sauce.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_1" class="form-horizontal"
																onsubmit="return populateFullMenuFreshRollsSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="FreshRollsCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="FreshRollsSpl"
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
											data-toggle="modal" data-target="#ThaiRolls"
											data-whatever="ThaiRolls">
											<span>Thai Rolls</span> <br /> <span
												style="font-size: 12px;">Deep fried egg rolls stuffed
												with combination vegetables and silver noodles served with
												sweet and sour sauce.</span>
										</button>
										<div class="modal fade" id="ThaiRolls" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="ThaiRollsCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Thai Rolls</h3>
															<span>Deep fried egg rolls stuffed with
																combination vegetables and silver noodles served with
																sweet and sour sauce.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_2" class="form-horizontal"
																onsubmit="return populateFullMenuThaiRollsSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="ThaiRollsCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ThaiRollsSpl"
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
											data-toggle="modal" data-target="#ChickenSatay"
											data-whatever="ChickenSatay">
											<span>Chicken Satay</span> <br /> <span
												style="font-size: 12px;">Grilled chicken marinated in
												coconut milk and a medley of spices served on skewers with
												peanut sauce and cucumber salad.</span>
										</button>
										<div class="modal fade" id="ChickenSatay" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="ChickenSatayCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chicken Satay</h3>
															<span>Grilled chicken marinated in coconut milk
																and a medley of spices served on skewers with peanut
																sauce and cucumber salad.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_3" class="form-horizontal"
																onsubmit="return populateFullMenuChickenSataySelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="ChickenSatayCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ChickenSataySpl"
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
						<div class="panel-group" id="accordion-Salad" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-Salad" href="#Salad"
										aria-expanded="true" aria-controls="Salad"> Salad </a>
								</div>
								<div id="Salad" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#PapayaSalad"
											data-whatever="PapayaSalad">
											<span>Papaya Salad</span> <br /> <span
												style="font-size: 12px;">Traditional Thai salad with
												sliced papaya. Delicious tomatoes, lemon juice, ground
												peanut, green beans and spices with mild to strong chilies.
												We can cook it to your favorite taste.</span>
										</button>
										<div class="modal fade" id="PapayaSalad" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="PapayaSaladCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Papaya Salad</h3>
															<span>Traditional Thai salad with sliced papaya.
																Delicious tomatoes, lemon juice, ground peanut, green
																beans and spices with mild to strong chilies. We can
																cook it to your favorite taste.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_2_1" class="form-horizontal"
																onsubmit="return populateFullMenuPapayaSaladSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="PapayaSaladCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="PapayaSaladSpl"
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
											data-toggle="modal" data-target="#ThaiSalad"
											data-whatever="ThaiSalad">
											<span>Thai Salad</span> <br /> <span
												style="font-size: 12px;">A mixture of lettuce, sliced
												tomatoes, cucumbers, onions and a hard boiled egg with our
												homemade peanut dressing.</span>
										</button>
										<div class="modal fade" id="ThaiSalad" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="ThaiSaladCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Thai Salad</h3>
															<span>A mixture of lettuce, sliced tomatoes,
																cucumbers, onions and a hard boiled egg with our
																homemade peanut dressing.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_2_2" class="form-horizontal"
																onsubmit="return populateFullMenuThaiSaladSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="ThaiSaladCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ThaiSaladSpl"
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
											data-toggle="modal" data-target="#SpicyChickenSalad"
											data-whatever="SpicyChickenSalad">
											<span>Spicy Chicken Salad</span> <br /> <span
												style="font-size: 12px;">Grilled chicken mixed with
												crispy noodles, ginger and seasoned with a spicy lime
												dressing.</span>
										</button>
										<div class="modal fade" id="SpicyChickenSalad" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="SpicyChickenSaladCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Spicy Chicken Salad</h3>
															<span>Grilled chicken mixed with crispy noodles,
																ginger and seasoned with a spicy lime dressing.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_2_3" class="form-horizontal"
																onsubmit="return populateFullMenuSpicyChickenSaladSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="SpicyChickenSaladCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="SpicyChickenSaladSpl" maxlength="20">
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
						<div class="panel-group" id="accordion-Meat__Vegetables"
							role="tablist" aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-Meat__Vegetables"
										href="#Meat__Vegetables" aria-expanded="true"
										aria-controls="Meat__Vegetables"> Meat & Vegetables </a>
								</div>
								<div id="Meat__Vegetables" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#ChickenMixedVegetables"
											data-whatever="ChickenMixedVegetables">
											<span>Chicken & Mixed Vegetables</span> <br /> <span
												style="font-size: 12px;">Chicken and variety of
												vegetables, garlic with light brown sauce.</span>
										</button>
										<div class="modal fade" id="ChickenMixedVegetables"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="ChickenMixedVegetablesCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chicken & Mixed Vegetables</h3>
															<span>Chicken and variety of vegetables, garlic
																with light brown sauce.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_1" class="form-horizontal"
																onsubmit="return populateFullMenuChickenMixedVegetablesSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="ChickenMixedVegetablesCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="ChickenMixedVegetablesSpl" maxlength="20">
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
											data-toggle="modal" data-target="#BeefMixedVegetables"
											data-whatever="BeefMixedVegetables">
											<span>Beef & Mixed Vegetables</span> <br /> <span
												style="font-size: 12px;">Beef and variety of
												vegetables, garlic with light brown sauce.</span>
										</button>
										<div class="modal fade" id="BeefMixedVegetables" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="BeefMixedVegetablesCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Beef & Mixed Vegetables</h3>
															<span>Beef and variety of vegetables, garlic with
																light brown sauce.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_2" class="form-horizontal"
																onsubmit="return populateFullMenuBeefMixedVegetablesSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="BeefMixedVegetablesCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="BeefMixedVegetablesSpl" maxlength="20">
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
											data-toggle="modal" data-target="#PorkMixedVegetables"
											data-whatever="PorkMixedVegetables">
											<span>Pork & Mixed Vegetables</span> <br /> <span
												style="font-size: 12px;">Pork and variety of
												vegetables, garlic with light brown sauce.</span>
										</button>
										<div class="modal fade" id="PorkMixedVegetables" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="PorkMixedVegetablesCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Pork & Mixed Vegetables</h3>
															<span>Pork and variety of vegetables, garlic with
																light brown sauce.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_3" class="form-horizontal"
																onsubmit="return populateFullMenuPorkMixedVegetablesSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="PorkMixedVegetablesCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="PorkMixedVegetablesSpl" maxlength="20">
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
											data-toggle="modal" data-target="#TofuMixedVegetables"
											data-whatever="TofuMixedVegetables">
											<span>Tofu & Mixed Vegetables</span> <br /> <span
												style="font-size: 12px;">Tofu and variety of
												vegetables, garlic with light brown sauce.</span>
										</button>
										<div class="modal fade" id="TofuMixedVegetables" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="TofuMixedVegetablesCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Tofu & Mixed Vegetables</h3>
															<span>Tofu and variety of vegetables, garlic with
																light brown sauce.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_4" class="form-horizontal"
																onsubmit="return populateFullMenuTofuMixedVegetablesSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="TofuMixedVegetablesCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="TofuMixedVegetablesSpl" maxlength="20">
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
											data-toggle="modal" data-target="#MixedVegetables"
											data-whatever="MixedVegetables">
											<span>Mixed Vegetables</span> <br /> <span
												style="font-size: 12px;">Variety of vegetables,
												garlic with light brown sauce.</span>
										</button>
										<div class="modal fade" id="MixedVegetables" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="MixedVegetablesCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Mixed Vegetables</h3>
															<span>Variety of vegetables, garlic with light
																brown sauce.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_5" class="form-horizontal"
																onsubmit="return populateFullMenuMixedVegetablesSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="MixedVegetablesCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="MixedVegetablesSpl"
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
											data-toggle="modal" data-target="#SweetSourBeef"
											data-whatever="SweetSourBeef">
											<span>Sweet & Sour (Beef)</span> <br /> <span
												style="font-size: 12px;">Stir-fried pineapples,
												cucumber, onions, tomatoes and bell peppers.</span>
										</button>
										<div class="modal fade" id="SweetSourBeef" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="SweetSourBeefCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Sweet & Sour (Beef)</h3>
															<span>Stir-fried pineapples, cucumber, onions,
																tomatoes and bell peppers.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_6" class="form-horizontal"
																onsubmit="return populateFullMenuSweetSourBeefSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="SweetSourBeefCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="SweetSourBeefSpl"
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
											data-toggle="modal" data-target="#SweetSourChicken"
											data-whatever="SweetSourChicken">
											<span>Sweet & Sour (Chicken)</span> <br /> <span
												style="font-size: 12px;">Stir-fried pineapples,
												cucumber, onions, tomatoes and bell peppers.</span>
										</button>
										<div class="modal fade" id="SweetSourChicken" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="SweetSourChickenCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Sweet & Sour (Chicken)</h3>
															<span>Stir-fried pineapples, cucumber, onions,
																tomatoes and bell peppers.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_7" class="form-horizontal"
																onsubmit="return populateFullMenuSweetSourChickenSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="SweetSourChickenCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="SweetSourChickenSpl"
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
											data-toggle="modal" data-target="#SweetSourPork"
											data-whatever="SweetSourPork">
											<span>Sweet & Sour (Pork)</span> <br /> <span
												style="font-size: 12px;">Stir-fried pineapples,
												cucumber, onions, tomatoes and bell peppers.</span>
										</button>
										<div class="modal fade" id="SweetSourPork" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="SweetSourPorkCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Sweet & Sour (Pork)</h3>
															<span>Stir-fried pineapples, cucumber, onions,
																tomatoes and bell peppers.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_8" class="form-horizontal"
																onsubmit="return populateFullMenuSweetSourPorkSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="SweetSourPorkCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="SweetSourPorkSpl"
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
											data-toggle="modal" data-target="#SweetSourTofu"
											data-whatever="SweetSourTofu">
											<span>Sweet & Sour (Tofu)</span> <br /> <span
												style="font-size: 12px;">Stir-fried pineapples,
												cucumber, onions, tomatoes and bell peppers.</span>
										</button>
										<div class="modal fade" id="SweetSourTofu" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="SweetSourTofuCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Sweet & Sour (Tofu)</h3>
															<span>Stir-fried pineapples, cucumber, onions,
																tomatoes and bell peppers.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_9" class="form-horizontal"
																onsubmit="return populateFullMenuSweetSourTofuSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="SweetSourTofuCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="SweetSourTofuSpl"
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
											data-toggle="modal" data-target="#SweetSourOnlyVegetables"
											data-whatever="SweetSourOnlyVegetables">
											<span>Sweet & Sour (Only Vegetables)</span> <br /> <span
												style="font-size: 12px;">Stir-fried pineapples,
												cucumber, onions, tomatoes and bell peppers.</span>
										</button>
										<div class="modal fade" id="SweetSourOnlyVegetables"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="SweetSourOnlyVegetablesCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Sweet & Sour (Only Vegetables)</h3>
															<span>Stir-fried pineapples, cucumber, onions,
																tomatoes and bell peppers.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_10" class="form-horizontal"
																onsubmit="return populateFullMenuSweetSourOnlyVegetablesSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="SweetSourOnlyVegetablesCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="SweetSourOnlyVegetablesSpl" maxlength="20">
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
						<div class="panel-group" id="accordion-Noodles" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-Noodles" href="#Noodles"
										aria-expanded="true" aria-controls="Noodles"> Noodles </a>
								</div>
								<div id="Noodles" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#PadThaiNoodleBeef"
											data-whatever="PadThaiNoodleBeef">
											<span>Pad Thai Noodle (Beef)</span> <br /> <span
												style="font-size: 12px;">One of Thailand's best known
												noodle dishes pan-fried rice noodles with your choice of
												meat egg, ground peanuts, bean sprouts and green onions.</span>
										</button>
										<div class="modal fade" id="PadThaiNoodleBeef" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="PadThaiNoodleBeefCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Pad Thai Noodle (Beef)</h3>
															<span>One of Thailand's best known noodle dishes
																pan-fried rice noodles with your choice of meat egg,
																ground peanuts, bean sprouts and green onions.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_1" class="form-horizontal"
																onsubmit="return populateFullMenuPadThaiNoodleBeefSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="PadThaiNoodleBeefCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="PadThaiNoodleBeefSpl" maxlength="20">
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
											data-toggle="modal" data-target="#PadThaiNoodleChicken"
											data-whatever="PadThaiNoodleChicken">
											<span>Pad Thai Noodle (Chicken)</span> <br /> <span
												style="font-size: 12px;">One of Thailand's best known
												noodle dishes pan-fried rice noodles with your choice of
												meat egg, ground peanuts, bean sprouts and green onions.</span>
										</button>
										<div class="modal fade" id="PadThaiNoodleChicken"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="PadThaiNoodleChickenCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Pad Thai Noodle (Chicken)</h3>
															<span>One of Thailand's best known noodle dishes
																pan-fried rice noodles with your choice of meat egg,
																ground peanuts, bean sprouts and green onions.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_2" class="form-horizontal"
																onsubmit="return populateFullMenuPadThaiNoodleChickenSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="PadThaiNoodleChickenCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="PadThaiNoodleChickenSpl" maxlength="20">
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
											data-toggle="modal" data-target="#PadThaiNoodlePork"
											data-whatever="PadThaiNoodlePork">
											<span>Pad Thai Noodle (Pork)</span> <br /> <span
												style="font-size: 12px;">One of Thailand's best known
												noodle dishes pan-fried rice noodles with your choice of
												meat egg, ground peanuts, bean sprouts and green onions.</span>
										</button>
										<div class="modal fade" id="PadThaiNoodlePork" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="PadThaiNoodlePorkCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Pad Thai Noodle (Pork)</h3>
															<span>One of Thailand's best known noodle dishes
																pan-fried rice noodles with your choice of meat egg,
																ground peanuts, bean sprouts and green onions.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_3" class="form-horizontal"
																onsubmit="return populateFullMenuPadThaiNoodlePorkSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="PadThaiNoodlePorkCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="PadThaiNoodlePorkSpl" maxlength="20">
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
											data-toggle="modal" data-target="#PadThaiNoodleTofu"
											data-whatever="PadThaiNoodleTofu">
											<span>Pad Thai Noodle (Tofu)</span> <br /> <span
												style="font-size: 12px;">One of Thailand's best known
												noodle dishes pan-fried rice noodles with your choice of
												meat egg, ground peanuts, bean sprouts and green onions.</span>
										</button>
										<div class="modal fade" id="PadThaiNoodleTofu" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="PadThaiNoodleTofuCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Pad Thai Noodle (Tofu)</h3>
															<span>One of Thailand's best known noodle dishes
																pan-fried rice noodles with your choice of meat egg,
																ground peanuts, bean sprouts and green onions.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_4" class="form-horizontal"
																onsubmit="return populateFullMenuPadThaiNoodleTofuSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="PadThaiNoodleTofuCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="PadThaiNoodleTofuSpl" maxlength="20">
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
											data-target="#PadThaiNoodleOnlyVegetables"
											data-whatever="PadThaiNoodleOnlyVegetables">
											<span>Pad Thai Noodle (Only Vegetables)</span> <br /> <span
												style="font-size: 12px;">One of Thailand's best known
												noodle dishes pan-fried rice noodles with your choice of
												meat egg, ground peanuts, bean sprouts and green onions.</span>
										</button>
										<div class="modal fade" id="PadThaiNoodleOnlyVegetables"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="PadThaiNoodleOnlyVegetablesCloseBtn"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Pad Thai Noodle (Only Vegetables)</h3>
															<span>One of Thailand's best known noodle dishes
																pan-fried rice noodles with your choice of meat egg,
																ground peanuts, bean sprouts and green onions.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_5" class="form-horizontal"
																onsubmit="return populateFullMenuPadThaiNoodleOnlyVegetablesSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="PadThaiNoodleOnlyVegetablesCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="PadThaiNoodleOnlyVegetablesSpl" maxlength="20">
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
											data-toggle="modal" data-target="#DrunkenNoodlesBeef"
											data-whatever="DrunkenNoodlesBeef">
											<span>Drunken Noodles (Beef)</span> <br /> <span
												style="font-size: 12px;">Spicy flat noodles with
												green onions, onions, chilies, garlic and Thai basil.</span>
										</button>
										<div class="modal fade" id="DrunkenNoodlesBeef" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="DrunkenNoodlesBeefCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Drunken Noodles (Beef)</h3>
															<span>Spicy flat noodles with green onions,
																onions, chilies, garlic and Thai basil.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_6" class="form-horizontal"
																onsubmit="return populateFullMenuDrunkenNoodlesBeefSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="DrunkenNoodlesBeefCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="DrunkenNoodlesBeefSpl" maxlength="20">
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
											data-toggle="modal" data-target="#DrunkenNoodlesChicken"
											data-whatever="DrunkenNoodlesChicken">
											<span>Drunken Noodles (Chicken)</span> <br /> <span
												style="font-size: 12px;">Spicy flat noodles with
												green onions, onions, chilies, garlic and Thai basil.</span>
										</button>
										<div class="modal fade" id="DrunkenNoodlesChicken"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="DrunkenNoodlesChickenCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Drunken Noodles (Chicken)</h3>
															<span>Spicy flat noodles with green onions,
																onions, chilies, garlic and Thai basil.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_7" class="form-horizontal"
																onsubmit="return populateFullMenuDrunkenNoodlesChickenSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="DrunkenNoodlesChickenCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="DrunkenNoodlesChickenSpl" maxlength="20">
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
											data-toggle="modal" data-target="#DrunkenNoodlesPork"
											data-whatever="DrunkenNoodlesPork">
											<span>Drunken Noodles (Pork)</span> <br /> <span
												style="font-size: 12px;">Spicy flat noodles with
												green onions, onions, chilies, garlic and Thai basil.</span>
										</button>
										<div class="modal fade" id="DrunkenNoodlesPork" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="DrunkenNoodlesPorkCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Drunken Noodles (Pork)</h3>
															<span>Spicy flat noodles with green onions,
																onions, chilies, garlic and Thai basil.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_8" class="form-horizontal"
																onsubmit="return populateFullMenuDrunkenNoodlesPorkSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="DrunkenNoodlesPorkCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="DrunkenNoodlesPorkSpl" maxlength="20">
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
											data-toggle="modal" data-target="#DrunkenNoodlesTofu"
											data-whatever="DrunkenNoodlesTofu">
											<span>Drunken Noodles (Tofu)</span> <br /> <span
												style="font-size: 12px;">Spicy flat noodles with
												green onions, onions, chilies, garlic and Thai basil.</span>
										</button>
										<div class="modal fade" id="DrunkenNoodlesTofu" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="DrunkenNoodlesTofuCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Drunken Noodles (Tofu)</h3>
															<span>Spicy flat noodles with green onions,
																onions, chilies, garlic and Thai basil.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_9" class="form-horizontal"
																onsubmit="return populateFullMenuDrunkenNoodlesTofuSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="DrunkenNoodlesTofuCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="DrunkenNoodlesTofuSpl" maxlength="20">
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
											data-target="#DrunkenNoodlesOnlyVegetables"
											data-whatever="DrunkenNoodlesOnlyVegetables">
											<span>Drunken Noodles (Only Vegetables)</span> <br /> <span
												style="font-size: 12px;">Spicy flat noodles with
												green onions, onions, chilies, garlic and Thai basil.</span>
										</button>
										<div class="modal fade" id="DrunkenNoodlesOnlyVegetables"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="DrunkenNoodlesOnlyVegetablesCloseBtn"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Drunken Noodles (Only Vegetables)</h3>
															<span>Spicy flat noodles with green onions,
																onions, chilies, garlic and Thai basil.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_10" class="form-horizontal"
																onsubmit="return populateFullMenuDrunkenNoodlesOnlyVegetablesSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="DrunkenNoodlesOnlyVegetablesCount"
																		maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="DrunkenNoodlesOnlyVegetablesSpl" maxlength="20">
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
						<div class="panel-group" id="accordion-Curries" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-Curries" href="#Curries"
										aria-expanded="true" aria-controls="Curries"> Curries </a>
								</div>
								<div id="Curries" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#RedCurryBeef"
											data-whatever="RedCurryBeef">
											<span>Red Curry (Beef)</span> <br /> <span
												style="font-size: 12px;">Eggplant, bell pepper, sweet
												Thai basil with bamboo shoots simmered in coconut milk and
												red curry.</span>
										</button>
										<div class="modal fade" id="RedCurryBeef" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="RedCurryBeefCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Red Curry (Beef)</h3>
															<span>Eggplant, bell pepper, sweet Thai basil with
																bamboo shoots simmered in coconut milk and red curry.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_5_1" class="form-horizontal"
																onsubmit="return populateFullMenuRedCurryBeefSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="RedCurryBeefCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="RedCurryBeefSpl"
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
											data-toggle="modal" data-target="#RedCurryChicken"
											data-whatever="RedCurryChicken">
											<span>Red Curry (Chicken)</span> <br /> <span
												style="font-size: 12px;">Eggplant, bell pepper, sweet
												Thai basil with bamboo shoots simmered in coconut milk and
												red curry.</span>
										</button>
										<div class="modal fade" id="RedCurryChicken" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="RedCurryChickenCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Red Curry (Chicken)</h3>
															<span>Eggplant, bell pepper, sweet Thai basil with
																bamboo shoots simmered in coconut milk and red curry.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_5_2" class="form-horizontal"
																onsubmit="return populateFullMenuRedCurryChickenSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="RedCurryChickenCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="RedCurryChickenSpl"
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
											data-toggle="modal" data-target="#RedCurryPork"
											data-whatever="RedCurryPork">
											<span>Red Curry (Pork)</span> <br /> <span
												style="font-size: 12px;">Eggplant, bell pepper, sweet
												Thai basil with bamboo shoots simmered in coconut milk and
												red curry.</span>
										</button>
										<div class="modal fade" id="RedCurryPork" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="RedCurryPorkCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Red Curry (Pork)</h3>
															<span>Eggplant, bell pepper, sweet Thai basil with
																bamboo shoots simmered in coconut milk and red curry.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_5_3" class="form-horizontal"
																onsubmit="return populateFullMenuRedCurryPorkSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="RedCurryPorkCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="RedCurryPorkSpl"
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
											data-toggle="modal" data-target="#RedCurryTofu"
											data-whatever="RedCurryTofu">
											<span>Red Curry (Tofu)</span> <br /> <span
												style="font-size: 12px;">Eggplant, bell pepper, sweet
												Thai basil with bamboo shoots simmered in coconut milk and
												red curry.</span>
										</button>
										<div class="modal fade" id="RedCurryTofu" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="RedCurryTofuCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Red Curry (Tofu)</h3>
															<span>Eggplant, bell pepper, sweet Thai basil with
																bamboo shoots simmered in coconut milk and red curry.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_5_4" class="form-horizontal"
																onsubmit="return populateFullMenuRedCurryTofuSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="RedCurryTofuCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="RedCurryTofuSpl"
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
											data-toggle="modal" data-target="#RedCurryOnlyVegetables"
											data-whatever="RedCurryOnlyVegetables">
											<span>Red Curry (Only Vegetables)</span> <br /> <span
												style="font-size: 12px;">Eggplant, bell pepper, sweet
												Thai basil with bamboo shoots simmered in coconut milk and
												red curry.</span>
										</button>
										<div class="modal fade" id="RedCurryOnlyVegetables"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="RedCurryOnlyVegetablesCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Red Curry (Only Vegetables)</h3>
															<span>Eggplant, bell pepper, sweet Thai basil with
																bamboo shoots simmered in coconut milk and red curry.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_5_5" class="form-horizontal"
																onsubmit="return populateFullMenuRedCurryOnlyVegetablesSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="RedCurryOnlyVegetablesCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="RedCurryOnlyVegetablesSpl" maxlength="20">
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
											data-toggle="modal" data-target="#YellowCurryBeef"
											data-whatever="YellowCurryBeef">
											<span>Yellow Curry (Beef)</span> <br /> <span
												style="font-size: 12px;">Potatoes, onion, carrot,
												simmered in coconut milk yellow curry.</span>
										</button>
										<div class="modal fade" id="YellowCurryBeef" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="YellowCurryBeefCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Yellow Curry (Beef)</h3>
															<span>Potatoes, onion, carrot, simmered in coconut
																milk yellow curry.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_5_6" class="form-horizontal"
																onsubmit="return populateFullMenuYellowCurryBeefSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="YellowCurryBeefCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="YellowCurryBeefSpl"
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
											data-toggle="modal" data-target="#YellowCurryChicken"
											data-whatever="YellowCurryChicken">
											<span>Yellow Curry (Chicken)</span> <br /> <span
												style="font-size: 12px;">Potatoes, onion, carrot,
												simmered in coconut milk yellow curry.</span>
										</button>
										<div class="modal fade" id="YellowCurryChicken" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="YellowCurryChickenCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Yellow Curry (Chicken)</h3>
															<span>Potatoes, onion, carrot, simmered in coconut
																milk yellow curry.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_5_7" class="form-horizontal"
																onsubmit="return populateFullMenuYellowCurryChickenSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="YellowCurryChickenCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="YellowCurryChickenSpl" maxlength="20">
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
											data-toggle="modal" data-target="#YellowCurryPork"
											data-whatever="YellowCurryPork">
											<span>Yellow Curry (Pork)</span> <br /> <span
												style="font-size: 12px;">Potatoes, onion, carrot,
												simmered in coconut milk yellow curry.</span>
										</button>
										<div class="modal fade" id="YellowCurryPork" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="YellowCurryPorkCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Yellow Curry (Pork)</h3>
															<span>Potatoes, onion, carrot, simmered in coconut
																milk yellow curry.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_5_8" class="form-horizontal"
																onsubmit="return populateFullMenuYellowCurryPorkSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="YellowCurryPorkCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="YellowCurryPorkSpl"
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
											data-toggle="modal" data-target="#YellowCurryTofu"
											data-whatever="YellowCurryTofu">
											<span>Yellow Curry (Tofu)</span> <br /> <span
												style="font-size: 12px;">Potatoes, onion, carrot,
												simmered in coconut milk yellow curry.</span>
										</button>
										<div class="modal fade" id="YellowCurryTofu" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="YellowCurryTofuCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Yellow Curry (Tofu)</h3>
															<span>Potatoes, onion, carrot, simmered in coconut
																milk yellow curry.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_5_9" class="form-horizontal"
																onsubmit="return populateFullMenuYellowCurryTofuSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="YellowCurryTofuCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="YellowCurryTofuSpl"
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
											data-toggle="modal" data-target="#YellowCurryOnlyVegetables"
											data-whatever="YellowCurryOnlyVegetables">
											<span>Yellow Curry (Only Vegetables)</span> <br /> <span
												style="font-size: 12px;">Potatoes, onion, carrot,
												simmered in coconut milk yellow curry.</span>
										</button>
										<div class="modal fade" id="YellowCurryOnlyVegetables"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="YellowCurryOnlyVegetablesCloseBtn"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Yellow Curry (Only Vegetables)</h3>
															<span>Potatoes, onion, carrot, simmered in coconut
																milk yellow curry.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_5_10" class="form-horizontal"
																onsubmit="return populateFullMenuYellowCurryOnlyVegetablesSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="YellowCurryOnlyVegetablesCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="YellowCurryOnlyVegetablesSpl" maxlength="20">
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
											data-toggle="modal" data-target="#GreenCurryBeef"
											data-whatever="GreenCurryBeef">
											<span>Green Curry (Beef)</span> <br /> <span
												style="font-size: 12px;">Green curry in coconut milk
												with Thai basil and assorted vegetables.</span>
										</button>
										<div class="modal fade" id="GreenCurryBeef" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="GreenCurryBeefCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Green Curry (Beef)</h3>
															<span>Green curry in coconut milk with Thai basil
																and assorted vegetables.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_5_11" class="form-horizontal"
																onsubmit="return populateFullMenuGreenCurryBeefSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="GreenCurryBeefCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="GreenCurryBeefSpl"
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
											data-toggle="modal" data-target="#GreenCurryChicken"
											data-whatever="GreenCurryChicken">
											<span>Green Curry (Chicken)</span> <br /> <span
												style="font-size: 12px;">Green curry in coconut milk
												with Thai basil and assorted vegetables.</span>
										</button>
										<div class="modal fade" id="GreenCurryChicken" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="GreenCurryChickenCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Green Curry (Chicken)</h3>
															<span>Green curry in coconut milk with Thai basil
																and assorted vegetables.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_5_12" class="form-horizontal"
																onsubmit="return populateFullMenuGreenCurryChickenSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="GreenCurryChickenCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="GreenCurryChickenSpl" maxlength="20">
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
											data-toggle="modal" data-target="#GreenCurryPork"
											data-whatever="GreenCurryPork">
											<span>Green Curry (Pork)</span> <br /> <span
												style="font-size: 12px;">Green curry in coconut milk
												with Thai basil and assorted vegetables.</span>
										</button>
										<div class="modal fade" id="GreenCurryPork" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="GreenCurryPorkCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Green Curry (Pork)</h3>
															<span>Green curry in coconut milk with Thai basil
																and assorted vegetables.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_5_13" class="form-horizontal"
																onsubmit="return populateFullMenuGreenCurryPorkSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="GreenCurryPorkCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="GreenCurryPorkSpl"
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
											data-toggle="modal" data-target="#GreenCurryTofu"
											data-whatever="GreenCurryTofu">
											<span>Green Curry (Tofu)</span> <br /> <span
												style="font-size: 12px;">Green curry in coconut milk
												with Thai basil and assorted vegetables.</span>
										</button>
										<div class="modal fade" id="GreenCurryTofu" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="GreenCurryTofuCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Green Curry (Tofu)</h3>
															<span>Green curry in coconut milk with Thai basil
																and assorted vegetables.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_5_14" class="form-horizontal"
																onsubmit="return populateFullMenuGreenCurryTofuSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="GreenCurryTofuCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="GreenCurryTofuSpl"
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
											data-toggle="modal" data-target="#GreenCurryOnlyVegetables"
											data-whatever="GreenCurryOnlyVegetables">
											<span>Green Curry (Only Vegetables)</span> <br /> <span
												style="font-size: 12px;">Green curry in coconut milk
												with Thai basil and assorted vegetables.</span>
										</button>
										<div class="modal fade" id="GreenCurryOnlyVegetables"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="GreenCurryOnlyVegetablesCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Green Curry (Only Vegetables)</h3>
															<span>Green curry in coconut milk with Thai basil
																and assorted vegetables.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_5_15" class="form-horizontal"
																onsubmit="return populateFullMenuGreenCurryOnlyVegetablesSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="GreenCurryOnlyVegetablesCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="GreenCurryOnlyVegetablesSpl" maxlength="20">
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
						<div class="panel-group" id="accordion-Rice" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-Rice" href="#Rice"
										aria-expanded="true" aria-controls="Rice"> Rice </a>
								</div>
								<div id="Rice" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#ThaiFriedRiceBeef"
											data-whatever="ThaiFriedRiceBeef">
											<span>Thai Fried Rice (Beef)</span> <br /> <span
												style="font-size: 12px;">Fried rice with eggs,
												tomatoes, onions.</span>
										</button>
										<div class="modal fade" id="ThaiFriedRiceBeef" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="ThaiFriedRiceBeefCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Thai Fried Rice (Beef)</h3>
															<span>Fried rice with eggs, tomatoes, onions.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_6_1" class="form-horizontal"
																onsubmit="return populateFullMenuThaiFriedRiceBeefSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="ThaiFriedRiceBeefCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="ThaiFriedRiceBeefSpl" maxlength="20">
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
											data-toggle="modal" data-target="#ThaiFriedRiceChicken"
											data-whatever="ThaiFriedRiceChicken">
											<span>Thai Fried Rice (Chicken)</span> <br /> <span
												style="font-size: 12px;">Fried rice with eggs,
												tomatoes, onions.</span>
										</button>
										<div class="modal fade" id="ThaiFriedRiceChicken"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="ThaiFriedRiceChickenCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Thai Fried Rice (Chicken)</h3>
															<span>Fried rice with eggs, tomatoes, onions.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_6_2" class="form-horizontal"
																onsubmit="return populateFullMenuThaiFriedRiceChickenSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="ThaiFriedRiceChickenCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="ThaiFriedRiceChickenSpl" maxlength="20">
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
											data-toggle="modal" data-target="#ThaiFriedRicePork"
											data-whatever="ThaiFriedRicePork">
											<span>Thai Fried Rice (Pork)</span> <br /> <span
												style="font-size: 12px;">Fried rice with eggs,
												tomatoes, onions.</span>
										</button>
										<div class="modal fade" id="ThaiFriedRicePork" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="ThaiFriedRicePorkCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Thai Fried Rice (Pork)</h3>
															<span>Fried rice with eggs, tomatoes, onions.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_6_3" class="form-horizontal"
																onsubmit="return populateFullMenuThaiFriedRicePorkSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="ThaiFriedRicePorkCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="ThaiFriedRicePorkSpl" maxlength="20">
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
											data-toggle="modal" data-target="#ThaiFriedRiceTofu"
											data-whatever="ThaiFriedRiceTofu">
											<span>Thai Fried Rice (Tofu)</span> <br /> <span
												style="font-size: 12px;">Fried rice with eggs,
												tomatoes, onions.</span>
										</button>
										<div class="modal fade" id="ThaiFriedRiceTofu" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="ThaiFriedRiceTofuCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Thai Fried Rice (Tofu)</h3>
															<span>Fried rice with eggs, tomatoes, onions.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_6_4" class="form-horizontal"
																onsubmit="return populateFullMenuThaiFriedRiceTofuSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="ThaiFriedRiceTofuCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="ThaiFriedRiceTofuSpl" maxlength="20">
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
											data-target="#ThaiFriedRiceOnlyVegetables"
											data-whatever="ThaiFriedRiceOnlyVegetables">
											<span>Thai Fried Rice (Only Vegetables)</span> <br /> <span
												style="font-size: 12px;">Fried rice with eggs,
												tomatoes, onions.</span>
										</button>
										<div class="modal fade" id="ThaiFriedRiceOnlyVegetables"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="ThaiFriedRiceOnlyVegetablesCloseBtn"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Thai Fried Rice (Only Vegetables)</h3>
															<span>Fried rice with eggs, tomatoes, onions.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_6_5" class="form-horizontal"
																onsubmit="return populateFullMenuThaiFriedRiceOnlyVegetablesSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="ThaiFriedRiceOnlyVegetablesCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="ThaiFriedRiceOnlyVegetablesSpl" maxlength="20">
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
										onclick="remove_sala_thai_item('m_${loop.index}');">X</span>
									<figure>${m.value}</figure>
								</div>
							</c:forEach>
						</div>
						<div class="pick-deliver">
							<div class="checkout">
								<form action="${pageContext.request.contextPath}/menu/saveMenu"
									id="sala_thai_target" method="post">
									<input type="hidden" name="full_menu_items"
										id="full_menu_items"> <input type="hidden"
										name="cuisineType" value="${menu.cuisine}">
									<textarea rows="4" cols="50" name="comments"
										placeholder="Enter your comments to restaurant here"
										class="form-control">${menu.comments}</textarea>
									<br />
									<!-- <button type="button" onclick="sala_thai_menu_submit();"
										class="btn btn-default">Next</button> -->
									<a href="javascript:sala_thai_menu_submit();">Next</a>
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
			sala_thai_menu_items.push(name + "+" + desc); //sala_thai_menu_items is in sala_thai_95670.js 
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
