<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html" />
		<title><t:getAsString name="title"/></title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/style.css" type="text/css" />
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/logo-favicon.ico">
		<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
		<!-- <script src = "http://www.myersdaily.org/joseph/javascript/md5.js"></script> -->
		<script src="${pageContext.request.contextPath}/resources/js/md5.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/register.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/settings.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/bootstrap-formhelpers.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/jquery.validate.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/additional-methods.min.js"></script>
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