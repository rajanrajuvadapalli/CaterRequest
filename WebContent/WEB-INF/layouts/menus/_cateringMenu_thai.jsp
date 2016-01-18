<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	function remove_thai_item(div_id) {
		var divToRemove = $("div[id=" + div_id + "]");
		var name = divToRemove.children().children().prev().text();
		var desc = divToRemove.children().children().next().text();
		var data = name + "+" + desc;
		console.log("Removing " + data);
		thai_menu_items.splice($.inArray(data, thai_menu_items), 1);
		divToRemove.remove();
	}

	function thai_menu_submit() {
		if (thai_menu_items.length == 0) {
			alert("Please select at least 1 item to proceed.");
			return false;
		}
		console.log(thai_menu_items);
		//console.log(JSON.stringify(thai_menu_items));
		$("#thai-menu-items").val(JSON.stringify(thai_menu_items));
		$("#thaitarget").submit();
	}
</script>

<!-- Page Canvas-->
<div id="page-canvas">
	<input type="hidden" id="refreshed" value="no">
	<!--Off Canvas Navigation-->
	<nav class="off-canvas-navigation">
		<header>Navigation</header>
		<div class="main-navigation navigation-off-canvas"></div>
	</nav>
	<!--end Off Canvas Navigation-->

	<!--Page Content-->
	<div id="page-content">
		<!--/.container-->
		<section id="image">
			<div class="container">
				<div class="col-md-8 col-md-offset-2">
					<div class="text-banner">
						<figure>
							<img
								src="${pageContext.request.contextPath}/resources/assets/img/marker.png"
								alt="">
						</figure>
						<div class="description">
							<h2>Pick the desired Menu</h2>
							<p>Just click on each of the item to get them selected. Its
								as easy as that.</p>
						</div>
					</div>
				</div>
			</div>
			<!--/.container-->
			<div class="background">
				<img
					src="${pageContext.request.contextPath}/resources/assets/img/about-us-bg.jpg"
					alt="">
			</div>
			<!--/.background-->
		</section>

		<section class="container" style="padding-top: 50px;">
			<div class="">
				<!--Content-->
				<div class="">
					<h3>Click on the image below to build your items.</h3>
					<!--Listing Grid-->
					<section class="block equal-height col-md-6 col-xs-12">
						<div class="row">
							<c:forEach items="${menu.categories}" var="category"
								varStatus="catloop">
								<c:forEach items="${category.items}" var="item" varStatus="loop">
									<div class="col-md-4 col-sm-3 col-xs-6">
										<div class="item" id="C${catloop.index}">
											<div class="image">
												<a class="popup-with-form"
													href="#popup_${catloop.index}_${loop.index}">
													<div class="item-specific">
														<span class="name">${item.name}</span>
													</div>
													<div>
														<span hidden="hidden">${item.code}</span>
													</div> <img
													src="https://s3-us-west-2.amazonaws.com/rajrv-caterrequest-s3bucket/images_menu/THAI/${item.code}.jpg"
													alt="">
												</a>
											</div>
										</div>
										<!-- /.item-->
									</div>
								</c:forEach>
							</c:forEach>
						</div>
						<!--/.row-->
					</section>

					<section class="col-md-6 col-xs-12">
						<div class="col-md-12 col-sm-12">
							<section>
								<!-- /.block -->
								<article class="block">
									<header>
										<h2>Menu Summary</h2>
									</header>
									<div class="list-slider owl-carousel owl-theme owl-loaded">

										<!-- /.slide -->
										<div class="slide">
											<header>
												<h3>
													<i class="fa fa-calendar"></i>Selected Items
												</h3>
											</header>
											<c:forEach items="${thai_items}" var="m" varStatus="loop">
												<div class="list-item" id="m_${loop.index}">
													<div class="left">
														<h4>${m.key}</h4>
														<figure>${m.value}</figure>
													</div>
													<span class="thai-item-close remove-item"
														onclick="remove_thai_item('m_${loop.index}');">X</span>
													<div class="right "></div>
												</div>
											</c:forEach>
										</div>
									</div>
									<!-- /.list-slider -->
								</article>
								<!-- /.block -->

							</section>
						</div>
						<div class="col-md-12 col-sm-12">
							<section>
								<div class="form-group clearfix" style="text-align: center;">
									<form action="${pageContext.request.contextPath}/menu/saveMenu"
										id="thaitarget" method="post">
										<input type="hidden" name="thai_menu_items"
											id="thai-menu-items"> <input type="hidden"
											name="cuisineType" value="${menu.cuisine}">
										<textarea rows="4" cols="50" name="comments"
											placeholder="Enter you comments to restaurant here"
											class="form-control">${menu.comments}</textarea>
										<figure class="note butnote">ONCE THE DESIRED MENU IS
											SELECTED, CLICK ON THE BUTTON BELOW TO SELECT THE RESTAURANTS
											TO REQUEST QUOTE FROM
										</figure>
										<c:choose>
											<c:when test="${sessionScope.user.isGuest()}">
												<button type="button" onclick="thai_menu_submit();"
													class="btn btn-default">Next</button>
											</c:when>
											<c:otherwise>
												<button type="button" onclick="thai_menu_submit();"
													class="btn btn-default">Select Restaurants</button>
											</c:otherwise>
										</c:choose>
									</form>
								</div>

							</section>
						</div>
					</section>
					<!--end Listing Grid-->
				</div>
			</div>
		</section>
	</div>
	<!-- end Page Content-->
