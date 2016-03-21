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
		$("#full_menu_items").val(
				JSON.stringify(chalupa_fresh_mexican_grill_menu_items));
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
											data-toggle="modal" data-target="#QuesoNachos"
											data-whatever="QuesoNachos">
											<span>Queso Nachos</span> <br /> <span
												style="font-size: 12px;">Corn tortilla chips, house
												melted queso cheese, black beans and jalape&#241;os with pico de
												gallo</span>
										</button>
										<div class="modal fade" id="QuesoNachos" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Queso Nachos</h3>
															<span>Corn tortilla chips, house melted queso
																cheese, black beans and jalape&#241;os with pico de gallo</span>
														</div>
														<div class="modal-desc">
															<form id="popup1_1" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="QuesoNachosCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="QuesoNachosSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuQuesoNachosSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#SuperNachos"
											data-whatever="SuperNachos">
											<span>Super Nachos</span> <br /> <span
												style="font-size: 12px;">Your choice of meat, corn
												tortilla chips, black beans, sour cream, guacamole and pico
												de gallo with house queso cheese</span>
										</button>
										<div class="modal fade" id="SuperNachos" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Super Nachos</h3>
															<span>Your choice of meat, corn tortilla chips,
																black beans, sour cream, guacamole and pico de gallo
																with house queso cheese</span>
														</div>
														<div class="modal-desc">
															<form id="popup1_2" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="SuperNachosCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="SuperNachosSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuSuperNachosSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#GrilledCornMexicanStyle"
											data-whatever="GrilledCornMexicanStyle">
											<span>Grilled Corn Mexican Style</span> <br /> <span
												style="font-size: 12px;">Two whole grilled corn
												served with mayo, cotija cheese, chili powder and lime</span>
										</button>
										<div class="modal fade" id="GrilledCornMexicanStyle"
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
															<h3>Grilled Corn Mexican Style</h3>
															<span>Two whole grilled corn served with mayo,
																cotija cheese, chili powder and lime</span>
														</div>
														<div class="modal-desc">
															<form id="popup1_3" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="GrilledCornMexicanStyleCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="GrilledCornMexicanStyleSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuGrilledCornMexicanStyleSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#ChickenQuesadilla"
											data-whatever="ChickenQuesadilla">
											<span>Chicken Quesadilla</span> <br /> <span
												style="font-size: 12px;">Melted Jack, chedder and
												cotija cheese and grilled chicken with your choice of
												cilantro-lime, white or chipotle sauce on side</span>
										</button>
										<div class="modal fade" id="ChickenQuesadilla" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chicken Quesadilla</h3>
															<span>Melted Jack, chedder and cotija cheese and
																grilled chicken with your choice of cilantro-lime, white
																or chipotle sauce on side</span>
														</div>
														<div class="modal-desc">
															<form id="popup1_4" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="ChickenQuesadillaCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="ChickenQuesadillaSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuChickenQuesadillaSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#VegetarianQuesadilla"
											data-whatever="VegetarianQuesadilla">
											<span>Vegetarian Quesadilla</span> <br /> <span
												style="font-size: 12px;">Melted monterey jack cheese,
												black beans, roasted sweet n'spicy corn, tomatoes, cilantro,
												sour cream, lettuce, onions and guacamole</span>
										</button>
										<div class="modal fade" id="VegetarianQuesadilla"
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
															<h3>Vegetarian Quesadilla</h3>
															<span>Melted monterey jack cheese, black beans,
																roasted sweet n'spicy corn, tomatoes, cilantro, sour
																cream, lettuce, onions and guacamole</span>
														</div>
														<div class="modal-desc">
															<form id="popup1_5" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="VegetarianQuesadillaCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="VegetarianQuesadillaSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuVegetarianQuesadillaSelectedItems();" />
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
						<div class="panel-group" id="accordion-Burritos" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-Burritos" href="#Burritos"
										aria-expanded="true" aria-controls="Burritos"> Burritos </a>
								</div>
								<div id="Burritos" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#Amecameca"
											data-whatever="Amecameca">
											<span>Amecameca</span> <br /> <span style="font-size: 12px;">Your
												choice of meat, cilantro-lime rice, black beans, lettuce,
												queso cheese and sour cream</span>
										</button>
										<div class="modal fade" id="Amecameca" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Amecameca</h3>
															<span>Your choice of meat, cilantro-lime rice,
																black beans, lettuce, queso cheese and sour cream</span>
														</div>
														<div class="modal-desc">
															<form id="popup2_1" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="AmecamecaCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="AmecamecaSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuAmecamecaSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#Mexicali"
											data-whatever="Mexicali">
											<span>Mexicali</span> <br /> <span style="font-size: 12px;">Your
												choice of meat, Mexican rice, sour cream, roasted sweet n'
												spicy corn, pico de gallo, pinto beans and guacamole with
												fresh salsa</span>
										</button>
										<div class="modal fade" id="Mexicali" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Mexicali</h3>
															<span>Your choice of meat, Mexican rice, sour
																cream, roasted sweet n' spicy corn, pico de gallo, pinto
																beans and guacamole with fresh salsa</span>
														</div>
														<div class="modal-desc">
															<form id="popup2_2" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="MexicaliCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="MexicaliSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuMexicaliSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#Chicano"
											data-whatever="Chicano">
											<span>Chicano</span> <br /> <span style="font-size: 12px;">Your
												choice of meat, cilantro-lime rice, black beans, lettuce,
												jack and cheddar cheese and tortilla strips with chipotle
												sauce</span>
										</button>
										<div class="modal fade" id="Chicano" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chicano</h3>
															<span>Your choice of meat, cilantro-lime rice,
																black beans, lettuce, jack and cheddar cheese and
																tortilla strips with chipotle sauce</span>
														</div>
														<div class="modal-desc">
															<form id="popup2_3" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="ChicanoCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ChicanoSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuChicanoSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#MahiMahiFishBurrito"
											data-whatever="MahiMahiFishBurrito">
											<span>Mahi Mahi Fish Burrito</span> <br /> <span
												style="font-size: 12px;">Cilantro-lime rice, black
												beans, cheese guacamole, sweet n' spicy corn and cabbage,
												with your choice of chipotle or white sauce</span>
										</button>
										<div class="modal fade" id="MahiMahiFishBurrito" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Mahi Mahi Fish Burrito</h3>
															<span>Cilantro-lime rice, black beans, cheese
																guacamole, sweet n' spicy corn and cabbage, with your
																choice of chipotle or white sauce</span>
														</div>
														<div class="modal-desc">
															<form id="popup2_4" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="MahiMahiFishBurritoCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="MahiMahiFishBurritoSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuMahiMahiFishBurritoSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#Vera" data-whatever="Vera">
											<span>Vera</span> <br /> <span style="font-size: 12px;">Cilantro-lime
												rice, black beans, Jack and cheddar cheese, pico de gallo,
												sweet n' spicy corn and lettuce with fresh salsa</span>
										</button>
										<div class="modal fade" id="Vera" tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Vera</h3>
															<span>Cilantro-lime rice, black beans, Jack and
																cheddar cheese, pico de gallo, sweet n' spicy corn and
																lettuce with fresh salsa</span>
														</div>
														<div class="modal-desc">
															<form id="popup2_5" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="VeraCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="VeraSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuVeraSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#Xochimilco"
											data-whatever="Xochimilco">
											<span>Xochimilco</span> <br /> <span
												style="font-size: 12px;">Rice, lettuce, pinto beans,
												sour cream, guacamole, pico de gallo and cheese with white
												sauce</span>
										</button>
										<div class="modal fade" id="Xochimilco" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Xochimilco</h3>
															<span>Rice, lettuce, pinto beans, sour cream,
																guacamole, pico de gallo and cheese with white sauce</span>
														</div>
														<div class="modal-desc">
															<form id="popup2_6" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="XochimilcoCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="XochimilcoSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuXochimilcoSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#Bowl" data-whatever="Bowl">
											<span>Bowl</span> <br /> <span style="font-size: 12px;">Make
												any above burritos a bowl, Big portion, Low carb Served
												Without tortilla or chips</span>
										</button>
										<div class="modal fade" id="Bowl" tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Bowl</h3>
															<span>Make any above burritos a bowl, Big portion,
																Low carb Served Without tortilla or chips</span>
														</div>
														<div class="modal-desc">
															<form id="popup2_7" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="BowlCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="BowlSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuBowlSelectedItems();" />
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
						<div class="panel-group" id="accordion-TACOS" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-TACOS" href="#TACOS"
										aria-expanded="true" aria-controls="TACOS"> TACOS </a>
								</div>
								<div id="TACOS" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#Chalupa"
											data-whatever="Chalupa">
											<span>Chalupa</span> <br /> <span style="font-size: 12px;">Your
												choice of meat, black beans, sour cream, pico de gallo,
												lettuce and cheese served on corn tostada</span>
										</button>
										<div class="modal fade" id="Chalupa" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chalupa</h3>
															<span>Your choice of meat, black beans, sour
																cream, pico de gallo, lettuce and cheese served on corn
																tostada</span>
														</div>
														<div class="modal-desc">
															<form id="popup3_1" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="ChalupaCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ChalupaSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuChalupaSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#Street"
											data-whatever="Street">
											<span>Street</span> <br /> <span style="font-size: 12px;">Your
												choice of meat, Onions and cilantro served in corn tortilla</span>
										</button>
										<div class="modal fade" id="Street" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Street</h3>
															<span>Your choice of meat, Onions and cilantro
																served in corn tortilla</span>
														</div>
														<div class="modal-desc">
															<form id="popup3_2" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="StreetCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="StreetSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuStreetSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#Soft" data-whatever="Soft">
											<span>Soft</span> <br /> <span style="font-size: 12px;">Your
												choice of meat, guacamole, pico de gallo and melted queso
												cheese served in soft flour tortilla</span>
										</button>
										<div class="modal fade" id="Soft" tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Soft</h3>
															<span>Your choice of meat, guacamole, pico de
																gallo and melted queso cheese served in soft flour
																tortilla</span>
														</div>
														<div class="modal-desc">
															<form id="popup3_3" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="SoftCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="SoftSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuSoftSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#Crispy"
											data-whatever="Crispy">
											<span>Crispy</span> <br /> <span style="font-size: 12px;">Your
												choice of meat, lettuce, pico de gallo and cheese served in
												crispy corn shell</span>
										</button>
										<div class="modal fade" id="Crispy" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Crispy</h3>
															<span>Your choice of meat, lettuce, pico de gallo
																and cheese served in crispy corn shell</span>
														</div>
														<div class="modal-desc">
															<form id="popup3_4" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="CrispyCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="CrispySpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuCrispySelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#MahiMahiFishTaco"
											data-whatever="MahiMahiFishTaco">
											<span>Mahi Mahi Fish Taco</span> <br /> <span
												style="font-size: 12px;">Cabbage, cilantro and onions
												with white and chipotle sauce served in corn tortilla</span>
										</button>
										<div class="modal fade" id="MahiMahiFishTaco" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Mahi Mahi Fish Taco</h3>
															<span>Cabbage, cilantro and onions with white and
																chipotle sauce served in corn tortilla</span>
														</div>
														<div class="modal-desc">
															<form id="popup3_5" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="MahiMahiFishTacoCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="MahiMahiFishTacoSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuMahiMahiFishTacoSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#CrispyFish"
											data-whatever="CrispyFish">
											<span>Crispy Fish</span> <br /> <span
												style="font-size: 12px;">Cabbage, cilantro and onions
												with white and chipotle sauce served in corn tortilla</span>
										</button>
										<div class="modal fade" id="CrispyFish" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Crispy Fish</h3>
															<span>Cabbage, cilantro and onions with white and
																chipotle sauce served in corn tortilla</span>
														</div>
														<div class="modal-desc">
															<form id="popup3_6" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="CrispyFishCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="CrispyFishSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuCrispyFishSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#Veggie"
											data-whatever="Veggie">
											<span>Veggie</span> <br /> <span style="font-size: 12px;">Your
												choice of black beans or pinto beans, pico de gallo, sour
												cream, guacamole and cheese served in soft tortilla</span>
										</button>
										<div class="modal fade" id="Veggie" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Veggie</h3>
															<span>Your choice of black beans or pinto beans,
																pico de gallo, sour cream, guacamole and cheese served
																in soft tortilla</span>
														</div>
														<div class="modal-desc">
															<form id="popup3_7" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="VeggieCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="VeggieSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuVeggieSelectedItems();" />
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
											data-toggle="modal" data-target="#TacoSalad"
											data-whatever="TacoSalad">
											<span>Taco Salad</span> <br /> <span
												style="font-size: 12px;">Your choice of meat,
												lettuce, rice, beans, sour cream, guacamole, pico de gallo
												and cheese served on flour tostada</span>
										</button>
										<div class="modal fade" id="TacoSalad" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Taco Salad</h3>
															<span>Your choice of meat, lettuce, rice, beans,
																sour cream, guacamole, pico de gallo and cheese served
																on flour tostada</span>
														</div>
														<div class="modal-desc">
															<form id="popup4_1" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="TacoSaladCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="TacoSaladSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuTacoSaladSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#AmoreSalad"
											data-whatever="AmoreSalad">
											<span>Amore Salad</span> <br /> <span
												style="font-size: 12px;">your choice of meat, fresh
												romaine lettuce, black beans, pico de gallo, sweet n' spicy
												corn, chips strips, crispy tostada and cilantro-lime
												dressing</span>
										</button>
										<div class="modal fade" id="AmoreSalad" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Amore Salad</h3>
															<span>your choice of meat, fresh romaine lettuce,
																black beans, pico de gallo, sweet n' spicy corn, chips
																strips, crispy tostada and cilantro-lime dressing</span>
														</div>
														<div class="modal-desc">
															<form id="popup4_2" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="AmoreSaladCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="AmoreSaladSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuAmoreSaladSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#TapatiaSalad"
											data-whatever="TapatiaSalad">
											<span>Tapatia Salad</span> <br /> <span
												style="font-size: 12px;">Your choice of meat ,
												lettuce, tomatoes, cheese, shredded carrot, roasted sweet n'
												spicy corn, cubed pineapple, chips strips and smokey
												chipotle-balsamic dressing served on whole flour tortilla</span>
										</button>
										<div class="modal fade" id="TapatiaSalad" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Tapatia Salad</h3>
															<span>Your choice of meat , lettuce, tomatoes,
																cheese, shredded carrot, roasted sweet n' spicy corn,
																cubed pineapple, chips strips and smokey
																chipotle-balsamic dressing served on whole flour
																tortilla</span>
														</div>
														<div class="modal-desc">
															<form id="popup4_3" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="TapatiaSaladCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="TapatiaSaladSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuTapatiaSaladSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#MexicanSalad"
											data-whatever="MexicanSalad">
											<span>Mexican Salad</span> <br /> <span
												style="font-size: 12px;">Your choice of meat,
												lettuce, black beans, tomatoes, onions, spicy pumpkin seeds,
												red cabbage, cotija cheese, chips strips, crispy tostada
												with mexican vinaigrette</span>
										</button>
										<div class="modal fade" id="MexicanSalad" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Mexican Salad</h3>
															<span>Your choice of meat, lettuce, black beans,
																tomatoes, onions, spicy pumpkin seeds, red cabbage,
																cotija cheese, chips strips, crispy tostada with mexican
																vinaigrette</span>
														</div>
														<div class="modal-desc">
															<form id="popup4_4" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="MexicanSaladCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="MexicanSaladSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuMexicanSaladSelectedItems();" />
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
						<div class="panel-group" id="accordion-Kids_Menu" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-Kids_Menu" href="#Kids_Menu"
										aria-expanded="true" aria-controls="Kids_Menu"> Kids Menu
									</a>
								</div>
								<div id="Kids_Menu" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#Burrito"
											data-whatever="Burrito">
											<span>Burrito</span> <br /> <span style="font-size: 12px;">Flour
												tortilla filled with your choice of meat, refried beans,
												cheese and sour cream</span>
										</button>
										<div class="modal fade" id="Burrito" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Burrito</h3>
															<span>Flour tortilla filled with your choice of
																meat, refried beans, cheese and sour cream</span>
														</div>
														<div class="modal-desc">
															<form id="popup5_1" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="BurritoCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="BurritoSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuBurritoSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#ChickenQuesadilla"
											data-whatever="ChickenQuesadilla">
											<span>Chicken Quesadilla</span> <br /> <span
												style="font-size: 12px;">Flour tortilla filled with
												grilled chicken and melted cheese</span>
										</button>
										<div class="modal fade" id="ChickenQuesadilla" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chicken Quesadilla</h3>
															<span>Flour tortilla filled with grilled chicken
																and melted cheese</span>
														</div>
														<div class="modal-desc">
															<form id="popup5_2" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="ChickenQuesadillaCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="ChickenQuesadillaSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuChickenQuesadillaSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#SoftTaco"
											data-whatever="SoftTaco">
											<span>Soft Taco</span> <br /> <span style="font-size: 12px;">Flour
												tortilla filled with your choice of meat, lettuce and cheese</span>
										</button>
										<div class="modal fade" id="SoftTaco" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Soft Taco</h3>
															<span>Flour tortilla filled with your choice of
																meat, lettuce and cheese</span>
														</div>
														<div class="modal-desc">
															<form id="popup5_3" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="SoftTacoCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="SoftTacoSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuSoftTacoSelectedItems();" />
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
						<div class="panel-group" id="accordion-Enchiladas" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-Enchiladas" href="#Enchiladas"
										aria-expanded="true" aria-controls="Enchiladas">
										Enchiladas </a>
								</div>
								<div id="Enchiladas" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#RedChile"
											data-whatever="RedChile">
											<span>Red Chile</span> <br /> <span style="font-size: 12px;">Topped
												with red chile sauce</span>
										</button>
										<div class="modal fade" id="RedChile" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Red Chile</h3>
															<span>Topped with red chile sauce</span>
														</div>
														<div class="modal-desc">
															<form id="popup6_1" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="RedChileCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="RedChileSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuRedChileSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#GreenChile"
											data-whatever="GreenChile">
											<span>Green Chile</span> <br /> <span
												style="font-size: 12px;">Topped with green sauce</span>
										</button>
										<div class="modal fade" id="GreenChile" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Green Chile</h3>
															<span>Topped with green sauce</span>
														</div>
														<div class="modal-desc">
															<form id="popup6_2" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="GreenChileCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="GreenChileSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuGreenChileSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#Enfrijoladas"
											data-whatever="Enfrijoladas">
											<span>Enfrijoladas</span> <br /> <span
												style="font-size: 12px;">Topped with black beans
												sauce</span>
										</button>
										<div class="modal fade" id="Enfrijoladas" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Enfrijoladas</h3>
															<span>Topped with black beans sauce</span>
														</div>
														<div class="modal-desc">
															<form id="popup6_3" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="EnfrijoladasCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="EnfrijoladasSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuEnfrijoladasSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#Swiss"
											data-whatever="Swiss">
											<span>Swiss</span> <br /> <span style="font-size: 12px;">Topped
												with Swiss sauce</span>
										</button>
										<div class="modal fade" id="Swiss" tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Swiss</h3>
															<span>Topped with Swiss sauce</span>
														</div>
														<div class="modal-desc">
															<form id="popup6_4" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="SwissCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="SwissSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuSwissSelectedItems();" />
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