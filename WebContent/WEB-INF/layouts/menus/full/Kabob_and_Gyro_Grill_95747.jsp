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
		kabob_and_gyro_grill_items.splice($.inArray(data,
				kabob_and_gyro_grill_menu_items), 1);
		divToRemove.remove();
	}

	function kabob_and_gyro_grill_menu_submit() {
		if (kabob_and_gyro_grill_items.length == 0) {
			alert("Please select at least 1 item to proceed.");
			return false;
		}
		console.log(kabob_and_gyro_grill_items);
		//console.log(JSON.stringify(california_kabob_menu_items));
		$("#full_menu_items").val(JSON.stringify(kabob_and_gyro_grill_items));
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
					<li><a href="#extra-items" aria-controls="extra-items"
						role="tab" data-toggle="tab">Extra Items</a></li>
				</ul>
				<div class="clearfix"></div>
				<div class="tab-content col-md-8">
					<div role="tabpanel" class="tab-pane active full-menu-content"
						id="full-menu">
						<p></p>
						<!-- Collapse start -->
						<div class="panel-group" id="accordion" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion" href="#BeachMunchies"
										aria-expanded="true" aria-controls="BeachMunchies"> Gyros </a>
								</div>
								<div id="BeachMunchies" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="#LambGyro"
											data-whatever="LambGyro">
											<span>Lamb Gyro</span>
										</button>
										<div class="modal fade" id="LambGyro" tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Lamb Gyro</h3>
														</div>
														<div class="modal-desc">
															<form id="popup_1_1" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="LambGyroCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="LambGyroSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuLambGryosSelectedItems();" />
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
											data-toggle="modal" data-target="#SteakGyro"
											data-whatever="SteakGyro">
											<span>Steak Gyro</span>
										</button>
										<div class="modal fade" id="SteakGyro" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Steak Gyro</h3>
														</div>
														<div class="modal-desc">
															<form id="popup_1_2" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="SteakGyroCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="SteakGyroSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuSteakGyrosSelectedItems();" />
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
											data-toggle="modal" data-target="#ChickenGyro"
											data-whatever="ChickenGyro">
											<span>Chicken Gyro</span>
										</button>
										<div class="modal fade" id="ChickenGyro" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Chicken Gyro</h3>
														</div>
														<div class="modal-desc">
															<form id="popup_2_1" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="ChickenGyroCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="ChickenGyroSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuChickenGryosSelectedItems();" />
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
											data-toggle="modal" data-target="#VeggieGyro"
											data-whatever="VeggieGyro">
											<span>Veggie Gyro</span>
										</button>
										<div class="modal fade" id="VeggieGyro" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Veggie Gyro</h3>
														</div>
														<div class="modal-desc">
															<form id="popup_1_2" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="VeggieGyroCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="VeggieGyroSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuVeggieGryosSelectedItems();" />
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
											data-toggle="modal" data-target="#CombinationGyro"
											data-whatever="CombinationGyro">
											<span>Combination Gyro</span>
										</button>
										<div class="modal fade" id="CombinationGyro" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Combination Gyro</h3>
														</div>
														<div class="modal-desc">
															<form id="popup_1_2" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="CombinationGyroCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="CombinationGyroSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuCombinationGryosSelectedItems();" />
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
						<div class="panel-group" id="accordion-kabob" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion-kabob" href="#ShawarmaCollapse"
										aria-expanded="true" aria-controls="ShawarmaCollapse" class="collapse"> Shawarmas </a>
								</div>
								<div id="ShawarmaCollapse" class="panel-collapse collapse in "
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										<!-- item begin -->
										<button type="button" class="btn btn-primary"
											data-toggle="modal" data-target="LambShawarma"
											data-whatever="LambShawarma">
											<span>Lamb Shawarma</span>
										</button>
										<div class="modal fade" id="LambShawarma" tabindex="-1" role="dialog"
											aria-labelledby="exampleModalLabel">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-box-left">
														<div class="modal-head">
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
															<h3>Lamb Shawarma</h3>
														</div>
														<div class="modal-desc">
															<form id="popup_1_1" class="form-horizontal"
																onsubmit="return false;">
																<div class="modal-textarea">
																	<h4>Quantity</h4>
																	<input type="text" size="20" name="LambShawarmaCount"
																		maxlength="20" required="required" pattern="^\d+$">
																	<h5>
																		Special Instructions<span>Additional charges
																			may apply.</span>
																	</h5>
																	<input type="text" size="60" name="LambShawarmaSpl"
																		maxlength="20">
																	<div class="clearfix"></div>
																	<div class="modal-sub">
																		<input type="button" data-dismiss="modal" name=""
																			value="Add to Cart"
																			onclick="populateFullMenuLambShawarmaSelectedItems();" />
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
                      data-toggle="modal" data-target="SteakShawarma"
                      data-whatever="SteakShawarma">
                      <span>Steak Shawarma</span>
                    </button>
                    <div class="modal fade" id="SteakShawarma" tabindex="-1" role="dialog"
                      aria-labelledby="exampleModalLabel">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content">
                          <div class="modal-box-left">
                            <div class="modal-head">
                              <button type="button" class="close" data-dismiss="modal"
                                aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                              </button>
                              <h3>Steak Shawarma</h3>
                            </div>
                            <div class="modal-desc">
                              <form id="popup_1_1" class="form-horizontal"
                                onsubmit="return false;">
                                <div class="modal-textarea">
                                  <h4>Quantity</h4>
                                  <input type="text" size="20" name="SteakShawarmaCount"
                                    maxlength="20" required="required" pattern="^\d+$">
                                  <h5>
                                    Special Instructions<span>Additional charges
                                      may apply.</span>
                                  </h5>
                                  <input type="text" size="60" name="SteakShawarmaSpl"
                                    maxlength="20">
                                  <div class="clearfix"></div>
                                  <div class="modal-sub">
                                    <input type="button" data-dismiss="modal" name=""
                                      value="Add to Cart"
                                      onclick="populateFullMenuSteakShawarmaSelectedItems();" />
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
                      data-toggle="modal" data-target="ChickenShawarma"
                      data-whatever="ChickenShawarma">
                      <span>Chicken Shawarma</span>
                    </button>
                    <div class="modal fade" id="ChickenShawarma" tabindex="-1" role="dialog"
                      aria-labelledby="exampleModalLabel">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content">
                          <div class="modal-box-left">
                            <div class="modal-head">
                              <button type="button" class="close" data-dismiss="modal"
                                aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                              </button>
                              <h3>Chicken Shawarma</h3>
                            </div>
                            <div class="modal-desc">
                              <form id="popup_1_1" class="form-horizontal"
                                onsubmit="return false;">
                                <div class="modal-textarea">
                                  <h4>Quantity</h4>
                                  <input type="text" size="20" name="ChickenShawarmaCount"
                                    maxlength="20" required="required" pattern="^\d+$">
                                  <h5>
                                    Special Instructions<span>Additional charges
                                      may apply.</span>
                                  </h5>
                                  <input type="text" size="60" name="ChickenShawarmaSpl"
                                    maxlength="20">
                                  <div class="clearfix"></div>
                                  <div class="modal-sub">
                                    <input type="button" data-dismiss="modal" name=""
                                      value="Add to Cart"
                                      onclick="populateFullMenuChickenShawarmaSelectedItems();" />
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
                      data-toggle="modal" data-target="MediterraneanShawarma"
                      data-whatever="MediterraneanShawarma">
                      <span>Mediterranean Shawarma</span>
                    </button>
                    <div class="modal fade" id="MediterraneanShawarma" tabindex="-1" role="dialog"
                      aria-labelledby="exampleModalLabel">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content">
                          <div class="modal-box-left">
                            <div class="modal-head">
                              <button type="button" class="close" data-dismiss="modal"
                                aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                              </button>
                              <h3>Mediterranean Shawarma</h3>
                            </div>
                            <div class="modal-desc">
                              <form id="popup_1_1" class="form-horizontal"
                                onsubmit="return false;">
                                <div class="modal-textarea">
                                  <h4>Quantity</h4>
                                  <input type="text" size="20" name="MediterraneanShawarmaCount"
                                    maxlength="20" required="required" pattern="^\d+$">
                                  <h5>
                                    Special Instructions<span>Additional charges
                                      may apply.</span>
                                  </h5>
                                  <input type="text" size="60" name="MediterraneanShawarmaSpl"
                                    maxlength="20">
                                  <div class="clearfix"></div>
                                  <div class="modal-sub">
                                    <input type="button" data-dismiss="modal" name=""
                                      value="Add to Cart"
                                      onclick="populateFullMenuMediterraneanShawarmaSelectedItems();" />
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
                      data-toggle="modal" data-target="CombinationShawarma"
                      data-whatever="CombinationShawarma">
                      <span>Combination Shawarma</span>
                    </button>
                    <div class="modal fade" id="CombinationShawarma" tabindex="-1" role="dialog"
                      aria-labelledby="exampleModalLabel">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content">
                          <div class="modal-box-left">
                            <div class="modal-head">
                              <button type="button" class="close" data-dismiss="modal"
                                aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                              </button>
                              <h3>Combination Shawarma</h3>
                            </div>
                            <div class="modal-desc">
                              <form id="popup_1_1" class="form-horizontal"
                                onsubmit="return false;">
                                <div class="modal-textarea">
                                  <h4>Quantity</h4>
                                  <input type="text" size="20" name="CombinationShawarmaCount"
                                    maxlength="20" required="required" pattern="^\d+$">
                                  <h5>
                                    Special Instructions<span>Additional charges
                                      may apply.</span>
                                  </h5>
                                  <input type="text" size="60" name="CombinationShawarmaSpl"
                                    maxlength="20">
                                  <div class="clearfix"></div>
                                  <div class="modal-sub">
                                    <input type="button" data-dismiss="modal" name=""
                                      value="Add to Cart"
                                      onclick="populateFullMenuCombinationShawarmaSelectedItems();" />
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
						<div class="panel-group" id="accordion" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion" href="#KabobPlatters"
										aria-expanded="true" aria-controls="KabobPlatters"> Kabob Platters </a>
								</div>
								<div id="KabobPlatters" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
										                    <!-- item begin -->
                                        <button type="button" class="btn btn-primary"
                                          data-toggle="modal" data-target="#LambKabob"
                                          data-whatever="LambKabob">
                                          <span>Lamb Kabob</span>
                                        </button>
                                        <div class="modal fade" id="LambKabob" tabindex="-1" role="dialog"
                                          aria-labelledby="exampleModalLabel">
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
                                                  <form id="popup_1_1" class="form-horizontal"
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
										                    <!-- item begin -->
                                        <button type="button" class="btn btn-primary"
                                          data-toggle="modal" data-target="#BeefKabob"
                                          data-whatever="BeefKabob">
                                          <span>Beef Kabob</span>
                                        </button>
                                        <div class="modal fade" id="BeefKabob" tabindex="-1" role="dialog"
                                          aria-labelledby="exampleModalLabel">
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
                                                  <form id="popup_1_1" class="form-horizontal"
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
										                    <!-- item begin -->
                                        <button type="button" class="btn btn-primary"
                                          data-toggle="modal" data-target="#ChickenKabob"
                                          data-whatever="ChickenKabob">
                                          <span>Chicken Kabob</span>
                                        </button>
                                        <div class="modal fade" id="ChickenKabob" tabindex="-1" role="dialog"
                                          aria-labelledby="exampleModalLabel">
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
                                                  <form id="popup_1_1" class="form-horizontal"
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
                                          data-toggle="modal" data-target="#ChappliKabob"
                                          data-whatever="ChappliKabob">
                                          <span>Chappli Kabob</span>
                                        </button>
                                        <div class="modal fade" id="ChappliKabob" tabindex="-1" role="dialog"
                                          aria-labelledby="exampleModalLabel">
                                          <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                              <div class="modal-box-left">
                                                <div class="modal-head">
                                                  <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                  </button>
                                                  <h3>Chappli Kabob</h3>
                                                </div>
                                                <div class="modal-desc">
                                                  <form id="popup_1_1" class="form-horizontal"
                                                    onsubmit="return false;">
                                                    <div class="modal-textarea">
                                                      <h4>Quantity</h4>
                                                      <input type="text" size="20" name="ChappliKabobCount"
                                                        maxlength="20" required="required" pattern="^\d+$">
                                                      <h5>
                                                        Special Instructions<span>Additional charges
                                                          may apply.</span>
                                                      </h5>
                                                      <input type="text" size="60" name="ChappliKabobSpl"
                                                        maxlength="20">
                                                      <div class="clearfix"></div>
                                                      <div class="modal-sub">
                                                        <input type="button" data-dismiss="modal" name=""
                                                          value="Add to Cart"
                                                          onclick="populateFullMenuChappliKabobSelectedItems();" />
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
                                          data-toggle="modal" data-target="#CombinationKabob"
                                          data-whatever="CombinationKabob">
                                          <span>Combination Kabob</span>
                                        </button>
                                        <div class="modal fade" id="CombinationKabob" tabindex="-1" role="dialog"
                                          aria-labelledby="exampleModalLabel">
                                          <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                              <div class="modal-box-left">
                                                <div class="modal-head">
                                                  <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                  </button>
                                                  <h3>Combination Kabob</h3>
                                                </div>
                                                <div class="modal-desc">
                                                  <form id="popup_1_1" class="form-horizontal"
                                                    onsubmit="return false;">
                                                    <div class="modal-textarea">
                                                      <h4>Quantity</h4>
                                                      <input type="text" size="20" name="CombinationKabobCount"
                                                        maxlength="20" required="required" pattern="^\d+$">
                                                      <h5>
                                                        Special Instructions<span>Additional charges
                                                          may apply.</span>
                                                      </h5>
                                                      <input type="text" size="60" name="CombinationKabobSpl"
                                                        maxlength="20">
                                                      <div class="clearfix"></div>
                                                      <div class="modal-sub">
                                                        <input type="button" data-dismiss="modal" name=""
                                                          value="Add to Cart"
                                                          onclick="populateFullMenuCombinationKabobSelectedItems();" />
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
						<div class="panel-group" id="accordion" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading" role="tab" id="headingOne">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion" href="#Salads"
										aria-expanded="true" aria-controls="Salads"> Salads </a>
								</div>
								<div id="Salads" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="headingOne">
									<div class="panel-body">
                      <!-- item begin -->
                                        <button type="button" class="btn btn-primary"
                                          data-toggle="modal" data-target="#GreekSalad"
                                          data-whatever="GreekSalad">
                                          <span>Greek Salad</span>
                                        </button>
                                        <div class="modal fade" id="GreekSalad" tabindex="-1" role="dialog"
                                          aria-labelledby="exampleModalLabel">
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
                                                  <form id="popup_1_1" class="form-horizontal"
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
                                                              <!-- item begin -->
                                        <button type="button" class="btn btn-primary"
                                          data-toggle="modal" data-target="#LambSalad"
                                          data-whatever="LambSalad">
                                          <span>Lamb Salad</span>
                                        </button>
                                        <div class="modal fade" id="LambSalad" tabindex="-1" role="dialog"
                                          aria-labelledby="exampleModalLabel">
                                          <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                              <div class="modal-box-left">
                                                <div class="modal-head">
                                                  <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                  </button>
                                                  <h3>Lamb Salad</h3>
                                                </div>
                                                <div class="modal-desc">
                                                  <form id="popup_1_1" class="form-horizontal"
                                                    onsubmit="return false;">
                                                    <div class="modal-textarea">
                                                      <h4>Quantity</h4>
                                                      <input type="text" size="20" name="LambSaladCount"
                                                        maxlength="20" required="required" pattern="^\d+$">
                                                      <h5>
                                                        Special Instructions<span>Additional charges
                                                          may apply.</span>
                                                      </h5>
                                                      <input type="text" size="60" name="LambSaladSpl"
                                                        maxlength="20">
                                                      <div class="clearfix"></div>
                                                      <div class="modal-sub">
                                                        <input type="button" data-dismiss="modal" name=""
                                                          value="Add to Cart"
                                                          onclick="populateFullMenuLambSaladSelectedItems();" />
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
                                          <span>Steak Salad</span>
                                        </button>
                                        <div class="modal fade" id="SteakSalad" tabindex="-1" role="dialog"
                                          aria-labelledby="exampleModalLabel">
                                          <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                              <div class="modal-box-left">
                                                <div class="modal-head">
                                                  <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                  </button>
                                                  <h3>Steak Salad</h3>
                                                </div>
                                                <div class="modal-desc">
                                                  <form id="popup_1_1" class="form-horizontal"
                                                    onsubmit="return false;">
                                                    <div class="modal-textarea">
                                                      <h4>Quantity</h4>
                                                      <input type="text" size="20" name="SteakSaladCount"
                                                        maxlength="20" required="required" pattern="^\d+$">
                                                      <h5>
                                                        Special Instructions<span>Additional charges
                                                          may apply.</span>
                                                      </h5>
                                                      <input type="text" size="60" name="SteakSaladSpl"
                                                        maxlength="20">
                                                      <div class="clearfix"></div>
                                                      <div class="modal-sub">
                                                        <input type="button" data-dismiss="modal" name=""
                                                          value="Add to Cart"
                                                          onclick="populateFullMenuSteakSaladSelectedItems();" />
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
                                          <span>Chicken Salad</span>
                                        </button>
                                        <div class="modal fade" id="ChickenSalad" tabindex="-1" role="dialog"
                                          aria-labelledby="exampleModalLabel">
                                          <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                              <div class="modal-box-left">
                                                <div class="modal-head">
                                                  <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                  </button>
                                                  <h3>Chicken Salad</h3>
                                                </div>
                                                <div class="modal-desc">
                                                  <form id="popup_1_1" class="form-horizontal"
                                                    onsubmit="return false;">
                                                    <div class="modal-textarea">
                                                      <h4>Quantity</h4>
                                                      <input type="text" size="20" name="ChickenSaladCount"
                                                        maxlength="20" required="required" pattern="^\d+$">
                                                      <h5>
                                                        Special Instructions<span>Additional charges
                                                          may apply.</span>
                                                      </h5>
                                                      <input type="text" size="60" name="ChickenSaladSpl"
                                                        maxlength="20">
                                                      <div class="clearfix"></div>
                                                      <div class="modal-sub">
                                                        <input type="button" data-dismiss="modal" name=""
                                                          value="Add to Cart"
                                                          onclick="populateFullMenuChickenSaladSelectedItems();" />
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
                                          <span>Combination Salad</span>
                                        </button>
                                        <div class="modal fade" id="CombinationSalad" tabindex="-1" role="dialog"
                                          aria-labelledby="exampleModalLabel">
                                          <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                              <div class="modal-box-left">
                                                <div class="modal-head">
                                                  <button type="button" class="close" data-dismiss="modal"
                                                    aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                  </button>
                                                  <h3>Combination Salad</h3>
                                                </div>
                                                <div class="modal-desc">
                                                  <form id="popup_1_1" class="form-horizontal"
                                                    onsubmit="return false;">
                                                    <div class="modal-textarea">
                                                      <h4>Quantity</h4>
                                                      <input type="text" size="20" name="CombinationSaladCount"
                                                        maxlength="20" required="required" pattern="^\d+$">
                                                      <h5>
                                                        Special Instructions<span>Additional charges
                                                          may apply.</span>
                                                      </h5>
                                                      <input type="text" size="60" name="CombinationSaladSpl"
                                                        maxlength="20">
                                                      <div class="clearfix"></div>
                                                      <div class="modal-sub">
                                                        <input type="button" data-dismiss="modal" name=""
                                                          value="Add to Cart"
                                                          onclick="populateFullMenuCombinationSaladSelectedItems();" />
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
					
					
					<!--  end of collapse -->
					</div>
					
					
					<!--  end of collapse -->
					
					
					
					</div>
				</div>
				<div class="col-md-4 rest-sidebar">
					<div class="hut-sec">
						<h3>Selected Items</h3>
						<div class="slide"></div>

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
									<!-- <button type="button" onclick="california_kabob_menu_submit();"
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
		 $('.slide .list-item .left').each(function() {   modal-sm
			var name = $(this).children().prev().text();
			var desc = $(this).children().next().text();
			console.log("Title: " + name);
			console.log("Desc: " + desc);
			kabob_and_gyro_grill_items.push(name + "+" + desc); //california_kabob_menu_items is in California_Kabob_Restaurant_95827.js 
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

