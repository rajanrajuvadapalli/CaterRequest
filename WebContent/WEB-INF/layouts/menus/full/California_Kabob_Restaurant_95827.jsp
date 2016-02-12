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
		california_kabob_menu_items.splice($.inArray(data, california_kabob_menu_items), 1);
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
					<h2>California Kabob Restaurant</h2>
					<h3>Click on the items below to build your items.</h3>
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
													src=""
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
											<c:forEach items="${items}" var="m" varStatus="loop">
												<div class="list-item" id="m_${loop.index}">
													<div class="left">
														<h4>${m.key}</h4>
														<figure>${m.value}</figure>
													</div>
													<span class="item-close remove-item"
														onclick="remove_california_kabob_item('m_${loop.index}');">X</span>
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
										id="california_kabob_target" method="post">
										<input type="hidden" name="full_menu_items"
											id="full_menu_items"> <input type="hidden"
											name="cuisineType" value="${menu.cuisine}">
										<textarea rows="4" cols="50" name="comments"
											placeholder="Enter you comments to restaurant here"
											class="form-control">${menu.comments}</textarea>
										<figure class="note butnote">ONCE THE DESIRED MENU IS
											SELECTED, CLICK ON THE BUTTON BELOW TO SUBMIT YOUR REQUEST
										</figure>
										<button type="button" onclick="california_kabob_menu_submit();"
													class="btn btn-default">Next</button>
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
	class="mfp-hide white-popup-block fullMenuPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="popup_0_0" class="form-horizontal"
		onsubmit="return populateFullMenuSarmaDolmeSelectedItems();">
		<h2>Sarma Dolme</h2>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Count<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<input type="text" size="20" name="SarmaDolmeCount" maxlength="20"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="SarmaDolmeSpl" maxlength="20"
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
	class="mfp-hide white-popup-block fullMenuPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="popup_0_1" class="form-horizontal"
		onsubmit="return populateFullMenuLargeHummusSelectedItems();">
		<h2>Large Hummus</h2>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Count<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<input type="text" size="20" name="LargeHummusCount" maxlength="20"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="LargeHummusSpl" maxlength="20"
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
	class="mfp-hide white-popup-block fullMenuPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="popup_1_0" class="form-horizontal"
		onsubmit="return populateFullMenuGreekSaladSelectedItems();">
		<h2>Greek Salad</h2>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Count<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<input type="text" size="20" name="GreekSaladCount" maxlength="20"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="GreekSaladSpl" maxlength="20"
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
	class="mfp-hide white-popup-block fullMenuPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="popup_2_0" class="form-horizontal"
		onsubmit="return populateFullMenuBeefKabobSelectedItems();">
		<h2>Beef Kabob</h2>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Count<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<input type="text" size="20" name="BeefKabobCount" maxlength="20"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="BeefKabobSpl" maxlength="20"
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
	class="mfp-hide white-popup-block fullMenuPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="popup_2_1" class="form-horizontal"
		onsubmit="return populateFullMenuGroundBeefKabobSelectedItems();">
		<h2>Ground Beef Kabob</h2>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Count<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<input type="text" size="20" name="GroundBeefKabobCount" maxlength="20"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="GroundBeefKabobSpl" maxlength="20"
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

<div id="popup_2_2"
	class="mfp-hide white-popup-block fullMenuPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="popup_2_2" class="form-horizontal"
		onsubmit="return populateFullMenuChickenKabobSelectedItems();">
		<h2>Chicken Kabob</h2>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Count<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<input type="text" size="20" name="ChickenKabobCount" maxlength="20"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="ChickenKabobSpl" maxlength="20"
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

<div id="popup_2_3"
	class="mfp-hide white-popup-block fullMenuPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="popup_2_3" class="form-horizontal"
		onsubmit="return populateFullMenuGroundChickenKabobSelectedItems();">
		<h2>Ground Chicken Kabob</h2>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Count<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<input type="text" size="20" name="GroundChickenKabobCount" maxlength="20"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="GroundChickenKabobSpl" maxlength="20"
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

<div id="popup_2_4"
	class="mfp-hide white-popup-block fullMenuPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="popup_2_4" class="form-horizontal"
		onsubmit="return populateFullMenuLambKabobSelectedItems();">
		<h2>Lamb Kabob</h2>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Count<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<input type="text" size="20" name="LambKabobCount" maxlength="20"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="LambKabobSpl" maxlength="20"
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

<div id="popup_2_5"
	class="mfp-hide white-popup-block fullMenuPopupOptions col-xs-6 col-sm-4 col-md-6">
	<form id="popup_2_5" class="form-horizontal"
		onsubmit="return populateFullMenuGroundLambKabobSelectedItems();">
		<h2>Ground Lamb Kabob</h2>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Count<span
				style="color: red">*</span>:
			</label>
			<div class="col-sm-6">
				<input type="text" size="20" name="GroundLambKabobCount" maxlength="20"
					required="required" pattern="^\d+$" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label for="" class="col-sm-4 control-label">Special
				Instructions: </label>
			<div class="col-sm-6">
				<input type="text" size="60" name="GroundLambKabobSpl" maxlength="20"
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
	});

	$('document').ready(function() {
		$('.slide .list-item .left').each(function() {
			var name = $(this).children().prev().text();
			var desc = $(this).children().next().text();
			console.log("Title: " + name);
			console.log("Desc: " + desc);
			california_kabob_menu_items.push(name + "+" + desc); //california_kabob_menu_items is in California_Kabob_Restaurant_95827.js 
		});
	});
</script>
