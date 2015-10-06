<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	function remove_pizza_item(div_id) {
		var divToRemove = $("div[id=" + div_id + "]");
		var pizzaName = divToRemove.children().children().prev().text();
		var desc = divToRemove.children().children().next().text();
		var data = pizzaName + "+" + desc;
		console.log("Removing " + data);
		pizza_menu_items.splice($.inArray(data, pizza_menu_items), 1);
		divToRemove.remove();
	}

	function pizza_menu_submit() {
		if (pizza_menu_items.length == 0) {
			alert("Please select at least 1 pizza to proceed.");
			return false;
		}
		console.log(pizza_menu_items);
		//console.log(JSON.stringify(pizza_menu_items));
		$("#pizza-menu-items").val(JSON.stringify(pizza_menu_items));
		$("#pizzatarget").submit();
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
					<!--Listing Grid-->
					<section class="block equal-height col-md-6 col-xs-12">
						<div class="row">

							<c:forEach items="${menu.categories}" var="category"
								varStatus="loop">
								<c:forEach items="${category.items}" var="item">

									<div class="col-md-4 col-sm-3 col-xs-6">
										<div class="item" id="C${loop.index}">
											<div class="image">
												<a class="popup-with-form" id="put-pizza-title"
													href="#options">
													<div class="item-specific">
														<span class="name">${item.name}</span>
													</div>
													<div>
														<span hidden="hidden">${item.code}</span>
													</div> <img
													src="https://s3-us-west-2.amazonaws.com/rajrv-caterrequest-s3bucket/images_menu/PIZZA/${item.code}.jpg"
													alt="">
												</a>
											</div>
										</div>
										<!-- /.item-->
									</div>
								</c:forEach>
							</c:forEach>

							<div id="options"
								class="mfp-hide white-popup-block pizzaPopupOptions">
								<form id="options" class="form-horizontal"
									onsubmit="return populatePizzaSelectedItems();">
									<span id="pizza-popup-title"> </span> <input type="hidden"
										id="pizzaName" val="">
									<div class="form-group">
										<label for="" class="col-sm-3 control-label">Pizza
											size<span style="color: red">*</span>:
										</label>
										<div class="col-sm-6">
											<input type="radio" name="psize" required="required"
												value="Big"> Big &nbsp;&nbsp; <input type="radio"
												name="psize" required="required" value="Average">
											Average &nbsp;&nbsp; <input type="radio" name="psize"
												required="required" value="Small"> Small
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-3 control-label">Number of
											pizzas<span style="color: red">*</span>:
										</label>
										<div class="col-sm-6">
											<input type="text" size="5" name="pcount" maxlength="10"
												required="required" pattern="^\d+$" class="form-control">
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-3 control-label">Sause<span
											style="color: red">*</span>:
										</label>
										<div class="row">
											<div class="col-sm-6">
												<input type="radio" name="psause" required="required"
													value="TOM"> Tomato sauce &nbsp;&nbsp; <br /> <input
													type="radio" name="psause" required="required" value="GAR">
												Garlic Parmesan White Sauce &nbsp;&nbsp; <br /> <input
													type="radio" name="psause" required="required" value="BBQ">
												BBQ Sauce &nbsp;&nbsp;<br /> <input type="radio"
													name="psause" required="required" value="BUF">
												Buffalo Sauce &nbsp;&nbsp;
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-3 control-label">Cheese<span
											style="color: red">*</span>:
										</label>
										<div class="row">
											<div class="col-sm-6">
												<input type="radio" name="pcheese" required="required"
													value="NO"> No Cheese &nbsp;&nbsp; <br /> <input
													type="radio" name="pcheese" required="required" value="REG">
												Regular &nbsp;&nbsp; <br /> <input type="radio"
													name="pcheese" required="required" value="EXT">
												Extra cheese &nbsp;&nbsp;
											</div>
										</div>
									</div>
									<div class="form-group" id="toppings">
										<label for="" class="col-sm-3 control-label">Toppings:</label>
										<!-- Column #1 START-->
										<div class="col-xs-6 col-sm-4">
											<div>
												&nbsp;&nbsp;&nbsp;<u>Meat</u>
											</div>
											<div>
												&nbsp;&nbsp;&nbsp;<img alt="L"
													src="${pageContext.request.contextPath}/resources/images/menus/pizza_left.jpg">
												&nbsp;&nbsp;&nbsp;<img alt="R"
													src="${pageContext.request.contextPath}/resources/images/menus/pizza_right.jpg">
												&nbsp;&nbsp;&nbsp;<img alt="A"
													src="${pageContext.request.contextPath}/resources/images/menus/pizza_all.jpg">
											</div>
											<br />
											<!-- Ingredient START -->
											<div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Pepperoni" value="L">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Pepperoni" value="R">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Pepperoni" value="A">
												</div>
												<div class="col-xs-1">Pepporoni</div>
												<br />
											</div>
											<!-- Ingredient END -->
											<!-- Ingredient START -->
											<div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Bacon" value="L">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Bacon" value="R">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Bacon" value="A">
												</div>
												<div class="col-xs-1">Bacon</div>
												<br />
											</div>
											<!-- Ingredient END -->
											<!-- Ingredient START -->
											<div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-ItalianSausage" value="L">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-ItalianSausage" value="R">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-ItalianSausage" value="A">
												</div>
												<div class="col-xs-1">Italian&nbsp;Sausage</div>
												<br />
											</div>
											<!-- Ingredient END -->
											<!-- Ingredient START -->
											<div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Beef" value="L">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Beef" value="R">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Beef" value="A">
												</div>
												<div class="col-xs-1">Beef</div>
												<br />
											</div>
											<!-- Ingredient END -->
											<!-- Ingredient START -->
											<div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Chicken" value="L">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Chicken" value="R">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Chicken" value="A">
												</div>
												<div class="col-xs-1">Chicken</div>
												<br />
											</div>
											<!-- Ingredient END -->
											<!-- Ingredient START -->
											<div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Salami" value="L">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Salami" value="R">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Salami" value="A">
												</div>
												<div class="col-xs-1">Salami</div>
												<br />
											</div>
											<!-- Ingredient END -->
										</div>
										<!-- Column #2 START-->
										<div class="col-xs-6 col-sm-4">
											<div>
												&nbsp;&nbsp;&nbsp;<u>Veg</u>
											</div>
											<div>
												&nbsp;&nbsp;&nbsp;<img alt="L"
													src="${pageContext.request.contextPath}/resources/images/menus/pizza_left.jpg">
												&nbsp;&nbsp;&nbsp;<img alt="R"
													src="${pageContext.request.contextPath}/resources/images/menus/pizza_right.jpg">
												&nbsp;&nbsp;&nbsp;<img alt="A"
													src="${pageContext.request.contextPath}/resources/images/menus/pizza_all.jpg">

											</div>
											<br />
											<!-- Ingredient START -->
											<div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Mushrooms" value="L">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Mushrooms" value="R">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Mushrooms" value="A">
												</div>
												<div class="col-xs-1">Mushrooms</div>
												<br />
											</div>
											<!-- Ingredient END -->
											<!-- Ingredient START -->
											<div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Onions" value="L">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Onions" value="R">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Onions" value="A">
												</div>
												<div class="col-xs-1">Onions</div>
												<br />
											</div>
											<!-- Ingredient END -->
											<!-- Ingredient START -->
											<div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-JalepenoPeppers" value="L">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-JalepenoPeppers" value="R">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-JalepenoPeppers" value="A">
												</div>
												<div class="col-xs-1">Jalepeno&nbsp;Peppers</div>
												<br />
											</div>
											<!-- Ingredient END -->
											<!-- Ingredient START -->
											<div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-GreenPeppers" value="L">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-GreenPeppers" value="R">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-GreenPeppers" value="A">
												</div>
												<div class="col-xs-1">Green&nbsp;Peppers</div>
												<br />
											</div>
											<!-- Ingredient END -->
											<!-- Ingredient START -->
											<div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Pineapple" value="L">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Pineapple" value="R">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Pineapple" value="A">
												</div>
												<div class="col-xs-1">Pineapple</div>
												<br />
											</div>
											<!-- Ingredient END -->
											<!-- Ingredient START -->
											<div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Spinach" value="L">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Spinach" value="R">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Spinach" value="A">
												</div>
												<div class="col-xs-1">Spinach</div>
												<br />
											</div>
											<!-- Ingredient END -->
											<!-- Ingredient START -->
											<div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-DicedTomatoes" value="L">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-DicedTomatoes" value="R">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-DicedTomatoes" value="A">
												</div>
												<div class="col-xs-1">Diced&nbsp;Tomatoes</div>
												<br />
											</div>
											<!-- Ingredient END -->
											<!-- Ingredient START -->
											<div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Olives" value="L">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Olives" value="R">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Olives" value="A">
												</div>
												<div class="col-xs-1">Olives</div>
												<br />
											</div>
											<!-- Ingredient END -->
											<!-- Ingredient START -->
											<div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Garlic" value="L">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Garlic" value="R">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Garlic" value="A">
												</div>
												<div class="col-xs-1">Garlic</div>
												<br />
											</div>
											<!-- Ingredient END -->
											<!-- Ingredient START -->
											<div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-ArtichokeHearts" value="L">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-ArtichokeHearts" value="R">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-ArtichokeHearts" value="A">
												</div>
												<div class="col-xs-1">Artichoke&nbsp;Hearts</div>
												<br />
											</div>
											<!-- Ingredient END -->
										</div>

									</div>
									<!-- Ingredients Form group END -->

									<div class="form-group">
										<label class="col-sm-4 control-label"></label>
										<div class="col-sm-2">
											<button type="submit"
												class="btn btn-default popup-modal-dismiss">Add
												this pizza</button>
										</div>
									</div>
								</form>
							</div>
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
											<c:forEach items="${pizza_items}" var="pi" varStatus="loop">
												<div class="list-item" id="p_${loop.index}">
													<div class="left">
														<c:choose>
															<c:when test="${pi.key.contains('#')}">
																<h4>${fn:substringBefore(pi.key, ' #')}</h4>
															</c:when>
															<c:otherwise>
																<h4>${pi.key}</h4>
															</c:otherwise>
														</c:choose>
														<figure>${pi.value}</figure>
													</div>
													<span class="pizza-item-close remove-item"
														onclick="remove_pizza_item('p_${loop.index}');">X</span>
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
										id="pizzatarget" method="post">
										<input type="hidden" name="pizza_menu_items"
											id="pizza-menu-items"> <input type="hidden"
											name="cuisineType" value="${menu.cuisine}">
										<textarea rows="4" cols="50" name="comments"
											placeholder="Enter you comments to restaurant here"
											class="form-control">${menu.comments}</textarea>
										<br />
										<button type="button" onclick="pizza_menu_submit();"
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
			var pizzaName = $(this).children().prev().text();
			var desc = $(this).children().next().text();
			//console.log("Title: "+ pizzaName);
			//console.log("Desc: "+ desc);
			pizza_menu_items.push(pizzaName + "+" + desc); //pizza_menu_items is in cater-request.js
		});

		//For the items that were selected in previous transaction,
		//send click event on the div with 'overlay' class (to simulate 'select' action).
		/*$(".turn-me-on").each(function() {
			$(this).parent().children().click();
		});*/
	});
</script>
