<%@ page contentType="text/html;charset=GBK" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0, user-scalable=no" />
		<meta http-equiv="Content-Type" content="text/html;charset=GBK" />
		<meta content="yes" name="apple-mobile-web-app-capable" />
		<meta content="black" name="apple-mobile-web-app-status-bar-style" />
		<meta content="telephone=no" name="format-detection" />
		<meta http-equiv="Cache-Control" content="no-cache" />
		<title>立即下单:充话费</title>
		<link rel="stylesheet" href="css/common_css/initialization_style.css" />
		<link rel="stylesheet" href="css/common_css/public_style.css" />
		<link rel="stylesheet" href="css/pay_phone_bill.css">
		<script type="text/javascript" src="js/common_js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="js/common_js/set_fontsize.js"></script>
	</head>

	<body>
		<div class="search_container">
			<div class="search_box">
				<div>
					<div>
						<span class="pay_phone_title">你将为此号码充值:</span>
						<span class="pay_phone_num"></span>
					</div>
				</div>
			</div>
		</div>
		<div class="line_interval"></div>
		<div class="product_container">
			<div class="car_container">
				<div class="goods_item">
					<div class="bottom_box">
						<div class="inquiry_header_div">
							<img src="img/pay_bill.png" class="pay_phone_img" />
						</div>
						<div class="pay_phone_text">充话费</div>
						<div class="pay_phone_money"></div>
						<div class="line line_top"></div>
						<div class="good">
							<div class="good_info">
								<div class="row1">
									<div class="good_name">商品总价</div>
									<div class="goods_total"></div>
								</div>
								<div class="row2">
									<div class="pay_phone_way">商品抵用券:</div>
									<div class="goods_voucher">不可用</div>
								</div>
							</div>
						</div>
						<div class="payment_required">
							<div class="pay_phone_way payment_text">需付款:</div>
							<div class="payment_money"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="footer_pay">
			<div class="payment_required">
				<div class="footer_pay_text" style="">需支付:</div>
				<div class="footer_pay_money">￥<span class="total-money"><span></div>
				<div class="footer_pay_now">立即支付</div>
			</div>
		</div>

		<!-- 待付款页面支付弹窗 -->
		<div id="pay-order" class="notice-pay">
			<div class="shadow"></div>
			<div class="chose-pay">
				<span>选择付款方式</span>
				</div>
				<div class="pay-content">
					<div class="pay-wechat pay-way pay-center">
						<p>金额<span class="pay-wechat-span"></span> 请在30分钟内完成支付</p>
					</div>
					<!--
                    	当微信支付功能开发后删除此处样式和默认勾选图片样式
                    -->
					<div class="pay-wechat pay-way" style="background-color: #DDDDDD;">
						<img src="img/wechat.png" class="brand">
						<span id="wechat_pay">微信支付</span>
						<img src="img/choose.png" class="chose chose-pay-yes">
						<img src="img/choose_no.png" class="chose-pay-no">
					</div>
					<div class="pay-wechat pay-way">
						<img src="img/alipay.png" class="brand">
						<span id="ali_pay">支付宝支付</span>
						<img src="img/choose.png" class="chose chose-pay-yes1" style="display: block;">
						<img src="img/choose_no.png" class="chose-pay-no">
					</div>
					<div class="blank"></div>
				</div>
				<div class="cancel-pay">确定支付</div>
			</div>

	</body>
	<script type="text/javascript" src="js/common_js/change_fontsize.js"></script>
	<script type="text/javascript" src="js/common_js/vconsole.min.js"></script>
	<script type="text/javascript" src="js/common_js/my_tools.js"></script>
	<script type="text/javascript" src="js/pay_phone_bill.js"></script>

</html>