</div>
<!-- end Page Canvas-->

<div id="popup_0_0"
	class="mfp-hide white-popup-block thaiPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="popup_0_0" class="form-horizontal"
		onsubmit="return populateVegeterianSpringRollSelectedItems();">
		<span id="thai-popup-title"><h2>Vegeterian Spring Rolls</h2></span> <b>Description:</b>&nbsp;
		Stuffed with cabbage, carrots, celery, and grass noodles. Served with
		plum sauce.
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Count<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<input type="text" size="20" name="springRollCount" maxlength="20"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="springRollSpl" maxlength="20"
					class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-4 control-label"></label>
			<div class="col-sm-2">
				<button type="submit" class="btn btn-default popup-modal-dismiss">Add</button>
			</div>
		</div>
	</form>
</div>

<div id="popup_0_1"
	class="mfp-hide white-popup-block thaiPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="popup_0_1" class="form-horizontal"
		onsubmit="return populateChickenSataySelectedItems();">
		<span id="thai-popup-title"><h2>Chicken Satay</h2></span> <b>Description:</b>&nbsp;
		Chicken breast marinated with Thai herbs and spices on sticks. Served
		with peanut sauce and cucumber salad.
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Count<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<input type="text" size="20" name="chickenSatayCount" maxlength="20"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="chickenSataySpl" maxlength="20"
					class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-4 control-label"></label>
			<div class="col-sm-2">
				<button type="submit" class="btn btn-default popup-modal-dismiss">Add</button>
			</div>
		</div>
	</form>
</div>

<div id="popup_0_2"
	class="mfp-hide white-popup-block thaiPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="popup_0_2" class="form-horizontal"
		onsubmit="return populateFriedCalamariSelectedItems();">
		<span id="thai-popup-title"><h2>Fried Calamari</h2></span> <b>Description:</b>&nbsp;Sliced
		fresh calamari dipped in batter sweet garlic plum sauce.
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Count<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<input type="text" size="20" name="fcount" maxlength="20"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Serving size<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="fservingSize" required="required"
							value="Small"> Half Size Tray (Serves 6-8 People)
					</div>
					<div class="input-group">
						<input type="radio" name="fservingSize" required="required"
							value="Large"> Full Size Tray (Serves 12-15 People)
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="fspl" maxlength="20"
					class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-4 control-label"></label>
			<div class="col-sm-2">
				<button type="submit" class="btn btn-default popup-modal-dismiss">Add</button>
			</div>
		</div>
	</form>
</div>

