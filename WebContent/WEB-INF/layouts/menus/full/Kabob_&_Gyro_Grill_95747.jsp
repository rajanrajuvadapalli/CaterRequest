<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	function remove_kabob_and_gyro_grill_item(div_id) {
		var divToRemove = $("div[id=" + div_id + "]");
		var name = divToRemove.children().children().prev().text();
		var desc = divToRemove.children().children().next().text();
		var data = name + "+" + desc;
		console.log("Removing " + data);
		kabob_and_gyro_grill_menu_items.splice($.inArray(data,
				kabob_and_gyro_grill_menu_items), 1);
		divToRemove.remove();
	}

	function kabob_and_gyro_grill_menu_submit() {
		if (kabob_and_gyro_grill_menu_items.length == 0) {
			alert("Please select at least 1 item to proceed.");
			return false;
		}
		console.log(kabob_and_gyro_grill_menu_items);
		//console.log(JSON.stringify(kabob_and_gyro_grill_menu_items));
		$("#full_menu_items").val(
				JSON.stringify(kabob_and_gyro_grill_menu_items));
		$("#kabob_and_gyro_grill_target").submit();
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
											data-toggle="modal" data-target="#GreekSalad1"
											data-whatever="GreekSalad1">
											<span>Greek Salad</span> <br /> <span
												style="font-size: 12px;">Fresh Lettuce, Onions,
												Tomatoes, Bell Peppers, Topped with Feta Cheese, Lemon and
												Vinegar Juice and Olive Oil.</span>
										</button>
										<div class="modal fade" id="GreekSalad1" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="GreekSalad1CloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Greek Salad</h3>
															<span>Fresh Lettuce, Onions, Tomatoes, Bell
																Peppers, Topped with Feta Cheese, Lemon and Vinegar
																Juice and Olive Oil.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_1" class="form-horizontal"
																onsubmit="return populateFullMenuGreekSalad1SelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="GreekSalad1Count" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="GreekSalad1Spl"
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
											data-toggle="modal" data-target="#SteakSalad"
											data-whatever="SteakSalad">
											<span>Steak Salad</span> <br /> <span
												style="font-size: 12px;">Slices of marinated Steak
												and Fresh Lettuce, Onions, Tomatoes, Bell Peppers, Topped
												with Feta Cheese, Lemon and Vinegar Juice and Olive Oil. </span>
										</button>
										<div class="modal fade" id="SteakSalad" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="SteakSaladCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Steak Salad</h3>
															<span>Slices of marinated Steak and Fresh Lettuce,
																Onions, Tomatoes, Bell Peppers, Topped with Feta Cheese,
																Lemon and Vinegar Juice and Olive Oil. </span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_2" class="form-horizontal"
																onsubmit="return populateFullMenuSteakSaladSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="SteakSaladCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="SteakSaladSpl"
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
												style="font-size: 12px;">Slices of marinated Steak
												and Fresh Lettuce, Onions, Tomatoes, Bell Peppers, Topped
												with Feta Cheese, Lemon and Vinegar Juice and Olive Oil.</span>
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
															<span>Slices of marinated Steak and Fresh Lettuce,
																Onions, Tomatoes, Bell Peppers, Topped with Feta Cheese,
																Lemon and Vinegar Juice and Olive Oil.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_3" class="form-horizontal"
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
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#CombinationSalad"
											data-whatever="CombinationSalad">
											<span>Combination Salad</span> <br /> <span
												style="font-size: 12px;">Slices of marinated Steak
												and Chicken and Fresh Lettuce, Onions, Tomatoes, Bell
												Peppers, Topped with Feta Cheese, Lemon and Vinegar Juice
												and Olive Oil.</span>
										</button>
										<div class="modal fade" id="CombinationSalad" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="CombinationSaladCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Combination Salad</h3>
															<span>Slices of marinated Steak and Chicken and
																Fresh Lettuce, Onions, Tomatoes, Bell Peppers, Topped
																with Feta Cheese, Lemon and Vinegar Juice and Olive Oil.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_4" class="form-horizontal"
																onsubmit="return populateFullMenuCombinationSaladSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="CombinationSaladCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="CombinationSaladSpl"
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
						<div class="panel-group" id="accordion-Gyros" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-Gyros" href="#Gyros"
										aria-expanded="true" aria-controls="Gyros"> Gyros </a>
								</div>
								<div id="Gyros" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#ChickenGyros"
											data-whatever="ChickenGyros">
											<span>Chicken Gyros</span> <br /> <span
												style="font-size: 12px;">All Gyros dishes are topped
												with Fresh Lettuce, Onions, Tomatoes and Cucumber sauce
												served on Hot Pita bread with thin marinated slices of
												Chicken.</span>
										</button>
										<div class="modal fade" id="ChickenGyros" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="ChickenGyrosCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chicken Gyros</h3>
															<span>All Gyros dishes are topped with Fresh
																Lettuce, Onions, Tomatoes and Cucumber sauce served on
																Hot Pita bread with thin marinated slices of Chicken.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_2_1" class="form-horizontal"
																onsubmit="return populateFullMenuChickenGyrosSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="ChickenGyrosCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ChickenGyrosSpl"
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
											data-toggle="modal" data-target="#SteakGyros"
											data-whatever="SteakGyros">
											<span>Steak Gyros</span> <br /> <span
												style="font-size: 12px;">All Gyros dishes are topped
												with Fresh Lettuce, Onions, Tomatoes and Cucumber sauce
												served on Hot Pita bread with thin marinated slices of
												Steak.</span>
										</button>
										<div class="modal fade" id="SteakGyros" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="SteakGyrosCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Steak Gyros</h3>
															<span>All Gyros dishes are topped with Fresh
																Lettuce, Onions, Tomatoes and Cucumber sauce served on
																Hot Pita bread with thin marinated slices of Steak.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_2_2" class="form-horizontal"
																onsubmit="return populateFullMenuSteakGyrosSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="SteakGyrosCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="SteakGyrosSpl"
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
											data-toggle="modal" data-target="#MixedGyrosChickenSteak"
											data-whatever="MixedGyrosChickenSteak">
											<span>Mixed Gyros(Chicken &amp; Steak)</span> <br /> <span
												style="font-size: 12px;">All Gyros dishes are topped
												with Fresh Lettuce, Onions, Tomatoes and Cucumber sauce
												served on Hot Pita bread with thin marinated slices of
												Chicken and Steak.</span>
										</button>
										<div class="modal fade" id="MixedGyrosChickenSteak"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="MixedGyrosChickenSteakCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Mixed Gyros(Chicken &amp; Steak)</h3>
															<span>All Gyros dishes are topped with Fresh
																Lettuce, Onions, Tomatoes and Cucumber sauce served on
																Hot Pita bread with thin marinated slices of Chicken and
																Steak.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_2_3" class="form-horizontal"
																onsubmit="return populateFullMenuMixedGyrosChickenSteakSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="MixedGyrosChickenSteakCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="MixedGyrosChickenSteakSpl" maxlength="20">
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
											data-toggle="modal" data-target="#VeggieGyros"
											data-whatever="VeggieGyros">
											<span>Veggie Gyros</span> <br /> <span
												style="font-size: 12px;">All Gyros dishes are topped
												with Fresh Lettuce, Onions, Tomatoes and Cucumber sauce
												served on Hot Pita bread with smashed Falafels.</span>
										</button>
										<div class="modal fade" id="VeggieGyros" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="VeggieGyrosCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Veggie Gyros</h3>
															<span>All Gyros dishes are topped with Fresh
																Lettuce, Onions, Tomatoes and Cucumber sauce served on
																Hot Pita bread with smashed Falafels.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_2_4" class="form-horizontal"
																onsubmit="return populateFullMenuVeggieGyrosSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="VeggieGyrosCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="VeggieGyrosSpl"
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
						<div class="panel-group" id="accordion-Kabobs" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-Kabobs" href="#Kabobs"
										aria-expanded="true" aria-controls="Kabobs"> Kabobs </a>
								</div>
								<div id="Kabobs" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#BeefKabob1"
											data-whatever="BeefKabob1">
											<span>Beef Kabob</span> <br /> <span
												style="font-size: 12px;">Two skewers of marinated
												Beef cooked over fire. All Kabob dishes come with onions and
												tomatoes served over Basmati rice with a side salad, side of
												Hummus, cucumber sause with a hot pita bread.</span>
										</button>
										<div class="modal fade" id="BeefKabob1" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="BeefKabob1CloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Beef Kabob</h3>
															<span>Two skewers of marinated Beef cooked over
																fire. All Kabob dishes come with onions and tomatoes
																served over Basmati rice with a side salad, side of
																Hummus, cucumber sause with a hot pita bread.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_1" class="form-horizontal"
																onsubmit="return populateFullMenuBeefKabob1SelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="BeefKabob1Count" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="BeefKabob1Spl"
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
											data-toggle="modal" data-target="#ChickenKabob1"
											data-whatever="ChickenKabob1">
											<span>Chicken Kabob</span> <br /> <span
												style="font-size: 12px;">Two skewers of marinated
												Chicken cooked over fire. All Kabob dishes come with onions
												and tomatoes served over Basmati rice with a side salad,
												side of Hummus, cucumber sause with a hot pita bread.</span>
										</button>
										<div class="modal fade" id="ChickenKabob1" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="ChickenKabob1CloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chicken Kabob</h3>
															<span>Two skewers of marinated Chicken cooked over
																fire. All Kabob dishes come with onions and tomatoes
																served over Basmati rice with a side salad, side of
																Hummus, cucumber sause with a hot pita bread.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_2" class="form-horizontal"
																onsubmit="return populateFullMenuChickenKabob1SelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="ChickenKabob1Count" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ChickenKabob1Spl"
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
											data-toggle="modal" data-target="#LambKabob1"
											data-whatever="LambKabob1">
											<span>Lamb Kabob</span> <br /> <span
												style="font-size: 12px;">Two skewers of marinated
												Lamb cooked over fire. All Kabob dishes come with onions and
												tomatoes served over Basmati rice with a side salad, side of
												Hummus, cucumber sause with a hot pita bread.</span>
										</button>
										<div class="modal fade" id="LambKabob1" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="LambKabob1CloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Lamb Kabob</h3>
															<span>Two skewers of marinated Lamb cooked over
																fire. All Kabob dishes come with onions and tomatoes
																served over Basmati rice with a side salad, side of
																Hummus, cucumber sause with a hot pita bread.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_3" class="form-horizontal"
																onsubmit="return populateFullMenuLambKabob1SelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="LambKabob1Count" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="LambKabob1Spl"
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
											data-target="#CombinationKabobChickenandLambBeef"
											data-whatever="CombinationKabobChickenandLambBeef">
											<span>Combination Kabob (Chicken and Lamb/Beef)</span> <br />
											<span style="font-size: 12px;">One skewer of marinated
												Chicken and One skewer of Lamb or Beef cooked over fire. All
												Kabob dishes come with onions and tomatoes served over
												Basmati rice with a side salad, side of Hummus, cucumber
												sause with a hot pita bread.</span>
										</button>
										<div class="modal fade"
											id="CombinationKabobChickenandLambBeef" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="CombinationKabobChickenandLambBeefCloseBtn"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Combination Kabob (Chicken and Lamb/Beef)</h3>
															<span>One skewer of marinated Chicken and One
																skewer of Lamb or Beef cooked over fire. All Kabob
																dishes come with onions and tomatoes served over Basmati
																rice with a side salad, side of Hummus, cucumber sause
																with a hot pita bread.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_4" class="form-horizontal"
																onsubmit="return populateFullMenuCombinationKabobChickenandLambBeefSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="CombinationKabobChickenandLambBeefCount"
																		maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="CombinationKabobChickenandLambBeefSpl"
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
											data-toggle="modal" data-target="#ChappaliKabob"
											data-whatever="ChappaliKabob">
											<span>Chappali Kabob</span> <br /> <span
												style="font-size: 12px;">Two Ground Beef patties
												marinated over Mediterranean spices. All Kabob dishes come
												with onions and tomatoes served over Basmati rice with a
												side salad, side of Hummus, cucumber sause with a hot pita
												bread.</span>
										</button>
										<div class="modal fade" id="ChappaliKabob" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="ChappaliKabobCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chappali Kabob</h3>
															<span>Two Ground Beef patties marinated over
																Mediterranean spices. All Kabob dishes come with onions
																and tomatoes served over Basmati rice with a side salad,
																side of Hummus, cucumber sause with a hot pita bread.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_5" class="form-horizontal"
																onsubmit="return populateFullMenuChappaliKabobSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="ChappaliKabobCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ChappaliKabobSpl"
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
											data-toggle="modal" data-target="#Hummus"
											data-whatever="Hummus">
											<span>Hummus</span> <br /> <span style="font-size: 12px;">Garbanzo
												beans, Olive oil, Tahineh Sause, topped with fresh chopped
												Parsley.</span>
										</button>
										<div class="modal fade" id="Hummus" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="HummusCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Hummus</h3>
															<span>Garbanzo beans, Olive oil, Tahineh Sause,
																topped with fresh chopped Parsley.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_1" class="form-horizontal"
																onsubmit="return populateFullMenuHummusSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="HummusCount" maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="HummusSpl"
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
											data-toggle="modal" data-target="#Falafel"
											data-whatever="Falafel">
											<span>Falafel</span> <br /> <span style="font-size: 12px;">Beans
												mixed with Onions, Cilantro, Parsley and Mediterranean
												spices.</span>
										</button>
										<div class="modal fade" id="Falafel" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="FalafelCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Falafel</h3>
															<span>Beans mixed with Onions, Cilantro, Parsley
																and Mediterranean spices.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_2" class="form-horizontal"
																onsubmit="return populateFullMenuFalafelSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="FalafelCount" maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="FalafelSpl"
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
										onclick="remove_kabob_and_gyro_grill_item('m_${loop.index}');">X</span>
									<figure>${m.value}</figure>
								</div>
							</c:forEach>
						</div>
						<div class="pick-deliver">
							<div class="checkout">
								<form action="${pageContext.request.contextPath}/menu/saveMenu"
									id="kabob_and_gyro_grill_target" method="post">
									<input type="hidden" name="full_menu_items"
										id="full_menu_items"> <input type="hidden"
										name="cuisineType" value="${menu.cuisine}">
									<textarea rows="4" cols="50" name="comments"
										placeholder="Enter your comments to restaurant here"
										class="form-control">${menu.comments}</textarea>
									<br />
									<!-- <button type="button" onclick="kabob_and_gyro_grill_menu_submit();"
										class="btn btn-default">Next</button> -->
									<a href="javascript:kabob_and_gyro_grill_menu_submit();">Next</a>
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
			kabob_and_gyro_grill_menu_items.push(name + "+" + desc); //kabob_and_gyro_grill_menu_items is in kabob_&_gyro_grill_95747.js 
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
