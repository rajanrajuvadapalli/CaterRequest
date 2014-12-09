<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html" />
		<title><t:getAsString name="title"/></title>
		<c:import url="scripts.jsp"></c:import>
	</head>
	<body align="center">
		<table align="center">
			<tr>
				<td>
					<t:insertAttribute name="header" />
				</td>
			</tr>
			<tr>
				<td>
					<t:insertAttribute name="body" />
				</td>
			</tr>
			<tr>
				<td>
					<t:insertAttribute name="footer" />
				</td>
			</tr>
		</table>
	</body>
</html>