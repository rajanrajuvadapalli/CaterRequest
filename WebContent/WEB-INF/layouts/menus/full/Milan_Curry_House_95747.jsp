<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	function remove_milan_curry_house_item(div_id) {
		var divToRemove = $("div[id=" + div_id + "]");
		var name = divToRemove.children().children().prev().text();
		var desc = divToRemove.children().children().next().text();
		var data = name + "+" + desc;
		console.log("Removing " + data);
		milan_curry_house_menu_items.splice($.inArray(data,
				milan_curry_house_menu_items), 1);
		divToRemove.remove();
	}

	function milan_curry_house_menu_submit() {
		if (milan_curry_house_menu_items.length == 0) {
			alert("Please select at least 1 item to proceed.");
			return false;
		}
		console.log(milan_curry_house_menu_items);
		//console.log(JSON.stringify(milan_curry_house_menu_items));
		$("#full_menu_items").val(JSON.stringify(milan_curry_house_menu_items));
		$("#milan_curry_house_target").submit();
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
											data-toggle="modal" data-target="#AlooTikki"
											data-whatever="AlooTikki">
											<span>Aloo Tikki</span> <br /> <span
												style="font-size: 12px;">Potato / Veggie Cutlets
												crispy on the outside, blended W/ herbs and spices.</span>
										</button>
										<div class="modal fade" id="AlooTikki" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="AlooTikkiCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Aloo Tikki</h3>
															<span>Potato / Veggie Cutlets crispy on the
																outside, blended W/ herbs and spices.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_1" class="form-horizontal"
																onsubmit="return populateFullMenuAlooTikkiSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="AlooTikkiCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="AlooTikkiSpl"
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
											data-toggle="modal" data-target="#SamosasPC"
											data-whatever="SamosasPC">
											<span>Samosas (2PC) </span> <br /> <span
												style="font-size: 12px;">Pastry filled W/ Potatoes,
												Peas, Onions, mint, blended W/ herb and spices. Served W/
												Tamarind and mint chutney.</span>
										</button>
										<div class="modal fade" id="SamosasPC" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="SamosasPCCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Samosas (2PC)</h3>
															<span>Pastry filled W/ Potatoes, Peas, Onions,
																mint, blended W/ herb and spices. Served W/ Tamarind and
																mint chutney.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_2" class="form-horizontal"
																onsubmit="return populateFullMenuSamosasPCSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="SamosasPCCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="SamosasPCSpl"
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
											data-toggle="modal" data-target="#Pakora"
											data-whatever="Pakora">
											<span>Pakora</span> <br /> <span style="font-size: 12px;">Fried
												snack mulched W/ Lentil, Wheat flour, onions, potatoes,
												blended W/ herbs and spices.</span>
										</button>
										<div class="modal fade" id="Pakora" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="PakoraCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Pakora</h3>
															<span>Fried snack mulched W/ Lentil, Wheat flour,
																onions, potatoes, blended W/ herbs and spices.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_3" class="form-horizontal"
																onsubmit="return populateFullMenuPakoraSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="PakoraCount" maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="PakoraSpl"
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
											data-toggle="modal" data-target="#MixedVeggiePakora"
											data-whatever="MixedVeggiePakora">
											<span>Mixed Veggie Pakora</span> <br /> <span
												style="font-size: 12px;">Mixed Vegetables fried snack
												mulched W/ Lentil, Wheat flour, onions, potatoes, blended W/
												herbs and spices.</span>
										</button>
										<div class="modal fade" id="MixedVeggiePakora" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="MixedVeggiePakoraCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Mixed Veggie Pakora</h3>
															<span>Mixed Vegetables fried snack mulched W/
																Lentil, Wheat flour, onions, potatoes, blended W/ herbs
																and spices.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_4" class="form-horizontal"
																onsubmit="return populateFullMenuMixedVeggiePakoraSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="MixedVeggiePakoraCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="MixedVeggiePakoraSpl" maxlength="20">
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
						<div class="panel-group" id="accordion-Signature_Wraps"
							role="tablist" aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-Signature_Wraps"
										href="#Signature_Wraps" aria-expanded="true"
										aria-controls="Signature_Wraps"> Signature Wraps </a>
								</div>
								<div id="Signature_Wraps" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#VegetarianWraps"
											data-whatever="VegetarianWraps">
											<span>Vegetarian Wraps</span> <br /> <span
												style="font-size: 12px;">Seasoned Veggie cutlet W/
												tomatoes, lettuce, cilantro, onion, mint, and tamarind sauce
												wrapped in fresh Naan.</span>
										</button>
										<div class="modal fade" id="VegetarianWraps" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="VegetarianWrapsCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Vegetarian Wraps</h3>
															<span>Seasoned Veggie cutlet W/ tomatoes, lettuce,
																cilantro, onion, mint, and tamarind sauce wrapped in
																fresh Naan.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_2_1" class="form-horizontal"
																onsubmit="return populateFullMenuVegetarianWrapsSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="VegetarianWrapsCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="VegetarianWrapsSpl"
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
											data-toggle="modal" data-target="#PaneerWrap"
											data-whatever="PaneerWrap">
											<span>Paneer Wrap</span> <br /> <span
												style="font-size: 12px;">Seasoned Veggie cutlet and
												Paneer W/ tomatoes, lettuce, cilantro, onion, mint, and
												tamarind wrapped in fresh Naan.</span>
										</button>
										<div class="modal fade" id="PaneerWrap" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="PaneerWrapCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Paneer Wrap</h3>
															<span>Seasoned Veggie cutlet and Paneer W/
																tomatoes, lettuce, cilantro, onion, mint, and tamarind
																wrapped in fresh Naan.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_2_2" class="form-horizontal"
																onsubmit="return populateFullMenuPaneerWrapSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="PaneerWrapCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="PaneerWrapSpl"
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
											data-toggle="modal" data-target="#ChickenWrap"
											data-whatever="ChickenWrap">
											<span>Chicken Wrap</span> <br /> <span
												style="font-size: 12px;">Baked boneless Chicken W/
												tomatoes, lettuce, cilantro, onion, mint, and tamarind sauce
												wrapped in fresh Naan.</span>
										</button>
										<div class="modal fade" id="ChickenWrap" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="ChickenWrapCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chicken Wrap</h3>
															<span>Baked boneless Chicken W/ tomatoes, lettuce,
																cilantro, onion, mint, and tamarind sauce wrapped in
																fresh Naan.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_2_3" class="form-horizontal"
																onsubmit="return populateFullMenuChickenWrapSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="ChickenWrapCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ChickenWrapSpl"
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
											data-toggle="modal" data-target="#LambWrap"
											data-whatever="LambWrap">
											<span>Lamb Wrap </span> <br /> <span
												style="font-size: 12px;">Baked boneless Lamb W/
												tomatoes, lettuce, cilantro, onion, mint, and tamarind sauce
												wrapped in fresh Naan.</span>
										</button>
										<div class="modal fade" id="LambWrap" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="LambWrapCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Lamb Wrap</h3>
															<span>Baked boneless Lamb W/ tomatoes, lettuce,
																cilantro, onion, mint, and tamarind sauce wrapped in
																fresh Naan.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_2_4" class="form-horizontal"
																onsubmit="return populateFullMenuLambWrapSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="LambWrapCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="LambWrapSpl"
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
						<div class="panel-group" id="accordion-Milan_Chefs_Special"
							role="tablist" aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-Milan_Chefs_Special"
										href="#Milan_Chefs_Special" aria-expanded="true"
										aria-controls="Milan_Chefs_Special"> Milan Chef's Special
									</a>
								</div>
								<div id="Milan_Chefs_Special" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#MilanTandooriSpecial"
											data-whatever="MilanTandooriSpecial">
											<span>Milan Tandoori Special</span> <br /> <span
												style="font-size: 12px;">Chicken Leg, Thigh, and
												Breast Marinated W/ Indian herbs and Spices, yogurt, ginger,
												Sizzled Onions, Lemon and Chili. Add Bread or Rice.</span>
										</button>
										<div class="modal fade" id="MilanTandooriSpecial"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="MilanTandooriSpecialCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Milan Tandoori Special</h3>
															<span>Chicken Leg, Thigh, and Breast Marinated W/
																Indian herbs and Spices, yogurt, ginger, Sizzled Onions,
																Lemon and Chili. Add Bread or Rice.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_1" class="form-horizontal"
																onsubmit="return populateFullMenuMilanTandooriSpecialSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="MilanTandooriSpecialCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="MilanTandooriSpecialSpl" maxlength="20">
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
											data-toggle="modal" data-target="#MixedGrilledTandoori"
											data-whatever="MixedGrilledTandoori">
											<span>Mixed Grilled Tandoori</span> <br /> <span
												style="font-size: 12px;">Combination of all tandoori
												Entr&#233;es (Chicken and Lamb). Add Bread or Rice.</span>
										</button>
										<div class="modal fade" id="MixedGrilledTandoori"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="MixedGrilledTandooriCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Mixed Grilled Tandoori</h3>
															<span>Combination of all tandoori Entr&#233;es
																(Chicken and Lamb). Add Bread or Rice.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_2" class="form-horizontal"
																onsubmit="return populateFullMenuMixedGrilledTandooriSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="MixedGrilledTandooriCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="MixedGrilledTandooriSpl" maxlength="20">
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
											data-toggle="modal" data-target="#Naan1"
											data-whatever="Naan1">
											<span>Naan</span> <br /> <span style="font-size: 12px;">Indian
												bread Baked in Clay Oven. Eaten W/ Entr&#233;e</span>
										</button>
										<div class="modal fade" id="Naan1" tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="Naan1CloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Naan</h3>
															<span>Indian bread Baked in Clay Oven. Eaten W/
																Entr&#233;e</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_1" class="form-horizontal"
																onsubmit="return populateFullMenuNaan1SelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="Naan1Count" maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="Naan1Spl"
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
											data-toggle="modal" data-target="#PlainRoti"
											data-whatever="PlainRoti">
											<span>Plain Roti</span> <br /> <span
												style="font-size: 12px;">Plain bread</span>
										</button>
										<div class="modal fade" id="PlainRoti" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="PlainRotiCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Plain Roti</h3>
															<span>Plain bread</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_2" class="form-horizontal"
																onsubmit="return populateFullMenuPlainRotiSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="PlainRotiCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="PlainRotiSpl"
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
											data-toggle="modal" data-target="#AlooKulcha"
											data-whatever="AlooKulcha">
											<span>Aloo Kulcha</span> <br /> <span
												style="font-size: 12px;">Flat bread with minced
												potatoes.</span>
										</button>
										<div class="modal fade" id="AlooKulcha" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="AlooKulchaCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Aloo Kulcha</h3>
															<span>Flat bread with minced potatoes.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_3" class="form-horizontal"
																onsubmit="return populateFullMenuAlooKulchaSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="AlooKulchaCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="AlooKulchaSpl"
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
						<div class="panel-group" id="accordion-Meat_Speciality_Entrees"
							role="tablist" aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-Meat_Speciality_Entrees"
										href="#Meat_Speciality_Entrees" aria-expanded="true"
										aria-controls="Meat_Speciality_Entrees"> Meat Speciality
										Entrees </a>
								</div>
								<div id="Meat_Speciality_Entrees"
									class="panel-collapse collapse in" role="tabpanel"
									aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#TraditionalChickenCurry"
											data-whatever="TraditionalChickenCurry">
											<span>Traditional Chicken Curry </span> <br /> <span
												style="font-size: 12px;">Chicken savored in Indian
												spicy gravy, chili, onions, and cilantro. Add Bread or Rice.</span>
										</button>
										<div class="modal fade" id="TraditionalChickenCurry"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="TraditionalChickenCurryCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Traditional Chicken Curry</h3>
															<span>Chicken savored in Indian spicy gravy,
																chili, onions, and cilantro. Add Bread or Rice.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_5_1" class="form-horizontal"
																onsubmit="return populateFullMenuTraditionalChickenCurrySelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="TraditionalChickenCurryCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="TraditionalChickenCurrySpl" maxlength="20">
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
											data-toggle="modal" data-target="#ButterChicken1"
											data-whatever="ButterChicken1">
											<span>Butter Chicken </span> <br /> <span
												style="font-size: 12px;">Chicken simmered in Tomato
												Cream Sauce, Herb and Spices. Add Bread or Rice.</span>
										</button>
										<div class="modal fade" id="ButterChicken1" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="ButterChicken1CloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Butter Chicken</h3>
															<span>Chicken simmered in Tomato Cream Sauce, Herb
																and Spices. Add Bread or Rice.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_5_2" class="form-horizontal"
																onsubmit="return populateFullMenuButterChicken1SelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="ButterChicken1Count" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ButterChicken1Spl"
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
											data-toggle="modal" data-target="#ChickenTikkaMasala1"
											data-whatever="ChickenTikkaMasala1">
											<span>Chicken Tikka Masala</span> <br /> <span
												style="font-size: 12px;">Roasted Chicken Tandoori
												cooked in spicy creamy sauce W/ Indian Herbs and Spice. Add
												Bread or Rice.</span>
										</button>
										<div class="modal fade" id="ChickenTikkaMasala1" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="ChickenTikkaMasala1CloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chicken Tikka Masala</h3>
															<span>Roasted Chicken Tandoori cooked in spicy
																creamy sauce W/ Indian Herbs and Spice. Add Bread or
																Rice.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_5_3" class="form-horizontal"
																onsubmit="return populateFullMenuChickenTikkaMasala1SelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="ChickenTikkaMasala1Count" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="ChickenTikkaMasala1Spl" maxlength="20">
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
											data-toggle="modal" data-target="#TraditionalLambCurry"
											data-whatever="TraditionalLambCurry">
											<span>Traditional Lamb Curry </span> <br /> <span
												style="font-size: 12px;">Chopped Lamb savored in
												Indian spicy gravy, chili, onions, and cilantro. Add Bread
												or Rice.</span>
										</button>
										<div class="modal fade" id="TraditionalLambCurry"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="TraditionalLambCurryCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Traditional Lamb Curry</h3>
															<span>Chopped Lamb savored in Indian spicy gravy,
																chili, onions, and cilantro. Add Bread or Rice.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_5_4" class="form-horizontal"
																onsubmit="return populateFullMenuTraditionalLambCurrySelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="TraditionalLambCurryCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="TraditionalLambCurrySpl" maxlength="20">
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
											data-toggle="modal" data-target="#SaagLamb"
											data-whatever="SaagLamb">
											<span>Saag Lamb</span> <br /> <span style="font-size: 12px;">Chopped
												Lamb cooked W/ minced spinach saut&#233;ed W/ Indian Herbs and
												Spices. Add Bread or Rice.</span>
										</button>
										<div class="modal fade" id="SaagLamb" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="SaagLambCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Saag Lamb</h3>
															<span>Chopped Lamb cooked W/ minced spinach
																saut&#233;ed W/ Indian Herbs and Spices. Add Bread or
																Rice.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_5_5" class="form-horizontal"
																onsubmit="return populateFullMenuSaagLambSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="SaagLambCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="SaagLambSpl"
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
						<div class="panel-group"
							id="accordion-Vegetarian_Speciality_Entrees" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-Vegetarian_Speciality_Entrees"
										href="#Vegetarian_Speciality_Entrees" aria-expanded="true"
										aria-controls="Vegetarian_Speciality_Entrees"> Vegetarian
										Speciality Entrees </a>
								</div>
								<div id="Vegetarian_Speciality_Entrees"
									class="panel-collapse collapse in" role="tabpanel"
									aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#MalaiKofta1"
											data-whatever="MalaiKofta1">
											<span>Malai Kofta</span> <br /> <span
												style="font-size: 12px;">Vegetarian dumplings
												simmered in Indian Herbs and Spices, and creamy curry sauce.
												Add Bread or Rice.</span>
										</button>
										<div class="modal fade" id="MalaiKofta1" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="MalaiKofta1CloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Malai Kofta</h3>
															<span>Vegetarian dumplings simmered in Indian
																Herbs and Spices, and creamy curry sauce. Add Bread or
																Rice.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_6_1" class="form-horizontal"
																onsubmit="return populateFullMenuMalaiKofta1SelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="MalaiKofta1Count" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="MalaiKofta1Spl"
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
											data-toggle="modal" data-target="#ShahiPaneer"
											data-whatever="ShahiPaneer">
											<span>Shahi Paneer</span> <br /> <span
												style="font-size: 12px;">Indian Cheese cooked in
												Spicy, Creamy Gravy Sauce, W/ tomatoes, Herbs and Spices.
												Add Bread or Rice.</span>
										</button>
										<div class="modal fade" id="ShahiPaneer" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="ShahiPaneerCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Shahi Paneer</h3>
															<span>Indian Cheese cooked in Spicy, Creamy Gravy
																Sauce, W/ tomatoes, Herbs and Spices. Add Bread or Rice.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_6_2" class="form-horizontal"
																onsubmit="return populateFullMenuShahiPaneerSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="ShahiPaneerCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ShahiPaneerSpl"
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
											data-toggle="modal" data-target="#MatarPaneer"
											data-whatever="MatarPaneer">
											<span>Matar Paneer</span> <br /> <span
												style="font-size: 12px;">Green Peas and Indian Cheese
												savored in Indian spicy gravy, chili, onions, tomatoes and
												cilantro. Add Bread or Rice.</span>
										</button>
										<div class="modal fade" id="MatarPaneer" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="MatarPaneerCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Matar Paneer</h3>
															<span>Green Peas and Indian Cheese savored in
																Indian spicy gravy, chili, onions, tomatoes and
																cilantro. Add Bread or Rice.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_6_3" class="form-horizontal"
																onsubmit="return populateFullMenuMatarPaneerSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="MatarPaneerCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="MatarPaneerSpl"
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
											data-toggle="modal" data-target="#DalMakhni"
											data-whatever="DalMakhni">
											<span>Dal Makhni</span> <br /> <span
												style="font-size: 12px;">Cooked Lentils, Mung Beans
												made W/ onions, tomatoes, ginger, in Indian Herbs and
												Spices. Add Bread or Rice.</span>
										</button>
										<div class="modal fade" id="DalMakhni" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="DalMakhniCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Dal Makhni</h3>
															<span>Cooked Lentils, Mung Beans made W/ onions,
																tomatoes, ginger, in Indian Herbs and Spices. Add Bread
																or Rice.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_6_4" class="form-horizontal"
																onsubmit="return populateFullMenuDalMakhniSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="DalMakhniCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="DalMakhniSpl"
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
											data-toggle="modal" data-target="#MixedVegetables1"
											data-whatever="MixedVegetables1">
											<span>Mixed Vegetables</span> <br /> <span
												style="font-size: 12px;">Mixed vegetables saut&#233;ed
												W/ Tomatoes, Peppers, Onions, Chili saut&#233;ed W/ Indian
												Herbs and Spices. Add Bread or Rice.</span>
										</button>
										<div class="modal fade" id="MixedVegetables1" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="MixedVegetables1CloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Mixed Vegetables</h3>
															<span>Mixed vegetables saut&#233;ed W/ Tomatoes,
																Peppers, Onions, Chili saut&#233;ed W/ Indian Herbs and
																Spices. Add Bread or Rice.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_6_5" class="form-horizontal"
																onsubmit="return populateFullMenuMixedVegetables1SelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="MixedVegetables1Count" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="MixedVegetables1Spl"
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
											data-toggle="modal" data-target="#ChanaMasala"
											data-whatever="ChanaMasala">
											<span>Chana Masala</span> <br /> <span
												style="font-size: 12px;">Chickpeas savored in Indian
												spicy gravy, chili, onions, tomatoes and cilantro, W/ a hint
												of citrus. Add Bread or Rice.</span>
										</button>
										<div class="modal fade" id="ChanaMasala" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="ChanaMasalaCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chana Masala</h3>
															<span>Chickpeas savored in Indian spicy gravy,
																chili, onions, tomatoes and cilantro, W/ a hint of
																citrus. Add Bread or Rice.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_6_6" class="form-horizontal"
																onsubmit="return populateFullMenuChanaMasalaSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="ChanaMasalaCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ChanaMasalaSpl"
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
						<div class="panel-group" id="accordion-Side_Orders" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-Side_Orders" href="#Side_Orders"
										aria-expanded="true" aria-controls="Side_Orders"> Side
										Orders </a>
								</div>
								<div id="Side_Orders" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#RaitaIndianYogurt"
											data-whatever="RaitaIndianYogurt">
											<span>Raita (Indian Yogurt)</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="RaitaIndianYogurt" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="RaitaIndianYogurtCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Raita (Indian Yogurt)</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup_7_1" class="form-horizontal"
																onsubmit="return populateFullMenuRaitaIndianYogurtSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="RaitaIndianYogurtCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="RaitaIndianYogurtSpl" maxlength="20">
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
											data-toggle="modal" data-target="#BasmatiRice"
											data-whatever="BasmatiRice">
											<span>Basmati Rice</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="BasmatiRice" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="BasmatiRiceCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Basmati Rice</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup_7_2" class="form-horizontal"
																onsubmit="return populateFullMenuBasmatiRiceSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="BasmatiRiceCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="BasmatiRiceSpl"
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
											data-toggle="modal" data-target="#Kheer1"
											data-whatever="Kheer1">
											<span>Kheer</span> <br /> <span style="font-size: 12px;">Indian
												Rice Pudding</span>
										</button>
										<div class="modal fade" id="Kheer1" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="Kheer1CloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Kheer</h3>
															<span>Indian Rice Pudding</span>
														</div>
														<div class="modal-desc">
															<form id="popup_8_1" class="form-horizontal"
																onsubmit="return populateFullMenuKheer1SelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="Kheer1Count" maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="Kheer1Spl"
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
											data-toggle="modal" data-target="#GulabJamun1"
											data-whatever="GulabJamun1">
											<span>Gulab Jamun</span> <br /> <span
												style="font-size: 12px;">Spongy Balls with Sugar
												Syrup</span>
										</button>
										<div class="modal fade" id="GulabJamun1" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="GulabJamun1CloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Gulab Jamun</h3>
															<span>Spongy Balls with Sugar Syrup</span>
														</div>
														<div class="modal-desc">
															<form id="popup_8_2" class="form-horizontal"
																onsubmit="return populateFullMenuGulabJamun1SelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="GulabJamun1Count" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="GulabJamun1Spl"
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
						<div class="panel-group" id="accordion-Beverages" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-Beverages" href="#Beverages"
										aria-expanded="true" aria-controls="Beverages"> Beverages
									</a>
								</div>
								<div id="Beverages" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#AssortedSoda1"
											data-whatever="AssortedSoda1">
											<span>Assorted Soda</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="AssortedSoda1" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="AssortedSoda1CloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Assorted Soda</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup_9_1" class="form-horizontal"
																onsubmit="return populateFullMenuAssortedSoda1SelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="AssortedSoda1Count" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="AssortedSoda1Spl"
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
											data-toggle="modal" data-target="#BottledWater1"
											data-whatever="BottledWater1">
											<span>Bottled Water</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="BottledWater1" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="BottledWater1CloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Bottled Water</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup_9_2" class="form-horizontal"
																onsubmit="return populateFullMenuBottledWater1SelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="BottledWater1Count" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="BottledWater1Spl"
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
										onclick="remove_milan_curry_house_item('m_${loop.index}');">X</span>
									<figure>${m.value}</figure>
								</div>
							</c:forEach>
						</div>
						<div class="pick-deliver">
							<div class="checkout">
								<form action="${pageContext.request.contextPath}/menu/saveMenu"
									id="milan_curry_house_target" method="post">
									<input type="hidden" name="full_menu_items"
										id="full_menu_items"> <input type="hidden"
										name="cuisineType" value="${menu.cuisine}">
									<textarea rows="4" cols="50" name="comments"
										placeholder="Enter your comments to restaurant here"
										class="form-control">${menu.comments}</textarea>
									<br />
									<!-- <button type="button" onclick="milan_curry_house_menu_submit();"
										class="btn btn-default">Next</button> -->
									<a href="javascript:milan_curry_house_menu_submit();">Next</a>
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
			milan_curry_house_menu_items.push(name + "+" + desc); //milan_curry_house_menu_items is in milan_curry_house_95747.js 
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