<div id="popup_1_0"
	class="mfp-hide white-popup-block thaiPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="popup_1_0" class="form-horizontal"
		onsubmit="return populateTomYumSoupSelectedItems();">
		<span id="thai-popup-title"><h2>Tom Yum Soup</h2></span> <b>Description:</b>&nbsp;Spicy
		and sour soup with choice of meat, mushrooms, fresh lime juice, lemon
		grass, kaffir lime leaves, cilantro and chili paste.
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Count<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<input type="text" size="20" name="tycount" maxlength="20"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Serving size<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="tyservingSize" required="required"
							value="Small"> Half Size Tray (Serves 6-8 People)
					</div>
					<div class="input-group">
						<input type="radio" name="tyservingSize" required="required"
							value="Large"> Full Size Tray (Serves 12-15 People)
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choice of meat <span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="tymeat" required="required"
							value="Chicken"> Chicken
					</div>
					<div class="input-group">
						<input type="radio" name="tymeat" required="required"
							value="Shrimp"> Shrimp
					</div>
					<div class="input-group">
						<input type="radio" name="tymeat" required="required" value="Beef">
						Beef
					</div>
					<div class="input-group">
						<input type="radio" name="tymeat" required="required" value="Pork">
						Pork
					</div>
					<div class="input-group">
						<input type="radio" name="tymeat" required="required" value="Tofu">
						Tofu
					</div>
					<div class="input-group">
						<input type="radio" name="tymeat" required="required"
							value="No Egg"> No Egg
					</div>

				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">How spicy?<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="tyspicy" required="required"
							value="Mild"> Mild
					</div>
					<div class="input-group">
						<input type="radio" name="tyspicy" required="required"
							value="Medium"> Medium
					</div>
					<div class="input-group">
						<input type="radio" name="tyspicy" required="required" value="Hot">
						Hot
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="tyspl" maxlength="20"
					class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-4 control-label"></label>
			<div class="col-sm-2">
				<button type="submit" class="btn btn-default popup-modal-dismiss">Add</button>
			</div>
		</div>
	</form>
</div>

<div id="popup_1_1"
	class="mfp-hide white-popup-block thaiPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="popup_1_1" class="form-horizontal"
		onsubmit="return populateTomKhaSoupSelectedItems();">
		<span id="thai-popup-title"><h2>Tom Kha Soup</h2></span> <b>Description:</b>&nbsp;Coconut
		milk soup with choice of meat, mushrooms, fresh lime juice, lemon
		grass, kaffir lime leaves, cilantro and chili paste.
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Count<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<input type="text" size="20" name="tkcount" maxlength="20"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Serving size<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="tkservingSize" required="required"
							value="Small"> Half Size Tray (Serves 6-8 People)
					</div>
					<div class="input-group">
						<input type="radio" name="tkservingSize" required="required"
							value="Large"> Full Size Tray (Serves 12-15 People)
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choice of meat <span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="tkmeat" required="required"
							value="Chicken"> Chicken
					</div>
					<div class="input-group">
						<input type="radio" name="tkmeat" required="required"
							value="Shrimp"> Shrimp
					</div>
					<div class="input-group">
						<input type="radio" name="tkmeat" required="required" value="Beef">
						Beef
					</div>
					<div class="input-group">
						<input type="radio" name="tkmeat" required="required" value="Pork">
						Pork
					</div>
					<div class="input-group">
						<input type="radio" name="tkmeat" required="required" value="Tofu">
						Tofu
					</div>
					<div class="input-group">
						<input type="radio" name="tkmeat" required="required"
							value="No Egg"> No Egg
					</div>

				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">How spicy?<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="tkspicy" required="required"
							value="Mild"> Mild
					</div>
					<div class="input-group">
						<input type="radio" name="tkspicy" required="required"
							value="Medium"> Medium
					</div>
					<div class="input-group">
						<input type="radio" name="tkspicy" required="required" value="Hot">
						Hot
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="tkspl" maxlength="20"
					class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-4 control-label"></label>
			<div class="col-sm-2">
				<button type="submit" class="btn btn-default popup-modal-dismiss">Add</button>
			</div>
		</div>
	</form>
</div>

