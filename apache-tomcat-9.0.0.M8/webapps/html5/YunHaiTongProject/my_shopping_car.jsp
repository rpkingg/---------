<%@ page contentType="text/html;charset=GBK" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<meta http-equiv="Content-Type" content="text/html;charset=GBK" />
		<meta http-equiv="Cache-Control" content="no-cache">
		<meta content="yes" name="apple-mobile-web-app-capable" />
		<meta content="black" name="apple-mobile-web-app-status-bar-style" />
		<meta content="telephone=no" name="format-detection" />
		<meta http-equiv="Cache-Control" content="no-cache"/>
		<title>我的购物车</title>
		<link rel="stylesheet" href="css/common_css/initialization_style.css">
		<link rel="stylesheet" href="css/common_css/public_style.css" />
		<link rel="stylesheet" href="css/my_shopping_car.css" />
		<script type="text/javascript" src="js/common_js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="js/common_js/set_fontsize.js"></script>
	</head>

	<body>
		<div class="shopping_car_top_bar">
			<div class="title_content">我的购物车</div>
			<img class="title_back" src="img/back_btn@2x.png" srcset="img/back_btn@2x.png 2x,img/back_btn@3x.png 3x" />
		</div>
		<div class="shopping_car_order_conner">
			
			<!--<div class="order_box margin_top_six">
				<div class="order_info background_color_FF">
					<div class="shop_name_conter">
						<img class="shop_selected" id="1" src="img/un_selected@2x.png" />
						<span class="shop_name">中环百联店</span>
					</div>
					<div class="goods_out_contaniner" id="1">
						<div class="line"></div>
						<div class="good_box">
							<img class="good_selected" id="1" src="img/un_selected@2x.png" />
							<img class="product_piture" src="img/product_pic@2x.png" />
							<div class="row_one">
								<span>苹果iPhone 8pluse</span>
							</div>
							<div class="good_price">￥5788</div>
							<div class="edit-count">
								<span class="less">-</span>
								<span class="count">1</span>
								<span class="plus">+</span>
							</div>
							<img class="order_trash" src="img/trash@2x.png" />
						</div>
					</div>
				</div>
			</div>-->
			
		</div>
		<div class="shopping_car_footer">
			<img class="selected_all" id="1" src="img/un_selected@2x.png" />
			<p class="selected_all_content">全选</p>
			<p class="need_pay">需支付：<span class="font_color_red">￥0.00</span></p>
			<div class="btn-commit">结算</div>
		</div>
		
		<!-- 支付弹窗 -->
		<div id="pay-order" class="notice-pay">
			<div class="shadow"></div>
			<div class="chose-pay">
				<div class="chose-pay-text"><span>选择付款方式</span></div>
				<div class="chose-pay-div">
					<img src="img/cencle_pay.png" class="chose-pay-img" />
				</div>
			</div>
			<div class="pay-content">
				<div class="pay-wechat  pay-center">
					<p class="pay-money">金额<span class="pay-wechat-span">￥1700</span> 请在30分钟内完成支付</p>
				</div>
				<div class="pay-wechat pay-way-chose" id="1">
					<img src="img/wechat.png" class="brand">
					<span>微信支付</span>
					<img src="img/choose.png" class="chose">
					<img src="img/choose_no.png" class="chose-pay-no">
				</div>
				<div class="pay-wechat pay-way-chose" id="2">
					<img src="img/alipay.png" class="brand">
					<span>支付宝支付</span>
					<img src="img/choose.png" class="chose chose-pay-yes">
					<img src="img/choose_no.png" class="chose-pay-no">
				</div>
				<div class="blank"></div>
			</div>
			<div class="sure-pay">确定支付</div>
		</div>
		
		<!--支付宝支付表单-->
		<form style="display: none;" name="alipayment" id="payFrom" action="http://120.76.190.223:8988/mrsyg/module/alipaym/alipayapi.jsp" method="post">
			<input name="WIDout_trade_no" id="WIDout_trade_no" value=""/>
			<input name="WIDsubject" id="WIDsubject" value=""/>
			<input name="WIDtotal_fee" id="WIDtotal_fee" value=""/>
			<input name="WIDshow_url" id="WIDshow_url" value=""/>
			<input name="WIDbody" id="WIDbody" value=""/>
		</form>
	</body>
	<script type="text/javascript" src="js/common_js/change_fontsize.js"></script>
	<script type="text/javascript" src="js/common_js/my_tools.js"></script>
	<script type="text/javascript" src="js/my_shopping_car.js"></script>
</html>