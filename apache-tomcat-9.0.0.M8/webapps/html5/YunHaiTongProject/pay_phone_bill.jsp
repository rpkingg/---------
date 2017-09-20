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
						<span class="pay_phone_num">139 6503 9258</span>
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
						<div class="pay_phone_money">￥100</div>
						<div class="line line_top"></div>
						<div class="good">
							<div class="good_info">
								<div class="row1">
									<div class="good_name">商品总价</div>
									<div class="goods_total">￥100</div>
								</div>
								<div class="row2">
									<div class="pay_phone_way">商品抵用券:</div>
									<div class="goods_voucher">不可用</div>
								</div>
							</div>
						</div>
						<div class="payment_required">
							<div class="pay_phone_way payment_text">需付款:</div>
							<div class="payment_money">￥100</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="footer_pay">
			<div class="payment_required">
				<div class="footer_pay_text" style="">需支付:</div>
				<div class="footer_pay_money">￥<span class="total-money">100<span></div>
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
						<p>金额<span class="pay-wechat-span">￥1700</span> 请在30分钟内完成支付</p>
					</div>
					<div class="pay-wechat pay-way">
						<img src="img/wechat.png" class="brand">
						<span id="wechat_pay">微信支付</span>
						<img src="img/choose.png" class="chose chose-pay-yes" style="display: block;">
						<img src="img/choose_no.png" class="chose-pay-no">
					</div>
					<div class="pay-wechat pay-way">
						<img src="img/alipay.png" class="brand">
						<span id="ali_pay">支付宝支付</span>
						<img src="img/choose.png" class="chose chose-pay-yes1">
						<img src="img/choose_no.png" class="chose-pay-no">
					</div>
					<div class="blank"></div>
				</div>
				<div class="cancel-pay">确定支付</div>
			</div>

	</body>
	<script type="text/javascript" src="js/common_js/change_fontsize.js"></script>
	<script type="text/javascript" src="js/common_js/my_tools.js"></script>
	<script type="text/javascript">
		//上个页面的数据
		var params = new queryString();
		var mobileNum = params["mobileNum"];
		var amount = params["amount"];
		var feeId = params["feeId"];
		//支付渠道：支付宝或微信
		var payWay = "wechat_pay";
		var aliPay = "ali_pay";
		var weChat = "wechat_pay";
		//获得本地存储的对象
		var localStorageObj = window.localStorage;
		//订单编号
		var order_no = "";
		//点击付款弹窗
		$('.footer_pay_now').on('click', function() {
			//下单接口
			//http://120.76.190.223:8988/mrsyg/kqgoods/RechargeOrder.form?phone=13333333333&parameter_id=1&type=1
			var urlPath_one = "mrsyg/kqgoods/RechargeOrder.form";
			var need_data = {
				"phone": mobileNum,
				"parameter_id": feeId,
				"type": 0
			};

			var data_one = myAjax(urlPath_one, need_data);
			if(data_one != undefined) {
				order_no = data_one.order_no;
				var total = $(".total-money").text();
				$(".pay-wechat-span").text("￥" + total);
				$('#pay-order').show();
			} else {
				alert("下单失败！");
			}
		});

		//点击确定付款关闭弹窗
		$('.cancel-pay').on('click', function() {
			$('#pay-order').hide();
			//order_pay_way：支付宝=0，微信=1
			if(payWay == aliPay) {
				localStorageObj.setItem("order_num", order_no);
				localStorageObj.setItem("order_pay_way", "0");
				//order_pay_type类型:0话费充值1流量充值2商品消费
				localStorageObj.setItem("order_pay_type","0");
				

				var data = '<div class="iframe_container" id="iframe_alipayment">' +
					'<iframe id="iframe_alipayment_id" src="alipayment.html" width="100%" height="100%" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>' +
					'</div>';
				$(data).appendTo("body");
				$("#iframe_alipayment").show();
			} else if(payWay == weChat) {

			}
		});
		$(".pay_phone_num").text(setTelNum(mobileNum));
		$(".pay_phone_money,.goods_total,.payment_money").text("￥" + amount);
		$(".total-money").text(amount);
		//电话格式
		function setTelNum(value) {
			value = value.replace(/\s*/g, "");
			var result = [];
			for(var i = 0; i < value.length; i++) {
				if(i == 3 || i == 7) {
					result.push(" " + value.charAt(i));
				} else {
					result.push(value.charAt(i));
				}
			}
			return value = result.join("");
		}
		//支付点击显示勾选状态
		$(".pay-way").on("click", function() {
			payWay = $(this).find("span").attr("id");
			$(this).find(".chose").show();
			$(this).siblings().find(".chose").hide();
		});
	</script>

</html>