<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	function remove_chalupa_fresh_mexican_grill_item(div_id) {
		var divToRemove = $("div[id=" + div_id + "]");
		var name = divToRemove.children().children().prev().text();
		var desc = divToRemove.children().children().next().text();
		var data = name + "+" + desc;
		console.log("Removing " + data);
		chalupa_fresh_mexican_grill_menu_items.splice($.inArray(data,
				chalupa_fresh_mexican_grill_menu_items), 1);
		divToRemove.remove();
	}

	function chalupa_fresh_mexican_grill_menu_submit() {
		if (chalupa_fresh_mexican_grill_menu_items.length == 0) {
			alert("Please select at least 1 item to proceed.");
			return false;
		}
		console.log(chalupa_fresh_mexican_grill_menu_items);
		//console.log(JSON.stringify(chalupa_fresh_mexican_grill_menu_items));
		$("#full_menu_items").val(JSON.stringify(chalupa_fresh_mexican_grill_menu_items));
		$("#chalupa_fresh_mexican_grill_target").submit();
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
											data-toggle="modal" data-target="#QuesoNachos"
											data-whatever="QuesoNachos">
											<span>Queso Nachos</span> <br /> <span
												style="font-size: 12px;">Corn tortilla chips, house melted queso cheese, black beans and jalape&#241;os with pico de gallo.</span>
										</button>
										<div class="modal fade" id="QuesoNachos" tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="QuesoNachosCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Queso Nachos</h3>
															<span>Corn tortilla chips, house melted queso cheese, black beans and jalape&#241;os with pico de gallo.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_1" class="form-horizontal"
																onsubmit="return populateFullMenuQuesoNachosSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20" name="QuesoNachosCount"
																		maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="QuesoNachosSpl"
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
										<!-- item end --><!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#GrilledCornMexicanStyle"
											data-whatever="GrilledCornMexicanStyle">
											<span>Grilled Corn Mexican Style</span> <br /> <span
												style="font-size: 12px;">Two whole grilled corn served with mayo, cotija cheese, chili powder and lime.</span>
										</button>
										<div class="modal fade" id="GrilledCornMexicanStyle" tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="GrilledCornMexicanStyleCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Grilled Corn Mexican Style</h3>
															<span>Two whole grilled corn served with mayo, cotija cheese, chili powder and lime.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_2" class="form-horizontal"
																onsubmit="return populateFullMenuGrilledCornMexicanStyleSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20" name="GrilledCornMexicanStyleCount"
																		maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="GrilledCornMexicanStyleSpl"
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
										<!-- item end --><!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#ChickenQuesadilla"
											data-whatever="ChickenQuesadilla">
											<span>Chicken Quesadilla</span> <br /> <span
												style="font-size: 12px;">Melted Jack, chedder and cotija cheese and grilled chicken with your choice of cilantro-lime, white or chipotle sauce on side.</span>
										</button>
										<div class="modal fade" id="ChickenQuesadilla" tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="ChickenQuesadillaCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chicken Quesadilla</h3>
															<span>Melted Jack, chedder and cotija cheese and grilled chicken with your choice of cilantro-lime, white or chipotle sauce on side.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_3" class="form-horizontal"
																onsubmit="return populateFullMenuChickenQuesadillaSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20" name="ChickenQuesadillaCount"
																		maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ChickenQuesadillaSpl"
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
										<!-- item end --><!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#VegetarianQuesadilla"
											data-whatever="VegetarianQuesadilla">
											<span>Vegetarian Quesadilla</span> <br /> <span
												style="font-size: 12px;">Melted monterey jack cheese, black beans, roasted sweet n'spicy corn, tomatoes, cilantro, sour cream, lettuce, onions and guacamole.</span>
										</button>
										<div class="modal fade" id="VegetarianQuesadilla" tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="VegetarianQuesadillaCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Vegetarian Quesadilla</h3>
															<span>Melted monterey jack cheese, black beans, roasted sweet n'spicy corn, tomatoes, cilantro, sour cream, lettuce, onions and guacamole.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_4" class="form-horizontal"
																onsubmit="return populateFullMenuVegetarianQuesadillaSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20" name="VegetarianQuesadillaCount"
																		maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="VegetarianQuesadillaSpl"
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
						</div><!-- Collapse start -->
						<div class="panel-group" id="accordion-Salads" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-Salads" href="#Salads"
										aria-expanded="true" aria-controls="Salads">
										Salads </a>
								</div>
								<div id="Salads" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#TacoSaladChicken"
											data-whatever="TacoSaladChicken">
											<span>Taco Salad(Chicken)</span> <br /> <span
												style="font-size: 12px;">Chicken, lettuce, rice, beans, sour cream, guacamole, pico de gallo and cheese served on flour tostada.</span>
										</button>
										<div class="modal fade" id="TacoSaladChicken" tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="TacoSaladChickenCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Taco Salad(Chicken)</h3>
															<span>Chicken, lettuce, rice, beans, sour cream, guacamole, pico de gallo and cheese served on flour tostada.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_2_1" class="form-horizontal"
																onsubmit="return populateFullMenuTacoSaladChickenSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20" name="TacoSaladChickenCount"
																		maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="TacoSaladChickenSpl"
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
										<!-- item end --><!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#TacoSaladSteak"
											data-whatever="TacoSaladSteak">
											<span>Taco Salad(Steak)</span> <br /> <span
												style="font-size: 12px;">Steak, lettuce, rice, beans, sour cream, guacamole, pico de gallo and cheese served on flour tostada.</span>
										</button>
										<div class="modal fade" id="TacoSaladSteak" tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="TacoSaladSteakCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Taco Salad(Steak)</h3>
															<span>Steak, lettuce, rice, beans, sour cream, guacamole, pico de gallo and cheese served on flour tostada.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_2_2" class="form-horizontal"
																onsubmit="return populateFullMenuTacoSaladSteakSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20" name="TacoSaladSteakCount"
																		maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="TacoSaladSteakSpl"
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
										<!-- item end --><!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#TacoSaladCarnitas"
											data-whatever="TacoSaladCarnitas">
											<span>Taco Salad(Carnitas)</span> <br /> <span
												style="font-size: 12px;">Carnitas, lettuce, rice, beans, sour cream, guacamole, pico de gallo and cheese served on flour tostada.</span>
										</button>
										<div class="modal fade" id="TacoSaladCarnitas" tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="TacoSaladCarnitasCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Taco Salad(Carnitas)</h3>
															<span>Carnitas, lettuce, rice, beans, sour cream, guacamole, pico de gallo and cheese served on flour tostada.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_2_3" class="form-horizontal"
																onsubmit="return populateFullMenuTacoSaladCarnitasSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20" name="TacoSaladCarnitasCount"
																		maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="TacoSaladCarnitasSpl"
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
										<!-- item end --><!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#TacoSaladVegetarian"
											data-whatever="TacoSaladVegetarian">
											<span>Taco Salad(Vegetarian)</span> <br /> <span
												style="font-size: 12px;">Lettuce, rice, beans, sour cream, guacamole, pico de gallo and cheese served on flour tostada.</span>
										</button>
										<div class="modal fade" id="TacoSaladVegetarian" tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="TacoSaladVegetarianCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Taco Salad(Vegetarian)</h3>
															<span>Lettuce, rice, beans, sour cream, guacamole, pico de gallo and cheese served on flour tostada.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_2_4" class="form-horizontal"
																onsubmit="return populateFullMenuTacoSaladVegetarianSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20" name="TacoSaladVegetarianCount"
																		maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="TacoSaladVegetarianSpl"
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
										<!-- item end --><!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#MexicanSaladChicken"
											data-whatever="MexicanSaladChicken">
											<span>Mexican Salad(Chicken)</span> <br /> <span
												style="font-size: 12px;">Chicken, lettuce, black beans, tomatoes, onions, spicy pumpkin seeds, red cabbage, cotija cheese, chips strips, crispy tostada with mexican vinaigrette.</span>
										</button>
										<div class="modal fade" id="MexicanSaladChicken" tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="MexicanSaladChickenCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Mexican Salad(Chicken)</h3>
															<span>Chicken, lettuce, black beans, tomatoes, onions, spicy pumpkin seeds, red cabbage, cotija cheese, chips strips, crispy tostada with mexican vinaigrette.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_2_5" class="form-horizontal"
																onsubmit="return populateFullMenuMexicanSaladChickenSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20" name="MexicanSaladChickenCount"
																		maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="MexicanSaladChickenSpl"
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
										<!-- item end --><!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#MexicanSaladSteak"
											data-whatever="MexicanSaladSteak">
											<span>Mexican Salad(Steak)</span> <br /> <span
												style="font-size: 12px;">Steak, lettuce, black beans, tomatoes, onions, spicy pumpkin seeds, red cabbage, cotija cheese, chips strips, crispy tostada with mexican vinaigrette.</span>
										</button>
										<div class="modal fade" id="MexicanSaladSteak" tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="MexicanSaladSteakCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Mexican Salad(Steak)</h3>
															<span>Steak, lettuce, black beans, tomatoes, onions, spicy pumpkin seeds, red cabbage, cotija cheese, chips strips, crispy tostada with mexican vinaigrette.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_2_6" class="form-horizontal"
																onsubmit="return populateFullMenuMexicanSaladSteakSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20" name="MexicanSaladSteakCount"
																		maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="MexicanSaladSteakSpl"
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
										<!-- item end --><!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#MexicanSaladCarnitas"
											data-whatever="MexicanSaladCarnitas">
											<span>Mexican Salad(Carnitas)</span> <br /> <span
												style="font-size: 12px;">Carnitas, lettuce, black beans, tomatoes, onions, spicy pumpkin seeds, red cabbage, cotija cheese, chips strips, crispy tostada with mexican vinaigrette.</span>
										</button>
										<div class="modal fade" id="MexicanSaladCarnitas" tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="MexicanSaladCarnitasCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Mexican Salad(Carnitas)</h3>
															<span>Carnitas, lettuce, black beans, tomatoes, onions, spicy pumpkin seeds, red cabbage, cotija cheese, chips strips, crispy tostada with mexican vinaigrette.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_2_7" class="form-horizontal"
																onsubmit="return populateFullMenuMexicanSaladCarnitasSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20" name="MexicanSaladCarnitasCount"
																		maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="MexicanSaladCarnitasSpl"
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
										<!-- item end --><!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#MexicanSaladVegetarian"
											data-whatever="MexicanSaladVegetarian">
											<span>Mexican Salad(Vegetarian)</span> <br /> <span
												style="font-size: 12px;">Lettuce, black beans, tomatoes, onions, spicy pumpkin seeds, red cabbage, cotija cheese, chips strips, crispy tostada with mexican vinaigrette.</span>
										</button>
										<div class="modal fade" id="MexicanSaladVegetarian" tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="MexicanSaladVegetarianCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Mexican Salad(Vegetarian)</h3>
															<span>Lettuce, black beans, tomatoes, onions, spicy pumpkin seeds, red cabbage, cotija cheese, chips strips, crispy tostada with mexican vinaigrette.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_2_8" class="form-horizontal"
																onsubmit="return populateFullMenuMexicanSaladVegetarianSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20" name="MexicanSaladVegetarianCount"
																		maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="MexicanSaladVegetarianSpl"
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
						</div><!-- Collapse start -->
						<div class="panel-group" id="accordion-Tacos" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-Tacos" href="#Tacos"
										aria-expanded="true" aria-controls="Tacos">
										Tacos </a>
								</div>
								<div id="Tacos" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#ChalupaChicken"
											data-whatever="ChalupaChicken">
											<span>Chalupa(Chicken)</span> <br /> <span
												style="font-size: 12px;">Chicken, black beans, sour cream, pico de gallo, lettuce and cheese served on corn tostada.</span>
										</button>
										<div class="modal fade" id="ChalupaChicken" tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="ChalupaChickenCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chalupa(Chicken)</h3>
															<span>Chicken, black beans, sour cream, pico de gallo, lettuce and cheese served on corn tostada.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_1" class="form-horizontal"
																onsubmit="return populateFullMenuChalupaChickenSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20" name="ChalupaChickenCount"
																		maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ChalupaChickenSpl"
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
										<!-- item end --><!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#ChalupaSteak"
											data-whatever="ChalupaSteak">
											<span>Chalupa(Steak)</span> <br /> <span
												style="font-size: 12px;">Steak, black beans, sour cream, pico de gallo, lettuce and cheese served on corn tostada.</span>
										</button>
										<div class="modal fade" id="ChalupaSteak" tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="ChalupaSteakCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chalupa(Steak)</h3>
															<span>Steak, black beans, sour cream, pico de gallo, lettuce and cheese served on corn tostada.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_2" class="form-horizontal"
																onsubmit="return populateFullMenuChalupaSteakSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20" name="ChalupaSteakCount"
																		maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ChalupaSteakSpl"
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
										<!-- item end --><!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#ChalupaCarnitas"
											data-whatever="ChalupaCarnitas">
											<span>Chalupa(Carnitas)</span> <br /> <span
												style="font-size: 12px;">Chicken, black beans, sour cream, pico de gallo, lettuce and cheese served on corn tostada.</span>
										</button>
										<div class="modal fade" id="ChalupaCarnitas" tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="ChalupaCarnitasCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chalupa(Carnitas)</h3>
															<span>Chicken, black beans, sour cream, pico de gallo, lettuce and cheese served on corn tostada.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_3" class="form-horizontal"
																onsubmit="return populateFullMenuChalupaCarnitasSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20" name="ChalupaCarnitasCount"
																		maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ChalupaCarnitasSpl"
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
										<!-- item end --><!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#StreetTacosChicken"
											data-whatever="StreetTacosChicken">
											<span>Street Tacos (Chicken)</span> <br /> <span
												style="font-size: 12px;">Chicken, Onions and cilantro served in corn tortilla.</span>
										</button>
										<div class="modal fade" id="StreetTacosChicken" tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="StreetTacosChickenCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Street Tacos (Chicken)</h3>
															<span>Chicken, Onions and cilantro served in corn tortilla.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_4" class="form-horizontal"
																onsubmit="return populateFullMenuStreetTacosChickenSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20" name="StreetTacosChickenCount"
																		maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="StreetTacosChickenSpl"
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
										<!-- item end --><!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#StreetTacosSteak"
											data-whatever="StreetTacosSteak">
											<span>Street Tacos (Steak)</span> <br /> <span
												style="font-size: 12px;">Chicken, Onions and cilantro served in corn tortilla.</span>
										</button>
										<div class="modal fade" id="StreetTacosSteak" tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="StreetTacosSteakCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Street Tacos (Steak)</h3>
															<span>Chicken, Onions and cilantro served in corn tortilla.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_5" class="form-horizontal"
																onsubmit="return populateFullMenuStreetTacosSteakSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20" name="StreetTacosSteakCount"
																		maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="StreetTacosSteakSpl"
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
										<!-- item end --><!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#StreetTacosCarnitas"
											data-whatever="StreetTacosCarnitas">
											<span>Street Tacos (Carnitas)</span> <br /> <span
												style="font-size: 12px;">Chicken, Onions and cilantro served in corn tortilla.</span>
										</button>
										<div class="modal fade" id="StreetTacosCarnitas" tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="StreetTacosCarnitasCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Street Tacos (Carnitas)</h3>
															<span>Chicken, Onions and cilantro served in corn tortilla.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_6" class="form-horizontal"
																onsubmit="return populateFullMenuStreetTacosCarnitasSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20" name="StreetTacosCarnitasCount"
																		maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="StreetTacosCarnitasSpl"
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
										<!-- item end --><!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#MahiMahiFishTaco"
											data-whatever="MahiMahiFishTaco">
											<span>Mahi Mahi Fish Taco</span> <br /> <span
												style="font-size: 12px;">Cabbage, cilantro and onions with white and chipotle sauce served in corn tortilla.</span>
										</button>
										<div class="modal fade" id="MahiMahiFishTaco" tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="MahiMahiFishTacoCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Mahi Mahi Fish Taco</h3>
															<span>Cabbage, cilantro and onions with white and chipotle sauce served in corn tortilla.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_7" class="form-horizontal"
																onsubmit="return populateFullMenuMahiMahiFishTacoSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20" name="MahiMahiFishTacoCount"
																		maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="MahiMahiFishTacoSpl"
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
										<!-- item end --><!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#VeggieTaco"
											data-whatever="VeggieTaco">
											<span>Veggie Taco</span> <br /> <span
												style="font-size: 12px;">Black beans or Pinto beans, pico de gallo, sour cream, guacamole and cheese served in soft tortilla.</span>
										</button>
										<div class="modal fade" id="VeggieTaco" tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="VeggieTacoCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Veggie Taco</h3>
															<span>Black beans or Pinto beans, pico de gallo, sour cream, guacamole and cheese served in soft tortilla.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_8" class="form-horizontal"
																onsubmit="return populateFullMenuVeggieTacoSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20" name="VeggieTacoCount"
																		maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="VeggieTacoSpl"
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
						</div><!-- Collapse start -->
						<div class="panel-group" id="accordion-Burritos" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-Burritos" href="#Burritos"
										aria-expanded="true" aria-controls="Burritos">
										Burritos </a>
								</div>
								<div id="Burritos" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#AmecamecaChicken"
											data-whatever="AmecamecaChicken">
											<span>Amecameca(Chicken)</span> <br /> <span
												style="font-size: 12px;">Chicken, cilantro-lime rice, black beans, lettuce, queso cheese and sour cream.</span>
										</button>
										<div class="modal fade" id="AmecamecaChicken" tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="AmecamecaChickenCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Amecameca(Chicken)</h3>
															<span>Chicken, cilantro-lime rice, black beans, lettuce, queso cheese and sour cream.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_1" class="form-horizontal"
																onsubmit="return populateFullMenuAmecamecaChickenSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20" name="AmecamecaChickenCount"
																		maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="AmecamecaChickenSpl"
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
										<!-- item end --><!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#AmecamecaSteak"
											data-whatever="AmecamecaSteak">
											<span>Amecameca(Steak)</span> <br /> <span
												style="font-size: 12px;">Steak, cilantro-lime rice, black beans, lettuce, queso cheese and sour cream.</span>
										</button>
										<div class="modal fade" id="AmecamecaSteak" tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="AmecamecaSteakCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Amecameca(Steak)</h3>
															<span>Steak, cilantro-lime rice, black beans, lettuce, queso cheese and sour cream.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_2" class="form-horizontal"
																onsubmit="return populateFullMenuAmecamecaSteakSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20" name="AmecamecaSteakCount"
																		maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="AmecamecaSteakSpl"
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
										<!-- item end --><!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#AmecamecaCarnitas"
											data-whatever="AmecamecaCarnitas">
											<span>Amecameca(Carnitas)</span> <br /> <span
												style="font-size: 12px;">Carnitas, cilantro-lime rice, black beans, lettuce, queso cheese and sour cream.</span>
										</button>
										<div class="modal fade" id="AmecamecaCarnitas" tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="AmecamecaCarnitasCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Amecameca(Carnitas)</h3>
															<span>Carnitas, cilantro-lime rice, black beans, lettuce, queso cheese and sour cream.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_3" class="form-horizontal"
																onsubmit="return populateFullMenuAmecamecaCarnitasSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20" name="AmecamecaCarnitasCount"
																		maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="AmecamecaCarnitasSpl"
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
										<!-- item end --><!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#MexicaliChicken"
											data-whatever="MexicaliChicken">
											<span>Mexicali (Chicken)</span> <br /> <span
												style="font-size: 12px;">Chicken, Mexican rice, sour cream, roasted sweet n' spicy corn, pico de gallo, pinto beans and guacamole with fresh salsa.</span>
										</button>
										<div class="modal fade" id="MexicaliChicken" tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="MexicaliChickenCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Mexicali (Chicken)</h3>
															<span>Chicken, Mexican rice, sour cream, roasted sweet n' spicy corn, pico de gallo, pinto beans and guacamole with fresh salsa.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_4" class="form-horizontal"
																onsubmit="return populateFullMenuMexicaliChickenSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20" name="MexicaliChickenCount"
																		maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="MexicaliChickenSpl"
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
										<!-- item end --><!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#MexicaliSteak"
											data-whatever="MexicaliSteak">
											<span>Mexicali (Steak)</span> <br /> <span
												style="font-size: 12px;">Steak, Mexican rice, sour cream, roasted sweet n' spicy corn, pico de gallo, pinto beans and guacamole with fresh salsa.</span>
										</button>
										<div class="modal fade" id="MexicaliSteak" tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="MexicaliSteakCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Mexicali (Steak)</h3>
															<span>Steak, Mexican rice, sour cream, roasted sweet n' spicy corn, pico de gallo, pinto beans and guacamole with fresh salsa.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_5" class="form-horizontal"
																onsubmit="return populateFullMenuMexicaliSteakSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20" name="MexicaliSteakCount"
																		maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="MexicaliSteakSpl"
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
										<!-- item end --><!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#MexicaliCarnitas"
											data-whatever="MexicaliCarnitas">
											<span>Mexicali (Carnitas)</span> <br /> <span
												style="font-size: 12px;">Carnitas, Mexican rice, sour cream, roasted sweet n' spicy corn, pico de gallo, pinto beans and guacamole with fresh salsa.</span>
										</button>
										<div class="modal fade" id="MexicaliCarnitas" tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="MexicaliCarnitasCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Mexicali (Carnitas)</h3>
															<span>Carnitas, Mexican rice, sour cream, roasted sweet n' spicy corn, pico de gallo, pinto beans and guacamole with fresh salsa.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_6" class="form-horizontal"
																onsubmit="return populateFullMenuMexicaliCarnitasSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20" name="MexicaliCarnitasCount"
																		maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="MexicaliCarnitasSpl"
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
										onclick="remove_chalupa_fresh_mexican_grill_item('m_${loop.index}');">X</span>
									<figure>${m.value}</figure>
								</div>
							</c:forEach>
						</div>
						<div class="pick-deliver">
							<div class="checkout">
								<form action="${pageContext.request.contextPath}/menu/saveMenu"
									id="chalupa_fresh_mexican_grill_target" method="post">
									<input type="hidden" name="full_menu_items"
										id="full_menu_items"> <input type="hidden"
										name="cuisineType" value="${menu.cuisine}">
									<textarea rows="4" cols="50" name="comments"
										placeholder="Enter your comments to restaurant here"
										class="form-control">${menu.comments}</textarea>
									<br />
									<!-- <button type="button" onclick="chalupa_fresh_mexican_grill_menu_submit();"
										class="btn btn-default">Next</button> -->
									<a href="javascript:chalupa_fresh_mexican_grill_menu_submit();">Next</a>
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
			chalupa_fresh_mexican_grill_menu_items.push(name + "+" + desc); //chalupa_fresh_mexican_grill_menu_items is in chalupa_fresh_mexican_grill_95670.js 
		});
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
					//marginTop : $(window).scrollTop() - offset.top + topPadding,
					marginTop : ($(window).scrollTop() - offset.top + topPadding)/4,
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
