<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
	function remove_firehouse_subs_item(div_id) {
		var divToRemove = $("div[id=" + div_id + "]");
		var name = divToRemove.children().children().prev().text();
		var desc = divToRemove.children().children().next().text();
		var data = name + "+" + desc;
		console.log("Removing " + data);
		firehouse_subs_menu_items.splice($.inArray(data,
				firehouse_subs_menu_items), 1);
		divToRemove.remove();
	}

	function firehouse_subs_menu_submit() {
		if (firehouse_subs_menu_items.length == 0) {
			alert("Please select at least 1 item to proceed.");
			return false;
		}
		console.log(firehouse_subs_menu_items);
		//console.log(JSON.stringify(firehouse_subs_menu_items));
		$("#full_menu_items").val(JSON.stringify(firehouse_subs_menu_items));
		$("#firehouse_subs_target").submit();
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
											data-toggle="modal"
											data-target="#FirehouseSaladGrilledChicken"
											data-whatever="FirehouseSaladGrilledChicken">
											<span>Firehouse Salad(Grilled Chicken)</span> <br /> <span
												style="font-size: 12px;">Grilled Chicken, dressing,
												Romaine, tomato, bell pepper, cucumber, mozzarella,
												pepperoncini, kalamata olives, and light Italian dressing.</span>
										</button>
										<div class="modal fade" id="FirehouseSaladGrilledChicken"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="FirehouseSaladGrilledChickenCloseBtn"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Firehouse Salad(Grilled Chicken)</h3>
															<span>Grilled Chicken, dressing, Romaine, tomato,
																bell pepper, cucumber, mozzarella, pepperoncini,
																kalamata olives, and light Italian dressing.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_1" class="form-horizontal"
																onsubmit="return populateFullMenuFirehouseSaladGrilledChickenSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="FirehouseSaladGrilledChickenCount"
																		maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="FirehouseSaladGrilledChickenSpl" maxlength="20">
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
											data-target="#ItalianwithGrilledChickenSalad"
											data-whatever="ItalianwithGrilledChickenSalad">
											<span>Italian with Grilled Chicken Salad</span> <br /> <span
												style="font-size: 12px;">Salami and grilled chicken
												breast, dressing, Romaine, tomato, bell pepper, cucumber,
												mozzarella, pepperoncini, kalamata olives, and light Italian
												dressing.</span>
										</button>
										<div class="modal fade" id="ItalianwithGrilledChickenSalad"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="ItalianwithGrilledChickenSaladCloseBtn"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Italian with Grilled Chicken Salad</h3>
															<span>Salami and grilled chicken breast, dressing,
																Romaine, tomato, bell pepper, cucumber, mozzarella,
																pepperoncini, kalamata olives, and light Italian
																dressing.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_2" class="form-horizontal"
																onsubmit="return populateFullMenuItalianwithGrilledChickenSaladSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="ItalianwithGrilledChickenSaladCount"
																		maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="ItalianwithGrilledChickenSaladSpl"
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
											data-toggle="modal" data-target="#HookandLadderSalad"
											data-whatever="HookandLadderSalad">
											<span>Hook and Ladder Salad</span> <br /> <span
												style="font-size: 12px;">Smoked turkey breast and
												virginia honey ham, dressing, Romaine, tomato, bell pepper,
												cucumber, mozzarella, pepperoncini, kalamata olives, and
												light Italian dressing.</span>
										</button>
										<div class="modal fade" id="HookandLadderSalad" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="HookandLadderSaladCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Hook and Ladder Salad</h3>
															<span>Smoked turkey breast and virginia honey ham,
																dressing, Romaine, tomato, bell pepper, cucumber,
																mozzarella, pepperoncini, kalamata olives, and light
																Italian dressing.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_3" class="form-horizontal"
																onsubmit="return populateFullMenuHookandLadderSaladSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="HookandLadderSaladCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="HookandLadderSaladSpl" maxlength="20">
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
											data-toggle="modal" data-target="#MommasHomemadeChickenSalad"
											data-whatever="MommasHomemadeChickenSalad">
											<span>Momma's Homemade Chicken Salad</span> <br /> <span
												style="font-size: 12px;">A scoop of chicken salad
												with pecans, dressing. Romaine, tomato, bell pepper,
												cucumber, mozzarella, pepperoncini, kalamata olives, and
												light Italian dressing.</span>
										</button>
										<div class="modal fade" id="MommasHomemadeChickenSalad"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="MommasHomemadeChickenSaladCloseBtn"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Momma's Homemade Chicken Salad</h3>
															<span>A scoop of chicken salad with pecans,
																dressing. Romaine, tomato, bell pepper, cucumber,
																mozzarella, pepperoncini, kalamata olives, and light
																Italian dressing.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_4" class="form-horizontal"
																onsubmit="return populateFullMenuMommasHomemadeChickenSaladSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="MommasHomemadeChickenSaladCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="MommasHomemadeChickenSaladSpl" maxlength="20">
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
						<div class="panel-group" id="accordion-Hot_Speciality_Subs"
							role="tablist" aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-Hot_Speciality_Subs"
										href="#Hot_Speciality_Subs" aria-expanded="true"
										aria-controls="Hot_Speciality_Subs"> Hot Speciality Subs </a>
								</div>
								<div id="Hot_Speciality_Subs" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#HookandLadderSandwich"
											data-whatever="HookandLadderSandwich">
											<span>Hook and Ladder Sandwich</span> <br /> <span
												style="font-size: 12px;">Smoked turkey breast,
												virginia honey ham, monterey jack, served fully involved.</span>
										</button>
										<div class="modal fade" id="HookandLadderSandwich"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="HookandLadderSandwichCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Hook and Ladder Sandwich</h3>
															<span>Smoked turkey breast, virginia honey ham,
																monterey jack, served fully involved.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_2_1" class="form-horizontal"
																onsubmit="return populateFullMenuHookandLadderSandwichSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="HookandLadderSandwichCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="HookandLadderSandwichSpl" maxlength="20">
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
											data-toggle="modal" data-target="#FirehouseMeatballSandwich"
											data-whatever="FirehouseMeatballSandwich">
											<span>Firehouse Meatball Sandwich</span> <br /> <span
												style="font-size: 12px;">Italian meatballs,
												provolone, zesty marinara, Italian seasonings.</span>
										</button>
										<div class="modal fade" id="FirehouseMeatballSandwich"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="FirehouseMeatballSandwichCloseBtn"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Firehouse Meatball Sandwich</h3>
															<span>Italian meatballs, provolone, zesty
																marinara, Italian seasonings.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_2_2" class="form-horizontal"
																onsubmit="return populateFullMenuFirehouseMeatballSandwichSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="FirehouseMeatballSandwichCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="FirehouseMeatballSandwichSpl" maxlength="20">
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
											data-toggle="modal" data-target="#NewYorkSteamerSandwich"
											data-whatever="NewYorkSteamerSandwich">
											<span>New York Steamer Sandwich</span> <br /> <span
												style="font-size: 12px;">USDA choice corned beef
												brisket, pastrami, provolone, deli mustard, mayo, Italian
												dressing. </span>
										</button>
										<div class="modal fade" id="NewYorkSteamerSandwich"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="NewYorkSteamerSandwichCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>New York Steamer Sandwich</h3>
															<span>USDA choice corned beef brisket, pastrami,
																provolone, deli mustard, mayo, Italian dressing. </span>
														</div>
														<div class="modal-desc">
															<form id="popup_2_3" class="form-horizontal"
																onsubmit="return populateFullMenuNewYorkSteamerSandwichSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="NewYorkSteamerSandwichCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="NewYorkSteamerSandwichSpl" maxlength="20">
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
											data-toggle="modal" data-target="#ItalianSandwich"
											data-whatever="ItalianSandwich">
											<span>Italian Sandwich</span> <br /> <span
												style="font-size: 12px;">Genoa salami, pepperoni,
												virginia honey ham, provolone, Italian dressing and
												seasonings, served fully involved.</span>
										</button>
										<div class="modal fade" id="ItalianSandwich" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="ItalianSandwichCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Italian Sandwich</h3>
															<span>Genoa salami, pepperoni, virginia honey ham,
																provolone, Italian dressing and seasonings, served fully
																involved.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_2_4" class="form-horizontal"
																onsubmit="return populateFullMenuItalianSandwichSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="ItalianSandwichCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ItalianSandwichSpl"
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
											data-toggle="modal" data-target="#TurkeyBaconRanchSandwich"
											data-whatever="TurkeyBaconRanchSandwich">
											<span>Turkey Bacon Ranch Sandwich</span> <br /> <span
												style="font-size: 12px;">Smoked turkey breast, bacon,
												cheddar, onion, lettuce, tomato, mayo, and creamy peppercorn
												ranch dressing.</span>
										</button>
										<div class="modal fade" id="TurkeyBaconRanchSandwich"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="TurkeyBaconRanchSandwichCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Turkey Bacon Ranch Sandwich</h3>
															<span>Smoked turkey breast, bacon, cheddar, onion,
																lettuce, tomato, mayo, and creamy peppercorn ranch
																dressing.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_2_5" class="form-horizontal"
																onsubmit="return populateFullMenuTurkeyBaconRanchSandwichSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="TurkeyBaconRanchSandwichCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="TurkeyBaconRanchSandwichSpl" maxlength="20">
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
											data-toggle="modal" data-target="#ClubonaSub"
											data-whatever="ClubonaSub">
											<span>Club on a Sub</span> <br /> <span
												style="font-size: 12px;">Smoked turkey breast,
												virginia honey ham, bacon, monterey jack, served fully
												involved.</span>
										</button>
										<div class="modal fade" id="ClubonaSub" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="ClubonaSubCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Club on a Sub</h3>
															<span>Smoked turkey breast, virginia honey ham,
																bacon, monterey jack, served fully involved.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_2_6" class="form-horizontal"
																onsubmit="return populateFullMenuClubonaSubSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="ClubonaSubCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ClubonaSubSpl"
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
											data-toggle="modal" data-target="#SteakandCheeseSandwich"
											data-whatever="SteakandCheeseSandwich">
											<span>Steak and Cheese Sandwich</span> <br /> <span
												style="font-size: 12px;">Sauteed USDA choice steak,
												provolone, sauteed peppers and onions, mayo, deli mustard.</span>
										</button>
										<div class="modal fade" id="SteakandCheeseSandwich"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="SteakandCheeseSandwichCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Steak and Cheese Sandwich</h3>
															<span>Sauteed USDA choice steak, provolone,
																sauteed peppers and onions, mayo, deli mustard.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_2_7" class="form-horizontal"
																onsubmit="return populateFullMenuSteakandCheeseSandwichSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="SteakandCheeseSandwichCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="SteakandCheeseSandwichSpl" maxlength="20">
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
											data-toggle="modal" data-target="#EngineerSandwich"
											data-whatever="EngineerSandwich">
											<span>Engineer Sandwich</span> <br /> <span
												style="font-size: 12px;">Smoked turkey breast, Swiss,
												sauteed mushrooms, served fully involved.</span>
										</button>
										<div class="modal fade" id="EngineerSandwich" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="EngineerSandwichCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Engineer Sandwich</h3>
															<span>Smoked turkey breast, Swiss, sauteed
																mushrooms, served fully involved.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_2_8" class="form-horizontal"
																onsubmit="return populateFullMenuEngineerSandwichSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="EngineerSandwichCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="EngineerSandwichSpl"
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
											data-toggle="modal" data-target="#FirehouseHero"
											data-whatever="FirehouseHero">
											<span>Firehouse Hero</span> <br /> <span
												style="font-size: 12px;">Usda choice roast beef,
												smoked turkey breast, virginia honey ham, provolone, served
												fully involved.</span>
										</button>
										<div class="modal fade" id="FirehouseHero" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="FirehouseHeroCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Firehouse Hero</h3>
															<span>Usda choice roast beef, smoked turkey
																breast, virginia honey ham, provolone, served fully
																involved.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_2_9" class="form-horizontal"
																onsubmit="return populateFullMenuFirehouseHeroSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="FirehouseHeroCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="FirehouseHeroSpl"
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
						<div class="panel-group" id="accordion-Hearty__Flavorfull_Sub"
							role="tablist" aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-Hearty__Flavorfull_Sub"
										href="#Hearty__Flavorfull_Sub" aria-expanded="true"
										aria-controls="Hearty__Flavorfull_Sub"> Hearty &
										Flavorfull Sub </a>
								</div>
								<div id="Hearty__Flavorfull_Sub"
									class="panel-collapse collapse in" role="tabpanel"
									aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#SrirachaBeefSub"
											data-whatever="SrirachaBeefSub">
											<span>Sriracha Beef Sub</span> <br /> <span
												style="font-size: 12px;">Hot USDA choice roast beef,
												monterey jack, spicy sriracha sauce, lettuce, tomato, onion.</span>
										</button>
										<div class="modal fade" id="SrirachaBeefSub" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="SrirachaBeefSubCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Sriracha Beef Sub</h3>
															<span>Hot USDA choice roast beef, monterey jack,
																spicy sriracha sauce, lettuce, tomato, onion.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_1" class="form-horizontal"
																onsubmit="return populateFullMenuSrirachaBeefSubSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="SrirachaBeefSubCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="SrirachaBeefSubSpl"
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
											data-target="#CaptSorensensDatilPepperGrilledChickenSub"
											data-whatever="CaptSorensensDatilPepperGrilledChickenSub">
											<span>Capt. Sorensen's Datil Pepper Grilled Chicken
												Sub</span> <br /> <span style="font-size: 12px;">Hot
												grilled chicken, monterey jack, Capt. Sorensen's Datil
												Pepper Sauce, lettuce, tomato, onion. </span>
										</button>
										<div class="modal fade"
											id="CaptSorensensDatilPepperGrilledChickenSub" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="CaptSorensensDatilPepperGrilledChickenSubCloseBtn"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Capt. Sorensen's Datil Pepper Grilled Chicken
																Sub</h3>
															<span>Hot grilled chicken, monterey jack, Capt.
																Sorensen's Datil Pepper Sauce, lettuce, tomato, onion. </span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_2" class="form-horizontal"
																onsubmit="return populateFullMenuCaptSorensensDatilPepperGrilledChickenSubSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="CaptSorensensDatilPepperGrilledChickenSubCount"
																		maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="CaptSorensensDatilPepperGrilledChickenSubSpl"
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
											data-toggle="modal" data-target="#HookandLaddarLightSub"
											data-whatever="HookandLaddarLightSub">
											<span>Hook and Laddar Light Sub</span> <br /> <span
												style="font-size: 12px;">Hot smoked turkey breast,
												virginia honey ham, monterey jack, lettuce, tomato, onion,
												deli mustard.</span>
										</button>
										<div class="modal fade" id="HookandLaddarLightSub"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="HookandLaddarLightSubCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Hook and Laddar Light Sub</h3>
															<span>Hot smoked turkey breast, virginia honey
																ham, monterey jack, lettuce, tomato, onion, deli
																mustard.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_3" class="form-horizontal"
																onsubmit="return populateFullMenuHookandLaddarLightSubSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="HookandLaddarLightSubCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="HookandLaddarLightSubSpl" maxlength="20">
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
											data-toggle="modal" data-target="#TurkeyandCranberrySub"
											data-whatever="TurkeyandCranberrySub">
											<span>Turkey and Cranberry Sub</span> <br /> <span
												style="font-size: 12px;">Hot smoked turkey breast,
												monterey jack, cranberry spread, lettuce, tomato, onion.</span>
										</button>
										<div class="modal fade" id="TurkeyandCranberrySub"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="TurkeyandCranberrySubCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Turkey and Cranberry Sub</h3>
															<span>Hot smoked turkey breast, monterey jack,
																cranberry spread, lettuce, tomato, onion.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_4" class="form-horizontal"
																onsubmit="return populateFullMenuTurkeyandCranberrySubSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="TurkeyandCranberrySubCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="TurkeyandCranberrySubSpl" maxlength="20">
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
											data-toggle="modal" data-target="#TurkeySalsaVerdeSub"
											data-whatever="TurkeySalsaVerdeSub">
											<span>Turkey Salsa Verde Sub</span> <br /> <span
												style="font-size: 12px;">Hot smoked turkey breast,
												monterey jack, salsa verde sauce, lettuce, tomato, onion.</span>
										</button>
										<div class="modal fade" id="TurkeySalsaVerdeSub" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="TurkeySalsaVerdeSubCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Turkey Salsa Verde Sub</h3>
															<span>Hot smoked turkey breast, monterey jack,
																salsa verde sauce, lettuce, tomato, onion.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_5" class="form-horizontal"
																onsubmit="return populateFullMenuTurkeySalsaVerdeSubSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="TurkeySalsaVerdeSubCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="TurkeySalsaVerdeSubSpl" maxlength="20">
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
											data-target="#MommasHomemadeChickenSaladSub"
											data-whatever="MommasHomemadeChickenSaladSub">
											<span>Momma's Homemade Chicken Salad Sub</span> <br /> <span
												style="font-size: 12px;">Chicken salad, pecans,
												swiss, tomato.</span>
										</button>
										<div class="modal fade" id="MommasHomemadeChickenSaladSub"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="MommasHomemadeChickenSaladSubCloseBtn"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Momma's Homemade Chicken Salad Sub</h3>
															<span>Chicken salad, pecans, swiss, tomato.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_6" class="form-horizontal"
																onsubmit="return populateFullMenuMommasHomemadeChickenSaladSubSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="MommasHomemadeChickenSaladSubCount"
																		maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="MommasHomemadeChickenSaladSubSpl" maxlength="20">
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
						<div class="panel-group" id="accordion-Sides" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-Sides" href="#Sides"
										aria-expanded="true" aria-controls="Sides"> Sides </a>
								</div>
								<div id="Sides" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#Cookie"
											data-whatever="Cookie">
											<span>Cookie</span> <br /> <span style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="Cookie" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="CookieCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Cookie</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_1" class="form-horizontal"
																onsubmit="return populateFullMenuCookieSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="CookieCount" maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="CookieSpl"
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
											data-toggle="modal" data-target="#Brownie"
											data-whatever="Brownie">
											<span>Brownie</span> <br /> <span style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="Brownie" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="BrownieCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Brownie</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_2" class="form-horizontal"
																onsubmit="return populateFullMenuBrownieSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="BrownieCount" maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="BrownieSpl"
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
											data-toggle="modal" data-target="#Doritosnachocheese"
											data-whatever="Doritosnachocheese">
											<span>Doritos nacho cheese </span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="Doritosnachocheese" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="DoritosnachocheeseCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Doritos nacho cheese</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_3" class="form-horizontal"
																onsubmit="return populateFullMenuDoritosnachocheeseSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="DoritosnachocheeseCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="DoritosnachocheeseSpl" maxlength="20">
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
											data-toggle="modal" data-target="#Doritoscoolranch"
											data-whatever="Doritoscoolranch">
											<span>Doritos cool ranch </span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="Doritoscoolranch" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="DoritoscoolranchCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Doritos cool ranch</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_4" class="form-horizontal"
																onsubmit="return populateFullMenuDoritoscoolranchSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="DoritoscoolranchCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="DoritoscoolranchSpl"
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
											data-toggle="modal" data-target="#Bakedlays"
											data-whatever="Bakedlays">
											<span>Baked lay's </span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="Bakedlays" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="BakedlaysCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Baked lay's</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_5" class="form-horizontal"
																onsubmit="return populateFullMenuBakedlaysSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="BakedlaysCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="BakedlaysSpl"
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
											data-toggle="modal" data-target="#Bakedlaysbarbecue"
											data-whatever="Bakedlaysbarbecue">
											<span>Baked lay's barbecue </span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="Bakedlaysbarbecue" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="BakedlaysbarbecueCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Baked lay's barbecue</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_6" class="form-horizontal"
																onsubmit="return populateFullMenuBakedlaysbarbecueSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="BakedlaysbarbecueCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="BakedlaysbarbecueSpl" maxlength="20">
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
											data-toggle="modal" data-target="#MrsVickiesjalapeno"
											data-whatever="MrsVickiesjalapeno">
											<span>Mrs. Vickies jalapeno </span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="MrsVickiesjalapeno" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="MrsVickiesjalapenoCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Mrs. Vickies jalapeno</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_7" class="form-horizontal"
																onsubmit="return populateFullMenuMrsVickiesjalapenoSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="MrsVickiesjalapenoCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="MrsVickiesjalapenoSpl" maxlength="20">
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
											data-toggle="modal" data-target="#Sunchips"
											data-whatever="Sunchips">
											<span>Sun chips.</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="Sunchips" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="SunchipsCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Sun chips.</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_8" class="form-horizontal"
																onsubmit="return populateFullMenuSunchipsSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" pattern="^\d+$"  min="1" size="20"
																		name="SunchipsCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="SunchipsSpl"
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
										onclick="remove_firehouse_subs_item('m_${loop.index}');">X</span>
									<figure>${m.value}</figure>
								</div>
							</c:forEach>
						</div>
						<div class="pick-deliver">
							<div class="checkout">
								<form action="${pageContext.request.contextPath}/menu/saveMenu"
									id="firehouse_subs_target" method="post">
									<input type="hidden" name="full_menu_items"
										id="full_menu_items"> <input type="hidden"
										name="cuisineType" value="${menu.cuisine}">
									<textarea rows="4" cols="50" name="comments"
										placeholder="Enter your comments to restaurant here"
										class="form-control">${menu.comments}</textarea>
									<br />
									<!-- <button type="button" onclick="firehouse_subs_menu_submit();"
										class="btn btn-default">Next</button> -->
									<a href="javascript:firehouse_subs_menu_submit();">Next</a>
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
			firehouse_subs_menu_items.push(name + "+" + desc); //firehouse_subs_menu_items is in firehouse_subs_95630.js 
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
