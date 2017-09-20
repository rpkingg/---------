<%@ page contentType="text/html;charset=GBK" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<meta http-equiv="Content-Type" content="text/html;charset=GBK" />
		<meta content="yes" name="apple-mobile-web-app-capable" />
		<meta content="black" name="apple-mobile-web-app-status-bar-style" />
		<meta content="telephone=no" name="format-detection" />
		<meta http-equiv="Cache-Control" content="no-cache" />
		<title>充话费</title>
		<link rel="stylesheet" href="css/common_css/initialization_style.css" />
		<link rel="stylesheet" href="css/common_css/public_style.css" />
		<link rel="stylesheet" href="css/pay_phone_bill_flow.css" />
		<script type="text/javascript" src="js/common_js/vconsole.min.js"></script>
		<script type="text/javascript" src="js/common_js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="js/common_js/set_fontsize.js"></script>
	</head>

	<body class="background_color_FF">
		<div class="phone_input_container">
			<input class="phone_input_container_num" placeholder="请输入手机号" required="required" maxlength="13" onpropertychange="setPhoneNum(this)" oninput="setPhoneNum(this)" />
			<div class="phone_input_container_content">当前充值手机号</div>
		</div>
		<div id="bill_container">
			<div class="first_line_container">
				<a class="phone_bill_item"></a>
				<a class="phone_bill_item phone_bill_item_left"></a>
				<a class="phone_bill_item phone_bill_item_left"></a>
			</div>
			<div class="second_line_container">
				<a class="phone_bill_item"></a>
				<a class="phone_bill_item phone_bill_item_left"></a>
				<a class="phone_bill_item phone_bill_item_left"></a>
			</div>
		</div>

		<div class="phone_bill_need_pay">
			需付款：<span class="phone_bill_need_pay_num">￥<span class="amount"></span></span>
		</div>
		<div class="pay_bill_btn">
			充值
		</div>
	</body>
	<script type="text/javascript" src="js/common_js/change_fontsize.js"></script>
	<script type="text/javascript" src="js/common_js/my_tools.js"></script>
	<script type="text/javascript" src="js/pay_the_phone_bill.js"></script>

</html>
