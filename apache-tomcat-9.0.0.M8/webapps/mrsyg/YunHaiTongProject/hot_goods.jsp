<%@ page contentType="text/html;charset=GBK" language="java" %>
<%@ include file="/YunHaiTongProject/common/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta charset="gbk">
		<title>抢手货</title>
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

	<body ontouchstart="" class="container ">
	<div id="content2">
		<div class="new-listed-container row text-center hot-goods-top-down">
			<!--抢手货-->
			<div id="hot_goods_container">
				<div class="hot-goods-content col-xs-12">
					<div id="hot_goods_container_first">


					</div>
					<div class="other-hot-goods-content col-xs-12">
						<div class="other-hot-goods-tip col-xs-12">
							<span class="left-tip-icon col-xs-3 text-right col-width">
							<svg class="icon" aria-hidden="true">
								<use xlink:href="#icon-zuobanbian"></use>
							</svg>
						</span>
							<span class="other-hot-tip-text col-xs-5">扫货时刻&nbsp;·&nbsp;不容错过</span>
							<span class="right-tip-icon col-xs-3 text-left col-width">
							<svg class="icon" aria-hidden="true">
								<use xlink:href="#icon-youbanbian"></use>
							</svg>
						</span>
						</div>
						<div class="hot-goods-list col-xs-12 text-center">

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</body>
	<c:if test="${DEBUG}"><script type="text/javascript" src="js/common_js/vconsole.min.js"></script> </c:if>
	<script type="text/javascript" src="assets/plugins/dropload/dropload.js"></script>
	<script type="text/javascript" src="js/common_js/my_tools.js?ts=${ts}"></script>
	<script type="text/javascript" src="js/buy_buy/hot_goods.js?ts=${ts}"></script>
	<script type="text/javascript">
		$(".buy-buy-nav-bar").on("click",function(){
			window.scroll(0,0);
		})
		/*function callByNativeBuy(){
			$("#01").addClass("active");
			$("#02").removeClass("active");
			$("#03").removeClass("active");
			$("#new_listed_container").show();
			$("#hot_goods_container").hide();
			$("#time_buy_container").hide();
		}*/
	</script>
</html>