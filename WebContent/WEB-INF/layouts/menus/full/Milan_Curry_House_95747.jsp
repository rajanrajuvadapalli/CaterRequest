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
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Vegetarian Wraps</h3>
															<span>Seasoned Veggie cutlet W/ tomatoes, lettuce,
																cilantro, onion, mint, and tamarind sauce wrapped in
																fresh Naan.</span>
														</div>
														<div class="modal-desc">
															<form id="popup1_1" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="VegetarianWrapsCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="VegetarianWrapsSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuVegetarianWrapsSelectedItems();" />
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
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Paneer Wrap</h3>
															<span>Seasoned Veggie cutlet and Paneer W/
																tomatoes, lettuce, cilantro, onion, mint, and tamarind
																wrapped in fresh Naan.</span>
														</div>
														<div class="modal-desc">
															<form id="popup1_2" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="PaneerWrapCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="PaneerWrapSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuPaneerWrapSelectedItems();" />
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
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chicken Wrap</h3>
															<span>Baked boneless Chicken W/ tomatoes, lettuce,
																cilantro, onion, mint, and tamarind sauce wrapped in
																fresh Naan.</span>
														</div>
														<div class="modal-desc">
															<form id="popup1_3" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="ChickenWrapCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ChickenWrapSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuChickenWrapSelectedItems();" />
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
											data-toggle="modal" data-target="#FishWrap"
											data-whatever="FishWrap">
											<span>Fish Wrap</span> <br /> <span style="font-size: 12px;">Baked
												boneless Fish W/ tomatoes, lettuce, cilantro, onion, mint,
												and tamarind sauce wrapped in fresh Naan.</span>
										</button>
										<div class="modal fade" id="FishWrap" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Fish Wrap</h3>
															<span>Baked boneless Fish W/ tomatoes, lettuce,
																cilantro, onion, mint, and tamarind sauce wrapped in
																fresh Naan.</span>
														</div>
														<div class="modal-desc">
															<form id="popup1_4" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="FishWrapCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="FishWrapSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuFishWrapSelectedItems();" />
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
											<span>Lamb Wrap</span> <br /> <span style="font-size: 12px;">Baked
												boneless Lamb W/ tomatoes, lettuce, cilantro, onion, mint,
												and tamarind sauce wrapped in fresh Naan.</span>
										</button>
										<div class="modal fade" id="LambWrap" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Lamb Wrap</h3>
															<span>Baked boneless Lamb W/ tomatoes, lettuce,
																cilantro, onion, mint, and tamarind sauce wrapped in
																fresh Naan.</span>
														</div>
														<div class="modal-desc">
															<form id="popup1_5" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="LambWrapCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="LambWrapSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuLambWrapSelectedItems();" />
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
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Aloo Tikki</h3>
															<span>Potato / Veggie Cutlets crispy on the
																outside, blended W/ herbs and spices.</span>
														</div>
														<div class="modal-desc">
															<form id="popup2_1" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="AlooTikkiCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="AlooTikkiSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuAlooTikkiSelectedItems();" />
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
											data-toggle="modal" data-target="#PanniPuriPC"
											data-whatever="PanniPuriPC">
											<span>Panni Puri (8 PC)</span> <br /> <span
												style="font-size: 12px;">Crispy Shallow Ball to be
												filled W/ Potatoes, chickpeas, onions, mint, Tamarind, and
												sweet and spicy Water.</span>
										</button>
										<div class="modal fade" id="PanniPuriPC" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Panni Puri (8 PC)</h3>
															<span>Crispy Shallow Ball to be filled W/
																Potatoes, chickpeas, onions, mint, Tamarind, and sweet
																and spicy Water.</span>
														</div>
														<div class="modal-desc">
															<form id="popup2_2" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="PanniPuriPCCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="PanniPuriPCSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuPanniPuriPCSelectedItems();" />
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
											data-toggle="modal" data-target="#PanniPuriPC"
											data-whatever="PanniPuriPC">
											<span>Panni Puri (20 PC)</span> <br /> <span
												style="font-size: 12px;">Crispy Shallow Ball to be
												filled W/ Potatoes, chickpeas, onions, mint, Tamarind, and
												sweet and spicy Water.</span>
										</button>
										<div class="modal fade" id="PanniPuriPC" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Panni Puri (20 PC)</h3>
															<span>Crispy Shallow Ball to be filled W/
																Potatoes, chickpeas, onions, mint, Tamarind, and sweet
																and spicy Water.</span>
														</div>
														<div class="modal-desc">
															<form id="popup2_3" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="PanniPuriPCCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="PanniPuriPCSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuPanniPuriPCSelectedItems();" />
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
											<span>Samosas (2PC)</span> <br /> <span
												style="font-size: 12px;">Pastry filled W/ Potatoes,
												Peas, Onions, mint, blended W/ herb and spices. Served W/
												Tamarind and mint chutney</span>
										</button>
										<div class="modal fade" id="SamosasPC" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Samosas (2PC)</h3>
															<span>Pastry filled W/ Potatoes, Peas, Onions,
																mint, blended W/ herb and spices. Served W/ Tamarind and
																mint chutney</span>
														</div>
														<div class="modal-desc">
															<form id="popup2_4" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="SamosasPCCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="SamosasPCSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuSamosasPCSelectedItems();" />
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
											data-toggle="modal" data-target="#BhelPuri"
											data-whatever="BhelPuri">
											<span>Bhel Puri</span> <br /> <span style="font-size: 12px;">Mixed
												Papri, puffed rice, onions, potatoes blended W/ herbs and
												spices. Served W/ Tamarind and Mint chutney.</span>
										</button>
										<div class="modal fade" id="BhelPuri" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Bhel Puri</h3>
															<span>Mixed Papri, puffed rice, onions, potatoes
																blended W/ herbs and spices. Served W/ Tamarind and Mint
																chutney.</span>
														</div>
														<div class="modal-desc">
															<form id="popup2_5" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="BhelPuriCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="BhelPuriSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuBhelPuriSelectedItems();" />
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
											data-toggle="modal" data-target="#DhaiVada"
											data-whatever="DhaiVada">
											<span>Dhai Vada</span> <br /> <span style="font-size: 12px;">Soft
												Lentil Patties soaked in Indian Yogurt, onions, cilantro,
												Smothered W/ Tamarind and mint chutney.</span>
										</button>
										<div class="modal fade" id="DhaiVada" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Dhai Vada</h3>
															<span>Soft Lentil Patties soaked in Indian Yogurt,
																onions, cilantro, Smothered W/ Tamarind and mint
																chutney.</span>
														</div>
														<div class="modal-desc">
															<form id="popup2_6" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="DhaiVadaCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="DhaiVadaSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuDhaiVadaSelectedItems();" />
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
											data-toggle="modal" data-target="#CholeyBhature"
											data-whatever="CholeyBhature">
											<span>Choley Bhature</span> <br /> <span
												style="font-size: 12px;">Chickpeas Curry Served W/
												Indian bread lightly fried along W/ onions, Mint Chutney,
												Achaar (Indian Pickles)</span>
										</button>
										<div class="modal fade" id="CholeyBhature" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Choley Bhature</h3>
															<span>Chickpeas Curry Served W/ Indian bread
																lightly fried along W/ onions, Mint Chutney, Achaar
																(Indian Pickles)</span>
														</div>
														<div class="modal-desc">
															<form id="popup2_7" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="CholeyBhatureCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="CholeyBhatureSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuCholeyBhatureSelectedItems();" />
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
												style="font-size: 12px;">Fried snack mulched W/ Mixed
												Veggies, Lentil, Wheat flour, onions, potatoes, blended W/
												herbs and spices.</span>
										</button>
										<div class="modal fade" id="MixedVeggiePakora" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Mixed Veggie Pakora</h3>
															<span>Fried snack mulched W/ Mixed Veggies,
																Lentil, Wheat flour, onions, potatoes, blended W/ herbs
																and spices.</span>
														</div>
														<div class="modal-desc">
															<form id="popup2_8" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="MixedVeggiePakoraCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="MixedVeggiePakoraSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuMixedVeggiePakoraSelectedItems();" />
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
											data-toggle="modal" data-target="#PaneerPakoraIndianCheese"
											data-whatever="PaneerPakoraIndianCheese">
											<span>Paneer Pakora (Indian Cheese)</span> <br /> <span
												style="font-size: 12px;">Fried snack mulched W/
												Paneer, Lentil, Wheat flour, onions, potatoes, blended W/
												herbs and spices.</span>
										</button>
										<div class="modal fade" id="PaneerPakoraIndianCheese"
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
															<h3>Paneer Pakora (Indian Cheese)</h3>
															<span>Fried snack mulched W/ Paneer, Lentil, Wheat
																flour, onions, potatoes, blended W/ herbs and spices.</span>
														</div>
														<div class="modal-desc">
															<form id="popup2_9" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="PaneerPakoraIndianCheeseCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="PaneerPakoraIndianCheeseSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuPaneerPakoraIndianCheeseSelectedItems();" />
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
											data-toggle="modal" data-target="#FishPakora"
											data-whatever="FishPakora">
											<span>Fish Pakora</span> <br /> <span
												style="font-size: 12px;">Fried snack mulched W/ Fish,
												Lentil, Wheat flour, onions, potatoes, blended W/ herbs and
												spices.</span>
										</button>
										<div class="modal fade" id="FishPakora" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Fish Pakora</h3>
															<span>Fried snack mulched W/ Fish, Lentil, Wheat
																flour, onions, potatoes, blended W/ herbs and spices.</span>
														</div>
														<div class="modal-desc">
															<form id="popup2_10" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="FishPakoraCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="FishPakoraSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuFishPakoraSelectedItems();" />
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
						<div class="panel-group" id="accordion-Chaat" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-Chaat" href="#Chaat"
										aria-expanded="true" aria-controls="Chaat"> Chaat </a>
								</div>
								<div id="Chaat" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#PapriChaat"
											data-whatever="PapriChaat">
											<span>Papri Chaat</span> <br /> <span
												style="font-size: 12px;">Crispy Wafers W/ potatoes,
												chickpeas, cilantro, onions, yogurt Smothered W/ Tamarind
												and mint chutney.</span>
										</button>
										<div class="modal fade" id="PapriChaat" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Papri Chaat</h3>
															<span>Crispy Wafers W/ potatoes, chickpeas,
																cilantro, onions, yogurt Smothered W/ Tamarind and mint
																chutney.</span>
														</div>
														<div class="modal-desc">
															<form id="popup3_1" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="PapriChaatCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="PapriChaatSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuPapriChaatSelectedItems();" />
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
											data-toggle="modal" data-target="#AlooTikkiChaat"
											data-whatever="AlooTikkiChaat">
											<span>Aloo Tikki Chaat</span> <br /> <span
												style="font-size: 12px;">Veggie Cutlets mixed W/
												chickpeas onions, cilantro, yogurt, Smothered W/ Tamarind
												and mint chutney.</span>
										</button>
										<div class="modal fade" id="AlooTikkiChaat" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Aloo Tikki Chaat</h3>
															<span>Veggie Cutlets mixed W/ chickpeas onions,
																cilantro, yogurt, Smothered W/ Tamarind and mint
																chutney.</span>
														</div>
														<div class="modal-desc">
															<form id="popup3_2" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="AlooTikkiChaatCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="AlooTikkiChaatSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuAlooTikkiChaatSelectedItems();" />
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
											data-toggle="modal" data-target="#SamosaChaat"
											data-whatever="SamosaChaat">
											<span>Samosa Chaat</span> <br /> <span
												style="font-size: 12px;">Mashed Samosa mixed W/
												chickpeas onions, cilantro, yogurt, Smothered W/ Tamarind
												and Mint Chutney.</span>
										</button>
										<div class="modal fade" id="SamosaChaat" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Samosa Chaat</h3>
															<span>Mashed Samosa mixed W/ chickpeas onions,
																cilantro, yogurt, Smothered W/ Tamarind and Mint
																Chutney.</span>
														</div>
														<div class="modal-desc">
															<form id="popup3_3" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="SamosaChaatCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="SamosaChaatSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuSamosaChaatSelectedItems();" />
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
						<div class="panel-group" id="accordion-Specialty_Salads"
							role="tablist" aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-Specialty_Salads"
										href="#Specialty_Salads" aria-expanded="true"
										aria-controls="Specialty_Salads"> Specialty Salads </a>
								</div>
								<div id="Specialty_Salads" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#RangSalad"
											data-whatever="RangSalad">
											<span>Rang Salad</span> <br /> <span
												style="font-size: 12px;">Colorful Salad of Red
												Onions, Green Chili, Cucumbers, Tomatoes, Cilantro. W/ lemon
												juice, salt and masala.</span>
										</button>
										<div class="modal fade" id="RangSalad" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Rang Salad</h3>
															<span>Colorful Salad of Red Onions, Green Chili,
																Cucumbers, Tomatoes, Cilantro. W/ lemon juice, salt and
																masala.</span>
														</div>
														<div class="modal-desc">
															<form id="popup4_1" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="RangSaladCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="RangSaladSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuRangSaladSelectedItems();" />
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
											data-toggle="modal" data-target="#ChickenTikkaSalad"
											data-whatever="ChickenTikkaSalad">
											<span>Chicken Tikka Salad</span> <br /> <span
												style="font-size: 12px;">Tandoori Chicken breast,
												wafers, crispy noodles, lettuce, tomatoes, onions, Cilantro
												W/ Indian spicy dressing.</span>
										</button>
										<div class="modal fade" id="ChickenTikkaSalad" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chicken Tikka Salad</h3>
															<span>Tandoori Chicken breast, wafers, crispy
																noodles, lettuce, tomatoes, onions, Cilantro W/ Indian
																spicy dressing.</span>
														</div>
														<div class="modal-desc">
															<form id="popup4_2" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="ChickenTikkaSaladCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="ChickenTikkaSaladSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuChickenTikkaSaladSelectedItems();" />
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
											data-toggle="modal" data-target="#CucumberSalad"
											data-whatever="CucumberSalad">
											<span>Cucumber Salad</span> <br /> <span
												style="font-size: 12px;">Sliced Cucumbers. W/ lemon
												juice, salt and masala.</span>
										</button>
										<div class="modal fade" id="CucumberSalad" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Cucumber Salad</h3>
															<span>Sliced Cucumbers. W/ lemon juice, salt and
																masala.</span>
														</div>
														<div class="modal-desc">
															<form id="popup4_3" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="CucumberSaladCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="CucumberSaladSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuCucumberSaladSelectedItems();" />
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
												Sizzled Onions, Lemon and Chili.</span>
										</button>
										<div class="modal fade" id="MilanTandooriSpecial"
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
															<h3>Milan Tandoori Special</h3>
															<span>Chicken Leg, Thigh, and Breast Marinated W/
																Indian herbs and Spices, yogurt, ginger, Sizzled Onions,
																Lemon and Chili.</span>
														</div>
														<div class="modal-desc">
															<form id="popup5_1" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="MilanTandooriSpecialCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="MilanTandooriSpecialSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuMilanTandooriSpecialSelectedItems();" />
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
											data-toggle="modal" data-target="#LambSeekhKabob"
											data-whatever="LambSeekhKabob">
											<span>Lamb Seekh Kabob</span> <br /> <span
												style="font-size: 12px;">Minced Lamb Marinated W/
												Indian herbs and Spices, yogurt, Green Chili, Ginger, Served
												W/ Indian Sauces.</span>
										</button>
										<div class="modal fade" id="LambSeekhKabob" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Lamb Seekh Kabob</h3>
															<span>Minced Lamb Marinated W/ Indian herbs and
																Spices, yogurt, Green Chili, Ginger, Served W/ Indian
																Sauces.</span>
														</div>
														<div class="modal-desc">
															<form id="popup5_2" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="LambSeekhKabobCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="LambSeekhKabobSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuLambSeekhKabobSelectedItems();" />
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
											data-toggle="modal" data-target="#ChickenSeekhKabob"
											data-whatever="ChickenSeekhKabob">
											<span>Chicken Seekh Kabob</span> <br /> <span
												style="font-size: 12px;">Minced Chicken Marinated W/
												Indian herbs and Spices, yogurt, Green Chili, Ginger, Served
												W/ Indian Sauces.</span>
										</button>
										<div class="modal fade" id="ChickenSeekhKabob" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chicken Seekh Kabob</h3>
															<span>Minced Chicken Marinated W/ Indian herbs and
																Spices, yogurt, Green Chili, Ginger, Served W/ Indian
																Sauces.</span>
														</div>
														<div class="modal-desc">
															<form id="popup5_3" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="ChickenSeekhKabobCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="ChickenSeekhKabobSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuChickenSeekhKabobSelectedItems();" />
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
												Entrées (Chicken and Lamb)</span>
										</button>
										<div class="modal fade" id="MixedGrilledTandoori"
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
															<h3>Mixed Grilled Tandoori</h3>
															<span>Combination of all tandoori Entrées (Chicken
																and Lamb)</span>
														</div>
														<div class="modal-desc">
															<form id="popup5_4" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="MixedGrilledTandooriCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="MixedGrilledTandooriSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuMixedGrilledTandooriSelectedItems();" />
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
												style="font-size: 12px;">A fiery Spicy Dish of Lamb
												and Spicy Potatoes Curry</span>
										</button>
										<div class="modal fade" id="LambVindaloo" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Lamb Vindaloo</h3>
															<span>A fiery Spicy Dish of Lamb and Spicy
																Potatoes Curry</span>
														</div>
														<div class="modal-desc">
															<form id="popup5_5" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="LambVindalooCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="LambVindalooSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuLambVindalooSelectedItems();" />
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
												style="font-size: 12px;">A fiery Spicy Dish of
												Chicken and Spicy Potatoes Curry</span>
										</button>
										<div class="modal fade" id="ChickenVindaloo" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chicken Vindaloo</h3>
															<span>A fiery Spicy Dish of Chicken and Spicy
																Potatoes Curry</span>
														</div>
														<div class="modal-desc">
															<form id="popup5_6" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="ChickenVindalooCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ChickenVindalooSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuChickenVindalooSelectedItems();" />
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
							id="accordion-Tandoori_Sizzler_on_Tandoor_Clay_Oven"
							role="tablist" aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-Tandoori_Sizzler_on_Tandoor_Clay_Oven"
										href="#Tandoori_Sizzler_on_Tandoor_Clay_Oven"
										aria-expanded="true"
										aria-controls="Tandoori_Sizzler_on_Tandoor_Clay_Oven">
										Tandoori Sizzler on Tandoor (Clay Oven) </a>
								</div>
								<div id="Tandoori_Sizzler_on_Tandoor_Clay_Oven"
									class="panel-collapse collapse in" role="tabpanel"
									aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#ChickenTandoori"
											data-whatever="ChickenTandoori">
											<span>Chicken Tandoori</span> <br /> <span
												style="font-size: 12px;">Chicken Marinated W/ Indian
												herbs and Spices, yogurt, ginger, Sizzled Onions, Lemon and
												Chili.</span>
										</button>
										<div class="modal fade" id="ChickenTandoori" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chicken Tandoori</h3>
															<span>Chicken Marinated W/ Indian herbs and
																Spices, yogurt, ginger, Sizzled Onions, Lemon and Chili.</span>
														</div>
														<div class="modal-desc">
															<form id="popup6_1" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="ChickenTandooriCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ChickenTandooriSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuChickenTandooriSelectedItems();" />
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
											data-toggle="modal" data-target="#ChickenTikkaKabob"
											data-whatever="ChickenTikkaKabob">
											<span>Chicken Tikka Kabob</span> <br /> <span
												style="font-size: 12px;">Chicken Marinated W/ Indian
												herbs and Spices, yogurt, Green Chili, Ginger, Served W/
												Indian Sauces.</span>
										</button>
										<div class="modal fade" id="ChickenTikkaKabob" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chicken Tikka Kabob</h3>
															<span>Chicken Marinated W/ Indian herbs and
																Spices, yogurt, Green Chili, Ginger, Served W/ Indian
																Sauces.</span>
														</div>
														<div class="modal-desc">
															<form id="popup6_2" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="ChickenTikkaKabobCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="ChickenTikkaKabobSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuChickenTikkaKabobSelectedItems();" />
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
											data-toggle="modal" data-target="#FishTandoori"
											data-whatever="FishTandoori">
											<span>Fish Tandoori</span> <br /> <span
												style="font-size: 12px;">Fish of the Day Marinated W/
												Indian herbs and Spices, yogurt, ginger, Sizzled Onions,
												Lemon and Chili.</span>
										</button>
										<div class="modal fade" id="FishTandoori" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Fish Tandoori</h3>
															<span>Fish of the Day Marinated W/ Indian herbs
																and Spices, yogurt, ginger, Sizzled Onions, Lemon and
																Chili.</span>
														</div>
														<div class="modal-desc">
															<form id="popup6_3" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="FishTandooriCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="FishTandooriSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuFishTandooriSelectedItems();" />
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
											data-toggle="modal" data-target="#PaneerTandoori"
											data-whatever="PaneerTandoori">
											<span>Paneer Tandoori</span> <br /> <span
												style="font-size: 12px;">Indian Cheese Marinated W/
												Indian Herbs and Spices, yogurt, ginger, Sizzled Onions,
												Lemon and Chili.</span>
										</button>
										<div class="modal fade" id="PaneerTandoori" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Paneer Tandoori</h3>
															<span>Indian Cheese Marinated W/ Indian Herbs and
																Spices, yogurt, ginger, Sizzled Onions, Lemon and Chili.</span>
														</div>
														<div class="modal-desc">
															<form id="popup6_4" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="PaneerTandooriCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="PaneerTandooriSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuPaneerTandooriSelectedItems();" />
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
											data-toggle="modal" data-target="#PlainNaanWButter"
											data-whatever="PlainNaanWButter">
											<span>Plain Naan (W/ Butter)</span> <br /> <span
												style="font-size: 12px;">Indian bread Baked in Clay
												Oven. Eaten W/ Entrée</span>
										</button>
										<div class="modal fade" id="PlainNaanWButter" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Plain Naan (W/ Butter)</h3>
															<span>Indian bread Baked in Clay Oven. Eaten W/
																Entrée</span>
														</div>
														<div class="modal-desc">
															<form id="popup7_1" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="PlainNaanWButterCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="PlainNaanWButterSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuPlainNaanWButterSelectedItems();" />
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
											data-target="#GarlicNaanWButterMincedGarlic"
											data-whatever="GarlicNaanWButterMincedGarlic">
											<span>Garlic Naan (W/ Butter Minced Garlic)</span> <br /> <span
												style="font-size: 12px;">Indian bread Baked in Clay
												Oven. Eaten W/ Entrée</span>
										</button>
										<div class="modal fade" id="GarlicNaanWButterMincedGarlic"
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
															<h3>Garlic Naan (W/ Butter Minced Garlic)</h3>
															<span>Indian bread Baked in Clay Oven. Eaten W/
																Entrée</span>
														</div>
														<div class="modal-desc">
															<form id="popup7_2" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="GarlicNaanWButterMincedGarlicCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="GarlicNaanWButterMincedGarlicSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuGarlicNaanWButterMincedGarlicSelectedItems();" />
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
											data-toggle="modal" data-target="#PaneerKulchaIndianCheese"
											data-whatever="PaneerKulchaIndianCheese">
											<span>Paneer Kulcha (Indian Cheese)</span> <br /> <span
												style="font-size: 12px;">Leaven Indian bread stuffed
												W/ indian cheese baked in Tandoor (Clay oven)</span>
										</button>
										<div class="modal fade" id="PaneerKulchaIndianCheese"
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
															<h3>Paneer Kulcha (Indian Cheese)</h3>
															<span>Leaven Indian bread stuffed W/ indian cheese
																baked in Tandoor (Clay oven)</span>
														</div>
														<div class="modal-desc">
															<form id="popup7_3" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="PaneerKulchaIndianCheeseCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="PaneerKulchaIndianCheeseSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuPaneerKulchaIndianCheeseSelectedItems();" />
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
											data-toggle="modal" data-target="#KeemaKulchaGroundMeat"
											data-whatever="KeemaKulchaGroundMeat">
											<span>Keema Kulcha (Ground Meat)</span> <br /> <span
												style="font-size: 12px;">Leaven Indian bread stuffed
												W/ ground meat baked in Tandoor (Clay oven)</span>
										</button>
										<div class="modal fade" id="KeemaKulchaGroundMeat"
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
															<h3>Keema Kulcha (Ground Meat)</h3>
															<span>Leaven Indian bread stuffed W/ ground meat
																baked in Tandoor (Clay oven)</span>
														</div>
														<div class="modal-desc">
															<form id="popup7_4" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="KeemaKulchaGroundMeatCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="KeemaKulchaGroundMeatSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuKeemaKulchaGroundMeatSelectedItems();" />
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
											data-toggle="modal" data-target="#PyaajKulchaDicedOnion"
											data-whatever="PyaajKulchaDicedOnion">
											<span>Pyaaj Kulcha (Diced Onion)</span> <br /> <span
												style="font-size: 12px;">Leaven Indian bread stuffed
												W/ dices onion Baked in Tandoor (Clay oven)</span>
										</button>
										<div class="modal fade" id="PyaajKulchaDicedOnion"
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
															<h3>Pyaaj Kulcha (Diced Onion)</h3>
															<span>Leaven Indian bread stuffed W/ dices onion
																Baked in Tandoor (Clay oven)</span>
														</div>
														<div class="modal-desc">
															<form id="popup7_5" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="PyaajKulchaDicedOnionCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="PyaajKulchaDicedOnionSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuPyaajKulchaDicedOnionSelectedItems();" />
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
											data-toggle="modal" data-target="#AlooKulchaMincedpotatoes"
											data-whatever="AlooKulchaMincedpotatoes">
											<span>Aloo Kulcha (Minced potatoes)</span> <br /> <span
												style="font-size: 12px;">Leaven Indian bread stuffed
												W/ minced potato baked in Tandoor (Clay oven)</span>
										</button>
										<div class="modal fade" id="AlooKulchaMincedpotatoes"
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
															<h3>Aloo Kulcha (Minced potatoes)</h3>
															<span>Leaven Indian bread stuffed W/ minced potato
																baked in Tandoor (Clay oven)</span>
														</div>
														<div class="modal-desc">
															<form id="popup7_6" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="AlooKulchaMincedpotatoesCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="AlooKulchaMincedpotatoesSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuAlooKulchaMincedpotatoesSelectedItems();" />
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
											data-toggle="modal" data-target="#PlainRotiChapati"
											data-whatever="PlainRotiChapati">
											<span>Plain Roti / Chapati</span> <br /> <span
												style="font-size: 12px;">Indian Tortilla made on Tava
												(Iron grill). Eaten W/ your Entrée</span>
										</button>
										<div class="modal fade" id="PlainRotiChapati" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Plain Roti / Chapati</h3>
															<span>Indian Tortilla made on Tava (Iron grill).
																Eaten W/ your Entrée</span>
														</div>
														<div class="modal-desc">
															<form id="popup7_7" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="PlainRotiChapatiCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="PlainRotiChapatiSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuPlainRotiChapatiSelectedItems();" />
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
						<div class="panel-group" id="accordion-Royal_Biryani"
							role="tablist" aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-Royal_Biryani" href="#Royal_Biryani"
										aria-expanded="true" aria-controls="Royal_Biryani"> Royal
										Biryani </a>
								</div>
								<div id="Royal_Biryani" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#VegetarianBiryani"
											data-whatever="VegetarianBiryani">
											<span>Vegetarian Biryani</span> <br /> <span
												style="font-size: 12px;">Mixed Vegetables cooked W/
												Basmati Rice, Indian Herbs, Spices, chili, onions, cilantro.
												W/Indian Yogurt</span>
										</button>
										<div class="modal fade" id="VegetarianBiryani" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Vegetarian Biryani</h3>
															<span>Mixed Vegetables cooked W/ Basmati Rice,
																Indian Herbs, Spices, chili, onions, cilantro. W/Indian
																Yogurt</span>
														</div>
														<div class="modal-desc">
															<form id="popup8_1" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="VegetarianBiryaniCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="VegetarianBiryaniSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuVegetarianBiryaniSelectedItems();" />
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
												style="font-size: 12px;">Boneless Chicken cooked W/
												Basmati Rice, Indian Herbs, Spices, chili, onions, cilantro.
												W/Indian Yogurt</span>
										</button>
										<div class="modal fade" id="ChickenBiryani" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chicken Biryani</h3>
															<span>Boneless Chicken cooked W/ Basmati Rice,
																Indian Herbs, Spices, chili, onions, cilantro. W/Indian
																Yogurt</span>
														</div>
														<div class="modal-desc">
															<form id="popup8_2" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="ChickenBiryaniCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ChickenBiryaniSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuChickenBiryaniSelectedItems();" />
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
												style="font-size: 12px;">Lamb Chops cooked W/ Basmati
												Rice, Indian Herbs, Spices, chili, onions, cilantro.
												W/Indian Yogurt</span>
										</button>
										<div class="modal fade" id="LambBiryani" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Lamb Biryani</h3>
															<span>Lamb Chops cooked W/ Basmati Rice, Indian
																Herbs, Spices, chili, onions, cilantro. W/Indian Yogurt</span>
														</div>
														<div class="modal-desc">
															<form id="popup8_3" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="LambBiryaniCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="LambBiryaniSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuLambBiryaniSelectedItems();" />
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
						<div class="panel-group" id="accordion-Meat_Specialty_Entres"
							role="tablist" aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-Meat_Specialty_Entres"
										href="#Meat_Specialty_Entres" aria-expanded="true"
										aria-controls="Meat_Specialty_Entres"> Meat Specialty
										Entrées </a>
								</div>
								<div id="Meat_Specialty_Entres"
									class="panel-collapse collapse in" role="tabpanel"
									aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#TraditionalChickenCurry"
											data-whatever="TraditionalChickenCurry">
											<span>Traditional Chicken Curry</span> <br /> <span
												style="font-size: 12px;">Chicken savored in Indian
												spicy gravy, chili, onions, and cilantro.</span>
										</button>
										<div class="modal fade" id="TraditionalChickenCurry"
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
															<h3>Traditional Chicken Curry</h3>
															<span>Chicken savored in Indian spicy gravy,
																chili, onions, and cilantro.</span>
														</div>
														<div class="modal-desc">
															<form id="popup9_1" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="TraditionalChickenCurryCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="TraditionalChickenCurrySpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuTraditionalChickenCurrySelectedItems();" />
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
												style="font-size: 12px;">Chicken simmered in Tomato
												Cream Sauce, Herb and Spices.</span>
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
															<span>Chicken simmered in Tomato Cream Sauce, Herb
																and Spices.</span>
														</div>
														<div class="modal-desc">
															<form id="popup9_2" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
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
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#ChickenTikkaMasala"
											data-whatever="ChickenTikkaMasala">
											<span>Chicken Tikka Masala</span> <br /> <span
												style="font-size: 12px;">Roasted Chicken Tandoori
												cooked in spicy creamy sauce W/ Indian Herbs and Spice.</span>
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
															<span>Roasted Chicken Tandoori cooked in spicy
																creamy sauce W/ Indian Herbs and Spice.</span>
														</div>
														<div class="modal-desc">
															<form id="popup9_3" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
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
											data-toggle="modal" data-target="#ChiliChicken"
											data-whatever="ChiliChicken">
											<span>Chili Chicken</span> <br /> <span
												style="font-size: 12px;">Chicken pieces, tomatoes,
												peppers, onions, and chili sautéed W/ Herbs and Spices.</span>
										</button>
										<div class="modal fade" id="ChiliChicken" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chili Chicken</h3>
															<span>Chicken pieces, tomatoes, peppers, onions,
																and chili sautéed W/ Herbs and Spices.</span>
														</div>
														<div class="modal-desc">
															<form id="popup9_4" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="ChiliChickenCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ChiliChickenSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuChiliChickenSelectedItems();" />
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
											data-toggle="modal" data-target="#SaagChicken"
											data-whatever="SaagChicken">
											<span>Saag Chicken</span> <br /> <span
												style="font-size: 12px;">Chicken cooked W/ minced
												spinach sautéed W/ Indian Herbs and Spices.</span>
										</button>
										<div class="modal fade" id="SaagChicken" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Saag Chicken</h3>
															<span>Chicken cooked W/ minced spinach sautéed W/
																Indian Herbs and Spices.</span>
														</div>
														<div class="modal-desc">
															<form id="popup9_5" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="SaagChickenCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="SaagChickenSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuSaagChickenSelectedItems();" />
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
											<span>Traditional Lamb Curry</span> <br /> <span
												style="font-size: 12px;">Chopped Lamb savored in
												Indian spicy gravy, chili, onions, and cilantro.</span>
										</button>
										<div class="modal fade" id="TraditionalLambCurry"
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
															<h3>Traditional Lamb Curry</h3>
															<span>Chopped Lamb savored in Indian spicy gravy,
																chili, onions, and cilantro.</span>
														</div>
														<div class="modal-desc">
															<form id="popup9_6" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="TraditionalLambCurryCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="TraditionalLambCurrySpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuTraditionalLambCurrySelectedItems();" />
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
												Lamb cooked W/ minced spinach sautéed W/ Indian Herbs and
												Spices.</span>
										</button>
										<div class="modal fade" id="SaagLamb" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Saag Lamb</h3>
															<span>Chopped Lamb cooked W/ minced spinach
																sautéed W/ Indian Herbs and Spices.</span>
														</div>
														<div class="modal-desc">
															<form id="popup9_7" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="SaagLambCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="SaagLambSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuSaagLambSelectedItems();" />
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
											data-target="#TraditionalGoatCurryOccasional"
											data-whatever="TraditionalGoatCurryOccasional">
											<span>Traditional Goat Curry (Occasional)</span> <br /> <span
												style="font-size: 12px;">Chopped Goat savored in
												Indian spicy gravy, chili, onions, and cilantro.</span>
										</button>
										<div class="modal fade" id="TraditionalGoatCurryOccasional"
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
															<h3>Traditional Goat Curry (Occasional)</h3>
															<span>Chopped Goat savored in Indian spicy gravy,
																chili, onions, and cilantro.</span>
														</div>
														<div class="modal-desc">
															<form id="popup9_8" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="TraditionalGoatCurryOccasionalCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="TraditionalGoatCurryOccasionalSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuTraditionalGoatCurryOccasionalSelectedItems();" />
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
											data-toggle="modal" data-target="#TraditionalFishCurry"
											data-whatever="TraditionalFishCurry">
											<span>Traditional Fish Curry</span> <br /> <span
												style="font-size: 12px;">Fish of the Day savored in
												Indian spicy gravy, chili, onions, and cilantro.</span>
										</button>
										<div class="modal fade" id="TraditionalFishCurry"
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
															<h3>Traditional Fish Curry</h3>
															<span>Fish of the Day savored in Indian spicy
																gravy, chili, onions, and cilantro.</span>
														</div>
														<div class="modal-desc">
															<form id="popup9_9" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="TraditionalFishCurryCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="TraditionalFishCurrySpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuTraditionalFishCurrySelectedItems();" />
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
							id="accordion-Vegetarian_Specialty_Entres" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-Vegetarian_Specialty_Entres"
										href="#Vegetarian_Specialty_Entres" aria-expanded="true"
										aria-controls="Vegetarian_Specialty_Entres"> Vegetarian
										Specialty Entrées </a>
								</div>
								<div id="Vegetarian_Specialty_Entres"
									class="panel-collapse collapse in" role="tabpanel"
									aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#MalaiKofta"
											data-whatever="MalaiKofta">
											<span>Malai Kofta</span> <br /> <span
												style="font-size: 12px;">Vegetarian dumplings
												simmered in Indian Herbs and Spices, and creamy curry sauce.</span>
										</button>
										<div class="modal fade" id="MalaiKofta" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Malai Kofta</h3>
															<span>Vegetarian dumplings simmered in Indian
																Herbs and Spices, and creamy curry sauce.</span>
														</div>
														<div class="modal-desc">
															<form id="popup10_1" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="MalaiKoftaCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="MalaiKoftaSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuMalaiKoftaSelectedItems();" />
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
												Spicy, Creamy Gravy Sauce, W/ tomatoes, Herbs and Spices.</span>
										</button>
										<div class="modal fade" id="ShahiPaneer" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Shahi Paneer</h3>
															<span>Indian Cheese cooked in Spicy, Creamy Gravy
																Sauce, W/ tomatoes, Herbs and Spices.</span>
														</div>
														<div class="modal-desc">
															<form id="popup10_2" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="ShahiPaneerCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ShahiPaneerSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuShahiPaneerSelectedItems();" />
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
												cilantro.</span>
										</button>
										<div class="modal fade" id="MatarPaneer" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Matar Paneer</h3>
															<span>Green Peas and Indian Cheese savored in
																Indian spicy gravy, chili, onions, tomatoes and
																cilantro.</span>
														</div>
														<div class="modal-desc">
															<form id="popup10_3" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="MatarPaneerCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="MatarPaneerSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuMatarPaneerSelectedItems();" />
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
											data-toggle="modal" data-target="#ChiliPaneer"
											data-whatever="ChiliPaneer">
											<span>Chili Paneer</span> <br /> <span
												style="font-size: 12px;">Indian Cheese sautéed W/
												Tomatoes, Peppers, Onions, Chili sautéed in herbs and
												Spices.</span>
										</button>
										<div class="modal fade" id="ChiliPaneer" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chili Paneer</h3>
															<span>Indian Cheese sautéed W/ Tomatoes, Peppers,
																Onions, Chili sautéed in herbs and Spices.</span>
														</div>
														<div class="modal-desc">
															<form id="popup10_4" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="ChiliPaneerCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ChiliPaneerSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuChiliPaneerSelectedItems();" />
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
											data-toggle="modal" data-target="#PaneerBurji"
											data-whatever="PaneerBurji">
											<span>Paneer Burji</span> <br /> <span
												style="font-size: 12px;">Crumbled Indian Cheese
												Sautéed W/ Onion, Chili sautéed W/ herbs and Spices.</span>
										</button>
										<div class="modal fade" id="PaneerBurji" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Paneer Burji</h3>
															<span>Crumbled Indian Cheese Sautéed W/ Onion,
																Chili sautéed W/ herbs and Spices.</span>
														</div>
														<div class="modal-desc">
															<form id="popup10_5" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="PaneerBurjiCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="PaneerBurjiSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuPaneerBurjiSelectedItems();" />
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
											data-toggle="modal" data-target="#SaagPaneer"
											data-whatever="SaagPaneer">
											<span>Saag Paneer</span> <br /> <span
												style="font-size: 12px;">Indian Cheese cooked W/
												minced spinach sautéed W/ Indian Herbs and Spices.</span>
										</button>
										<div class="modal fade" id="SaagPaneer" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Saag Paneer</h3>
															<span>Indian Cheese cooked W/ minced spinach
																sautéed W/ Indian Herbs and Spices.</span>
														</div>
														<div class="modal-desc">
															<form id="popup10_6" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="SaagPaneerCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="SaagPaneerSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuSaagPaneerSelectedItems();" />
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
												Spices.</span>
										</button>
										<div class="modal fade" id="DalMakhni" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Dal Makhni</h3>
															<span>Cooked Lentils, Mung Beans made W/ onions,
																tomatoes, ginger, in Indian Herbs and Spices.</span>
														</div>
														<div class="modal-desc">
															<form id="popup10_7" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="DalMakhniCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="DalMakhniSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuDalMakhniSelectedItems();" />
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
												of citrus.</span>
										</button>
										<div class="modal fade" id="ChanaMasala" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chana Masala</h3>
															<span>Chickpeas savored in Indian spicy gravy,
																chili, onions, tomatoes and cilantro, W/ a hint of
																citrus.</span>
														</div>
														<div class="modal-desc">
															<form id="popup10_8" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="ChanaMasalaCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ChanaMasalaSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuChanaMasalaSelectedItems();" />
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
												style="font-size: 12px;">Mixed vegetables sautéed W/
												Tomatoes, Peppers, Onions, Chili sautéed W/ Indian Herbs and
												Spices.</span>
										</button>
										<div class="modal fade" id="MixedVegetables" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Mixed Vegetables</h3>
															<span>Mixed vegetables sautéed W/ Tomatoes,
																Peppers, Onions, Chili sautéed W/ Indian Herbs and
																Spices.</span>
														</div>
														<div class="modal-desc">
															<form id="popup10_9" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="MixedVegetablesCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="MixedVegetablesSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuMixedVegetablesSelectedItems();" />
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
											data-toggle="modal" data-target="#BhindiMasala"
											data-whatever="BhindiMasala">
											<span>Bhindi Masala</span> <br /> <span
												style="font-size: 12px;">Chopped Okra sautéed W/
												Tomatoes, Peppers, Onions, Chili sautéed W/ herbs and
												Spices.</span>
										</button>
										<div class="modal fade" id="BhindiMasala" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Bhindi Masala</h3>
															<span>Chopped Okra sautéed W/ Tomatoes, Peppers,
																Onions, Chili sautéed W/ herbs and Spices.</span>
														</div>
														<div class="modal-desc">
															<form id="popup10_10" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="BhindiMasalaCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="BhindiMasalaSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuBhindiMasalaSelectedItems();" />
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
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Raita (Indian Yogurt)</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup11_1" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="RaitaIndianYogurtCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="RaitaIndianYogurtSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuRaitaIndianYogurtSelectedItems();" />
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
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Basmati Rice</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup11_2" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="BasmatiRiceCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="BasmatiRiceSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuBasmatiRiceSelectedItems();" />
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
											data-toggle="modal" data-target="#ChiliOnionsCarrotsetc"
											data-whatever="ChiliOnionsCarrotsetc">
											<span>Chili, Onions, Carrots, etc.</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="ChiliOnionsCarrotsetc"
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
															<h3>Chili, Onions, Carrots, etc.</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup11_3" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="ChiliOnionsCarrotsetcCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="ChiliOnionsCarrotsetcSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuChiliOnionsCarrotsetcSelectedItems();" />
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
											data-toggle="modal" data-target="#AchaarIndianPickles"
											data-whatever="AchaarIndianPickles">
											<span>Achaar (Indian Pickles)</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="AchaarIndianPickles" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Achaar (Indian Pickles)</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup11_4" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="AchaarIndianPicklesCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="AchaarIndianPicklesSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuAchaarIndianPicklesSelectedItems();" />
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
											data-toggle="modal" data-target="#ChutneyIndianSauce"
											data-whatever="ChutneyIndianSauce">
											<span>Chutney (Indian Sauce)</span> <br /> <span
												style="font-size: 12px;">On the House</span>
										</button>
										<div class="modal fade" id="ChutneyIndianSauce" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chutney (Indian Sauce)</h3>
															<span>On the House</span>
														</div>
														<div class="modal-desc">
															<form id="popup11_5" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="ChutneyIndianSauceCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="ChutneyIndianSauceSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuChutneyIndianSauceSelectedItems();" />
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
											data-toggle="modal" data-target="#FaloodaKulfiIndianIceCream"
											data-whatever="FaloodaKulfiIndianIceCream">
											<span>Falooda Kulfi (Indian Ice Cream)</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="FaloodaKulfiIndianIceCream"
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
															<h3>Falooda Kulfi (Indian Ice Cream)</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup12_1" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="FaloodaKulfiIndianIceCreamCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="FaloodaKulfiIndianIceCreamSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuFaloodaKulfiIndianIceCreamSelectedItems();" />
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
											data-toggle="modal" data-target="#KheerIndianRicePudding"
											data-whatever="KheerIndianRicePudding">
											<span>Kheer (Indian Rice Pudding)</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="KheerIndianRicePudding"
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
															<h3>Kheer (Indian Rice Pudding)</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup12_2" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="KheerIndianRicePuddingCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="KheerIndianRicePuddingSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuKheerIndianRicePuddingSelectedItems();" />
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
											data-target="#GulabJamunSpongyBallsWSyrup"
											data-whatever="GulabJamunSpongyBallsWSyrup">
											<span>Gulab Jamun (Spongy Balls W/ Syrup)</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="GulabJamunSpongyBallsWSyrup"
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
															<h3>Gulab Jamun (Spongy Balls W/ Syrup)</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup12_3" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="GulabJamunSpongyBallsWSyrupCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="GulabJamunSpongyBallsWSyrupSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuGulabJamunSpongyBallsWSyrupSelectedItems();" />
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
											data-toggle="modal" data-target="#RasmalaiCheesecakeWCream"
											data-whatever="RasmalaiCheesecakeWCream">
											<span>Rasmalai (Cheesecake W/ Cream)</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="RasmalaiCheesecakeWCream"
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
															<h3>Rasmalai (Cheesecake W/ Cream)</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup12_4" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="RasmalaiCheesecakeWCreamCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="RasmalaiCheesecakeWCreamSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuRasmalaiCheesecakeWCreamSelectedItems();" />
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
											data-toggle="modal" data-target="#SweetSaltyLassiYogurtDrink"
											data-whatever="SweetSaltyLassiYogurtDrink">
											<span>Sweet & Salty Lassi (Yogurt Drink)</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="SweetSaltyLassiYogurtDrink"
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
															<h3>Sweet & Salty Lassi (Yogurt Drink)</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup13_1" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="SweetSaltyLassiYogurtDrinkCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="SweetSaltyLassiYogurtDrinkSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuSweetSaltyLassiYogurtDrinkSelectedItems();" />
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
											data-toggle="modal" data-target="#MangoLassiSweetMangoDrink"
											data-whatever="MangoLassiSweetMangoDrink">
											<span>Mango Lassi (Sweet Mango Drink)</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="MangoLassiSweetMangoDrink"
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
															<h3>Mango Lassi (Sweet Mango Drink)</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup13_2" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="MangoLassiSweetMangoDrinkCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="MangoLassiSweetMangoDrinkSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuMangoLassiSweetMangoDrinkSelectedItems();" />
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
											data-toggle="modal" data-target="#MasalaChaiIndianTeaWSpices"
											data-whatever="MasalaChaiIndianTeaWSpices">
											<span>Masala Chai (Indian Tea W/ Spices)</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="MasalaChaiIndianTeaWSpices"
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
															<h3>Masala Chai (Indian Tea W/ Spices)</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup13_3" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="MasalaChaiIndianTeaWSpicesCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="MasalaChaiIndianTeaWSpicesSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuMasalaChaiIndianTeaWSpicesSelectedItems();" />
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
											data-toggle="modal" data-target="#CoffeeWCream"
											data-whatever="CoffeeWCream">
											<span>Coffee W/ Cream</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="CoffeeWCream" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Coffee W/ Cream</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup13_4" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="CoffeeWCreamCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="CoffeeWCreamSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuCoffeeWCreamSelectedItems();" />
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
											data-toggle="modal" data-target="#DrinksCokeCo"
											data-whatever="DrinksCokeCo">
											<span>Drinks (Coke Co.)</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="DrinksCokeCo" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Drinks (Coke Co.)</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup13_5" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="DrinksCokeCoCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="DrinksCokeCoSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuDrinksCokeCoSelectedItems();" />
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