<%@ page import="java.util.Date"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="col-sm-10 col-sm-offset-1 page-header">
	<h1>${event.name}</h1>
</div>

<c:set var="now" value="<%=new Date()%>" />

<div class="row">
	<div class="col-sm-10 col-sm-offset-1">
		<div class="panel panel-warning">
			<div class="panel-heading">
				<h3 class="panel-title">Menu</h3>
			</div>
			<div class="panel-body" align="left">
				<div align="right">
					<c:if test="${event.status == 'ACTIVE' && user.role == 'CUSTOMER'}">
						<a
							href="${pageContext.request.contextPath}/menu/selectMenu?eventId=${event.id}&cuisineType=${menu.cuisine}"
							role="button" class="btn btn-default"><span
							class="glyphicon glyphicon-edit"></span> Edit Menu</a>
					</c:if>
				</div>
				<c:forEach items="${menu.categories}" var="category">
					<c:if test="${not empty category.items}">
						<div class="col-sm-12">
							<ul>
								<li><b>${category.name}</b></li>
								<ol>
									<c:forEach items="${category.items}" var="item">
										<li>${item.name}</li>
									</c:forEach>
								</ol>
							</ul>
						</div>
					</c:if>
				</c:forEach>
				<c:if test="${menu.cuisine == 'PIZZA'}">
					<c:forEach items="${pizza_items}" var="pi">
						<div class="col-sm-12">
							<c:choose>
								<c:when test="${pi.key.contains('#')}">
									<ul>
										<li><b>${fn:substringBefore(pi.key, ' #')}</b>
											&nbsp;&nbsp; ${pi.value}</li>
									</ul>
								</c:when>
								<c:otherwise>
									<ul>
										<li><b>${pi.key}</b> &nbsp;&nbsp; ${pi.value}</li>
									</ul>
								</c:otherwise>
							</c:choose>


						</div>
					</c:forEach>
				</c:if>
				<c:if test="${menu.cuisine == 'MEXICAN'}">
					<c:forEach items="${mexican_items}" var="m">
						<div class="col-sm-12">
							<ul>
								<li><b>${m.key}</b> &nbsp;&nbsp; ${m.value}</li>
							</ul>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${menu.cuisine == 'THAI'}">
					<c:forEach items="${thai_items}" var="m">
						<div class="col-sm-12">
							<ul>
								<li><b>${m.key}</b> &nbsp;&nbsp; ${m.value}</li>
							</ul>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${menu.cuisine == 'SANDWICH'}">
					<c:forEach items="${sandwich_items}" var="m">
						<div class="col-sm-12">
							<ul>
								<li><b>${m.key}</b> &nbsp;&nbsp; ${m.value}</li>
							</ul>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${not empty menu.comments}">
					<c:choose>
						<c:when test="${user.role == 'RESTAURANT'}">
							<b>Comments from Customer:</b>
							<br />
						</c:when>
						<c:otherwise>
							<b>Your comments:</b>
							<br />
						</c:otherwise>
					</c:choose>
					<pre>${menu.comments}</pre>
				</c:if>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-sm-4 col-sm-offset-1">
		<div class="panel panel-success">
			<div class="panel-heading">
				<h3 class="panel-title">Event details</h3>
			</div>
			<div class="panel-body" align="left">
				<b>Event name:</b> ${event.name}<br /> <b>Time:</b>
				<fmt:formatDate value="${event.date_time}"
					pattern="EEE, d MMM yyyy hh:mm aaa" />
					<c:if test="${event.date_time <= now}">
						<span style="color:red">Past Event!</span>
					</c:if>
				<br /> <b>Number of Adults:</b> <span style="color: red;">${event.personCount}</span><br />
				<b>Number of Kids:</b> <span style="color: red;">${event.kidsCount}</span><br />
				<b>Delivery Option:</b> <span style="color: red;">${event.isPickUp()?'Pick Up':'Delivered'}</span><br />
				<b>Customer name:</b> ${event.customer.name}<br />
				<c:if
					test="${quote.status.toString() == 'CUSTOMER_ORDER_CONFIRMED'}">
					<b>Customer contact number:</b>
					<c:out
						value="(${fn:substring(event.customer.contactNumber, 0, 3)}) ${fn:substring(event.customer.contactNumber, 3, 6)}-${fn:substring(event.customer.contactNumber, 6, 10)}" />
				</c:if>
				<br />
			</div>
		</div>
	</div>
	<c:if test="${user.role == 'RESTAURANT'}">
		<div class="col-sm-6">
			<div class="panel panel-success">
				<div class="panel-heading">
					<h3 class="panel-title">Quote</h3>
				</div>
				<div class="panel-body" align="left">
					<form class="form-horizontal" method="POST" id="submit-price-form"
						action="${pageContext.request.contextPath}/restaurant/submitprice"
						enctype="application/x-www-form-urlencoded" autocomplete="off">
						<div class="form-group">
							<label class="col-sm-4 control-label">Status:</label>
							<div class="col-sm-6">
								<c:choose>
									<c:when test="${quote.status.toString() == 'CREATED'}">New Event.</c:when>
									<c:when
										test="${quote.status.toString() == 'CUSTOMER_UPDATED_MENU'}">
												Customer has updated the menu. <span class="badge"
											style="background-color: #FF3300;">&nbsp;&#134;&nbsp;</span>
									</c:when>
									<c:when
										test="${quote.status.toString() == 'CUSTOMER_UPDATED_COUNT'}">
												Customer has updated the person count. <span class="badge"
											style="background-color: #FF3300;">&nbsp;&#134;&nbsp;</span>
									</c:when>
									<c:when
										test="${quote.status.toString() == 'CUSTOMER_UPDATED_DATE'}">
												Customer has updated the date and/or time of the event. <span
											class="badge" style="background-color: #FF3300;">&nbsp;&#134;&nbsp;</span>
									</c:when>
									<c:when
										test="${quote.status.toString() == 'RESTAURANT_SUBMITTED_PRICE'}">Customer is reviewing your price quote.</c:when>
									<c:when
										test="${quote.status.toString() == 'RESTAURANT_UPDATED_PRICE'}">Customer is reviewing your updated price quote.</c:when>
									<c:when test="${quote.status.toString() == 'APPROVED'}">Customer accepted your quote.
											<span class="badge" style="background-color: #009933;">&nbsp;&#x2713;&nbsp;</span>
									</c:when>
									<c:when test="${quote.status.toString() == 'DENIED'}">Customer denied your quote.</c:when>
									<c:when test="${quote.status.toString() == 'PAID'}">Customer has paid.</c:when>
									<c:when
										test="${quote.status.toString() == 'CUSTOMER_ORDER_CONFIRMED'}">Customer has confirmed the order.</c:when>
								</c:choose>
							</div>
						</div>

						<c:choose>
							<c:when test="${quote.menu.event.status eq 'ACTIVE'}">

								<input type="text" hidden="true" value="${quote.id}"
									name="quoteId">
								<div class="form-group">
									<label class="col-sm-4 control-label">Event location:</label>
									<div class="col-sm-6">
										${event.location.getAddressString()} <br />(<b>${eventDistance}</b>)
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-4 control-label">Can you deliver
										for this order?</label>
									<div class="col-sm-3">
										<select name="deliver" class="form-control"
											required="required">
											<option value="yes" ${quote.canDeliver()?'selected':''}>Yes</option>
											<option value="no" ${quote.canDeliver()?'':'selected'}>No</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="notes" class="col-sm-4 control-label">Notes:</label>
									<div class="col-sm-6">
										<textarea rows="4" name="notes" class="form-control">${quote.notes}</textarea>
									</div>
								</div>
								<c:choose>
									<c:when test="${quote.price != null}">
										<div class="form-group">
											<label for="quotedPrice" class="col-sm-4 control-label">Price
												Quoted:</label>
											<div class="col-sm-2" align="left">
												<fmt:setLocale value="en_US" />
												<span style="color: red;"><fmt:formatNumber
														value="${quote.price}" type="currency" /></span>
											</div>
										</div>
										<div class="form-group">
											<label for="quotedPrice" class="col-sm-4 control-label">New
												Price:</label>
											<div class="col-sm-3">
												<input type="text" size="30" maxlength="50" name="price"
													required="required" pattern="[0-9]+(\.[0-9]*)?"
													title="Example: 250.60" placeholder="0.00"
													class="form-control inputs" value="${quote.price}">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-4 control-label"></label>
											<div class="col-sm-2" align="left">
												<button type="submit" class="btn btn-default"
													${(event.date_time <= now)?'disabled':''}>Update</button>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<div class="form-group">
											<label for="quotedPrice" class="col-sm-4 control-label">Price:</label>
											<div class="col-sm-3">
												<input type="text" size="30" maxlength="50" name="price"
													required="required" pattern="[0-9]+(\.[0-9]{2})?"
													title="Example: 250.60" placeholder="0.00"
													class="form-control inputs">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-4 control-label"></label>
											<div class="col-sm-2" align="left">
												<button type="submit" class="btn btn-default"
													${(event.date_time <= now)?'disabled':''}>Submit</button>
											</div>
										</div>
									</c:otherwise>
								</c:choose>

							</c:when>
							<c:otherwise>
								<label for="quotedPrice" class="col-sm-4 control-label">Price
									Quoted:</label>
								<div class="col-sm-2" align="left">
									<fmt:setLocale value="en_US" />
									<span style="color: red;"><fmt:formatNumber
											value="${quote.price}" type="currency" /></span>
								</div>
							</c:otherwise>
						</c:choose>
					</form>
				</div>
			</div>
		</div>
	</c:if>
</div>
<div class="col-sm-1 col-sm-offset-1">
	<button type="button" class="btn btn-default"
		onclick="window.location.href='${pageContext.request.contextPath}/dashboard'">Back</button>
	<br /> <br /> <br /> <br />
</div>
