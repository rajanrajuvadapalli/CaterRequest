<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	function remove_sandwich_item(div_id) {
		var divToRemove = $("div[id=" + div_id + "]");
		var name = divToRemove.children().children().prev().text();
		var desc = divToRemove.children().children().next().text();
		var data = name + "+" + desc;
		console.log("Removing " + data);
		sandwich_menu_items.splice($.inArray(data, sandwich_menu_items), 1);
		divToRemove.remove();
	}

	function sandwich_menu_submit() {
		if (sandwich_menu_items.length == 0) {
			alert("Please select at least 1 item to proceed.");
			return false;
		}
		console.log(sandwich_menu_items);
		//console.log(JSON.stringify(sandwich_menu_items));
		$("#sandwich-menu-items").val(JSON.stringify(sandwich_menu_items));
		$("#sandwichtarget").submit();
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
							<c:forEach items="${menu.categories}" var="category">
								<c:forEach items="${category.items}" var="item" varStatus="loop">

									<div class="col-md-4 col-sm-3 col-xs-6">
										<div class="item" id="C${loop.index}">
											<div class="image">
												<a class="popup-with-form" href="#popup_${loop.index}">
													<div class="item-specific">
														<span class="name">${item.name}</span>
													</div>
													<div>
														<span hidden="hidden">${item.code}</span>
													</div> <img
													src="https://s3-us-west-2.amazonaws.com/rajrv-caterrequest-s3bucket/images_menu/SANDWICH/${item.code}.jpg"
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
											<c:forEach items="${sandwich_items}" var="m" varStatus="loop">
												<div class="list-item" id="m_${loop.index}">
													<div class="left">
														<h4>${m.key}</h4>
														<figure>${m.value}</figure>
													</div>
													<span class="sandwich-item-close remove-item"
														onclick="remove_sandwich_item('m_${loop.index}');">X</span>
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
								<div class="center">
									<figure class="note butnote">ONCE THE DESIRED MENU IS
										SELECTED, CLICK ON THE BUTTON BELOW TO SELECT THE RESTAURANTS
										TO REQUEST QUOTE FROM
									</figure>
								</div>
								<div class="form-group clearfix" style="text-align: center;">
									<form action="${pageContext.request.contextPath}/menu/saveMenu"
										id="sandwichtarget" method="post">
										<input type="hidden" name="sandwich_menu_items"
											id="sandwich-menu-items"> <input type="hidden"
											name="cuisineType" value="${menu.cuisine}">
										<textarea rows="4" cols="50" name="comments"
											placeholder="Enter you comments to restaurant here"
											class="form-control">${menu.comments}</textarea>
										<br />
										<button type="button" onclick="sandwich_menu_submit();"
											class="btn btn-default">Select Restaurants</button>
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

<div id="popup_0"
	class="mfp-hide white-popup-block sandwichPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="popup_0" class="form-horizontal"
		onsubmit="return populateChickenSandwichSelectedItems();">
		<span id="sandwich-popup-title"><h2>Chicken Sandwich</h2></span>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Count<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<input type="text" size="20" name="cscount" maxlength="20"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choice of Meat<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6 col-md-6">
					<div class="input-group">
						<input type="checkbox" name="csmeat" value="Chicken"
							checked="checked" disabled="disabled"> Chicken
					</div>
					<div class="input-group">
						<input type="checkbox" name="csmeat" value="Turkey">
						Turkey
					</div>
					<div class="input-group">
						<input type="checkbox" name="csmeat" value="Roast Beef">
						Roast Beef
					</div>
					<div class="input-group">
						<input type="checkbox" name="csmeat" value="Salami">
						Salami
					</div>
					<div class="input-group">
						<input type="checkbox" name="csmeat" value="Bacon"> Bacon
					</div>
					<div class="input-group">
						<input type="checkbox" name="csmeat" value="Pastrami">
						Pastrami
					</div>
					<div class="input-group">
						<input type="checkbox" name="csmeat" value="Ham"> Ham
					</div>
					<div class="input-group">
						<input type="checkbox" name="csmeat" value="Tuna"> Tuna
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Bread<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="csbread" required="required"
							value="White"> White
					</div>
					<div class="input-group">
						<input type="radio" name="csbread" required="required"
							value="Wheat"> Wheat
					</div>
					<div class="input-group">
						<input type="radio" name="csbread" required="required"
							value="Sourdough"> Sourdough
					</div>
					<div class="input-group">
						<input type="radio" name="csbread" required="required"
							value="Ducth Crunch"> Ducth Crunch
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Cheese<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="cscheese" required="required"
							value="American"> American
					</div>
					<div class="input-group">
						<input type="radio" name="cscheese" required="required"
							value="Swiss"> Swiss
					</div>
					<div class="input-group">
						<input type="radio" name="cscheese" required="required"
							value="Cheddar"> Cheddar
					</div>
					<div class="input-group">
						<input type="radio" name="cscheese" required="required"
							value="Pepper Jack"> Pepper Jack
					</div>
					<div class="input-group">
						<input type="radio" name="cscheese" required="required"
							value="Provolone"> Provolone
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Veggies<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="csveggies" required="required"
							value="Lettuce"> Lettuce
					</div>
					<div class="input-group">
						<input type="radio" name="csveggies" required="required"
							value="Onion"> Onion
					</div>
					<div class="input-group">
						<input type="radio" name="csveggies" required="required"
							value="Spinach"> Spinach
					</div>
					<div class="input-group">
						<input type="radio" name="csveggies" required="required"
							value="Jalapeno"> Jalapeno
					</div>
					<div class="input-group">
						<input type="radio" name="csveggies" required="required"
							value="Black Olives"> Black Olives
					</div>
					<div class="input-group">
						<input type="radio" name="csveggies" required="required"
							value="Tomato"> Tomato
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Others<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="csothers" required="required"
							value="Salt"> Salt
					</div>
					<div class="input-group">
						<input type="radio" name="csothers" required="required"
							value="Oil"> Oil
					</div>
					<div class="input-group">
						<input type="radio" name="csothers" required="required"
							value="Red Wine Vinegar"> Red Wine Vinegar
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Dressings<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="csdressing" required="required"
							value="Mayonisse"> Mayonisse
					</div>
					<div class="input-group">
						<input type="radio" name="csdressing" required="required"
							value="Mustard"> Mustard
					</div>
					<div class="input-group">
						<input type="radio" name="csdressing" required="required"
							value="Ranch"> Ranch
					</div>
					<div class="input-group">
						<input type="radio" name="csdressing" required="required"
							value="Italian"> Italian
					</div>
					<div class="input-group">
						<input type="radio" name="csdressing" required="required"
							value="Chipotle"> Chipotle
					</div>
				</div>
			</div>
		</div>

		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Extras<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="csextras" required="required"
							value="Cheese"> Cheese
					</div>
					<div class="input-group">
						<input type="radio" name="csextras" required="required"
							value="Bacon"> Bacon
					</div>
					<div class="input-group">
						<input type="radio" name="csextras" required="required"
							value="Avacado"> Avacado
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="csspl" maxlength="20"
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

<div id="popup_1"
	class="mfp-hide white-popup-block sandwichPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="popup_1" class="form-horizontal"
		onsubmit="return populateTurkeySandwichSelectedItems();">
		<span id="sandwich-popup-title"><h2>Turkey Sandwich</h2></span>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Count<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<input type="text" size="20" name="tscount" maxlength="20"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choice of Meat<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6 col-md-6">
					<div class="input-group">
						<input type="checkbox" name="tsmeat" value="Chicken">
						Chicken
					</div>
					<div class="input-group">
						<input type="checkbox" name="tsmeat" value="Turkey"
							checked="checked" disabled="disabled"> Turkey
					</div>
					<div class="input-group">
						<input type="checkbox" name="tsmeat" value="Roast Beef">
						Roast Beef
					</div>
					<div class="input-group">
						<input type="checkbox" name="tsmeat" value="Salami">
						Salami
					</div>
					<div class="input-group">
						<input type="checkbox" name="tsmeat" value="Bacon"> Bacon
					</div>
					<div class="input-group">
						<input type="checkbox" name="tsmeat" value="Pastrami">
						Pastrami
					</div>
					<div class="input-group">
						<input type="checkbox" name="tsmeat" value="Ham"> Ham
					</div>
					<div class="input-group">
						<input type="checkbox" name="tsmeat" value="Tuna"> Tuna
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Bread<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="tsbread" required="required"
							value="White"> White
					</div>
					<div class="input-group">
						<input type="radio" name="tsbread" required="required"
							value="Wheat"> Wheat
					</div>
					<div class="input-group">
						<input type="radio" name="tsbread" required="required"
							value="Sourdough"> Sourdough
					</div>
					<div class="input-group">
						<input type="radio" name="tsbread" required="required"
							value="Ducth Crunch"> Ducth Crunch
					</div>

				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Cheese<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="tscheese" required="required"
							value="American"> American
					</div>
					<div class="input-group">
						<input type="radio" name="tscheese" required="required"
							value="Swiss"> Swiss
					</div>
					<div class="input-group">
						<input type="radio" name="tscheese" required="required"
							value="Cheddar"> Cheddar
					</div>
					<div class="input-group">
						<input type="radio" name="tscheese" required="required"
							value="Pepper Jack"> Pepper Jack
					</div>
					<div class="input-group">
						<input type="radio" name="tscheese" required="required"
							value="Provolone"> Provolone
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Veggies<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="tsveggies" required="required"
							value="Lettuce"> Lettuce
					</div>
					<div class="input-group">
						<input type="radio" name="tsveggies" required="required"
							value="Onion"> Onion
					</div>
					<div class="input-group">
						<input type="radio" name="tsveggies" required="required"
							value="Spinach"> Spinach
					</div>
					<div class="input-group">
						<input type="radio" name="tsveggies" required="required"
							value="Jalapeno"> Jalapeno
					</div>
					<div class="input-group">
						<input type="radio" name="tsveggies" required="required"
							value="Black Olives"> Black Olives
					</div>
					<div class="input-group">
						<input type="radio" name="tsveggies" required="required"
							value="Tomato"> Tomato
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Others<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="tsothers" required="required"
							value="Salt"> Salt
					</div>
					<div class="input-group">
						<input type="radio" name="tsothers" required="required"
							value="Oil"> Oil
					</div>
					<div class="input-group">
						<input type="radio" name="tsothers" required="required"
							value="Red Wine Vinegar"> Red Wine Vinegar
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Dressings<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="tsdressing" required="required"
							value="Mayonisse"> Mayonisse
					</div>
					<div class="input-group">
						<input type="radio" name="tsdressing" required="required"
							value="Mustard"> Mustard
					</div>
					<div class="input-group">
						<input type="radio" name="tsdressing" required="required"
							value="Ranch"> Ranch
					</div>
					<div class="input-group">
						<input type="radio" name="tsdressing" required="required"
							value="Italian"> Italian
					</div>
					<div class="input-group">
						<input type="radio" name="tsdressing" required="required"
							value="Chipotle"> Chipotle
					</div>
				</div>
			</div>
		</div>

		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Extras<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="tsextras" required="required"
							value="Cheese"> Cheese
					</div>
					<div class="input-group">
						<input type="radio" name="tsextras" required="required"
							value="Bacon"> Bacon
					</div>
					<div class="input-group">
						<input type="radio" name="tsextras" required="required"
							value="Avacado"> Avacado
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="tsspl" maxlength="20"
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

<div id="popup_2"
	class="mfp-hide white-popup-block sandwichPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="popup_2" class="form-horizontal"
		onsubmit="return populateRoastBeefSandwichSelectedItems();">
		<span id="sandwich-popup-title"><h2>Roast Beef Sandwich</h2></span>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Count<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<input type="text" size="20" name="rbscount" maxlength="20"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choice of Meat<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6 col-md-6">
					<div class="input-group">
						<input type="checkbox" name="rbsmeat" value="Chicken">
						Chicken
					</div>
					<div class="input-group">
						<input type="checkbox" name="rbsmeat" value="Turkey">
						Turkey
					</div>
					<div class="input-group">
						<input type="checkbox" name="rbsmeat" value="Roast Beef"
							checked="checked" disabled="disabled"> Roast Beef
					</div>
					<div class="input-group">
						<input type="checkbox" name="rbsmeat" value="Salami">
						Salami
					</div>
					<div class="input-group">
						<input type="checkbox" name="rbsmeat" value="Bacon"> Bacon
					</div>
					<div class="input-group">
						<input type="checkbox" name="rbsmeat" value="Pastrami">
						Pastrami
					</div>
					<div class="input-group">
						<input type="checkbox" name="rbsmeat" value="Ham"> Ham
					</div>
					<div class="input-group">
						<input type="checkbox" name="tmeat" value="Tuna"> Tuna
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Bread<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="rbsbread" required="required"
							value="White"> White
					</div>
					<div class="input-group">
						<input type="radio" name="rbsbread" required="required"
							value="Wheat"> Wheat
					</div>
					<div class="input-group">
						<input type="radio" name="rbsbread" required="required"
							value="Sourdough"> Sourdough
					</div>
					<div class="input-group">
						<input type="radio" name="rbsbread" required="required"
							value="Ducth Crunch"> Ducth Crunch
					</div>

				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Cheese<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="rbscheese" required="required"
							value="American"> American
					</div>
					<div class="input-group">
						<input type="radio" name="rbscheese" required="required"
							value="Swiss"> Swiss
					</div>
					<div class="input-group">
						<input type="radio" name="rbscheese" required="required"
							value="Cheddar"> Cheddar
					</div>
					<div class="input-group">
						<input type="radio" name="rbscheese" required="required"
							value="Pepper Jack"> Pepper Jack
					</div>
					<div class="input-group">
						<input type="radio" name="rbscheese" required="required"
							value="Provolone"> Provolone
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Veggies<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="rbsveggies" required="required"
							value="Lettuce"> Lettuce
					</div>
					<div class="input-group">
						<input type="radio" name="rbsveggies" required="required"
							value="Onion"> Onion
					</div>
					<div class="input-group">
						<input type="radio" name="rbsveggies" required="required"
							value="Spinach"> Spinach
					</div>
					<div class="input-group">
						<input type="radio" name="rbsveggies" required="required"
							value="Jalapeno"> Jalapeno
					</div>
					<div class="input-group">
						<input type="radio" name="rbsveggies" required="required"
							value="Black Olives"> Black Olives
					</div>
					<div class="input-group">
						<input type="radio" name="rbsveggies" required="required"
							value="Tomato"> Tomato
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Others<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="rbsothers" required="required"
							value="Salt"> Salt
					</div>
					<div class="input-group">
						<input type="radio" name="rbsothers" required="required"
							value="Oil"> Oil
					</div>
					<div class="input-group">
						<input type="radio" name="rbsothers" required="required"
							value="Red Wine Vinegar"> Red Wine Vinegar
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Dressings<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="rbsdressing" required="required"
							value="Mayonisse"> Mayonisse
					</div>
					<div class="input-group">
						<input type="radio" name="rbsdressing" required="required"
							value="Mustard"> Mustard
					</div>
					<div class="input-group">
						<input type="radio" name="rbsdressing" required="required"
							value="Ranch"> Ranch
					</div>
					<div class="input-group">
						<input type="radio" name="rbsdressing" required="required"
							value="Italian"> Italian
					</div>
					<div class="input-group">
						<input type="radio" name="rbsdressing" required="required"
							value="Chipotle"> Chipotle
					</div>
				</div>
			</div>
		</div>

		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Extras<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="rbsextras" required="required"
							value="Cheese"> Cheese
					</div>
					<div class="input-group">
						<input type="radio" name="rbsextras" required="required"
							value="Bacon"> Bacon
					</div>
					<div class="input-group">
						<input type="radio" name="rbsextras" required="required"
							value="Avacado"> Avacado
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="rbsspl" maxlength="20"
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

<div id="popup_3"
	class="mfp-hide white-popup-block sandwichPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="popup_3" class="form-horizontal"
		onsubmit="return populateSalamiSandwichSelectedItems();">
		<span id="sandwich-popup-title"><h2>Salami Sandwich</h2></span>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Count<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<input type="text" size="20" name="sscount" maxlength="20"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choice of Meat<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6 col-md-6">
					<div class="input-group">
						<input type="checkbox" name="ssmeat" value="Chicken">
						Chicken
					</div>
					<div class="input-group">
						<input type="checkbox" name="ssmeat" value="Turkey">
						Turkey
					</div>
					<div class="input-group">
						<input type="checkbox" name="ssmeat" value="Roast Beef">
						Roast Beef
					</div>
					<div class="input-group">
						<input type="checkbox" name="ssmeat" value="Salami"
							checked="checked" disabled="disabled"> Salami
					</div>
					<div class="input-group">
						<input type="checkbox" name="ssmeat" value="Bacon"> Bacon
					</div>
					<div class="input-group">
						<input type="checkbox" name="ssmeat" value="Pastrami">
						Pastrami
					</div>
					<div class="input-group">
						<input type="checkbox" name="ssmeat" value="Ham"> Ham
					</div>
					<div class="input-group">
						<input type="checkbox" name="ssmeat" value="Tuna"> Tuna
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Bread<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="ssbread" required="required"
							value="White"> White
					</div>
					<div class="input-group">
						<input type="radio" name="ssbread" required="required"
							value="Wheat"> Wheat
					</div>
					<div class="input-group">
						<input type="radio" name="ssbread" required="required"
							value="Sourdough"> Sourdough
					</div>
					<div class="input-group">
						<input type="radio" name="ssbread" required="required"
							value="Ducth Crunch"> Ducth Crunch
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Cheese<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="sscheese" required="required"
							value="American"> American
					</div>
					<div class="input-group">
						<input type="radio" name="sscheese" required="required"
							value="Swiss"> Swiss
					</div>
					<div class="input-group">
						<input type="radio" name="sscheese" required="required"
							value="Cheddar"> Cheddar
					</div>
					<div class="input-group">
						<input type="radio" name="sscheese" required="required"
							value="Pepper Jack"> Pepper Jack
					</div>
					<div class="input-group">
						<input type="radio" name="sscheese" required="required"
							value="Provolone"> Provolone
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Veggies<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="ssveggies" required="required"
							value="Lettuce"> Lettuce
					</div>
					<div class="input-group">
						<input type="radio" name="ssveggies" required="required"
							value="Onion"> Onion
					</div>
					<div class="input-group">
						<input type="radio" name="ssveggies" required="required"
							value="Spinach"> Spinach
					</div>
					<div class="input-group">
						<input type="radio" name="ssveggies" required="required"
							value="Jalapeno"> Jalapeno
					</div>
					<div class="input-group">
						<input type="radio" name="ssveggies" required="required"
							value="Black Olives"> Black Olives
					</div>
					<div class="input-group">
						<input type="radio" name="ssveggies" required="required"
							value="Tomato"> Tomato
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Others<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="ssothers" required="required"
							value="Salt"> Salt
					</div>
					<div class="input-group">
						<input type="radio" name="ssothers" required="required"
							value="Oil"> Oil
					</div>
					<div class="input-group">
						<input type="radio" name="ssothers" required="required"
							value="Red Wine Vinegar"> Red Wine Vinegar
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Dressings<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="ssdressing" required="required"
							value="Mayonisse"> Mayonisse
					</div>
					<div class="input-group">
						<input type="radio" name="ssdressing" required="required"
							value="Mustard"> Mustard
					</div>
					<div class="input-group">
						<input type="radio" name="ssdressing" required="required"
							value="Ranch"> Ranch
					</div>
					<div class="input-group">
						<input type="radio" name="ssdressing" required="required"
							value="Italian"> Italian
					</div>
					<div class="input-group">
						<input type="radio" name="ssdressing" required="required"
							value="Chipotle"> Chipotle
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Extras<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="ssextras" required="required"
							value="Cheese"> Cheese
					</div>
					<div class="input-group">
						<input type="radio" name="ssextras" required="required"
							value="Bacon"> Bacon
					</div>
					<div class="input-group">
						<input type="radio" name="ssextras" required="required"
							value="Avacado"> Avacado
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="ssspl" maxlength="20"
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


<div id="popup_4"
	class="mfp-hide white-popup-block sandwichPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="popup_4" class="form-horizontal"
		onsubmit="return populateBaconSandwichSelectedItems();">
		<span id="sandwich-popup-title"><h2>Bacon Sandwich</h2></span>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Count<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<input type="text" size="20" name="bscount" maxlength="20"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choice of Meat<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6 col-md-6">
					<div class="input-group">
						<input type="checkbox" name="bsmeat" value="Chicken">
						Chicken
					</div>
					<div class="input-group">
						<input type="checkbox" name="bsmeat" value="Turkey">
						Turkey
					</div>
					<div class="input-group">
						<input type="checkbox" name="bsmeat" value="Roast Beef">
						Roast Beef
					</div>
					<div class="input-group">
						<input type="checkbox" name="bsmeat" value="Salami">
						Salami
					</div>
					<div class="input-group">
						<input type="checkbox" name="bsmeat" value="Bacon"
							checked="checked" disabled="disabled"> Bacon
					</div>
					<div class="input-group">
						<input type="checkbox" name="bsmeat" value="Pastrami">
						Pastrami
					</div>
					<div class="input-group">
						<input type="checkbox" name="bsmeat" value="Ham"> Ham
					</div>
					<div class="input-group">
						<input type="checkbox" name="bsmeat" value="Tuna"> Tuna
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Bread<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="bsbread" required="required"
							value="White"> White
					</div>
					<div class="input-group">
						<input type="radio" name="bsbread" required="required"
							value="Wheat"> Wheat
					</div>
					<div class="input-group">
						<input type="radio" name="bsbread" required="required"
							value="Sourdough"> Sourdough
					</div>
					<div class="input-group">
						<input type="radio" name="bsbread" required="required"
							value="Ducth Crunch"> Ducth Crunch
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Cheese<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="bscheese" required="required"
							value="American"> American
					</div>
					<div class="input-group">
						<input type="radio" name="bscheese" required="required"
							value="Swiss"> Swiss
					</div>
					<div class="input-group">
						<input type="radio" name="bscheese" required="required"
							value="Cheddar"> Cheddar
					</div>
					<div class="input-group">
						<input type="radio" name="bscheese" required="required"
							value="Pepper Jack"> Pepper Jack
					</div>
					<div class="input-group">
						<input type="radio" name="bscheese" required="required"
							value="Provolone"> Provolone
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Veggies<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="bsveggies" required="required"
							value="Lettuce"> Lettuce
					</div>
					<div class="input-group">
						<input type="radio" name="bsveggies" required="required"
							value="Onion"> Onion
					</div>
					<div class="input-group">
						<input type="radio" name="bsveggies" required="required"
							value="Spinach"> Spinach
					</div>
					<div class="input-group">
						<input type="radio" name="bsveggies" required="required"
							value="Jalapeno"> Jalapeno
					</div>
					<div class="input-group">
						<input type="radio" name="bsveggies" required="required"
							value="Black Olives"> Black Olives
					</div>
					<div class="input-group">
						<input type="radio" name="bsveggies" required="required"
							value="Tomato"> Tomato
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Others<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="bsothers" required="required"
							value="Salt"> Salt
					</div>
					<div class="input-group">
						<input type="radio" name="bsothers" required="required"
							value="Oil"> Oil
					</div>
					<div class="input-group">
						<input type="radio" name="bsothers" required="required"
							value="Red Wine Vinegar"> Red Wine Vinegar
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Dressings<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="bsdressing" required="required"
							value="Mayonisse"> Mayonisse
					</div>
					<div class="input-group">
						<input type="radio" name="bsdressing" required="required"
							value="Mustard"> Mustard
					</div>
					<div class="input-group">
						<input type="radio" name="bsdressing" required="required"
							value="Ranch"> Ranch
					</div>
					<div class="input-group">
						<input type="radio" name="bsdressing" required="required"
							value="Italian"> Italian
					</div>
					<div class="input-group">
						<input type="radio" name="bsdressing" required="required"
							value="Chipotle"> Chipotle
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Extras<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="bsextras" required="required"
							value="Cheese"> Cheese
					</div>
					<div class="input-group">
						<input type="radio" name="bsextras" required="required"
							value="Bacon"> Bacon
					</div>
					<div class="input-group">
						<input type="radio" name="bsextras" required="required"
							value="Avacado"> Avacado
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="bsspl" maxlength="20"
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

<div id="popup_5"
	class="mfp-hide white-popup-block sandwichPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="popup_5" class="form-horizontal"
		onsubmit="return populatePastramiSandwichSelectedItems();">
		<span id="sandwich-popup-title"><h2>Pastrami Sandwich</h2></span>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Count<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<input type="text" size="20" name="pscount" maxlength="20"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choice of Meat<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6 col-md-6">
					<div class="input-group">
						<input type="checkbox" name="psmeat" value="Chicken">
						Chicken
					</div>
					<div class="input-group">
						<input type="checkbox" name="psmeat" value="Turkey">
						Turkey
					</div>
					<div class="input-group">
						<input type="checkbox" name="psmeat" value="Roast Beef">
						Roast Beef
					</div>
					<div class="input-group">
						<input type="checkbox" name="psmeat" value="Salami">
						Salami
					</div>
					<div class="input-group">
						<input type="checkbox" name="psmeat" value="Bacon"> Bacon
					</div>
					<div class="input-group">
						<input type="checkbox" name="psmeat" value="Pastrami"
							checked="checked" disabled="disabled"> Pastrami
					</div>
					<div class="input-group">
						<input type="checkbox" name="psmeat" value="Ham"> Ham
					</div>
					<div class="input-group">
						<input type="checkbox" name="psmeat" value="Tuna"> Tuna
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Bread<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="psbread" required="required"
							value="White"> White
					</div>
					<div class="input-group">
						<input type="radio" name="psbread" required="required"
							value="Wheat"> Wheat
					</div>
					<div class="input-group">
						<input type="radio" name="psbread" required="required"
							value="Sourdough"> Sourdough
					</div>
					<div class="input-group">
						<input type="radio" name="psbread" required="required"
							value="Ducth Crunch"> Ducth Crunch
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Cheese<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="pscheese" required="required"
							value="American"> American
					</div>
					<div class="input-group">
						<input type="radio" name="pscheese" required="required"
							value="Swiss"> Swiss
					</div>
					<div class="input-group">
						<input type="radio" name="pscheese" required="required"
							value="Cheddar"> Cheddar
					</div>
					<div class="input-group">
						<input type="radio" name="pscheese" required="required"
							value="Pepper Jack"> Pepper Jack
					</div>
					<div class="input-group">
						<input type="radio" name="pscheese" required="required"
							value="Provolone"> Provolone
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Veggies<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="psveggies" required="required"
							value="Lettuce"> Lettuce
					</div>
					<div class="input-group">
						<input type="radio" name="psveggies" required="required"
							value="Onion"> Onion
					</div>
					<div class="input-group">
						<input type="radio" name="psveggies" required="required"
							value="Spinach"> Spinach
					</div>
					<div class="input-group">
						<input type="radio" name="psveggies" required="required"
							value="Jalapeno"> Jalapeno
					</div>
					<div class="input-group">
						<input type="radio" name="psveggies" required="required"
							value="Black Olives"> Black Olives
					</div>
					<div class="input-group">
						<input type="radio" name="psveggies" required="required"
							value="Tomato"> Tomato
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Others<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="psothers" required="required"
							value="Salt"> Salt
					</div>
					<div class="input-group">
						<input type="radio" name="psothers" required="required"
							value="Oil"> Oil
					</div>
					<div class="input-group">
						<input type="radio" name="psothers" required="required"
							value="Red Wine Vinegar"> Red Wine Vinegar
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Dressings<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="psdressing" required="required"
							value="Mayonisse"> Mayonisse
					</div>
					<div class="input-group">
						<input type="radio" name="psdressing" required="required"
							value="Mustard"> Mustard
					</div>
					<div class="input-group">
						<input type="radio" name="psdressing" required="required"
							value="Ranch"> Ranch
					</div>
					<div class="input-group">
						<input type="radio" name="psdressing" required="required"
							value="Italian"> Italian
					</div>
					<div class="input-group">
						<input type="radio" name="psdressing" required="required"
							value="Chipotle"> Chipotle
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Extras<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="psextras" required="required"
							value="Cheese"> Cheese
					</div>
					<div class="input-group">
						<input type="radio" name="psextras" required="required"
							value="Bacon"> Bacon
					</div>
					<div class="input-group">
						<input type="radio" name="psextras" required="required"
							value="Avacado"> Avacado
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="psspl" maxlength="20"
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

<div id="popup_6"
	class="mfp-hide white-popup-block sandwichPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="popup_6" class="form-horizontal"
		onsubmit="return populateHamSandwichSelectedItems();">
		<span id="sandwich-popup-title"><h2>Ham Sandwich</h2></span>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Count<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<input type="text" size="20" name="hscount" maxlength="20"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choice of Meat<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6 col-md-6">
					<div class="input-group">
						<input type="checkbox" name="hsmeat" value="Chicken">
						Chicken
					</div>
					<div class="input-group">
						<input type="checkbox" name="hsmeat" value="Turkey">
						Turkey
					</div>
					<div class="input-group">
						<input type="checkbox" name="hsmeat" value="Roast Beef">
						Roast Beef
					</div>
					<div class="input-group">
						<input type="checkbox" name="hsmeat" value="Salami">
						Salami
					</div>
					<div class="input-group">
						<input type="checkbox" name="hsmeat" value="Bacon"> Bacon
					</div>
					<div class="input-group">
						<input type="checkbox" name="hsmeat" value="Pastrami">
						Pastrami
					</div>
					<div class="input-group">
						<input type="checkbox" name="hsmeat" value="Ham" checked="checked"
							disabled="disabled"> Ham
					</div>
					<div class="input-group">
						<input type="checkbox" name="hsmeat" value="Tuna"> Tuna
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Bread<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="hsbread" required="required"
							value="White"> White
					</div>
					<div class="input-group">
						<input type="radio" name="hsbread" required="required"
							value="Wheat"> Wheat
					</div>
					<div class="input-group">
						<input type="radio" name="hsbread" required="required"
							value="Sourdough"> Sourdough
					</div>
					<div class="input-group">
						<input type="radio" name="hsbread" required="required"
							value="Ducth Crunch"> Ducth Crunch
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Cheese<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="hscheese" required="required"
							value="American"> American
					</div>
					<div class="input-group">
						<input type="radio" name="hscheese" required="required"
							value="Swiss"> Swiss
					</div>
					<div class="input-group">
						<input type="radio" name="hscheese" required="required"
							value="Cheddar"> Cheddar
					</div>
					<div class="input-group">
						<input type="radio" name="hscheese" required="required"
							value="Pepper Jack"> Pepper Jack
					</div>
					<div class="input-group">
						<input type="radio" name="hscheese" required="required"
							value="Provolone"> Provolone
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Veggies<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="hsveggies" required="required"
							value="Lettuce"> Lettuce
					</div>
					<div class="input-group">
						<input type="radio" name="hsveggies" required="required"
							value="Onion"> Onion
					</div>
					<div class="input-group">
						<input type="radio" name="hsveggies" required="required"
							value="Spinach"> Spinach
					</div>
					<div class="input-group">
						<input type="radio" name="hsveggies" required="required"
							value="Jalapeno"> Jalapeno
					</div>
					<div class="input-group">
						<input type="radio" name="hsveggies" required="required"
							value="Black Olives"> Black Olives
					</div>
					<div class="input-group">
						<input type="radio" name="hsveggies" required="required"
							value="Tomato"> Tomato
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Others<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="hsothers" required="required"
							value="Salt"> Salt
					</div>
					<div class="input-group">
						<input type="radio" name="hsothers" required="required"
							value="Oil"> Oil
					</div>
					<div class="input-group">
						<input type="radio" name="hsothers" required="required"
							value="Red Wine Vinegar"> Red Wine Vinegar
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Dressings<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="hsdressing" required="required"
							value="Mayonisse"> Mayonisse
					</div>
					<div class="input-group">
						<input type="radio" name="hsdressing" required="required"
							value="Mustard"> Mustard
					</div>
					<div class="input-group">
						<input type="radio" name="hsdressing" required="required"
							value="Ranch"> Ranch
					</div>
					<div class="input-group">
						<input type="radio" name="hsdressing" required="required"
							value="Italian"> Italian
					</div>
					<div class="input-group">
						<input type="radio" name="hsdressing" required="required"
							value="Chipotle"> Chipotle
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Extras<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="hsextras" required="required"
							value="Cheese"> Cheese
					</div>
					<div class="input-group">
						<input type="radio" name="hsextras" required="required"
							value="Bacon"> Bacon
					</div>
					<div class="input-group">
						<input type="radio" name="hsextras" required="required"
							value="Avacado"> Avacado
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="hsspl" maxlength="20"
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

<div id="popup_7"
	class="mfp-hide white-popup-block sandwichPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="popup_7" class="form-horizontal"
		onsubmit="return populateTunaSandwichSelectedItems();">
		<span id="sandwich-popup-title"><h2>Tuna Sandwich</h2></span>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Count<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<input type="text" size="20" name="tuscount" maxlength="20"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choice of Meat<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6 col-md-6">
					<div class="input-group">
						<input type="checkbox" name="tusmeat" value="Chicken">
						Chicken
					</div>
					<div class="input-group">
						<input type="checkbox" name="tusmeat" value="Turkey">
						Turkey
					</div>
					<div class="input-group">
						<input type="checkbox" name="tusmeat" value="Roast Beef">
						Roast Beef
					</div>
					<div class="input-group">
						<input type="checkbox" name="tusmeat" value="Salami">
						Salami
					</div>
					<div class="input-group">
						<input type="checkbox" name="tusmeat" value="Bacon"> Bacon
					</div>
					<div class="input-group">
						<input type="checkbox" name="tusmeat" value="Pastrami">
						Pastrami
					</div>
					<div class="input-group">
						<input type="checkbox" name="tusmeat" value="Ham"> Ham
					</div>
					<div class="input-group">
						<input type="checkbox" name="tusmeat" value="Tuna"
							checked="checked" disabled="disabled"> Tuna
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Bread<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="tusbread" required="required"
							value="White"> White
					</div>
					<div class="input-group">
						<input type="radio" name="tusbread" required="required"
							value="Wheat"> Wheat
					</div>
					<div class="input-group">
						<input type="radio" name="tusbread" required="required"
							value="Sourdough"> Sourdough
					</div>
					<div class="input-group">
						<input type="radio" name="tusbread" required="required"
							value="Ducth Crunch"> Ducth Crunch
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Cheese<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="tuscheese" required="required"
							value="American"> American
					</div>
					<div class="input-group">
						<input type="radio" name="tuscheese" required="required"
							value="Swiss"> Swiss
					</div>
					<div class="input-group">
						<input type="radio" name="tuscheese" required="required"
							value="Cheddar"> Cheddar
					</div>
					<div class="input-group">
						<input type="radio" name="tuscheese" required="required"
							value="Pepper Jack"> Pepper Jack
					</div>
					<div class="input-group">
						<input type="radio" name="tuscheese" required="required"
							value="Provolone"> Provolone
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Veggies<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="tusveggies" required="required"
							value="Lettuce"> Lettuce
					</div>
					<div class="input-group">
						<input type="radio" name="tusveggies" required="required"
							value="Onion"> Onion
					</div>
					<div class="input-group">
						<input type="radio" name="tusveggies" required="required"
							value="Spinach"> Spinach
					</div>
					<div class="input-group">
						<input type="radio" name="tusveggies" required="required"
							value="Jalapeno"> Jalapeno
					</div>
					<div class="input-group">
						<input type="radio" name="tusveggies" required="required"
							value="Black Olives"> Black Olives
					</div>
					<div class="input-group">
						<input type="radio" name="tusveggies" required="required"
							value="Tomato"> Tomato
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Others<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="tusothers" required="required"
							value="Salt"> Salt
					</div>
					<div class="input-group">
						<input type="radio" name="tusothers" required="required"
							value="Oil"> Oil
					</div>
					<div class="input-group">
						<input type="radio" name="tusothers" required="required"
							value="Red Wine Vinegar"> Red Wine Vinegar
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Dressings<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="tusdressing" required="required"
							value="Mayonisse"> Mayonisse
					</div>
					<div class="input-group">
						<input type="radio" name="tusdressing" required="required"
							value="Mustard"> Mustard
					</div>
					<div class="input-group">
						<input type="radio" name="tusdressing" required="required"
							value="Ranch"> Ranch
					</div>
					<div class="input-group">
						<input type="radio" name="tusdressing" required="required"
							value="Italian"> Italian
					</div>
					<div class="input-group">
						<input type="radio" name="tusdressing" required="required"
							value="Chipotle"> Chipotle
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Extras<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="tusextras" required="required"
							value="Cheese"> Cheese
					</div>
					<div class="input-group">
						<input type="radio" name="tusextras" required="required"
							value="Bacon"> Bacon
					</div>
					<div class="input-group">
						<input type="radio" name="tusextras" required="required"
							value="Avacado"> Avacado
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="tusspl" maxlength="20"
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

<div id="popup_8"
	class="mfp-hide white-popup-block sandwichPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="popup_8" class="form-horizontal"
		onsubmit="return populateVeggieSandwichSelectedItems();">
		<span id="sandwich-popup-title"><h2>Veggie Sandwich</h2></span>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Count<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<input type="text" size="20" name="vscount" maxlength="20"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Bread<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="vsbread" required="required"
							value="White"> White
					</div>
					<div class="input-group">
						<input type="radio" name="vsbread" required="required"
							value="Wheat"> Wheat
					</div>
					<div class="input-group">
						<input type="radio" name="vsbread" required="required"
							value="Sourdough"> Sourdough
					</div>
					<div class="input-group">
						<input type="radio" name="vsbread" required="required"
							value="Ducth Crunch"> Ducth Crunch
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Cheese<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="vscheese" required="required"
							value="American"> American
					</div>
					<div class="input-group">
						<input type="radio" name="vscheese" required="required"
							value="Swiss"> Swiss
					</div>
					<div class="input-group">
						<input type="radio" name="vscheese" required="required"
							value="Cheddar"> Cheddar
					</div>
					<div class="input-group">
						<input type="radio" name="vscheese" required="required"
							value="Pepper Jack"> Pepper Jack
					</div>
					<div class="input-group">
						<input type="radio" name="vscheese" required="required"
							value="Provolone"> Provolone
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Veggies<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="vsveggies" required="required"
							value="Lettuce"> Lettuce
					</div>
					<div class="input-group">
						<input type="radio" name="vsveggies" required="required"
							value="Onion"> Onion
					</div>
					<div class="input-group">
						<input type="radio" name="vsveggies" required="required"
							value="Spinach"> Spinach
					</div>
					<div class="input-group">
						<input type="radio" name="vsveggies" required="required"
							value="Jalapeno"> Jalapeno
					</div>
					<div class="input-group">
						<input type="radio" name="vsveggies" required="required"
							value="Black Olives"> Black Olives
					</div>
					<div class="input-group">
						<input type="radio" name="vsveggies" required="required"
							value="Tomato"> Tomato
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Choose Others<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="vsothers" required="required"
							value="Salt"> Salt
					</div>
					<div class="input-group">
						<input type="radio" name="vsothers" required="required"
							value="Oil"> Oil
					</div>
					<div class="input-group">
						<input type="radio" name="vsothers" required="required"
							value="Red Wine Vinegar"> Red Wine Vinegar
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Dressings<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="vsdressing" required="required"
							value="Mayonisse"> Mayonisse
					</div>
					<div class="input-group">
						<input type="radio" name="vsdressing" required="required"
							value="Mustard"> Mustard
					</div>
					<div class="input-group">
						<input type="radio" name="vsdressing" required="required"
							value="Ranch"> Ranch
					</div>
					<div class="input-group">
						<input type="radio" name="vsdressing" required="required"
							value="Italian"> Italian
					</div>
					<div class="input-group">
						<input type="radio" name="vsdressing" required="required"
							value="Chipotle"> Chipotle
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Extras<span
				style="color: red">*</span>:
			</label>
			<div class="row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="radio" name="vsextras" required="required"
							value="Cheese"> Cheese
					</div>
					<div class="input-group">
						<input type="radio" name="vsextras" required="required"
							value="Avacado"> Avacado
					</div>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="vsspl" maxlength="20"
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
			var sandwichName = $(this).children().prev().text();
			var desc = $(this).children().next().text();
			console.log("Title: " + sandwichName);
			console.log("Desc: " + desc);
			sandwich_menu_items.push(sandwichName + "+" + desc); //sandwich_menu_items is in cater-sandwich.js
		});

		//For the items that were selected in previous transaction,
		//send click event on the div with 'overlay' class (to simulate 'select' action).
		/*$(".turn-me-on").each(function() {
			$(this).parent().children().click();
		});*/
	});
</script>