<div id="popup_1_2"
	class="mfp-hide white-popup-block thaiPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="popup_1_2" class="form-horizontal"
		onsubmit="return populateGreenPapayaSaladSelectedItems();">
		<span id="thai-popup-title"><h2>Green Papaya Salad</h2></span> <b>Description:</b>&nbsp;Spicy
		salad made from shredded unripe papayae, choice of meat and other
		veggies.
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Count<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<input type="text" size="20" name="gpscount" maxlength="20"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Serving size<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="gpsservingSize" required="required"
							value="Small"> Half Size Tray (Serves 6-8 People)
					</div>
					<div class="input-group">
						<input type="radio" name="gpsservingSize" required="required"
							value="Large"> Full Size Tray (Serves 12-15 People)
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">How spicy?<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="gpsspicy" required="required"
							value="Mild"> Mild
					</div>
					<div class="input-group">
						<input type="radio" name="gpsspicy" required="required"
							value="Medium"> Medium
					</div>
					<div class="input-group">
						<input type="radio" name="gpsspicy" required="required"
							value="Hot"> Hot
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="gpsspl" maxlength="20"
					class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-4 control-label"></label>
			<div class="col-sm-2">
				<button type="submit" class="btn btn-default popup-modal-dismiss">Add</button>
			</div>
		</div>
	</form>
</div>

<div id="popup_2_0"
	class="mfp-hide white-popup-block thaiPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="popup_2_0" class="form-horizontal"
		onsubmit="return populateThaiPadThaiSelectedItems();">
		<span id="thai-popup-title"><h2>Pad Thai</h2></span> <b>Description:</b>&nbsp;Popular
		noodle dish; pan stir fried noodles with bean sprouts, onion and
		ground peanuts.
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Count<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<input type="text" size="20" name="ptcount" maxlength="20"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Serving size<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="ptservingSize" required="required"
							value="Small"> Half Size Tray (Serves 6-8 People)
					</div>
					<div class="input-group">
						<input type="radio" name="ptservingSize" required="required"
							value="Large"> Full Size Tray (Serves 12-15 People)
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choice of meat <span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="ptmeat" required="required"
							value="Chicken"> Chicken
					</div>
					<div class="input-group">
						<input type="radio" name="ptmeat" required="required"
							value="Shrimp"> Shrimp
					</div>
					<div class="input-group">
						<input type="radio" name="ptmeat" required="required" value="Beef">
						Beef
					</div>
					<div class="input-group">
						<input type="radio" name="ptmeat" required="required" value="Pork">
						Pork
					</div>
					<div class="input-group">
						<input type="radio" name="ptmeat" required="required" value="Tofu">
						Tofu
					</div>
					<div class="input-group">
						<input type="radio" name="ptmeat" required="required"
							value="No Egg"> No Egg
					</div>

				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">How spicy?<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="ptspicy" required="required"
							value="Mild"> Mild
					</div>
					<div class="input-group">
						<input type="radio" name="ptspicy" required="required"
							value="Medium"> Medium
					</div>
					<div class="input-group">
						<input type="radio" name="ptspicy" required="required" value="Hot">
						Hot
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="ptspl" maxlength="20"
					class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-4 control-label"></label>
			<div class="col-sm-2">
				<button type="submit" class="btn btn-default popup-modal-dismiss">Add</button>
			</div>
		</div>
	</form>
</div>

