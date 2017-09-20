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
		<title>邀请注册</title>
		<link rel="stylesheet" href="css/common_css/initialization_style.css"/>
		<link rel="stylesheet" href="css/common_css/public_style.css"/>
		<link rel="stylesheet" href="css/my_invite_registration.css"/>
		<script type="text/javascript" src="js/common_js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="js/common_js/set_fontsize.js"></script>
	</head>
	<body class="background_color_FF">
		<div>
			<div class="title_content">邀请注册</div>
			<img class="title_back" src="img/back_btn@2x.png" srcset="img/back_btn@2x.png 2x,img/back_btn@3x.png 3x" />
		</div>
		<div class="invite_adviser">
			<img class="invite_adviser_img" src="img/adviser_two@2x.png"/>
		</div>
		<div class="invite_adviser_name">丁雯雯</div>
		<div class="customer_invite_qr_container">
			<img class="invite_qr_container_img" src="img/qr_code@2x.png" srcset="img/qr_code@2x.png 2x,img/qr_code@3x.png 3x"/>
		</div>
	</body>
	<script type="text/javascript" src="js/common_js/change_fontsize.js"></script>
	<script type="text/javascript" src="js/common_js/my_tools.js"></script>
	<script>
		(function($,ddocument){
			//接口路径（邀请注册--初始化页面）
			//http://120.76.190.223:8988/mrsyg/kquser/UserInfo.form
			var urlPath_one = "mrsyg/kquser/UserInfo.form";
			var need_data = {};
			var data_one = myAjax(urlPath_one, need_data);
			if(data_one != undefined) {
				init(data_one);
			}
			
			function init(data){
				//是否是营业员(1营业员 0普通用户)
				var customer_type=data.customer_type;
				//用户头像
				var customer_picture=data.customer_picture;
				$(".invite_adviser_img").attr("src",customer_picture);
				//用户id
				var customer_id=data.customer_id;
				$(".invite_adviser_name").attr("id",customer_id);
				//用户名称
				var customer_name=data.customer_name;
				$(".invite_adviser_name").text(customer_name);
				//用户二维码图片
				var qr_code=data.qr_code;
				var qr_code2x=getDifferencePic(qr_code,"2x_");
				var qr_code3x=getDifferencePic(qr_code,"3x_");
				console.log("qr_code2x="+qr_code2x);
				console.log("qr_code3x="+qr_code3x);
				$(".invite_qr_container_img").attr("src",qr_code2x);
				$(".invite_qr_container_img").attr("srcset",qr_code2x+" 2x,"+qr_code3x+" 3x");
			}
		})(jQuery,document)
	</script>
</html>