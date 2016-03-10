<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	function remove_california_kabob_item(div_id) {
		var divToRemove = $("div[id=" + div_id + "]");
		var name = divToRemove.children().children().prev().text();
		var desc = divToRemove.children().children().next().text();
		var data = name + "+" + desc;
		console.log("Removing " + data);
		california_kabob_menu_items.splice($.inArray(data,
				california_kabob_menu_items), 1);
		divToRemove.remove();
	}

	function california_kabob_menu_submit() {
		if (california_kabob_menu_items.length == 0) {
			alert("Please select at least 1 item to proceed.");
			return false;
		}
		console.log(california_kabob_menu_items);
		//console.log(JSON.stringify(california_kabob_menu_items));
		$("#full_menu_items").val(JSON.stringify(california_kabob_menu_items));
		$("#california_kabob_target").submit();
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
						<div class="panel-group" id="accordion-APPETIZERS" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-APPETIZERS" href="#APPETIZERS"
										aria-expanded="true" aria-controls="APPETIZERS">
										APPETIZERS </a>
								</div>
								<div id="APPETIZERS" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#chips"
											data-whatever="Chips">
											<span>Sarma Dolme</span>
										</button>
										<div class="modal fade" id="chips" tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Sarma Dolme</h3>
														</div>
														<div class="modal-desc">
															<form id="popup_1_1" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="SarmaDolmeCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="SarmaDolmeSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuSarmaDolmeSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->

										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#LargeHummus"
											data-whatever="LargeHummus">
											<span>Large Hummus</span>
										</button>
										<div class="modal fade" id="LargeHummus" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Large Hummus</h3>
														</div>
														<div class="modal-desc">
															<form id="popup_1_2" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="LargeHummusCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="LargeHummusSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuLargeHummusSelectedItems();" />
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
						<div class="panel-group" id="accordion-SALADS" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-SALADS" href="#SALADS"
										aria-expanded="true" aria-controls="SALADS"> SALADS </a>
								</div>
								<div id="SALADS" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#GreekSalad"
											data-whatever="GreekSalad">
											<span>Greek Salad</span>
										</button>
										<div class="modal fade" id="GreekSalad" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Greek Salad</h3>
														</div>
														<div class="modal-desc">
															<form id="popup_2_1" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="GreekSaladCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="GreekSaladSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuGreekSaladSelectedItems();" />
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
						<div class="panel-group" id="accordion-KABOB" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-KABOB" href="#KABOB"
										aria-expanded="true" aria-controls="KABOB"> KABOB </a>
								</div>
								<div id="KABOB" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#BeefKabob"
											data-whatever="BeefKabob">
											<span>Beef Kabob</span>
										</button>
										<div class="modal fade" id="BeefKabob" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Beef Kabob</h3>
														</div>
														<div class="modal-desc">
															<form id="popup_3_1" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="BeefKabobCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="BeefKabobSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuBeefKabobSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->

										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#GroundBeefKabob"
											data-whatever="GroundBeefKabob">
											<span>Ground Beef Kabob</span>
										</button>
										<div class="modal fade" id="GroundBeefKabob" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Ground Beef Kabob</h3>
														</div>
														<div class="modal-desc">
															<form id="popup_3_2" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="GroundBeefKabobCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="GroundBeefKabobSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuGroundBeefKabobSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->

										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#ChickenKabob"
											data-whatever="ChickenKabob">
											<span>Chicken Kabob</span>
										</button>
										<div class="modal fade" id="ChickenKabob" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chicken Kabob</h3>
														</div>
														<div class="modal-desc">
															<form id="popup_3_3" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="ChickenKabobCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ChickenKabobSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuChickenKabobSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->

										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#GroundChickenKabob"
											data-whatever="GroundChickenKabob">
											<span>Ground Chicken Kabob</span>
										</button>
										<div class="modal fade" id="GroundChickenKabob" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Ground Chicken Kabob</h3>
														</div>
														<div class="modal-desc">
															<form id="popup_3_4" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="GroundChickenKabobCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60"
																		name="GroundChickenKabobSpl" maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuGroundChickenKabobSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->

										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#LambKabob"
											data-whatever="LambKabob">
											<span>Lamb Kabob</span>
										</button>
										<div class="modal fade" id="LambKabob" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Lamb Kabob</h3>
														</div>
														<div class="modal-desc">
															<form id="popup_3_5" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="LambKabobCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="LambKabobSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuLambKabobSelectedItems();" />
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!-- item end -->

										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#GroundLambKabob"
											data-whatever="GroundLambKabob">
											<span>Ground Lamb Kabob</span>
										</button>
										<div class="modal fade" id="GroundLambKabob" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Ground Lamb Kabob</h3>
														</div>
														<div class="modal-desc">
															<form id="popup_3_6" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20"
																		name="GroundLambKabobCount" maxlength="20"
																		required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="GroundLambKabobSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuGroundLambKabobSelectedItems();" />
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
										onclick="remove_california_kabob_item('m_${loop.index}');">X</span>
									<figure>${m.value}</figure>
								</div>
							</c:forEach>
						</div>

						<div class="pick-deliver">
							<div class="checkout">

								<form action="${pageContext.request.contextPath}/menu/saveMenu"
									id="california_kabob_target" method="post">
									<input type="hidden" name="full_menu_items"
										id="full_menu_items"> <input type="hidden"
										name="cuisineType" value="${menu.cuisine}">
									<textarea rows="4" cols="50" name="comments"
										placeholder="Enter your comments to restaurant here"
										class="form-control">${menu.comments}</textarea>
									<br />
									<!-- <button type="button" onclick="california_kabob_menu_submit();"
										class="btn btn-default">Next</button> -->
									<a href="javascript:california_kabob_menu_submit();">Next</a>
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
			california_kabob_menu_items.push(name + "+" + desc); //california_kabob_menu_items is in California_Kabob_Restaurant_95827.js 
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
