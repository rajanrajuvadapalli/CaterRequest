<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	function remove_curry_bowl_indian_and_indo_chinese_cuisine_item(div_id) {
		var divToRemove = $("div[id=" + div_id + "]");
		var name = divToRemove.children().children().prev().text();
		var desc = divToRemove.children().children().next().text();
		var data = name + "+" + desc;
		console.log("Removing " + data);
		curry_bowl_indian_and_indo_chinese_cuisine_menu_items
				.splice($.inArray(data,
						curry_bowl_indian_and_indo_chinese_cuisine_menu_items),
						1);
		divToRemove.remove();
	}

	function curry_bowl_indian_and_indo_chinese_cuisine_menu_submit() {
		if (curry_bowl_indian_and_indo_chinese_cuisine_menu_items.length == 0) {
			alert("Please select at least 1 item to proceed.");
			return false;
		}
		console.log(curry_bowl_indian_and_indo_chinese_cuisine_menu_items);
		//console.log(JSON.stringify(curry_bowl_indian_and_indo_chinese_cuisine_menu_items));
		$("#full_menu_items")
				.val(
						JSON
								.stringify(curry_bowl_indian_and_indo_chinese_cuisine_menu_items));
		$("#curry_bowl_indian_and_indo_chinese_cuisine_target").submit();
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
						<div class="panel-group" id="accordion-Appeitizers" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-Appeitizers" href="#Appeitizers"
										aria-expanded="true" aria-controls="Appeitizers">
										Appeitizers </a>
								</div>
								<div id="Appeitizers" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#VegetableSamosa1"
											data-whatever="VegetableSamosa1">
											<span>Vegetable Samosa</span> <br /> <span
												style="font-size: 12px;">Minced Potato and Peas
												Wrapped in Pastry Dough and Fried.</span>
										</button>
										<div class="modal fade" id="VegetableSamosa1" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="VegetableSamosa1CloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Vegetable Samosa</h3>
															<span>Minced Potato and Peas Wrapped in Pastry
																Dough and Fried.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_1" class="form-horizontal"
																onsubmit="return populateFullMenuVegetableSamosa1SelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="VegetableSamosa1Count" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="VegetableSamosa1Spl"
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
											data-toggle="modal" data-target="#VegetableCutlet1"
											data-whatever="VegetableCutlet1">
											<span>Vegetable Cutlet</span> <br /> <span
												style="font-size: 12px;">Potato and Vegetables
												Pan-Fried with Spices.</span>
										</button>
										<div class="modal fade" id="VegetableCutlet1" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="VegetableCutlet1CloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Vegetable Cutlet</h3>
															<span>Potato and Vegetables Pan-Fried with Spices.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_2" class="form-horizontal"
																onsubmit="return populateFullMenuVegetableCutlet1SelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="VegetableCutlet1Count" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="VegetableCutlet1Spl"
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
											data-toggle="modal" data-target="#OnionPakora"
											data-whatever="OnionPakora">
											<span>Onion Pakora</span> <br /> <span
												style="font-size: 12px;">Fresh Onions Coated with
												Chickpeas Flour.</span>
										</button>
										<div class="modal fade" id="OnionPakora" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="OnionPakoraCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Onion Pakora</h3>
															<span>Fresh Onions Coated with Chickpeas Flour.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_3" class="form-horizontal"
																onsubmit="return populateFullMenuOnionPakoraSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="OnionPakoraCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="OnionPakoraSpl"
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
											data-toggle="modal" data-target="#MixedVegetablePakora"
											data-whatever="MixedVegetablePakora">
											<span>Mixed Vegetable Pakora</span> <br /> <span
												style="font-size: 12px;">Fresh Mixed Vegetable Coated
												with Chickpeas Flour.</span>
										</button>
										<div class="modal fade" id="MixedVegetablePakora"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="MixedVegetablePakoraCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Mixed Vegetable Pakora</h3>
															<span>Fresh Mixed Vegetable Coated with Chickpeas
																Flour.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_4" class="form-horizontal"
																onsubmit="return populateFullMenuMixedVegetablePakoraSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="MixedVegetablePakoraCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="MixedVegetablePakoraSpl" maxlength="20">
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
											data-toggle="modal" data-target="#GobiManchurian"
											data-whatever="GobiManchurian">
											<span>Gobi Manchurian</span> <br /> <span
												style="font-size: 12px;">Butter Fried Cauliflower
												with Ginger, Garlic, Onion.</span>
										</button>
										<div class="modal fade" id="GobiManchurian" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="GobiManchurianCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Gobi Manchurian</h3>
															<span>Butter Fried Cauliflower with Ginger,
																Garlic, Onion.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_5" class="form-horizontal"
																onsubmit="return populateFullMenuGobiManchurianSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="GobiManchurianCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="GobiManchurianSpl"
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
											data-toggle="modal" data-target="#ChickenLillyPop"
											data-whatever="ChickenLillyPop">
											<span>Chicken Lilly Pop</span> <br /> <span
												style="font-size: 12px;">Chicken Wings Indian Style
												Spices.</span>
										</button>
										<div class="modal fade" id="ChickenLillyPop" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="ChickenLillyPopCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chicken Lilly Pop</h3>
															<span>Chicken Wings Indian Style Spices.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_6" class="form-horizontal"
																onsubmit="return populateFullMenuChickenLillyPopSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="ChickenLillyPopCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ChickenLillyPopSpl"
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
											data-toggle="modal" data-target="#ChickenTikka"
											data-whatever="ChickenTikka">
											<span>Chicken Tikka</span> <br /> <span
												style="font-size: 12px;">Boneless Chicken Bowl
												Marinated with Curry Bowl Special.</span>
										</button>
										<div class="modal fade" id="ChickenTikka" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="ChickenTikkaCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chicken Tikka</h3>
															<span>Boneless Chicken Bowl Marinated with Curry
																Bowl Special.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_7" class="form-horizontal"
																onsubmit="return populateFullMenuChickenTikkaSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="ChickenTikkaCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ChickenTikkaSpl"
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
											data-toggle="modal" data-target="#Chicken1"
											data-whatever="Chicken1">
											<span>Chicken 65</span> <br /> <span
												style="font-size: 12px;">Boneless Chicken Marinated
												In Yogurt Cooked with Curry Leaves and Species</span>
										</button>
										<div class="modal fade" id="Chicken1" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="Chicken1CloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chicken 65</h3>
															<span>Boneless Chicken Marinated In Yogurt Cooked
																with Curry Leaves and Species</span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_8" class="form-horizontal"
																onsubmit="return populateFullMenuChicken1SelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="Chicken1Count" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="Chicken1Spl"
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
											data-toggle="modal" data-target="#TandooriShrimp"
											data-whatever="TandooriShrimp">
											<span>Tandoori Shrimp</span> <br /> <span
												style="font-size: 12px;">Jumbo Shrimp Marinated in
												Red White And Curry Bowl spl Herbs and Spices.</span>
										</button>
										<div class="modal fade" id="TandooriShrimp" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="TandooriShrimpCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Tandoori Shrimp</h3>
															<span>Jumbo Shrimp Marinated in Red White And
																Curry Bowl spl Herbs and Spices.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_9" class="form-horizontal"
																onsubmit="return populateFullMenuTandooriShrimpSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="TandooriShrimpCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="TandooriShrimpSpl"
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
						<div class="panel-group" id="accordion-Biriyani" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-Biriyani" href="#Biriyani"
										aria-expanded="true" aria-controls="Biriyani"> Biriyani </a>
								</div>
								<div id="Biriyani" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#VegetableBiryani"
											data-whatever="VegetableBiryani">
											<span>Vegetable Biryani</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="VegetableBiryani" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="VegetableBiryaniCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Vegetable Biryani</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup_2_1" class="form-horizontal"
																onsubmit="return populateFullMenuVegetableBiryaniSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="VegetableBiryaniCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="VegetableBiryaniSpl"
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
											data-toggle="modal" data-target="#ChickenBiryani"
											data-whatever="ChickenBiryani">
											<span>Chicken Biryani</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="ChickenBiryani" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="ChickenBiryaniCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chicken Biryani</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup_2_2" class="form-horizontal"
																onsubmit="return populateFullMenuChickenBiryaniSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="ChickenBiryaniCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ChickenBiryaniSpl"
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
											data-toggle="modal" data-target="#CurryBowlSpChickenBiryani"
											data-whatever="CurryBowlSpChickenBiryani">
											<span>Curry Bowl (Sp) Chicken Biryani</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="CurryBowlSpChickenBiryani"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="CurryBowlSpChickenBiryaniCloseBtn"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Curry Bowl (Sp) Chicken Biryani</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup_2_3" class="form-horizontal"
																onsubmit="return populateFullMenuCurryBowlSpChickenBiryaniSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="CurryBowlSpChickenBiryaniCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="CurryBowlSpChickenBiryaniSpl" maxlength="20">
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
											data-toggle="modal" data-target="#LambBiryani"
											data-whatever="LambBiryani">
											<span>Lamb Biryani</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="LambBiryani" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="LambBiryaniCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Lamb Biryani</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup_2_4" class="form-horizontal"
																onsubmit="return populateFullMenuLambBiryaniSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="LambBiryaniCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="LambBiryaniSpl"
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
											data-toggle="modal" data-target="#Rice" data-whatever="Rice">
											<span>Rice</span> <br /> <span style="font-size: 12px;">Steamed
												Basmati Rice</span>
										</button>
										<div class="modal fade" id="Rice" tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="RiceCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Rice</h3>
															<span>Steamed Basmati Rice</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_1" class="form-horizontal"
																onsubmit="return populateFullMenuRiceSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20" name="RiceCount"
																		maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="RiceSpl"
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
											data-toggle="modal" data-target="#YogurtRice"
											data-whatever="YogurtRice">
											<span>Yogurt Rice</span> <br /> <span
												style="font-size: 12px;">Billed Rice Mixed With A
												Mild Yogurt.</span>
										</button>
										<div class="modal fade" id="YogurtRice" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="YogurtRiceCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Yogurt Rice</h3>
															<span>Billed Rice Mixed With A Mild Yogurt.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_2" class="form-horizontal"
																onsubmit="return populateFullMenuYogurtRiceSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="YogurtRiceCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="YogurtRiceSpl"
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
						<div class="panel-group" id="accordion-Entrees" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-Entrees" href="#Entrees"
										aria-expanded="true" aria-controls="Entrees"> Entrees </a>
								</div>
								<div id="Entrees" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#AlooGobi1"
											data-whatever="AlooGobi1">
											<span>Aloo Gobi</span> <br /> <span style="font-size: 12px;">Cauliflower,
												Potatoes Cooked In Curry Bowl Special Spices served with
												Basmati Rice.</span>
										</button>
										<div class="modal fade" id="AlooGobi1" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="AlooGobi1CloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Aloo Gobi</h3>
															<span>Cauliflower, Potatoes Cooked In Curry Bowl
																Special Spices served with Basmati Rice.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_1" class="form-horizontal"
																onsubmit="return populateFullMenuAlooGobi1SelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="AlooGobi1Count" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="AlooGobi1Spl"
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
											data-toggle="modal" data-target="#BainganBhurta"
											data-whatever="BainganBhurta">
											<span>Baingan Bhurta</span> <br /> <span
												style="font-size: 12px;">Egg Plant Rosted In Tandoor
												Cooked with Curry Bowl Special Spices served with Basmati
												Rice.</span>
										</button>
										<div class="modal fade" id="BainganBhurta" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="BainganBhurtaCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Baingan Bhurta</h3>
															<span>Egg Plant Rosted In Tandoor Cooked with
																Curry Bowl Special Spices served with Basmati Rice.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_2" class="form-horizontal"
																onsubmit="return populateFullMenuBainganBhurtaSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="BainganBhurtaCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="BainganBhurtaSpl"
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
											data-toggle="modal" data-target="#ChannaMasala1"
											data-whatever="ChannaMasala1">
											<span>Channa Masala</span> <br /> <span
												style="font-size: 12px;">Chickpeas Cooked with North
												Indian Spices served with Basmati Rice.</span>
										</button>
										<div class="modal fade" id="ChannaMasala1" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="ChannaMasala1CloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Channa Masala</h3>
															<span>Chickpeas Cooked with North Indian Spices
																served with Basmati Rice.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_3" class="form-horizontal"
																onsubmit="return populateFullMenuChannaMasala1SelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="ChannaMasala1Count" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ChannaMasala1Spl"
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
											data-toggle="modal" data-target="#MixedVegetableKorma"
											data-whatever="MixedVegetableKorma">
											<span>Mixed Vegetable Korma</span> <br /> <span
												style="font-size: 12px;">Fresh Vegetables Cooked In
												Cashew Paste and Spices served with Basmati Rice.</span>
										</button>
										<div class="modal fade" id="MixedVegetableKorma" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="MixedVegetableKormaCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Mixed Vegetable Korma</h3>
															<span>Fresh Vegetables Cooked In Cashew Paste and
																Spices served with Basmati Rice.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_4" class="form-horizontal"
																onsubmit="return populateFullMenuMixedVegetableKormaSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="MixedVegetableKormaCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="MixedVegetableKormaSpl" maxlength="20">
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
											data-toggle="modal" data-target="#ChickenCurry1"
											data-whatever="ChickenCurry1">
											<span>Chicken Curry</span> <br /> <span
												style="font-size: 12px;">Chicken Finished with Curry
												Bowl Special Spices served with Basmati Rice.</span>
										</button>
										<div class="modal fade" id="ChickenCurry1" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="ChickenCurry1CloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chicken Curry</h3>
															<span>Chicken Finished with Curry Bowl Special
																Spices served with Basmati Rice.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_5" class="form-horizontal"
																onsubmit="return populateFullMenuChickenCurry1SelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="ChickenCurry1Count" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ChickenCurry1Spl"
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
											data-toggle="modal"
											data-target="#ChickenTikkaMasalaSignature"
											data-whatever="ChickenTikkaMasalaSignature">
											<span>Chicken Tikka Masala Signature</span> <br /> <span
												style="font-size: 12px;">Grilled Chicken with Eggs
												Cooked In Tomato Sauce with a Touch of Cream served with
												Basmati Rice.</span>
										</button>
										<div class="modal fade" id="ChickenTikkaMasalaSignature"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="ChickenTikkaMasalaSignatureCloseBtn"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chicken Tikka Masala Signature</h3>
															<span>Grilled Chicken with Eggs Cooked In Tomato
																Sauce with a Touch of Cream served with Basmati Rice.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_6" class="form-horizontal"
																onsubmit="return populateFullMenuChickenTikkaMasalaSignatureSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="ChickenTikkaMasalaSignatureCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="ChickenTikkaMasalaSignatureSpl" maxlength="20">
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
											data-toggle="modal" data-target="#ButterChicken"
											data-whatever="ButterChicken">
											<span>Butter Chicken</span> <br /> <span
												style="font-size: 12px;">Tandoori Chicken Cooked With
												Spices and Butter Sauce served with Basmati Rice.</span>
										</button>
										<div class="modal fade" id="ButterChicken" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="ButterChickenCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Butter Chicken</h3>
															<span>Tandoori Chicken Cooked With Spices and
																Butter Sauce served with Basmati Rice.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_7" class="form-horizontal"
																onsubmit="return populateFullMenuButterChickenSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="ButterChickenCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ButterChickenSpl"
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
											data-toggle="modal" data-target="#ChickenVindaloo"
											data-whatever="ChickenVindaloo">
											<span>Chicken Vindaloo</span> <br /> <span
												style="font-size: 12px;">For a True Adventure Who Has
												Passing for Spice Food. Tangy and Spicy Curry, served with
												Basmati Rice.</span>
										</button>
										<div class="modal fade" id="ChickenVindaloo" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="ChickenVindalooCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chicken Vindaloo</h3>
															<span>For a True Adventure Who Has Passing for
																Spice Food. Tangy and Spicy Curry, served with Basmati
																Rice.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_8" class="form-horizontal"
																onsubmit="return populateFullMenuChickenVindalooSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="ChickenVindalooCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ChickenVindalooSpl"
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
											data-toggle="modal" data-target="#LambCurry1"
											data-whatever="LambCurry1">
											<span>Lamb Curry</span> <br /> <span
												style="font-size: 12px;">Tender Lamb Marinated and
												Cooked In a Curry of Fresh, served with Basmati Rice.</span>
										</button>
										<div class="modal fade" id="LambCurry1" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="LambCurry1CloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Lamb Curry</h3>
															<span>Tender Lamb Marinated and Cooked In a Curry
																of Fresh, served with Basmati Rice.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_9" class="form-horizontal"
																onsubmit="return populateFullMenuLambCurry1SelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="LambCurry1Count" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="LambCurry1Spl"
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
											data-toggle="modal" data-target="#MuttonRoganJosh"
											data-whatever="MuttonRoganJosh">
											<span>Mutton Rogan Josh</span> <br /> <span
												style="font-size: 12px;">Lamb Delates Cooked with
												Spiced Curry Leaves and Jogury and Spices, served with
												Basmati Rice.</span>
										</button>
										<div class="modal fade" id="MuttonRoganJosh" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="MuttonRoganJoshCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Mutton Rogan Josh</h3>
															<span>Lamb Delates Cooked with Spiced Curry Leaves
																and Jogury and Spices, served with Basmati Rice.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_10" class="form-horizontal"
																onsubmit="return populateFullMenuMuttonRoganJoshSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="MuttonRoganJoshCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="MuttonRoganJoshSpl"
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
											data-toggle="modal" data-target="#LambKorma"
											data-whatever="LambKorma">
											<span>Lamb Korma</span> <br /> <span
												style="font-size: 12px;">Lamb Delite Creamy Sweet and
												Spicy with Flavour with Cardamom, served with Basmati Rice.</span>
										</button>
										<div class="modal fade" id="LambKorma" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="LambKormaCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Lamb Korma</h3>
															<span>Lamb Delite Creamy Sweet and Spicy with
																Flavour with Cardamom, served with Basmati Rice.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_11" class="form-horizontal"
																onsubmit="return populateFullMenuLambKormaSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="LambKormaCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="LambKormaSpl"
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
											data-toggle="modal" data-target="#LambVindaloo"
											data-whatever="LambVindaloo">
											<span>Lamb Vindaloo</span> <br /> <span
												style="font-size: 12px;">Passion for Spices Food
												Lambs Potatoes Cooked In Fresh Red Chilies, served with
												Basmati Rice.</span>
										</button>
										<div class="modal fade" id="LambVindaloo" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="LambVindalooCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Lamb Vindaloo</h3>
															<span>Passion for Spices Food Lambs Potatoes
																Cooked In Fresh Red Chilies, served with Basmati Rice.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_12" class="form-horizontal"
																onsubmit="return populateFullMenuLambVindalooSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="LambVindalooCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="LambVindalooSpl"
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
						<div class="panel-group" id="accordion-Indian_Bread"
							role="tablist" aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-Indian_Bread" href="#Indian_Bread"
										aria-expanded="true" aria-controls="Indian_Bread"> Indian
										Bread </a>
								</div>
								<div id="Indian_Bread" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#TandooriRoti"
											data-whatever="TandooriRoti">
											<span>Tandoori Roti</span> <br /> <span
												style="font-size: 12px;">Baked Whole Wheat Bread.</span>
										</button>
										<div class="modal fade" id="TandooriRoti" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="TandooriRotiCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Tandoori Roti</h3>
															<span>Baked Whole Wheat Bread.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_5_1" class="form-horizontal"
																onsubmit="return populateFullMenuTandooriRotiSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="TandooriRotiCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="TandooriRotiSpl"
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
											data-toggle="modal" data-target="#PlainNaan"
											data-whatever="PlainNaan">
											<span>Plain Naan</span> <br /> <span
												style="font-size: 12px;">Leaven White Flour Baked In
												Clay Oven.</span>
										</button>
										<div class="modal fade" id="PlainNaan" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="PlainNaanCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Plain Naan</h3>
															<span>Leaven White Flour Baked In Clay Oven.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_5_2" class="form-horizontal"
																onsubmit="return populateFullMenuPlainNaanSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="PlainNaanCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="PlainNaanSpl"
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
											data-toggle="modal" data-target="#ButterNaan"
											data-whatever="ButterNaan">
											<span>Butter Naan</span> <br /> <span
												style="font-size: 12px;">Leaven White Flour Baked In
												Clay Oven with Butter.</span>
										</button>
										<div class="modal fade" id="ButterNaan" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="ButterNaanCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Butter Naan</h3>
															<span>Leaven White Flour Baked In Clay Oven with
																Butter.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_5_3" class="form-horizontal"
																onsubmit="return populateFullMenuButterNaanSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="ButterNaanCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ButterNaanSpl"
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
											data-toggle="modal" data-target="#AlooParata"
											data-whatever="AlooParata">
											<span>Aloo Parata</span> <br /> <span
												style="font-size: 12px;">Whole Wheat Bread Stuffed
												with Potato.</span>
										</button>
										<div class="modal fade" id="AlooParata" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="AlooParataCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Aloo Parata</h3>
															<span>Whole Wheat Bread Stuffed with Potato.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_5_4" class="form-horizontal"
																onsubmit="return populateFullMenuAlooParataSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="AlooParataCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="AlooParataSpl"
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
						<div class="panel-group" id="accordion-Desserts" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-Desserts" href="#Desserts"
										aria-expanded="true" aria-controls="Desserts"> Desserts </a>
								</div>
								<div id="Desserts" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#GulabJamun"
											data-whatever="GulabJamun">
											<span>Gulab Jamun</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="GulabJamun" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="GulabJamunCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Gulab Jamun</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup_6_1" class="form-horizontal"
																onsubmit="return populateFullMenuGulabJamunSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="GulabJamunCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="GulabJamunSpl"
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
											data-toggle="modal" data-target="#Kheer"
											data-whatever="Kheer">
											<span>Kheer</span> <br /> <span style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="Kheer" tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="KheerCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Kheer</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup_6_2" class="form-horizontal"
																onsubmit="return populateFullMenuKheerSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="KheerCount" maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="KheerSpl"
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
											data-toggle="modal" data-target="#BreadHalwa"
											data-whatever="BreadHalwa">
											<span>Bread Halwa</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="BreadHalwa" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="BreadHalwaCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Bread Halwa</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup_6_3" class="form-horizontal"
																onsubmit="return populateFullMenuBreadHalwaSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="BreadHalwaCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="BreadHalwaSpl"
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
										onclick="remove_curry_bowl_indian_and_indo_chinese_cuisine_item('m_${loop.index}');">X</span>
									<figure>${m.value}</figure>
								</div>
							</c:forEach>
						</div>
						<div class="pick-deliver">
							<div class="checkout">
								<form action="${pageContext.request.contextPath}/menu/saveMenu"
									id="curry_bowl_indian_and_indo_chinese_cuisine_target"
									method="post">
									<input type="hidden" name="full_menu_items"
										id="full_menu_items"> <input type="hidden"
										name="cuisineType" value="${menu.cuisine}">
									<textarea rows="4" cols="50" name="comments"
										placeholder="Enter your comments to restaurant here"
										class="form-control">${menu.comments}</textarea>
									<br />
									<!-- <button type="button" onclick="curry_bowl_indian_and_indo_chinese_cuisine_menu_submit();"
										class="btn btn-default">Next</button> -->
									<a
										href="javascript:curry_bowl_indian_and_indo_chinese_cuisine_menu_submit();">Next</a>
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

	$('document').ready(
			function() {
				$('.slide .full-menu-list-item').each(
						function() {
							var name = $(this).children().prev().text();
							var desc = $(this).children().next().next().text();
							console.log("Title: " + name);
							console.log("Desc: " + desc);
							curry_bowl_indian_and_indo_chinese_cuisine_menu_items
									.push(name + "+" + desc); //curry_bowl_indian_and_indo_chinese_cuisine_menu_items is in curry_bowl_indian_and_indo_chinese_cuisine_95765.js 
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
