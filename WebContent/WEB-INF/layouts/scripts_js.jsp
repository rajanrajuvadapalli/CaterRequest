<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/jquery-2.1.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/before.load.js"></script>
<!-- <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&amp;libraries=places"></script> -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/smoothscroll.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/jquery.hotkeys.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/jquery.nouislider.all.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/custom.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/maps.js"></script>
<!--[if lte IE 9]>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/ie-scripts.js"></script>
<![endif]-->

<!-- <script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script> -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAlobAYE25Q2m62_DX3wc1AMimO2Xr-WHc"></script>
<!-- <script src="http://maps.google.com/maps?file=api&v=2&key=AIzaSyAlobAYE25Q2m62_DX3wc1AMimO2Xr-WHc" type="text/javascript"></script>  -->
<!-- <script src = "http://www.myersdaily.org/joseph/javascript/md5.js"></script> -->
<script src="${pageContext.request.contextPath}/resources/js/md5.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/cater-request.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/settings.js"></script>
<%-- <script src="${pageContext.request.contextPath}/resources/js/distanceCalculator.js"></script> --%>
<!--<script src="${pageContext.request.contextPath}/resources/js/bootstrap-formhelpers.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/additional-methods.min.js"></script> -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.datetimepicker.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/moment.min.js"></script>
<!-- http://www.kryogenix.org/code/browser/sorttable/ -->
<script src="${pageContext.request.contextPath}/resources/js/sorttable.js"></script>
<!-- http://dimsemenov.com/plugins/magnific-popup/ -->
<script src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/fileinput.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap-tabs-x.min.js"></script>

<script>
    $(window).load(function(){
        var rtl = false; // Use RTL
        //initializeOwl(rtl);
    });

    autoComplete();
</script>

<script type="text/javascript">
	//If Chrome, hide the warning message.
	//Source:http://stackoverflow.com/questions/9847580/how-to-detect-safari-chrome-ie-firefox-and-opera-browser
	var isOpera = !!window.opera || navigator.userAgent.indexOf(' OPR/') >= 0;
	var isChrome = !!window.chrome && !isOpera;
	if (!isChrome) {
		$('div[id=browserwarning]').removeClass("hidden");
	}
</script>

