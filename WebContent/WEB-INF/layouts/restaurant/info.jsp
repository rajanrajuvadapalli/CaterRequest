<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Important note! The contents of the file that you load is already a popup itself, so there must be only one root element. -->
<div id="custom-content" class="white-popup-block"
	style="max-width: 600px; margin: 20px auto;">

	<h1>${r.name}</h1>
	(${r.cuisineType})

	<div class="col-sm-6">
		<img
			src="${pageContext.request.contextPath}/imagesproxy/Restaurant_${r.id}"
			width="180px"> <br /> <b>Address: </b>${r.address.street1}
		${r.address.street2}, ${r.address.city}, ${r.address.state}
		${r.address.zip}

	</div>
</div>