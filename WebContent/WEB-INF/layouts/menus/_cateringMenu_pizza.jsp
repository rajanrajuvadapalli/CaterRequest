<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	/*function remove_item(ths, itm, name, itemCode, pos, categoryCode) {
		if (pos == 'up') {
			$('.up_' + ths).remove();
			$('.down_' + ths).parent().remove();
		} else {
			$('.up_' + ths).remove();
			$('.down_' + ths).parent().remove();
		}
		$('.' + itm).parent().prev().removeAttr('style');
		$('.' + itm).children().children().children().removeAttr('style');
		$('.' + itm).parent().prev().children().removeAttr('style');
		$('.' + itm).removeAttr('style');
		$('.' + itm).removeClass('seleted');

		menu_items.deleteElem = function(val) {
			for (var i = 0; i < this.length; i++) {
				if (this[i] === val) {
					this.splice(i, 1);
					return i;
				}
			}
		};
		menu_item_codes.deleteElem = function(val) {
			for (var i = 0; i < this.length; i++) {
				if (this[i] === val) {
					this.splice(i, 1);
					return i;
				}
			}
		};
		var idx = menu_items.deleteElem(name);
		var idx2 = menu_item_codes.deleteElem(itemCode);
		//$('.butnote').css('margin-top','-=45');	
		//If all the items are removed, remove the parent element.
		if($('.slide #' + categoryCode).children().length == 2 ) {
			$('.slide #' + categoryCode).addClass('hidden');
		}
	}
	function menu_submit() {
		if (menu_items.length == 0) {
			alert("Please select at least 1 item to proceed.");
			return false;
		}
		console.log(menu_items);
		console.log(menu_item_codes); //This list is populated in custom.js script.
		$('#menu-items').html(JSON.stringify(menu_items));
		$('#menu-item-codes').val(JSON.stringify(menu_item_codes));
		$("#target").submit();
	}*/
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
							<div class="col-md-4 col-sm-3 col-xs-6">
								<div class="item" id="C1">
									<div class="image">
										<a class="popup-with-form" href="#options">
											<div class="item-specific">
												<span class="name">Garlic and Oil</span>
											</div>
											<div>
												<span hidden="hidden">C1_1</span>
											</div> <img
											src="https://s3-us-west-2.amazonaws.com/rajrv-caterrequest-s3bucket/images_menu/PIZZA/C1_1.jpg"
											alt="">
										</a>
									</div>
								</div>
								<!-- /.item-->
							</div>

							<div class="col-md-4 col-sm-3 col-xs-6">
								<div class="item" id="C2">
									<div class="image">
										<a class="popup-with-form" href="#options">
											<div class="item-specific">
												<span class="name">Pepperoni</span>
											</div>
											<div>
												<span hidden="hidden">C1_2</span>
											</div> <img
											src="https://s3-us-west-2.amazonaws.com/rajrv-caterrequest-s3bucket/images_menu/PIZZA/C1_2.jpg"
											alt="">
										</a>
									</div>
								</div>
								<!-- /.item-->
							</div>

							<div id="options"
								class="mfp-hide white-popup-block pizzaPopupOptions">
								<form class="form-horizontal"
									onsubmit="return populatePizzaSelectedItems();">

									<div class="form-group">
										<label for="" class="col-sm-4 control-label">Pizza
											size<span style="color: red">*</span>:
										</label>
										<div class="col-sm-6">
											<input type="radio" name="psize" required="required"
												value="Big"> Big &nbsp;&nbsp;
											<input type="radio"
												name="psize" required="required" value="Average">
											Average &nbsp;&nbsp; 
											<input type="radio" name="psize"
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
										<label class="col-sm-4 control-label"></label>
										<div class="col-sm-2">
											<button type="submit" class="btn btn-default">Add
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
										id="target" method="post">
										<input type="hidden" name="menu_items" id="menu-items">
										<input type="hidden" name="menu_item_codes"
											id="menu-item-codes"> <input type="hidden"
											name="cuisineType" value="${menu.cuisine}">
										<textarea rows="4" cols="50" name="comments"
											placeholder="Enter you comments to restaurant here"
											class="form-control">${menu.comments}</textarea>
										<br />
										<button type="button" onclick="menu_submit();"
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
		//For the items that were selected in previous transaction,
		//send click event on the div with 'overlay' class (to simulate 'select' action).
		/*$(".turn-me-on").each(function() {
			$(this).parent().children().click();
		});*/
	});
</script>
