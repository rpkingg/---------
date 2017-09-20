<%@ page contentType="text/html;charset=GBK" language="java" %>
<%@ include file="/YunHaiTongProject/common/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="gbk">
		<title>新上市</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-cache"/>
		<link rel="stylesheet" href="css/common/iconfont/iconfont.css">
		<link rel="stylesheet" href="css/dxt.css">
		<link rel="stylesheet" href="css/buy_buy/new_listed.css?ts=${ts}">
		<link rel="stylesheet" href="css/buy_buy/hot_goods.css?ts=${ts}">
		<link rel="stylesheet" href="css/buy_buy/time_buy.css?ts=${ts}">
		<!--<link rel="stylesheet" href="css/common_css/mui.min.css">
		<script type="text/javascript" src="js/common_js/mui.js"></script>-->
		<script type="text/javascript" src="js/common/jquery-2.1.4.min.js"></script>
		<link rel="stylesheet" href="assets/plugins/dropload/dropload.css"/>
	</head>

	<body ontouchstart="" class="container buy-buy-top">
	<div id="content2">
		<div class="new-listed-container row text-center buy-buy-top-down">
		<!--<div id="pullrefresh" class="mui-content mui-scroll-wrapper">-->
	<!--<div id="pullupRefreshFirst" class="mui-content mui-scroll-wrapper">
				<div class="mui-scroll">
					<ul class="mui-table-view mui-table-view-chevron">-->
						<!--新上市-->
						<div id="new_listed_container">
							<div class="new-listed-content col-xs-12" >

							</div>
						</div>
					<!--</div>-->
		</div>
	</div>
	</body>
	<c:if test="${DEBUG}"><script type="text/javascript" src="js/common_js/vconsole.min.js"></script> </c:if>
	<script type="text/javascript" src="assets/plugins/dropload/dropload.js"></script>
	<script type="text/javascript" src="js/common_js/my_tools.js?ts=${ts}"></script>
	<script type="text/javascript" src="js/buy_buy/new_listed.js?ts=${ts}"></script>
	<script type="text/javascript">
		$(".buy-buy-nav-bar").on("click",function(){
			window.scroll(0,0);
		})
	</script>
</html>