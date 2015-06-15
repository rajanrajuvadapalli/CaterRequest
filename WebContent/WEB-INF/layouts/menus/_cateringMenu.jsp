<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
	function remove_item(ths, itm, name, itemCode, pos) {
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
		$('.butnote').css('margin-top', '-=45');
	}
	function menu_submit() {
		if (menu_items.length == 0) {
			alert("Please select at least 1 item to proceed.");
			return false;
		}
		console.log(menu_items);
		console.log(menu_item_codes);
		$('#menu-items').val(JSON.stringify(menu_items));
		$('#menu-item-codes').val(JSON.stringify(menu_item_codes));
		$("#target").submit();
	}
</script>

<!-- Page Canvas-->
<div id="page-canvas">
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
								src="${pageContext.request.contextPath}/resources/assets/img/marker2.png"
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
					src="${pageContext.request.contextPath}/resources/assets/img/about-us-bg2.jpg"
					alt="">
			</div>
			<!--/.background-->
		</section>

		<section class="container" style="padding-top: 50px;">
			<div class="">
				<!--Content-->
				<div class="">
					<figure class="filter clearfix">
						<div class="buttons pull-left">
							<a href="javascript:;" onClick="filter('All');" id="All"
								class="btn icon active"><i class="fa fa-th"></i>All</a>

							<c:forEach items="${categoryNames}" var="category"
								varStatus="loop">
								<a href="javascript:;" onClick="filter('C${loop.index}');"
									id="C${loop.index}" class="btn icon"><i
									class="fa fa-th-list"></i>${category}</a>
							</c:forEach>
						</div>
						<!-- <div class="pull-right">
							<aside class="sorting">
								<span>Sorting</span>
								<div class="form-group">
									<select class="framed" name="sort" style="display: none;">
										<option value="">Date - Newest First</option>
										<option value="1">Date - Oldest First</option>
										<option value="2">Price - Highest First</option>
										<option value="3">Price - Lowest First</option>
									</select>
								</div>
								/.form-group
							</aside>
						</div> -->
					</figure>

					<!--Listing Grid-->
					<section class="block equal-height">
						<div class="row">

							<c:forEach items="${menu.categories}" var="category"
								varStatus="loop">
								<c:forEach items="${category.items}" var="item">
									<div class="col-md-2 col-sm-2">
										<div class="item" id="C${loop.index}">
											<div class="image">
												<div class="quick-view">
													<i class="fa fa-check"></i><span>Selected</span>
												</div>
												<a href="javascript:;">
													<div class="overlay">
														<div class="inner">
															<div class="content">
																<p style="display: none;">${item.description}</p>
															</div>
														</div>
													</div>
													<div class="item-specific">
														<span class="name">${item.name}</span>
													</div> 
													<div><span hidden="hidden">${item.code}</span></div>
													<img
													src="${pageContext.request.contextPath}/resources/assets/img/items/1.jpg"
													alt="">
													<c:if test="${item.isSelected()}">
														<div class="turn-me-on"></div>
													</c:if>
												</a>
											</div>
										</div>

										<!-- /.item-->
									</div>
									<!--/.col-sm-4-->
								</c:forEach>
							</c:forEach>
						</div>

						<!--/.row-->
					</section>

					<section>
						<div class="col-md-7 col-sm-7">
							<section>
								<!-- /.block -->
								<article class="block">
									<header>
										<h2>Menu Summary</h2>
									</header>
									<div class="list-slider owl-carousel owl-theme owl-loaded">

										<!-- /.slide -->
										<div class="owl-stage-outer">
											<div class="owl-stage"
												style="width: 1110px; transform: translate3d(0px, 0px, 0px); transition: 0.25s; -webkit-transition: 0.25s;">
												<div class="owl-item active"
													style="width: 555px; margin-right: 0px;">
													<div class="slide">
														<header>
															<h3>
																<i class="fa fa-calendar"></i>Selected Items
															</h3>
														</header>
													</div>
												</div>
											</div>
										</div>
										<div class="owl-controls">
											<div class="owl-nav">
												<div class="owl-prev" style=""></div>
												<div class="owl-next" style=""></div>
											</div>
											<div class="owl-dots" style="">
												<div class="owl-dot active">
													<span></span>
												</div>
												<div class="owl-dot">
													<span></span>
												</div>
											</div>
										</div>
									</div>
									<!-- /.list-slider -->
								</article>
								<!-- /.block -->

							</section>
						</div>
						<div class="col-md-5 col-sm-5">
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
										<input type="hidden" name="menu_items" id="menu-items" >
										<input type="hidden" name="menu_item_codes" id="menu-item-codes" >
										<input type="hidden" name="cuisineType" value="${menu.cuisine}">
										<button type="button" onclick="menu_submit();"
											class="btn btn-default">Select Restaurants</button>
									</form>
								</div>

							</section>
						</div>
					</section>
					<!--end Listing Grid-->
					<!--Pagination-->
					<!--                             <nav>
                                <ul class="pagination pull-right">
                                    <li class="active"><a href="#">1</a></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#" class="previous"><i class="fa fa-angle-left"></i></a></li>
                                    <li><a href="#" class="next"><i class="fa fa-angle-right"></i></a></li>
                                </ul>
                            </nav> -->
					<!--end Pagination-->
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
	});
	
	$('document').ready(function(){
		//For the items that were selected in previous transaction,
		//send click event on the div with 'overlay' class (to simulate 'select' action).
		$(".turn-me-on").each(function(){
			$(this).parent().children().click(); 
		});
	});
</script>