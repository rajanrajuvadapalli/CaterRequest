<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!--Page Footer-->
<footer id="page-footer">
	<div class="inner">
		<div class="footer-top"></div>
		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<span class="right"> <a href="#page-top" class="to-top roll"><i
							class="fa fa-angle-up"></i></a>
					</span> 
					<span class="left"> <a
						href="[full link to your Facebook page]"> <img
							title="Facebook" alt="Facebook"
							src="${pageContext.request.contextPath}/resources/images/social/02_facebook.png"
							width="35" height="35" />
					</a><a href="[full link to your Twitter]"> <img title="Twitter"
							alt="Twitter"
							src="${pageContext.request.contextPath}/resources/images/social/01_twitter.png"
							width="35" height="35" />
					</a> <a href="[full link to your Pinterest]"> <img
							title="Pinterest" alt="Pinterest"
							src="${pageContext.request.contextPath}/resources/images/social/13_pinterest.png"
							width="35" height="35" />
					</a> <%-- a href="[full link to your LinkedIn]"> <img title="LinkedIn"
					alt="LinkedIn"
					src="${pageContext.request.contextPath}/resources/images/social/07_linkedin.png"
					width="35" height="35" /> </a> --%> <a
						href="[full link to your
					Instagram]"> <img
							title="Instagram" alt="RSS"
							src="${pageContext.request.contextPath}/resources/images/social/10_instagram.png"
							width="35" height="35" />
					</a>
					</span>
					<div class="col-sm-6 col-sm-offset-1">
						<a role="button" style="margin-left:10px;" href="#">Privacy</a>
						<a role="button" style="margin-left:10px;" href="#">Terms of Service</a>
						<a role="button" style="margin-left:10px;" href="#">FAQs</a>
						<a role="button" style="margin-left:10px;" href="${pageContext.request.contextPath}/contactUs">Contact
							Us </a>
					</div>
				</div>
				<!-- end row 1 -->
				<div class="row" style="margin-top:8px;">
					<span class="left"> <a
						href="https://itunes.apple.com/us/app/caterrequest"
						target="_blank" class="ios"><img
							src="${pageContext.request.contextPath}/resources/images/ios_store.png"
							width="107"></a><a
						href="https://play.google.com/store/apps/details?id=com.caterrequest.app"
						target="_blank"><img alt="Get it on Google Play"
							src="${pageContext.request.contextPath}/resources/images/google_play.png"
							width="107"></a></span>
				</div>
				<div class="row">
					<span class="left">&copy; CaterRequest, All rights reserved</span>
				</div>
				<!-- end row 2 -->
			</div>
		</div>
		<!--end footer-bottom-->
	</div>
	<!--end inner-->
</footer>
<!--end Page Footer-->