<div id="popup_2_1"
	class="mfp-hide white-popup-block thaiPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="popup_2_1" class="form-horizontal"
		onsubmit="return populateDrunkenNoodlesSelectedItems();">
		<span id="thai-popup-title"><h2>Drunken Noodles</h2></span> <b>Description:</b>&nbsp;Wide
		rice noodles with choices of meat; wok fried garlic, chili cabbage,
		tomatoes, carrots and basil leaves.
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Count<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<input type="text" size="20" name="dncount" maxlength="20"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Serving size<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="dnservingSize" required="required"
							value="Small"> Half Size Tray (Serves 6-8 People)
					</div>
					<div class="input-group">
						<input type="radio" name="dnservingSize" required="required"
							value="Large"> Full Size Tray (Serves 12-15 People)
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choice of meat <span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="dnmeat" required="required"
							value="Chicken"> Chicken
					</div>
					<div class="input-group">
						<input type="radio" name="dnmeat" required="required"
							value="Shrimp"> Shrimp
					</div>
					<div class="input-group">
						<input type="radio" name="dnmeat" required="required" value="Beef">
						Beef
					</div>
					<div class="input-group">
						<input type="radio" name="dnmeat" required="required" value="Pork">
						Pork
					</div>
					<div class="input-group">
						<input type="radio" name="dnmeat" required="required" value="Tofu">
						Tofu
					</div>
					<div class="input-group">
						<input type="radio" name="dnmeat" required="required"
							value="No Egg"> No Egg
					</div>

				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">How spicy?<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="dnspicy" required="required"
							value="Mild"> Mild
					</div>
					<div class="input-group">
						<input type="radio" name="dnspicy" required="required"
							value="Medium"> Medium
					</div>
					<div class="input-group">
						<input type="radio" name="dnspicy" required="required" value="Hot">
						Hot
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="dnspl" maxlength="20"
					class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-4 control-label"></label>
			<div class="col-sm-2">
				<button type="submit" class="btn btn-default popup-modal-dismiss">Add</button>
			</div>
		</div>
	</form>
</div>


<div id="popup_3_0"
	class="mfp-hide white-popup-block thaiPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="popup_3_0" class="form-horizontal"
		onsubmit="return populateThaiFriedRiceSelectedItems();">
		<span id="thai-popup-title"><h2>Thai Fried Rice</h2></span> <b>Description:</b>&nbsp;Fried
		rice with choice of meat, garlic, chili bamboo shoots, bell pepper.
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Count<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<input type="text" size="20" name="frcount" maxlength="20"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Serving size<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="frservingSize" required="required"
							value="Small"> Half Size Tray (Serves 6-8 People)
					</div>
					<div class="input-group">
						<input type="radio" name="frservingSize" required="required"
							value="Large"> Full Size Tray (Serves 12-15 People)
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choice of meat <span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="frmeat" required="required"
							value="Chicken"> Chicken
					</div>
					<div class="input-group">
						<input type="radio" name="frmeat" required="required"
							value="Shrimp"> Shrimp
					</div>
					<div class="input-group">
						<input type="radio" name="frmeat" required="required" value="Beef">
						Beef
					</div>
					<div class="input-group">
						<input type="radio" name="frmeat" required="required" value="Pork">
						Pork
					</div>
					<div class="input-group">
						<input type="radio" name="frmeat" required="required" value="Tofu">
						Tofu
					</div>
					<div class="input-group">
						<input type="radio" name="frmeat" required="required"
							value="No Egg"> No Egg
					</div>

				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">How spicy?<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="frspicy" required="required"
							value="Mild"> Mild
					</div>
					<div class="input-group">
						<input type="radio" name="frspicy" required="required"
							value="Medium"> Medium
					</div>
					<div class="input-group">
						<input type="radio" name="frspicy" required="required" value="Hot">
						Hot
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="frspl" maxlength="20"
					class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-4 control-label"></label>
			<div class="col-sm-2">
				<button type="submit" class="btn btn-default popup-modal-dismiss">Add</button>
			</div>
		</div>
	</form>
</div>

<div id="popup_3_1"
	class="mfp-hide white-popup-block thaiPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="popup_3_1" class="form-horizontal"
		onsubmit="return populatePineappleFriedRiceSelectedItems();">
		<span id="thai-popup-title"><h2>Pineapple Fried Rice</h2></span> <b>Description:</b>&nbsp;Exotic
		fried rice with choice of meat, egg, tomatoes, onion, cashew nuts and
		pineapple.
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Count<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<input type="text" size="20" name="pfrcount" maxlength="20"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Serving size<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="pfrservingSize" required="required"
							value="Small"> Half Size Tray (Serves 6-8 People)
					</div>
					<div class="input-group">
						<input type="radio" name="pfrservingSize" required="required"
							value="Large"> Full Size Tray (Serves 12-15 People)
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choice of meat <span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="pfrmeat" required="required"
							value="Chicken"> Chicken
					</div>
					<div class="input-group">
						<input type="radio" name="pfrmeat" required="required"
							value="Shrimp"> Shrimp
					</div>
					<div class="input-group">
						<input type="radio" name="pfrmeat" required="required"
							value="Beef"> Beef
					</div>
					<div class="input-group">
						<input type="radio" name="pfrmeat" required="required"
							value="Pork"> Pork
					</div>
					<div class="input-group">
						<input type="radio" name="pfrmeat" required="required"
							value="Tofu"> Tofu
					</div>
					<div class="input-group">
						<input type="radio" name="pfrmeat" required="required"
							value="No Egg"> No Egg
					</div>

				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">How spicy?<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="pfrspicy" required="required"
							value="Mild"> Mild
					</div>
					<div class="input-group">
						<input type="radio" name="pfrspicy" required="required"
							value="Medium"> Medium
					</div>
					<div class="input-group">
						<input type="radio" name="pfrspicy" required="required"
							value="Hot"> Hot
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="pfrspl" maxlength="20"
					class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-4 control-label"></label>
			<div class="col-sm-2">
				<button type="submit" class="btn btn-default popup-modal-dismiss">Add</button>
			</div>
		</div>
	</form>
