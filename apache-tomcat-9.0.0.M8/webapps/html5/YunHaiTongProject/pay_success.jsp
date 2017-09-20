<%@ page contentType="text/html;charset=GBK" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<meta http-equiv="Content-Type" content="text/html;charset=GBK"/>
		<meta content="yes" name="apple-mobile-web-app-capable"/>
		<meta content="black" name="apple-mobile-web-app-status-bar-style"/>
		<meta content="telephone=no" name="format-detection"/>
		<meta http-equiv="Cache-Control" content="no-cache"/>
		<title>支付成功</title>
		<link rel="stylesheet" href="css/common_css/initialization_style.css"/>
		<link rel="stylesheet" href="css/common_css/public_style.css"/>
		<script type="text/javascript" src="js/common_js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="js/common_js/set_fontsize.js"></script>
	</head>
	<body>
		<div>
			<div class="title_content">支付成功</div>
			<img class="title_back" src="img/back_btn@2x.png" srcset="img/back_btn@2x.png 2x,img/back_btn@3x.png 3x" />
		</div>
		<div  style="color: ;font-size: 1rem;text-align: center;padding-top: 5rem;">支付成功</div>
		<div id="complete"  style="color: green;font-size: 1rem;text-align: center;padding-top: 0.5rem;">完成</div>
	</body>
	<script type="text/javascript" src="js/common_js/change_fontsize.js"></script>
	<script type="text/javascript" src="js/common_js/my_tools.js"></script>
	<script>
		(function($,document){
			jsFunc('json字符串');
			$("#complete").bind("click",function(){
				//跳转到我的订单
				window.location.href="my_order.html";
			});
		})(jQuery,document);
	</script>
</html>