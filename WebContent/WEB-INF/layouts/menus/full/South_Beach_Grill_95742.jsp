<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	function remove_south_beach_grill_item(div_id) {
		var divToRemove = $("div[id=" + div_id + "]");
		var name = divToRemove.children().children().prev().text();
		var desc = divToRemove.children().children().next().text();
		var data = name + "+" + desc;
		console.log("Removing " + data);
		south_beach_grill_menu_items.splice($.inArray(data,
				south_beach_grill_menu_items), 1);
		divToRemove.remove();
	}

	function south_beach_grill_menu_submit() {
		if (south_beach_grill_menu_items.length == 0) {
			alert("Please select at least 1 item to proceed.");
			return false;
		}
		console.log(south_beach_grill_menu_items);
		//console.log(JSON.stringify(south_beach_grill_menu_items));
		$("#full_menu_items").val(JSON.stringify(south_beach_grill_menu_items));
		$("#south_beach_grill_target").submit();
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
						<div class="panel-group" id="accordion-All_American_Hamburgers"
							role="tablist" aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-All_American_Hamburgers"
										href="#All_American_Hamburgers" aria-expanded="true"
										aria-controls="All_American_Hamburgers"> All American
										Hamburgers </a>
								</div>
								<div id="All_American_Hamburgers"
									class="panel-collapse collapse in" role="tabpanel"
									aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal"
											data-target="#SouthBeachBaconBurgerwithFries"
											data-whatever="SouthBeachBaconBurgerwithFries">
											<span>South Beach Bacon Burger with Fries</span> <br /> <span
												style="font-size: 12px;">1/3 100% certified Ground
												Chuck beef blended , grilled onions, cheese, and lettuce.
												Served with fries.</span>
										</button>
										<div class="modal fade" id="SouthBeachBaconBurgerwithFries"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="SouthBeachBaconBurgerwithFriesCloseBtn"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>South Beach Bacon Burger with Fries</h3>
															<span>1/3 100% certified Ground Chuck beef blended
																, grilled onions, cheese, and lettuce. Served with
																fries.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_1" class="form-horizontal"
																onsubmit="return populateFullMenuSouthBeachBaconBurgerwithFriesSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="SouthBeachBaconBurgerwithFriesCount"
																		maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="SouthBeachBaconBurgerwithFriesSpl"
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
											data-target="#SouthBeachBaconBurgerwithSalad"
											data-whatever="SouthBeachBaconBurgerwithSalad">
											<span>South Beach Bacon Burger with Salad</span> <br /> <span
												style="font-size: 12px;">1/3 100% certified Ground
												Chuck beef blended , grilled onions, cheese, and lettuce.
												Served with green salad.</span>
										</button>
										<div class="modal fade" id="SouthBeachBaconBurgerwithSalad"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="SouthBeachBaconBurgerwithSaladCloseBtn"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>South Beach Bacon Burger with Salad</h3>
															<span>1/3 100% certified Ground Chuck beef blended
																, grilled onions, cheese, and lettuce. Served with green
																salad.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_2" class="form-horizontal"
																onsubmit="return populateFullMenuSouthBeachBaconBurgerwithSaladSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="SouthBeachBaconBurgerwithSaladCount"
																		maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="SouthBeachBaconBurgerwithSaladSpl"
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
											data-toggle="modal" data-target="#BigMamaBurgerwithFries"
											data-whatever="BigMamaBurgerwithFries">
											<span>Big Mama Burger with Fries</span> <br /> <span
												style="font-size: 12px;">2 -1/3 lb 100%CERTIFIED
												Angus Ground Chuck patties, grilled onions, cheese, and leu
												Cheese Crumble lettuce, tomatoes, applewood smoked bacon,
												and special sauce. Served with Fries.</span>
										</button>
										<div class="modal fade" id="BigMamaBurgerwithFries"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="BigMamaBurgerwithFriesCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Big Mama Burger with Fries</h3>
															<span>2 -1/3 lb 100%CERTIFIED Angus Ground Chuck
																patties, grilled onions, cheese, and leu Cheese Crumble
																lettuce, tomatoes, applewood smoked bacon, and special
																sauce. Served with Fries.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_3" class="form-horizontal"
																onsubmit="return populateFullMenuBigMamaBurgerwithFriesSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="BigMamaBurgerwithFriesCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="BigMamaBurgerwithFriesSpl" maxlength="20">
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
											data-toggle="modal" data-target="#BigMamaBurgerwithSalad"
											data-whatever="BigMamaBurgerwithSalad">
											<span>Big Mama Burger with Salad</span> <br /> <span
												style="font-size: 12px;">2 -1/3 lb 100%CERTIFIED
												Angus Ground Chuck patties, grilled onions, cheese, and leu
												Cheese Crumble lettuce, tomatoes, applewood smoked bacon,
												and special sauce. Served with Salad.</span>
										</button>
										<div class="modal fade" id="BigMamaBurgerwithSalad"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="BigMamaBurgerwithSaladCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Big Mama Burger with Salad</h3>
															<span>2 -1/3 lb 100%CERTIFIED Angus Ground Chuck
																patties, grilled onions, cheese, and leu Cheese Crumble
																lettuce, tomatoes, applewood smoked bacon, and special
																sauce. Served with Salad.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_4" class="form-horizontal"
																onsubmit="return populateFullMenuBigMamaBurgerwithSaladSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="BigMamaBurgerwithSaladCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="BigMamaBurgerwithSaladSpl" maxlength="20">
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
											data-toggle="modal" data-target="#MimisBurgerwithFries"
											data-whatever="MimisBurgerwithFries">
											<span>Mimi's Burger with Fries</span> <br /> <span
												style="font-size: 12px;">Grilled onions, cheese,
												lettuce, applewood smoked bacon, pickles, and special sauce.
												Served with Fries.</span>
										</button>
										<div class="modal fade" id="MimisBurgerwithFries"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="MimisBurgerwithFriesCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Mimi's Burger with Fries</h3>
															<span>Grilled onions, cheese, lettuce, applewood
																smoked bacon, pickles, and special sauce. Served with
																Fries.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_5" class="form-horizontal"
																onsubmit="return populateFullMenuMimisBurgerwithFriesSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="MimisBurgerwithFriesCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="MimisBurgerwithFriesSpl" maxlength="20">
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
											data-toggle="modal" data-target="#MimisBurgerwithSalad"
											data-whatever="MimisBurgerwithSalad">
											<span>Mimi's Burger with Salad</span> <br /> <span
												style="font-size: 12px;">Grilled onions, cheese,
												lettuce, applewood smoked bacon, pickles, and special sauce.
												Served with Salad.</span>
										</button>
										<div class="modal fade" id="MimisBurgerwithSalad"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="MimisBurgerwithSaladCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Mimi's Burger with Salad</h3>
															<span>Grilled onions, cheese, lettuce, applewood
																smoked bacon, pickles, and special sauce. Served with
																Salad.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_6" class="form-horizontal"
																onsubmit="return populateFullMenuMimisBurgerwithSaladSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="MimisBurgerwithSaladCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="MimisBurgerwithSaladSpl" maxlength="20">
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
											data-toggle="modal" data-target="#IlisBurger"
											data-whatever="IlisBurger">
											<span>Ili's Burger</span> <br /> <span
												style="font-size: 12px;">Served with cheese, fresh
												avocado, and special sauce.</span>
										</button>
										<div class="modal fade" id="IlisBurger" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="IlisBurgerCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Ili's Burger</h3>
															<span>Served with cheese, fresh avocado, and
																special sauce.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_7" class="form-horizontal"
																onsubmit="return populateFullMenuIlisBurgerSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="IlisBurgerCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="IlisBurgerSpl"
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
											data-toggle="modal" data-target="#DomainBurgerlb"
											data-whatever="DomainBurgerlb">
											<span>Domain Burger 1/3 lb</span> <br /> <span
												style="font-size: 12px;">Served with cheese, fresh
												avocado, and special sauce.</span>
										</button>
										<div class="modal fade" id="DomainBurgerlb" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="DomainBurgerlbCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Domain Burger 1/3 lb</h3>
															<span>Served with cheese, fresh avocado, and
																special sauce.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_1_8" class="form-horizontal"
																onsubmit="return populateFullMenuDomainBurgerlbSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="DomainBurgerlbCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="DomainBurgerlbSpl"
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
						<div class="panel-group" id="accordion-Authentic_Mexican_Dishes"
							role="tablist" aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-Authentic_Mexican_Dishes"
										href="#Authentic_Mexican_Dishes" aria-expanded="true"
										aria-controls="Authentic_Mexican_Dishes"> Authentic
										Mexican Dishes </a>
								</div>
								<div id="Authentic_Mexican_Dishes"
									class="panel-collapse collapse in" role="tabpanel"
									aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#JuicyCarneAsada"
											data-whatever="JuicyCarneAsada">
											<span>Juicy Carne Asada</span> <br /> <span
												style="font-size: 12px;">2 Beach Tacos on corn
												tortillas served with Beans and Rice, Onions, Cilantro and
												Fresh Green Salsa.</span>
										</button>
										<div class="modal fade" id="JuicyCarneAsada" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="JuicyCarneAsadaCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Juicy Carne Asada</h3>
															<span>2 Beach Tacos on corn tortillas served with
																Beans and Rice, Onions, Cilantro and Fresh Green Salsa.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_2_1" class="form-horizontal"
																onsubmit="return populateFullMenuJuicyCarneAsadaSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="JuicyCarneAsadaCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="JuicyCarneAsadaSpl"
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
											data-toggle="modal" data-target="#SavoryCarnitas"
											data-whatever="SavoryCarnitas">
											<span>Savory Carnitas</span> <br /> <span
												style="font-size: 12px;">2 Beach Tacos on corn
												tortillas served with Beans and Rice, Carnitas, Onions,
												Cilantro and Delicious Ranch based Sause.</span>
										</button>
										<div class="modal fade" id="SavoryCarnitas" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="SavoryCarnitasCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Savory Carnitas</h3>
															<span>2 Beach Tacos on corn tortillas served with
																Beans and Rice, Carnitas, Onions, Cilantro and Delicious
																Ranch based Sause.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_2_2" class="form-horizontal"
																onsubmit="return populateFullMenuSavoryCarnitasSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="SavoryCarnitasCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="SavoryCarnitasSpl"
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
											data-toggle="modal" data-target="#TenderChicken"
											data-whatever="TenderChicken">
											<span>Tender Chicken</span> <br /> <span
												style="font-size: 12px;">2 Beach Tacos on corn
												tortillas served with Beans and Rice, Grilled Chicken,
												Onions, Cilantro and Delicious Ranch based Sause.</span>
										</button>
										<div class="modal fade" id="TenderChicken" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="TenderChickenCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Tender Chicken</h3>
															<span>2 Beach Tacos on corn tortillas served with
																Beans and Rice, Grilled Chicken, Onions, Cilantro and
																Delicious Ranch based Sause.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_2_3" class="form-horizontal"
																onsubmit="return populateFullMenuTenderChickenSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="TenderChickenCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="TenderChickenSpl"
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
											data-toggle="modal" data-target="#BeerBatteredCod"
											data-whatever="BeerBatteredCod">
											<span>Beer Battered Cod</span> <br /> <span
												style="font-size: 12px;">2 Beach Tacos on corn
												tortillas served with Beans and Rice, Fried Beer Battered
												Cod, House Sauce and Pico De Gallo.</span>
										</button>
										<div class="modal fade" id="BeerBatteredCod" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="BeerBatteredCodCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Beer Battered Cod</h3>
															<span>2 Beach Tacos on corn tortillas served with
																Beans and Rice, Fried Beer Battered Cod, House Sauce and
																Pico De Gallo.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_2_4" class="form-horizontal"
																onsubmit="return populateFullMenuBeerBatteredCodSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="BeerBatteredCodCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="BeerBatteredCodSpl"
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
						<div class="panel-group" id="accordion-Special_Plates"
							role="tablist" aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-Special_Plates" href="#Special_Plates"
										aria-expanded="true" aria-controls="Special_Plates">
										Special Plates </a>
								</div>
								<div id="Special_Plates" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#BurritoGrandeCarneAsada"
											data-whatever="BurritoGrandeCarneAsada">
											<span>Burrito Grande (Carne Asada)</span> <br /> <span
												style="font-size: 12px;">Carne Asada with Beans and
												Rice, Cheese, Sour Cream, Salsa, Guacamole and Pico De
												Gallo.</span>
										</button>
										<div class="modal fade" id="BurritoGrandeCarneAsada"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="BurritoGrandeCarneAsadaCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Burrito Grande (Carne Asada)</h3>
															<span>Carne Asada with Beans and Rice, Cheese,
																Sour Cream, Salsa, Guacamole and Pico De Gallo.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_1" class="form-horizontal"
																onsubmit="return populateFullMenuBurritoGrandeCarneAsadaSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="BurritoGrandeCarneAsadaCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="BurritoGrandeCarneAsadaSpl" maxlength="20">
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
											data-toggle="modal" data-target="#BurritoGrandeCarnitas"
											data-whatever="BurritoGrandeCarnitas">
											<span>Burrito Grande (Carnitas)</span> <br /> <span
												style="font-size: 12px;">Carnitas with Beans and
												Rice, Cheese, Sour Cream, Salsa, Guacamole and Pico De
												Gallo.</span>
										</button>
										<div class="modal fade" id="BurritoGrandeCarnitas"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="BurritoGrandeCarnitasCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Burrito Grande (Carnitas)</h3>
															<span>Carnitas with Beans and Rice, Cheese, Sour
																Cream, Salsa, Guacamole and Pico De Gallo.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_2" class="form-horizontal"
																onsubmit="return populateFullMenuBurritoGrandeCarnitasSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="BurritoGrandeCarnitasCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="BurritoGrandeCarnitasSpl" maxlength="20">
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
											data-toggle="modal" data-target="#BurritoGrandeChicken"
											data-whatever="BurritoGrandeChicken">
											<span>Burrito Grande (Chicken)</span> <br /> <span
												style="font-size: 12px;">Chicken with Beans and Rice,
												Cheese, Sour Cream, Salsa, Guacamole and Pico De Gallo.</span>
										</button>
										<div class="modal fade" id="BurritoGrandeChicken"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="BurritoGrandeChickenCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Burrito Grande (Chicken)</h3>
															<span>Chicken with Beans and Rice, Cheese, Sour
																Cream, Salsa, Guacamole and Pico De Gallo.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_3" class="form-horizontal"
																onsubmit="return populateFullMenuBurritoGrandeChickenSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="BurritoGrandeChickenCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="BurritoGrandeChickenSpl" maxlength="20">
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
											data-toggle="modal" data-target="#BurritoGrandeNoMeat"
											data-whatever="BurritoGrandeNoMeat">
											<span>Burrito Grande (No Meat)</span> <br /> <span
												style="font-size: 12px;">Beans and Rice, Cheese, Sour
												Cream, Salsa, Guacamole and Pico De Gallo.</span>
										</button>
										<div class="modal fade" id="BurritoGrandeNoMeat" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="BurritoGrandeNoMeatCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Burrito Grande (No Meat)</h3>
															<span>Beans and Rice, Cheese, Sour Cream, Salsa,
																Guacamole and Pico De Gallo.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_4" class="form-horizontal"
																onsubmit="return populateFullMenuBurritoGrandeNoMeatSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="BurritoGrandeNoMeatCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="BurritoGrandeNoMeatSpl" maxlength="20">
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
											data-toggle="modal" data-target="#CarneAsadaFries"
											data-whatever="CarneAsadaFries">
											<span>Carne Asada Fries</span> <br /> <span
												style="font-size: 12px;">Fries topped with Juicy
												Carne Asada, Sour Cream, Cheese, Guacamole and Pico De
												Gallo.</span>
										</button>
										<div class="modal fade" id="CarneAsadaFries" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="CarneAsadaFriesCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Carne Asada Fries</h3>
															<span>Fries topped with Juicy Carne Asada, Sour
																Cream, Cheese, Guacamole and Pico De Gallo.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_3_5" class="form-horizontal"
																onsubmit="return populateFullMenuCarneAsadaFriesSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="CarneAsadaFriesCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="CarneAsadaFriesSpl"
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
						<div class="panel-group" id="accordion-Entree_Plates"
							role="tablist" aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-Entree_Plates" href="#Entree_Plates"
										aria-expanded="true" aria-controls="Entree_Plates"> Entree
										Plates </a>
								</div>
								<div id="Entree_Plates" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal"
											data-target="#CarneAsadaPlateCornTortilla"
											data-whatever="CarneAsadaPlateCornTortilla">
											<span>Carne Asada Plate(Corn Tortilla)</span> <br /> <span
												style="font-size: 12px;">Served with Rice, Beans,
												Grilled Jalapeno, Grilled Mexican Onions and Corn Tortilla.</span>
										</button>
										<div class="modal fade" id="CarneAsadaPlateCornTortilla"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="CarneAsadaPlateCornTortillaCloseBtn"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Carne Asada Plate(Corn Tortilla)</h3>
															<span>Served with Rice, Beans, Grilled Jalapeno,
																Grilled Mexican Onions and Corn Tortilla.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_1" class="form-horizontal"
																onsubmit="return populateFullMenuCarneAsadaPlateCornTortillaSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="CarneAsadaPlateCornTortillaCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="CarneAsadaPlateCornTortillaSpl" maxlength="20">
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
											data-target="#CarneAsadaPlateFlourTortilla"
											data-whatever="CarneAsadaPlateFlourTortilla">
											<span>Carne Asada Plate(Flour Tortilla)</span> <br /> <span
												style="font-size: 12px;">Served with Rice, Beans,
												Grilled Jalapeno, Grilled Mexican Onions and Flour Tortilla.</span>
										</button>
										<div class="modal fade" id="CarneAsadaPlateFlourTortilla"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="CarneAsadaPlateFlourTortillaCloseBtn"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Carne Asada Plate(Flour Tortilla)</h3>
															<span>Served with Rice, Beans, Grilled Jalapeno,
																Grilled Mexican Onions and Flour Tortilla.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_2" class="form-horizontal"
																onsubmit="return populateFullMenuCarneAsadaPlateFlourTortillaSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="CarneAsadaPlateFlourTortillaCount"
																		maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="CarneAsadaPlateFlourTortillaSpl" maxlength="20">
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
											data-toggle="modal" data-target="#CarnitasPlateCornTortilla"
											data-whatever="CarnitasPlateCornTortilla">
											<span>Carnitas Plate(Corn Tortilla)</span> <br /> <span
												style="font-size: 12px;">Served with Rice, Beans,
												Grilled Jalapeno, Grilled Mexican Onions and Corn Tortilla.</span>
										</button>
										<div class="modal fade" id="CarnitasPlateCornTortilla"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="CarnitasPlateCornTortillaCloseBtn"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Carnitas Plate(Corn Tortilla)</h3>
															<span>Served with Rice, Beans, Grilled Jalapeno,
																Grilled Mexican Onions and Corn Tortilla.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_3" class="form-horizontal"
																onsubmit="return populateFullMenuCarnitasPlateCornTortillaSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="CarnitasPlateCornTortillaCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="CarnitasPlateCornTortillaSpl" maxlength="20">
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
											data-toggle="modal" data-target="#CarnitasPlateFlourTortilla"
											data-whatever="CarnitasPlateFlourTortilla">
											<span>Carnitas Plate(Flour Tortilla)</span> <br /> <span
												style="font-size: 12px;">Served with Rice, Beans,
												Grilled Jalapeno, Grilled Mexican Onions and Flour Tortilla.</span>
										</button>
										<div class="modal fade" id="CarnitasPlateFlourTortilla"
											tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="CarnitasPlateFlourTortillaCloseBtn"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Carnitas Plate(Flour Tortilla)</h3>
															<span>Served with Rice, Beans, Grilled Jalapeno,
																Grilled Mexican Onions and Flour Tortilla.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_4_4" class="form-horizontal"
																onsubmit="return populateFullMenuCarnitasPlateFlourTortillaSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="CarnitasPlateFlourTortillaCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="CarnitasPlateFlourTortillaSpl" maxlength="20">
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
											data-toggle="modal" data-target="#GrilledChickenSalad"
											data-whatever="GrilledChickenSalad">
											<span>Grilled Chicken Salad</span> <br /> <span
												style="font-size: 12px;">Spring Mix, Grilled Chicken,
												Tomato, Cucumber, Red Onion, Cheese and Croutons.</span>
										</button>
										<div class="modal fade" id="GrilledChickenSalad" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="GrilledChickenSaladCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Grilled Chicken Salad</h3>
															<span>Spring Mix, Grilled Chicken, Tomato,
																Cucumber, Red Onion, Cheese and Croutons.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_5_1" class="form-horizontal"
																onsubmit="return populateFullMenuGrilledChickenSaladSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="GrilledChickenSaladCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="GrilledChickenSaladSpl" maxlength="20">
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
											data-toggle="modal" data-target="#CaesarSalad"
											data-whatever="CaesarSalad">
											<span>Caesar Salad</span> <br /> <span
												style="font-size: 12px;">Romaine, Cheese, Croutons.</span>
										</button>
										<div class="modal fade" id="CaesarSalad" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="CaesarSaladCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Caesar Salad</h3>
															<span>Romaine, Cheese, Croutons.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_5_2" class="form-horizontal"
																onsubmit="return populateFullMenuCaesarSaladSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="CaesarSaladCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="CaesarSaladSpl"
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
											data-toggle="modal" data-target="#GreenSalad"
											data-whatever="GreenSalad">
											<span>Green Salad</span> <br /> <span
												style="font-size: 12px;">Spring Mix, Tomato,
												Cucumber, Red Onion, Cheese and Croutons.</span>
										</button>
										<div class="modal fade" id="GreenSalad" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="GreenSaladCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Green Salad</h3>
															<span>Spring Mix, Tomato, Cucumber, Red Onion,
																Cheese and Croutons.</span>
														</div>
														<div class="modal-desc">
															<form id="popup_5_3" class="form-horizontal"
																onsubmit="return populateFullMenuGreenSaladSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="GreenSaladCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="GreenSaladSpl"
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
											data-toggle="modal" data-target="#Fries"
											data-whatever="Fries">
											<span>Fries</span> <br /> <span style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="Fries" tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="FriesCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Fries</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup_6_1" class="form-horizontal"
																onsubmit="return populateFullMenuFriesSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="FriesCount" maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="FriesSpl"
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
											data-toggle="modal" data-target="#OnionRings"
											data-whatever="OnionRings">
											<span>Onion Rings</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="OnionRings" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="OnionRingsCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Onion Rings</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup_6_2" class="form-horizontal"
																onsubmit="return populateFullMenuOnionRingsSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="OnionRingsCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="OnionRingsSpl"
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
											data-toggle="modal" data-target="#FreshGuacamole"
											data-whatever="FreshGuacamole">
											<span>Fresh Guacamole</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="FreshGuacamole" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="FreshGuacamoleCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Fresh Guacamole</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup_6_3" class="form-horizontal"
																onsubmit="return populateFullMenuFreshGuacamoleSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="FreshGuacamoleCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="FreshGuacamoleSpl"
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
											data-toggle="modal" data-target="#ChipsSalsa"
											data-whatever="ChipsSalsa">
											<span>Chips & Salsa</span> <br /> <span
												style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="ChipsSalsa" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="ChipsSalsaCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chips & Salsa</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup_6_4" class="form-horizontal"
																onsubmit="return populateFullMenuChipsSalsaSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="ChipsSalsaCount" maxlength="20"
																		required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ChipsSalsaSpl"
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
											data-toggle="modal" data-target="#Water"
											data-whatever="Water">
											<span>Water</span> <br /> <span style="font-size: 12px;"></span>
										</button>
										<div class="modal fade" id="Water" tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																id="WaterCloseBtn" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Water</h3>
															<span></span>
														</div>
														<div class="modal-desc">
															<form id="popup_7_1" class="form-horizontal"
																onsubmit="return populateFullMenuWaterSelectedItems();">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="number" min="1" size="20"
																		name="WaterCount" maxlength="20" required="required">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="WaterSpl"
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
										onclick="remove_south_beach_grill_item('m_${loop.index}');">X</span>
									<figure>${m.value}</figure>
								</div>
							</c:forEach>
						</div>
						<div class="pick-deliver">
							<div class="checkout">
								<form action="${pageContext.request.contextPath}/menu/saveMenu"
									id="south_beach_grill_target" method="post">
									<input type="hidden" name="full_menu_items"
										id="full_menu_items"> <input type="hidden"
										name="cuisineType" value="${menu.cuisine}">
									<textarea rows="4" cols="50" name="comments"
										placeholder="Enter your comments to restaurant here"
										class="form-control">${menu.comments}</textarea>
									<br />
									<!-- <button type="button" onclick="south_beach_grill_menu_submit();"
										class="btn btn-default">Next</button> -->
									<a href="javascript:south_beach_grill_menu_submit();">Next</a>
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
			south_beach_grill_menu_items.push(name + "+" + desc); //south_beach_grill_menu_items is in south_beach_grill_95742.js 
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