</div>



<div id="popup_3_2"
	class="mfp-hide white-popup-block thaiPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="popup_3_2" class="form-horizontal"
		onsubmit="return populateBasilFriedRiceSelectedItems();">
		<span id="thai-popup-title"><h2>Basil Fried Rice</h2></span> <b>Description:</b>&nbsp;Fried
		rice with choice of meat, garlic, chili bamboo shoots, bell pepper and
		Thai basil.
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Count<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<input type="text" size="20" name="bfrcount" maxlength="20"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Serving size<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="bfrservingSize" required="required"
							value="Small"> Half Size Tray (Serves 6-8 People)
					</div>
					<div class="input-group">
						<input type="radio" name="bfrservingSize" required="required"
							value="Large"> Full Size Tray (Serves 12-15 People)
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choice of meat <span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="bfrmeat" required="required"
							value="Chicken"> Chicken
					</div>
					<div class="input-group">
						<input type="radio" name="bfrmeat" required="required"
							value="Shrimp"> Shrimp
					</div>
					<div class="input-group">
						<input type="radio" name="bfrmeat" required="required"
							value="Beef"> Beef
					</div>
					<div class="input-group">
						<input type="radio" name="bfrmeat" required="required"
							value="Pork"> Pork
					</div>
					<div class="input-group">
						<input type="radio" name="bfrmeat" required="required"
							value="Tofu"> Tofu
					</div>
					<div class="input-group">
						<input type="radio" name="bfrmeat" required="required"
							value="No Egg"> No Egg
					</div>

				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">How spicy?<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="bfrspicy" required="required"
							value="Mild"> Mild
					</div>
					<div class="input-group">
						<input type="radio" name="bfrspicy" required="required"
							value="Medium"> Medium
					</div>
					<div class="input-group">
						<input type="radio" name="bfrspicy" required="required"
							value="Hot"> Hot
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="bfrspl" maxlength="20"
					class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-4 control-label"></label>
			<div class="col-sm-2">
				<button type="submit" class="btn btn-default popup-modal-dismiss">Add</button>
			</div>
		</div>
	</form>
</div>

