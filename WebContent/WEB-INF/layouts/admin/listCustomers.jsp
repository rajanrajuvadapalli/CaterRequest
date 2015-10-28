<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="col-sm-offset-2 page-header">
	<h1>Admin Dashboard</h1>
	
	
</div>
<div class="col-md-10 col-sm-10 col-sm-offset-1">
         <form class="Panel"id="start-new-search-form"
	       action="${pageContext.request.contextPath}/admin/customerSearch" method="GET">
	       <div class="col-md-10 col-sm-10 col-sm-offset-1">
           <div class="panel panel-success">
	           <div class="panel-heading">
		         	<h3 class="panel-title">Customer Search</h3>
	           </div>
	          <div class="col-md-10 col-sm-10 col-sm-offset-1">
	           <label for="name" class="col-sm-2 control-label">username &nbsp;:</label>
	             <input type="text" name="id" id="id" class="form-control"> 
	           <label for="name" class="col-sm-2 control-label">From Date &nbsp;:</label>
	            <input type="text"	name="fromDate" id="fromDate"  class="form-control">
	           <label for="name" class="col-sm-2 control-label">To Date &nbsp;:</label>
	             <input type="text" name="toDate" id="toDate" class="form-control"> 
	         <br /> <span class="input-group-btn">
		        <button type="submit" class="btn btn-default">
			Search 
		</button>
	</span>
	</div>
	</div>
       </form>
</div>

<div class="col-sm-12">
	<div class="panel panel-success">
		<div class="panel-heading">
			<h3 class="panel-title">Customers</h3>
		</div>
		<div class="panel-body">
			<c:choose>
				<c:when test="${empty customers}">
					There are no customers registered.
				</c:when>
				<c:otherwise>
					<div class="table-responsive">
						<table class="table table-striped table-hover table-bordered">
							<tr>
								<th>Email</th>
								<th>Name</th>
								<th>Contact Number</th>
								
								<th>SMS indicator</th>
								<th>Event Name</th>
								<th>Event Location</th>
								<th>Restaurant Name</th>
								<th>Price</th>
								<th>Event Time</th>
							</tr>
							<c:forEach items="${customers}" var="cust">
								<tr>
									<td>${cust.customerEmail}</td>
									<td>${cust.customerName}</td>
									<td>${cust.contactNumber}</td>
									<td>${cust.smsIndicator}</td>
									<td>${cust.eventName}</td>
									<td>${cust.eventStreet1} ${cust.eventStreet2}, ${cust.eventCity}, ${cust.eventState}, ${cust.eventZip}</td>
									<td>${cust.restaurantName}</td>
									<td>${cust.price}</td>
									<td>${cust.date_time}</td>
									
								</tr>
								
							</c:forEach>
						</table>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>


        <script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {
                
                $('.input-daterange').datepicker({
                    todayBtn: "linked"
                });
            
            });
        </script>