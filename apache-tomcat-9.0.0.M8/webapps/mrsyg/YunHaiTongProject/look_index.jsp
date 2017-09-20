<%@ page contentType="text/html;charset=GBK" language="java" %>
<%@ include file="/YunHaiTongProject/common/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta charset="gbk">
		<title>看看首页</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-cache" />
		<link rel="stylesheet" href="css/common/iconfont/iconfont.css">
		<link rel="stylesheet" href="css/dxt.css">
		<link rel="stylesheet" href="css/look_look/look_index.css?ts=${ts}">
		<!--<link rel="stylesheet" href="css/common_css/mui01.css">-->
		
	</head>

	<body ontouchstart="" class="container">
		<!--<div id="pullrefresh" class="mui-content mui-scroll-wrapper">
			<div class="mui-scroll">
				
			</div>
		</div>-->
		<!--</div>-->
		<!--<div class="line_interval"></div>-->
		
		
		<section class="look-index-container row text-center">
			<div class="look-content-container col-xs-12">

				<!--<div class="look-content-item col-xs-12">
         			<div class="look-item-cover col-xs-12">
         				<img src="image/look_look/C0D57980-8B76-440F-87E5-1ECA61C7F444.png"/>
         				<div class="look-item-base-info col-xs-12">
         					<div class="bofang col-xs-12">
         						<span class="iconfont icon-rectangle1"></span>
         					</div>
         					<div class="base-info-tip col-xs-12">
         						<span class="goods-name">金立s10四摄拍照更美</span>
         						<span class="goods-video-time">时长：18:20</span>
         					</div>
         				</div>
         			</div>
         			<div class="look-item-cont col-xs-12">
         				<div class="look-assistant-pic col-xs-2">
         					<img	 src="image/look_look/BF5206C7-EA2E-43C6-A420-50B89D4C662B.png"/>
         				</div>
         				<div class="look-assistant-info col-xs-7 text-left">
         					<span class="assistant-name">丁雯雯</span>
         					<span class="store-name">百联中环城店</span>
         				</div>
         				<div class="look-assistant-other col-xs-3 text-right">
         					<span class="view-count">
         						<span class="iconfont icon-eye-open"></span>
         						<span>28次</span>
         					</span>
         					<span class="publish-time">今天19:20</span>
         				</div>
         			</div>
         		</div>-->

			</div>
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
		</section>
	</body>
	<script type="text/javascript" src="js/common/jquery-2.1.4.min.js"></script>
	<c:if test="${DEBUG}">
		<script type="text/javascript" src="js/common_js/vconsole.min.js"></script>
	</c:if>
	<!--<script type="text/javascript" src="js/common_js/mui.js"></script>-->
	<script type="text/javascript" src="js/common_js/my_tools.js"></script>
	<script type="text/javascript" src="js/look_look/look_index.js?ts=${ts}"></script>
	<script type="text/javascript">
	$(".refresh").on("click",function(){
		window.location.reload();
	})
	</script>
</html>