<div id="popup_4_0"
	class="mfp-hide white-popup-block thaiPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="popup_4_0" class="form-horizontal"
		onsubmit="return populateRedCurrySelectedItems();">
		<span id="thai-popup-title"><h2>Red Curry</h2></span> <b>Description:</b>&nbsp;Choice
		of meat simmered in red curry paste, coconut milk, bamboo shoots, bell
		pepper and Thai basil leaves.
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Count<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<input type="text" size="20" name="rccount" maxlength="20"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Serving size<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="rcservingSize" required="required"
							value="Small"> Half Size Tray (Serves 6-8 People)
					</div>
					<div class="input-group">
						<input type="radio" name="rcservingSize" required="required"
							value="Large"> Full Size Tray (Serves 12-15 People)
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choice of meat <span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="rcmeat" required="required"
							value="Chicken"> Chicken
					</div>
					<div class="input-group">
						<input type="radio" name="rcmeat" required="required"
							value="Shrimp"> Shrimp
					</div>
					<div class="input-group">
						<input type="radio" name="rcmeat" required="required" value="Beef">
						Beef
					</div>
					<div class="input-group">
						<input type="radio" name="rcmeat" required="required" value="Pork">
						Pork
					</div>
					<div class="input-group">
						<input type="radio" name="rcmeat" required="required" value="Tofu">
						Tofu
					</div>
					<div class="input-group">
						<input type="radio" name="rcmeat" required="required"
							value="No Egg"> No Egg
					</div>

				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">How spicy?<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="rcspicy" required="required"
							value="Mild"> Mild
					</div>
					<div class="input-group">
						<input type="radio" name="rcspicy" required="required"
							value="Medium"> Medium
					</div>
					<div class="input-group">
						<input type="radio" name="rcspicy" required="required" value="Hot">
						Hot
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="rcspl" maxlength="20"
					class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-4 control-label"></label>
			<div class="col-sm-2">
				<button type="submit" class="btn btn-default popup-modal-dismiss">Add</button>
			</div>
		</div>
	</form>
</div>

<div id="popup_4_1"
	class="mfp-hide white-popup-block thaiPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="popup_4_1" class="form-horizontal"
		onsubmit="return populateGreenCurrySelectedItems();">
		<span id="thai-popup-title"><h2>Green Curry</h2></span> <b>Description:</b>&nbsp;Choice
		of meat, simmered in green chili curry paste, coconut milk, bell
		pepper and basil.
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Count<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<input type="text" size="20" name="gccount" maxlength="20"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Serving size<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="gcservingSize" required="required"
							value="Small"> Half Size Tray (Serves 6-8 People)
					</div>
					<div class="input-group">
						<input type="radio" name="gcservingSize" required="required"
							value="Large"> Full Size Tray (Serves 12-15 People)
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choice of meat <span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="gcmeat" required="required"
							value="Chicken"> Chicken
					</div>
					<div class="input-group">
						<input type="radio" name="gcmeat" required="required"
							value="Shrimp"> Shrimp
					</div>
					<div class="input-group">
						<input type="radio" name="gcmeat" required="required" value="Beef">
						Beef
					</div>
					<div class="input-group">
						<input type="radio" name="gcmeat" required="required" value="Pork">
						Pork
					</div>
					<div class="input-group">
						<input type="radio" name="gcmeat" required="required" value="Tofu">
						Tofu
					</div>
					<div class="input-group">
						<input type="radio" name="gcmeat" required="required"
							value="No Egg"> No Egg
					</div>

				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">How spicy?<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="gcspicy" required="required"
							value="Mild"> Mild
					</div>
					<div class="input-group">
						<input type="radio" name="gcspicy" required="required"
							value="Medium"> Medium
					</div>
					<div class="input-group">
						<input type="radio" name="gcspicy" required="required" value="Hot">
						Hot
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="gcspl" maxlength="20"
					class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-4 control-label"></label>
			<div class="col-sm-2">
				<button type="submit" class="btn btn-default popup-modal-dismiss">Add</button>
			</div>
		</div>
	</form>
</div>

<div id="popup_4_2"
	class="mfp-hide white-popup-block thaiPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="popup_4_2" class="form-horizontal"
		onsubmit="return populateYellowCurrySelectedItems();">
		<span id="thai-popup-title"><h2>Yellow Curry</h2></span> <b>Description:</b>&nbsp;Choice
		of meat, simmered in yellow curry paste, coconut milk, potatoes and
		carrots.
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Count<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<input type="text" size="20" name="yccount" maxlength="20"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Serving size<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="ycservingSize" required="required"
							value="Small"> Half Size Tray (Serves 6-8 People)
					</div>
					<div class="input-group">
						<input type="radio" name="ycservingSize" required="required"
							value="Large"> Full Size Tray (Serves 12-15 People)
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choice of meat <span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="ycmeat" required="required"
							value="Chicken"> Chicken
					</div>
					<div class="input-group">
						<input type="radio" name="ycmeat" required="required"
							value="Shrimp"> Shrimp
					</div>
					<div class="input-group">
						<input type="radio" name="ycmeat" required="required" value="Beef">
						Beef
					</div>
					<div class="input-group">
						<input type="radio" name="ycmeat" required="required" value="Pork">
						Pork
					</div>
					<div class="input-group">
						<input type="radio" name="ycmeat" required="required" value="Tofu">
						Tofu
					</div>
					<div class="input-group">
						<input type="radio" name="ycmeat" required="required"
							value="No Egg"> No Egg
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">How spicy?<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="ycspicy" required="required"
							value="Mild"> Mild
					</div>
					<div class="input-group">
						<input type="radio" name="ycspicy" required="required"
							value="Medium"> Medium
					</div>
					<div class="input-group">
						<input type="radio" name="ycspicy" required="required" value="Hot">
						Hot
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="ycspl" maxlength="20"
					class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-4 control-label"></label>
			<div class="col-sm-2">
				<button type="submit" class="btn btn-default popup-modal-dismiss">Add</button>
			</div>
		</div>
	</form>
