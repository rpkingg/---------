	<%@ page contentType="text/html;charset=GBK" language="java" %>
		<%@ include file="/YunHaiTongProject/common/taglibs.jsp" %>
		<!DOCTYPE html>
		<html lang="zh-CN">

		<head>
			<meta charset="gbk">
			<title>限时购</title>
			<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="renderer" content="webkit">
			<meta http-equiv="Cache-Control" content="no-cache"/>
			<link rel="stylesheet" href="css/common/iconfont/iconfont.css">
			<link rel="stylesheet" href="css/dxt.css">
			<link rel="stylesheet" href="css/buy_buy/new_listed.css?ts=${ts}">
			<link rel="stylesheet" href="css/buy_buy/hot_goods.css?ts=${ts}">
			<link rel="stylesheet" href="css/buy_buy/time_buy.css?ts=${ts}">
			<script type="text/javascript" src="js/common/jquery-2.1.4.min.js"></script>
			<link rel="stylesheet" href="assets/plugins/dropload/dropload.css"/>
		</head>

		<body ontouchstart="" class="container buy-buy-top">
			<div id="content2">
				<div class="new-listed-container row text-center buy-buy-top-down">
					<!--限时购-->
					<!--<div id="pullrefresh1" class="mui-content mui-scroll-wrapper">-->
					<div id="time_buy_container" >
						<div class="time-buy-content col-xs-12 ">

						</div>
					</div>
					<!--</div>-->
					<!--</ul>
					</div>
					</div>-->

				</div>
			</div>
		</body>
		<c:if test="${DEBUG}"><script type="text/javascript" src="js/common_js/vconsole.min.js"></script> </c:if>
		<script type="text/javascript" src="assets/plugins/dropload/dropload.js"></script>
		<script type="text/javascript" src="js/common_js/my_tools.js?ts=${ts}"></script>
		<script type="text/javascript" src="js/buy_buy/time_buy.js?ts=${ts}"></script>
		<script type="text/javascript">
		$(".buy-buy-nav-bar").on("click",function(){
			window.scroll(0,0);
		})
		</script>
		</html>