<%@ page contentType="text/html;charset=GBK" language="java" %>
<%@ include file="/YunHaiTongProject/common/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta charset="gbk">
		<title>买买</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-cache" />
		<link rel="stylesheet" href="css/common/iconfont/iconfont.css"/>
		<link rel="stylesheet" href="css/dxt.css?ts=${ts}"/>
		<link rel="stylesheet" href="css/buy_buy/new_listed.css?ts=${ts}"/>
		<link rel="stylesheet" href="css/buy_buy/hot_goods.css?ts=${ts}"/>
		<link rel="stylesheet" href="css/buy_buy/time_buy.css?ts=${ts}"/>
		<%--<link rel="stylesheet" href="css/common_css/mui.min.css">--%>
		<%--<script type="text/javascript" src="js/common_js/mui.js"></script>--%>
		<script type="text/javascript" src="js/common/jquery-2.1.4.min.js"></script>
		<link rel="stylesheet" href="assets/plugins/dropload/dropload.css"/>
	</head>

	<body class="container buy-buy-top">
		<div id="content2">
		<div class="new-listed-container row text-center buy-buy-top-down">
			<div class="buy-buy-nav-bar col-xs-12">
				<span class="active col-xs-4" id="new_listed_container_tab"> 新上市</span>
				<span class="col-xs-4" id="hot_goods_container_tab">抢手货</span>
				<span class="col-xs-4" id="time_buy_container_tab">限时购</span>
			</div>
			<div id="content3">
			<!--新上市-->
				<div id="new_listed_container">
					<div class="new-listed-content col-xs-12" >

					</div>
				</div>

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


				<!--限时购-->
				<div id="time_buy_container" >
					<div class="time-buy-content col-xs-12 ">

					</div>
				</div>
		</div>
		</div>
	</div>
	</body>
	<c:if test="${DEBUG}">
		 <script type="text/javascript" src="js/common_js/vconsole.min.js"></script>
	</c:if>
	<script type="text/javascript" src="assets/plugins/dropload/dropload.js"></script>
	<script type="text/javascript" src="js/common_js/my_tools.js?ts=${ts}"></script>
	<script type="text/javascript" src="js/buy_buy/new_listed.js?ts=${ts}"></script>


	<script type="text/javascript">
		$(".buy-buy-nav-bar").on("click",function(){
			// window.scroll(0,0);
		})
		function callByNativeBuy(){
			$("#new_listed_container_tab").addClass("active");
			$("#hot_goods_container_tab").removeClass("active");
			$("#time_buy_container_tab").removeClass("active");
			$("#new_listed_container").show();
			$("#hot_goods_container").hide();
			$("#time_buy_container").hide();
		}
	</script>
</html>
