<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
	<head>
		<meta name="viewport" content="width=device-width, user-scalable=no" />
		<meta http-equiv="content-type" content="text/html" />
		<title><t:getAsString name="title"/></title>
		<c:import url="scripts.jsp"></c:import>
	</head>
	<body align="center">
		<div class="container container-fluid">
			<div class="row">
				<t:insertAttribute name="header" />
			</div>
			<div class="row">
				<t:insertAttribute name="body" />
			</div>
			<div class="row">
				<t:insertAttribute name="footer" />
			</div>
		</div>
	</body>
</html>