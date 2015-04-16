<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="page-header">
	<h1>My Dashboard</h1>
</div>

<c:if test="${not empty errors}">
	<div class="alert alert-danger">
		<button type="button" class="close btn-lg" data-dismiss="alert"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<ul>
			<c:forEach items="${errors}" var="e">
				<li align="left">${e}</li>
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
				<li align="left">${sm}</li>
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
				<li align="left">${w}</li>
			</c:forEach>
		</ul>
	</div>
</c:if>


<div class="col-sm-12">
	<div align="right">
		<a href="${pageContext.request.contextPath}/customer/createEvent"
			role="button" class="btn btn-lg btn-primary"> Create Event</a>
	</div>
	<br>
	<div class="panel panel-success">
		<div class="panel-heading">
			<h3 class="panel-title">Events</h3>
		</div>
		<div class="panel-body">

			<c:choose>
				<c:when test="${empty events}">
		Welcome to your dashboard. <br>
					<br>
		Looks like this is your first time here.<br>
					<br>
		To get started, click on the "Create Event" button on the top.
				</c:when>
				<c:otherwise>
					<div class="table-responsive">
						<table class="table table-striped table-bordered">
							<tr>
								<th class="col-sm-2">Event Name</th>
								<th class="col-sm-2">Date/Time</th>
								<th class="col-sm-2">Location</th>
								<th class="col-sm-2">Quote(s)</th>
								<th class="col-sm-2">Menu(s)</th>
							</tr>
							<c:forEach items="${events}" var="e">
								<tr>
									<td>${e.name} <br/>(${e.personCount} count)<br /> <a
										href="${pageContext.request.contextPath}/customer/event/edit/${e.id}">
											<img alt="edit"
											src="${pageContext.request.contextPath}/resources/images/edit.png">&nbsp;Edit
									</a></td>
									<td>${e.date_time}</td>
									<td>${e.location.street1}${e.location.street2},
										${e.location.city}, ${e.location.state} - ${e.location.zip}</td>
									<td>
									<c:if test ="${e.status eq 'ACTIVE'}"><b></b></c:if>
									<c:choose>
									    <c:when test="${empty e2m.get(e.id)}">Please select a menu and create your request.</c:when>
									    <c:when test="${empty e2q.get(e.id)}">	0 restaurants have responded to your request.
										</c:when>
										<c:otherwise>
											<c:choose>
											    <c:when test="${e.status eq 'ACTIVE'}">
											       <form class="form-horizontal" method="POST"
							                             id="select-restaurant-form"
							                             action="${pageContext.request.contextPath}/customer/orderConfirmation"
							                             ectype="application/x-www-form-urlencoded" autocomplete="off">
							                             <input type="hidden" name="xeventId" value="${e.id}">
							                             <input type="hidden" name="xquoteId" value="">
												         <c:forEach items="${e2q.get(e.id)}" var="q2c">
												           	<c:if test="${not empty q2c}">
														    <div>
															<div class="panel panel-info">
															   <div class="panel-heading">
																   <h3 class="panel-title">${q2c.key}</h3>
															   </div>
															   <div class="panel-body">
																  <div>
																  <input type="hidden" name="xcuisineType" value="${cuisine}">
																    	<c:forEach items="${q2c.value}" var="q">
																	  	 <div class="radio">
                                                                          <label><input type="radio" value="${q.restaurant.id}" data-quote-id="${q.id}" name="restaurantName">
                                                                            ${q.restaurant.name}
                                                                           </label>
                                                                         </div>
																		 <c:choose>
																				<c:when test="${empty q.price}">Not responded</c:when>
																				<c:otherwise>
																					<fmt:setLocale value="en_US" />
																					<b><fmt:formatNumber value="${q.price}"
																							type="currency" /></b>
																				</c:otherwise>
																		 </c:choose>
																		 <br>
																		</c:forEach>
																		
																	</div>
																</div>
															  </div>
														    </div>
													       </c:if>
												         </c:forEach>
												         <class="col-sm-2">
								                              <button type="submit" width="50px" class="btn btn-lg btn-primary">confirm order</button>
							                         </form>
											     </c:when>
											     <c:otherwise>
											  	 <c:forEach items="${e2q.get(e.id)}" var="q2c">
											  	    <div class="panel-body">
													  <div>
														<c:forEach items="${q2c.value}" var="q">
														   <c:if test = "${ q.status eq 'APPROVED'}">
														   
														      <u>${q.restaurant.name}</u> &nbsp;
																<fmt:setLocale value="en_US" />
																<a href="${pageContext.request.contextPath}/menu/view/${q.menu.id}"><b><fmt:formatNumber value="${q.price}" type="currency" /></b></a>
																
														   </c:if>
															<br>
													    </c:forEach>
													 </div>
													</div>
												</c:forEach>
											  </c:otherwise>
										   </c:choose>
									</c:otherwise>
									</c:choose>
									</td>
									<td>
									<c:choose>
									   <c:when test="${e.status eq 'ACTIVE'}">
									   <c:if test="${not empty e2m.get(e.id)}">
											<c:forEach items="${e2m.get(e.id)}" var="cuisine">
												${cuisine} <a
													href="${pageContext.request.contextPath}/menu/selectMenu?eventId=${e.id}&cuisineType=${cuisine}">
													<img alt="edit"
													src="${pageContext.request.contextPath}/resources/images/edit.png">&nbsp;Edit
												</a>
												<br />
											</c:forEach>
											<hr>
										</c:if> <a class="popup-with-form" href="#${e.id}"><span
											class="glyphicon glyphicon-plus" aria-hidden="true"></span>
											Add Menu</a>
										<form class=" mfp-hide white-popup-block menuOptions"
											method="GET" id="${e.id}"
											action="${pageContext.request.contextPath}/menu/selectMenu"
											onsubmit="return validateCuisine(${e.id});"
											ectype="application/x-www-form-urlencoded">
											<br /> <input type="text" hidden="true" name="eventId"
												value="${e.id}"> <span id="cuisineType"></span><br />
											<button type="submit" class="btn btn-sm btn-warning">Select
												Menu</button>
										</form>
									   
									   </c:when>
									   
									</c:choose>
									     </td>

								</tr>
							</c:forEach>
						</table>
					</div>
				</c:otherwise>
			</c:choose>

		</div>
	</div>
</div>