<%@ page contentType="text/html;charset=GBK" language="java" %>
<%@ include file="/YunHaiTongProject/common/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<meta http-equiv="Content-Type" content="text/html;charset=GBK" />
		<meta content="yes" name="apple-mobile-web-app-capable" />
		<meta content="black" name="apple-mobile-web-app-status-bar-style" />
		<meta content="telephone=no" name="format-detection" />
		<meta http-equiv="Cache-Control" content="no-cache" />
		<title>寻好店</title>
		<link rel="stylesheet" href="css/common_css/initialization_style.css" />
		<link rel="stylesheet" href="css/common_css/public_style.css" />
		<link rel="stylesheet" href="css/common_css/swiper.min.css" />
		<link rel="stylesheet" href="css/searching_good_shop.css?ts=${ts}" />
		<!--<link rel="stylesheet" href="css/common_css/mui01.css">
		<script type="text/javascript" src="js/common_js/mui.js"></script>-->
		<script type="text/javascript" src="js/common_js/swiper.min.js"></script>
		<script type="text/javascript" src="js/common_js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="js/common_js/set_fontsize.js"></script>
		<script type="text/javascript">
			(function($, document) {
				console.log("This is a test");
				var fontSize = $(window).width() / 10;
				$("html").css('font-size', fontSize + 'px');
			})(jQuery, document);
		</script>

		<!--<style>
			ul{
				width:100%;
				margin-top:0px;
				position: absolute;
				left:0px;
				padding:0px;
				top:0px;
			}

			.outerScroller{
				position: absolute;
				top:0px;
				bottom:0px;
				width:100%;
				left:0px;
				}

			li{
				list-style-type: none;
			}

			.loading{
				text-align: center;
				font-size: 0.32rem;
			}
		</style>-->
	</head>

	<body>
		<!--下拉刷新容器-->
		<!--<div id="pullrefresh" class="mui-content mui-scroll-wrapper">
			<div class="mui-scroll">-->
			<!--<div class="outerScroller">
				<div style="display:none" class="loading">loading</div>-->
				<ul id="search_shop_container_id" class="scroll">

				</ul>
			<!--</div>-->
			<!--</div>
		</div>-->
		<div class="refresh" style="float: right;
					z-index: 200000;
					position: fixed;
					right: 0;
					bottom: 0;
					border-radius: 0.2rem;
					border: 1px solid #4395F7;
					height: 1.5rem;
					width: 2.5rem;
					font-size:0.8rem;
					text-align: center;
					padding-top: 0.4rem;">
			刷新
		</div>
	</body>
	<c:if test="${DEBUG}">
		<script type="text/javascript" src="js/common_js/vconsole.min.js"></script>
	</c:if>
	<script type="text/javascript" src="js/common_js/change_fontsize.js"></script>
	<script type="text/javascript" src="js/common_js/my_tools.js?ts=${ts}"></script>
	<script type="text/javascript" src="js/searching_good_shop.js?ts=${ts}"></script>
	<script type="text/javascript">
		$(".refresh").on("click",function(){
			window.location.reload();
		})
	</script>
</html>
