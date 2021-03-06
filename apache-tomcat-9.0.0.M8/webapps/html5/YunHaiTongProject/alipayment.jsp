<%@ page contentType="text/html;charset=GBK" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<meta http-equiv="Content-Type" content="text/html;charset=GBK" />
		<meta content="yes" name="apple-mobile-web-app-capable" />
		<meta content="black" name="apple-mobile-web-app-status-bar-style" />
		<meta content="telephone=no" name="format-detection" />
		<meta http-equiv="Cache-Control" content="no-cache"/>
		<title>支付跳转</title>
		<link rel="stylesheet" href="css/common_css/initialization_style.css" />
		<link rel="stylesheet" href="css/common_css/public_style.css" />
		<script type="text/javascript" src="js/common_js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="js/common_js/set_fontsize.js"></script>
	</head>

	<body>
		<!--支付宝支付表单-->
		<form style="display: none;" name="alipayment" id="payFrom" action="/mrsyg/kquser/PayOrder.form" method="post">
			<input name="order_no" id="order_no" value="" />
			<input name="pay_way" id="pay_way" value="" />
			<input name="type" id="type" value="" />
		</form>
	</body>
	<script>
		(function($, document) {
			//获得本地存储的对象
			var localStorageObj = window.localStorage;
			
			submitData();
			function submitData() {
				$("#order_no").val(localStorageObj.getItem("order_num"));
				$("#pay_way").val(localStorageObj.getItem("order_pay_way"));
				$("#type").val(localStorageObj.getItem("order_pay_type"));
				$("#payFrom").submit();
			}
			
		})(jQuery, document);
	</script>

</html>