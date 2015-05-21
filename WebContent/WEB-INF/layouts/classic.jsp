<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html lang="en-US">
<head>
	<meta charset="UTF-8"/>
	<meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1.0" />
	<meta http-equiv="content-type" content="text/html" />
	<title><t:getAsString name="title" /></title>
	<c:import url="scripts_css.jsp"></c:import>
</head>

<body id="page-top">
	<div id="outer-wrapper">
		<div id="inner-wrapper">
			<t:insertAttribute name="header" />
			<t:insertAttribute name="body" />
			<t:insertAttribute name="footer" />
		</div>
	</div>
</body>
</html>