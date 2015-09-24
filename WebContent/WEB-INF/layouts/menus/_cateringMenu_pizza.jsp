<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	function remove_pizza_item(div_id) {
		$("div[id=" + div_id + "]").remove();
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
									<span id="pizza-popup-title"> </span>
									<input type="hidden" id="pizzaName" val="">
									<div class="form-group">
										<label for="" class="col-sm-4 control-label">Pizza
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
										<label for="" class="col-sm-4 control-label">Number of
											pizzas<span style="color: red">*</span>:
										</label>
										<div class="col-sm-6">
											<input type="text" size="5" name="pcount" maxlength="10"
												required="required" pattern="^\d+$" class="form-control">
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-4 control-label">Stuffed
											Edge<span style="color: red">*</span>:
										</label>
										<div class="row">
											<div class="col-sm-4">
												<input type="radio" name="pse" required="required"
													value="BF"> Borderless Filled &nbsp;&nbsp; <br />
												<input type="radio" name="pse" required="required"
													value="CC"> Cottage Cheese &nbsp;&nbsp; <br /> <input
													type="radio" name="pse" required="required" value="CH">
												Cheddar &nbsp;&nbsp;<br /> <input type="radio" name="pse"
													required="required" value="PE"> Pepperoni
												&nbsp;&nbsp;
											</div>
											<div class="col-sm-3">
												<input type="radio" name="pse" required="required"
													value="CK"> Chicken &nbsp;&nbsp;<br /> <input
													type="radio" name="pse" required="required" value="MO">
												Mozarella &nbsp;&nbsp; <br /> <input type="radio"
													name="pse" required="required" value="PA"> Palmetto
												&nbsp;&nbsp;
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="" class="col-sm-4 control-label">Ingredients:</label>
										<!-- Column #1 START-->
										<div class="col-xs-4">
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
													<input type="checkbox" name="pai-Garlic-L" value="L">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Garlic-R" value="R">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Garlic-A" value="A">
												</div>
												<div class="col-xs-1">Garlic</div>
												<br />
											</div>
											<!-- Ingredient END -->
											<!-- Ingredient START -->
											<div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Bacon-L" value="L">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Bacon-R" value="R">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Bacon-A" value="A">
												</div>
												<div class="col-xs-1">Bacon</div>
												<br />
											</div>
											<!-- Ingredient END -->
											<!-- Ingredient START -->
											<div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Broccoli-L" value="L">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Broccoli-R" value="R">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Broccoli-A" value="A">
												</div>
												<div class="col-xs-1">Broccoli</div>
												<br />
											</div>
											<!-- Ingredient END -->
										</div>
										<!-- Column #2 START-->
										<div class="col-xs-4">
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
													<input type="checkbox" name="pai-Anchovies-L" value="L">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Anchovies-R" value="R">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Anchovies-A" value="A">
												</div>
												<div class="col-xs-1">Anchovies</div>
												<br />
											</div>
											<!-- Ingredient END -->
											<!-- Ingredient START -->
											<div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Pepperoni-L" value="L">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Pepperoni-R" value="R">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Pepperoni-A" value="A">
												</div>
												<div class="col-xs-1">Pepperoni</div>
												<br />
											</div>
											<!-- Ingredient END -->
											<!-- Ingredient START -->
											<div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Onion-L" value="L">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Onion-R" value="R">
												</div>
												<div class="col-xs-1">
													<input type="checkbox" name="pai-Onion-A" value="A">
												</div>
												<div class="col-xs-1">Onion</div>
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
														<h4>${pi.key}</h4>
														<figure>${pi.value}</figure>
													</div>
													<span class="pizza-item-close remove-item" onclick="remove_pizza_item('p_${loop.index}');">X</span><div class="right "></div>
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
										<input type="hidden" name="pizza_menu_items" id="pizza-menu-items">
										<input type="hidden"
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
