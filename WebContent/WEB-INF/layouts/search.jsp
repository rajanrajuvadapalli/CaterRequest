<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<input type="hidden" name="eventAddress" id="event-address"
	class="event-address" value="${eventLocation}" />
<div class="container">
    <header><h2>Search</h2></header>
       <form class="subscribe form-inline border-less-inputs" action="${pageContext.request.contextPath}/search" method="GET" role="form">
          <div class="form-group">
              <input type="text" id="main-search" value="${eventLocation}" name="zip_code" id="zip_code" placeholder="Enter ZIP Code for restaurants nearby">
                   <span class="input-group-btn">
                   <button type="submit" class="btn btn-default btn-large">Search<i class="fa fa-angle-right"></i></button>
                   </span>
          </div>
       </form>
</div>
<div class="container">
		<c:choose>
			<c:when test="${empty restaurants}">Sorry! No restaurants registered with us.</c:when>
			<c:otherwise>					
				<c:forEach items="${restaurants}" var="r">
					<span class="restaurants" style="display: none;" data-restaurant-id="${r.id}" data-restaurant-address="${r.address.street1} ${r.address.street2}, ${r.address.city}, ${r.address.state} ${r.address.zip}" data-restaurant-name="${r.name}"></span>
					<br />
				</c:forEach>
					<div class="display-restaurants"></div>
					<br>
			</c:otherwise>
		</c:choose>
		<br>
</div>	


