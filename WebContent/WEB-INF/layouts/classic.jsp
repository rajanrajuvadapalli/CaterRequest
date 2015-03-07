<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<meta name="viewport"
	content="width=device-width, user-scalable=yes, initial-scale=1" />
<meta http-equiv="content-type" content="text/html" />
<title><t:getAsString name="title" /></title>
<c:import url="scripts.jsp"></c:import>
</head>
<body align="center">
	<div class="container container-fluid">
		<div class="row">
			<t:insertAttribute name="header" />
		</div>
		<div class="row">
			<div class="col-sm-1">
				<img
					src="${pageContext.request.contextPath}/resources/images/logo.jpg"
					alt="VSP" width="180px" />
			</div>
			<div>
				<t:insertAttribute name="body" />
			</div>
		</div>
		<div class="row">
			<t:insertAttribute name="footer" />
		</div>
	</div>
</body>
</html>