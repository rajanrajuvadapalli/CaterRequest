<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="col-sm-10 col-sm-offset-1 page-header">
	<h1>Payment</h1>
</div>
<c:set var="quote" value="${quote}"></c:set>
<c:set var="r" value="${restuarant}"></c:set>
<c:set var="e" value="${event}"></c:set>

<div class="col-sm-10 col-sm-offset-1">
	<c:if test="${not empty errors}">
		<div class="alert alert-danger">
			<button type="button" class="close btn-lg" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			<ul>
				<c:forEach items="${errors}" var="e">
					<li>${e}</li>
				</c:forEach>
			</ul>
		</div>
	</c:if>

	<c:if test="${not empty successMessages}">
		<div class="alert alert-success">
			<button type="button" class="close btn-lg" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			<ul>
				<c:forEach items="${successMessages}" var="sm">
					<li>${sm}</li>
				</c:forEach>
			</ul>
		</div>
	</c:if>

	<c:if test="${not empty warnings}">
		<div class="alert alert-warning">
			<button type="button" class="close btn-lg" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			<ul>
				<c:forEach items="${warnings}" var="w">
					<li>${w}</li>
				</c:forEach>
			</ul>
		</div>
	</c:if>
</div>

<div class="col-sm-10 col-sm-offset-1">
	<c:if test="${!sessionScope.full_menu_flow}">
		<div class="col-lg-12">
			<div class="panel panel-success">
				<div class="panel-heading">
					<h3 class="panel-title">Event Details</h3>
				</div>
				<div class="panel-body">
					<div class="col-lg-10 sm-5" align="left">
						<b>Event name:</b> ${e.name}<br /> <b>Time:</b>
						<fmt:formatDate value="${e.date_time}"
							pattern="EEE, d MMM yyyy hh:mm aaa" />
						<br /> <b>Location: </b> ${event.location.getAddressString()} <br />
						<b>Number of people:</b> <span style="color: red;">${e.personCount}</span><br />
						<b>Delivery Option:</b> <span style="color: red;">${e.isPickUp()?'Pick Up':'Delivered'}</span><br />
						<b>Customer name:</b> ${e.customer.name}<br /> <b>Customer
							contact number:</b> ${e.customer.contactNumber}<br />
					</div>
				</div>
			</div>
		</div>
	</c:if>

	<div class="col-lg-12">
		<div class="panel panel-danger">
			<div class="panel-heading">
				<h3 class="panel-title">Billing Info</h3>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body" align="left">
				<div class="col-lg-10 sm-6">
					<b>Restaurant Name: </b>${r.name} <br /> <b>Restaurant Phone
						Number: </b>${r.contactNumber} <br /> <b>Quote Price: </b>$${subtotal}
					<br /> <b>Sales Tax: </b>$${tax} <br /> <b>Total Amount:
						$${amount}</b> <br /> <br />
					<div class="row">
						<div class="col-sm-2">
							<form
								action="${pageContext.request.contextPath}/stripePayment/charge"
								method="POST">
								<script src="https://checkout.stripe.com/checkout.js"
									class="stripe-button"
									data-key="pk_live_8Ip3CxrdRB2SweSSVe1oPyJt"
									data-image="${pageContext.request.contextPath}/resources/assets/img/marker.png"
									data-name="${e.name}" data-description="Charge for ${r.name}"
									data-amount="${totalAmountInCents}" data-locale="auto">
									
								</script>
								<c:if test="${sessionScope.full_menu_flow}">
									<input type="hidden" name="full_menu_items" value="${full_menu_items}">
									<input type="hidden" name="rId" value="${rId}">
									<input type="hidden" name="summary" value="${summary}">
									<input type="hidden" name="comments" value="${comments}">
								</c:if>
								<c:if test="${!sessionScope.full_menu_flow}">
									<input type="hidden" name="quoteId" value="${quote.id}">
									<input type="hidden" size="30" maxlength="10" name="eventName"
										value="${e.name}" readonly>
									<input type="hidden" size="16" name="eventTime"
										value="${e.date_time}" readonly>
									<input type="hidden" size="30" name="expDate"
										value="${e.location}">
								</c:if>
								<input type="hidden" size="30" name="restuarantName"
									required="required" value="${r.name}"> <input
									type="hidden" size="4" name="securityCode" required="required"
									value="${subtotal}" readonly> <input type="hidden"
									name="amountInCents" value="${totalAmountInCents}"> <input
									type="hidden" name="salesTax" value="${tax}"> <input
									type="hidden" name="totalAmt" value="${amount}">


							</form>
						</div>
						<c:if test="${!sessionScope.full_menu_flow}">
							<div class="col-sm-2">
								<form class="form-horizontal" method="POST" id="event-form"
									action="${pageContext.request.contextPath}/customer/makePayment"
									enctype="application/x-www-form-urlencoded" autocomplete="off">
									<button type="submit" class="btn btn-default">Pay at
										Restaurant</button>
									<input type="hidden" name="xquoteId" value="${quote.id}">
								</form>
							</div>
						</c:if>
					</div>
				</div>
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<div>
		<c:choose>
			<c:if test="${sessionScope.full_menu_flow}">
				<button type="button" class="btn btn-default"
					onclick="window.location.href='${pageContext.request.contextPath}/menu/view/complete?rName=${sessionScope.full_menu_flow_rname}&rId=${sessionScope.full_menu_flow_rid}&rZip=${sessionScope.full_menu_flow_rzip}'">
					Cancel</button>
			</c:if>
			<c:otherwise>
				<button type="button" class="btn btn-default"
					onclick="window.location.href='${pageContext.request.contextPath}/menu/view/all?eventId=${e.id}'">
					Cancel</button>
			</c:otherwise>
		</c:choose>
	</div>

	<!--
         <div class="col-sm-12">
         <div class="panel panel-success">
         <div class="panel-heading">
         <h3 class="panel-title">Card Info</h3>
         </div>
         <div class="panel-body">
         <div class="form-group">
         <label for="cardType" class="col-sm-3 control-label">Name on the Card</label>
         <div class="col-sm-6">
         <input type="text" size="30" maxlength="10" name="firstName"
         required="required" placeholder="First Name" class="form-control">
         
         <input type="text" size="30" maxlength="10" name="lastName"
         required="required" placeholder="Last Name" class="form-control">
         </div>
         </div>
         
         <div class="form-group">
         <label for="cardType" class="col-sm-3 control-label">Credit Card Type</label>
         <div class="col-sm-6">
         
         <input type="text" size="30" maxlength="10" name="cardType"
         required="required" placeholder="Credit Card Type" class="form-control">
         </div>
         </div>
         <div class="form-group">
         <label for="cardNumber" class="col-sm-3 control-label">Credit Card Number</label>
         <div class="col-sm-6">
         <input type="text" size="16" name="cardNumber" required="required"
         placeholder="Credit Card Number" class="form-control">
         </div>
         </div>
         <div class="form-group">
         <label for="expDate" class="col-sm-3 control-label">Exp Date</label>
         <div class="col-sm-6">
         <input type="text" size="2" name="month" required="required"
         placeholder="Month" class="form-control">
         <input type="text" size="4" name="year" required="required"
         placeholder="Year" class="form-control">
         </div>
         </div>
         <div class="form-group">
         <label for="securityCode" class="col-sm-3 control-label">Security Code</label>
         <div class="col-sm-6">
         <input type="text" size="4" name="securityCode" required="required"
         placeholder="Security Code" class="form-control">
         </div>
         </div>
         </div>
         </div>
         </div>
         <div class="col-sm-12">
         <div class="panel panel-success">
         <div class="panel-heading">
         <h3 class="panel-title">Billing Address</h3>
         </div>
         <div class="panel-body">
         
         <div class="form-group">
         <label for="street1" class="col-sm-3 control-label">Street</label>
         <div class="col-sm-6">
         <input type="text" size="30" maxlength="50" name="street"
         required="required" placeholder="Street" class="form-control">
         </div>
         </div>
         <div class="form-group">
         <label for="city" class="col-sm-3 control-label">City</label>
         <div class="col-sm-6">
         <input type="text" size="30" name="city" required="required"
         placeholder="City" class="form-control">
         </div>
         </div>
         
         <div class="form-group">
         <label for="state" class="col-sm-3 control-label">State :</label>
         <div class="col-sm-6">
         <input type="text" size="30" name="state" required="required"
         placeholder="State" class="form-control">
         </div>
         </div>
         
         <div class="form-group">
         <label for="zip" class="col-sm-3 control-label">Zip :</label>
         <div class="col-sm-6">
         <input type="text" size="10" name="zip" maxlength="10"
         required="required" placeholder="Ex.: xxxxx"
         pattern="^\d{5}(\-\d{4})?$" class="form-control">
         </div>
         </div>
         
         
         </div>
         </div>
         -->
</div>