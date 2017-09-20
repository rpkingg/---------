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
		<meta http-equiv="Cache-Control" content="no-cache"/>
		<title>找潮货-首页</title>
		<link rel="stylesheet" href="css/common_css/initialization_style.css" />
		<link rel="stylesheet" href="css/common_css/public_style.css" />
		<link rel="stylesheet" href="css/common_css/swiper.min.css" />
		<link rel="stylesheet" href="css/stroll_find_goods.css?ts=${ts}" />
		<!--<link rel="stylesheet" href="css/common_css/mui01.css">-->
	</head>
	<body>
		<div id="pullrefresh" class="mui-content mui-scroll-wrapper">
			<div class="mui-scroll">
				<div class="swiper-container">
					<div class="swiper-wrapper stroll_banner_img">
						<!--<div class="swiper-slide stroll_banner">
							<img class="stroll_banner_img" src="img/shop_pic@2x.png" srcset="img/shop_pic@2x.png 2x,img/shop_pic@3x.png 3x" />
						</div>
						<div class="swiper-slide stroll_banner">
							<img class="stroll_banner_img" src="img/shop_pic@2x.png" srcset="img/shop_pic@2x.png 2x,img/shop_pic@3x.png 3x" />
						</div>
						<div class="swiper-slide stroll_banner">
							<img class="stroll_banner_img" src="img/shop_pic@2x.png" srcset="img/shop_pic@2x.png 2x,img/shop_pic@3x.png 3x" />
						</div>-->
					</div>
					<!--分页器-->
					<div class="swiper-pagination"></div>
				</div>
				<ul id="search_shop_container_id" class="mui-table-view mui-table-view-chevron">
					<div class="margin_top_six" id="stroll_product_lists">
						<!--<div class="stroll_product_list background_color_FF">
							<img class="stroll_product_pic" src="" />
							<div class="stroll_product_introduce">
								<div class="stroll_product_name">苹果iPhone 7</div>
								<div class="stroll_product_introduce_p two_line_font">果粉必备红色特别版 中国移动电信联通全网通 最低价</div>
								<div class="stroll_customer_note">
									<img class="stroll_product_note_pic" src="img/note_icon@2x.png" />
									<p class="stroll_product_note_num">用户笔记24篇</p>
								</div>
								<a class="stroll_product_buy_btn">选购</a>
							</div>
						</div>-->
					</div>
				</ul>
			</div>
		</div>
		<!--</div>-->
			<div class="line_interval"></div>
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
	<script type="text/javascript" src="js/common_js/jquery-2.1.4.min.js"></script>
	<!--<script type="text/javascript" src="js/common_js/mui.js"></script>-->
	<script type="text/javascript" src="js/common_js/change_fontsize.js"></script>
	<script type="text/javascript" src="js/common_js/my_tools.js?ts=${ts}"></script>
	<script type="text/javascript" src="js/common_js/swiper.min.js"></script>
	<script type="text/javascript" src="js/stroll_find_goods.js?ts=${ts}"></script>
	<script type="text/javascript">
		$(".refresh").on("click",function(){
			window.location.reload();
		})
	</script>
</html>
