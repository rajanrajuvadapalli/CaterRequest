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
	</div>
       </form>
</div>

<br>

	 <div class="col-md-10 col-sm-10 col-sm-offset-1">
         <form class="Panel"id="start-new-search-form"
	       action="${pageContext.request.contextPath}/admin/restaurantSearch" method="GET">
	       <div class="col-md-10 col-sm-10 col-sm-offset-1">
             <div class="panel panel-info">
	           <div class="panel-heading">
		         	<h3 class="panel-title">Restaurant Search</h3>
	           </div>
	          <div class="col-md-10 col-sm-10 col-sm-offset-1">
	           <label for="name" class="col-sm-2 control-label">restaurant id &nbsp;:</label>
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
	</div>
       </form>
</div>




<script>
	$('document').ready(function() {
		populateStateDropDown();
		$("input[id=fromDate]").datetimepicker({
			dayOfWeekStart : 1,
			lang : 'en'
		});
	});
	$('document').ready(function() {
		populateStateDropDown();
		$("input[id=toDate]").datetimepicker({
			dayOfWeekStart : 1,
			lang : 'en'
		});
	});
</script>