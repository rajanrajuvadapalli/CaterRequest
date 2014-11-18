<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html" />
		<title><t:getAsString name="title"/></title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css" type="text/css" />
		<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
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