</div>

<div id="popup_4_3"
	class="mfp-hide white-popup-block thaiPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="popup_4_2" class="form-horizontal"
		onsubmit="return populatePanangCurrySelectedItems();">
		<span id="thai-popup-title"><h2>Panang Curry</h2></span> <b>Description:</b>&nbsp;Choice
		of meat simmered in thick red curry paste, coconut milk, bell pepper
		and lime leaves.
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Count<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<input type="text" size="20" name="pccount" maxlength="20"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Serving size<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="pcservingSize" required="required"
							value="Small"> Half Size Tray (Serves 6-8 People)
					</div>
					<div class="input-group">
						<input type="radio" name="pcservingSize" required="required"
							value="Large"> Full Size Tray (Serves 12-15 People)
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choice of meat <span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="pcmeat" required="required"
							value="Chicken"> Chicken
					</div>
					<div class="input-group">
						<input type="radio" name="pcmeat" required="required"
							value="Shrimp"> Shrimp
					</div>
					<div class="input-group">
						<input type="radio" name="pcmeat" required="required" value="Beef">
						Beef
					</div>
					<div class="input-group">
						<input type="radio" name="pcmeat" required="required" value="Pork">
						Pork
					</div>
					<div class="input-group">
						<input type="radio" name="pcmeat" required="required" value="Tofu">
						Tofu
					</div>
					<div class="input-group">
						<input type="radio" name="pcmeat" required="required"
							value="No Egg"> No Egg
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">How spicy?<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="pcspicy" required="required"
							value="Mild"> Mild
					</div>
					<div class="input-group">
						<input type="radio" name="pcspicy" required="required"
							value="Medium"> Medium
					</div>
					<div class="input-group">
						<input type="radio" name="pcspicy" required="required" value="Hot">
						Hot
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="pcspl" maxlength="20"
					class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-4 control-label"></label>
			<div class="col-sm-2">
				<button type="submit" class="btn btn-default popup-modal-dismiss">Add</button>
			</div>
		</div>
	</form>
</div>

<script>
	$(window).load(function() {
		var rtl = false; // Use RTL
		initializeOwl(rtl);
		//Show only the first category when the window loads.
		//$('#C0').click();
		//For the items that were selected in previous transaction,
		//send click event on the div with 'overlay' class (to simulate 'select' action).
		/*$(".turn-me-on").each(function() {
			$(this).parent().children().click();
		});*/
		//When the user clicks back button, force reload page.
		/*var e = document.getElementById("refreshed");
		if (e.value == "no")
			e.value = "yes";
		else {
			e.value = "no";
			location.reload();
		}*/
	});

	$('document').ready(function() {
		$('.slide .list-item .left').each(function() {
			var thaiName = $(this).children().prev().text();
			var desc = $(this).children().next().text();
			console.log("Title: " + thaiName);
			console.log("Desc: " + desc);
			thai_menu_items.push(thaiName + "+" + desc); //thai_menu_items is in cater-thai.js
		});

		//For the items that were selected in previous transaction,
		//send click event on the div with 'overlay' class (to simulate 'select' action).
		/*$(".turn-me-on").each(function() {
			$(this).parent().children().click();
		});*/
	});
</script>
