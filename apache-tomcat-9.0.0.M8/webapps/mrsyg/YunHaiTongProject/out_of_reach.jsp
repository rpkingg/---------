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
		<title>���ڷ�����</title>
		<link rel="stylesheet" href="css/common_css/initialization_style.css"/>
		<link rel="stylesheet" href="css/common_css/public_style.css"/>
		<link rel="stylesheet" href="css/out_of_reach.css"/>
		<script type="text/javascript" src="js/common_js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="js/common_js/set_fontsize.js"></script>
	</head>
	<body>
		<div>
			<div class="title_content">���ڷ�����</div>
			<img class="title_back" src="img/back_btn@2x.png" srcset="img/back_btn@2x.png 2x,img/back_btn@3x.png 3x" />
		</div>
		<div class="out_of_reach_container">
			<img src="img/out_of_reach_icon@2x.png" srcset="img/out_of_reach_icon@2x.png 2x,img/out_of_reach_icon@3x.png 3x"/>
			<div class="out_of_reach_area">��ǰλ�ò��ڷ��������ڣ���������<span>�㽭ʡ</span>��Χ��ַ</div>
			<div class="set_delivery_address">�����ջ���ַ</div>
		</div>
	</body>
	<script type="text/javascript" src="js/common_js/change_fontsize.js"></script>
	<script type="text/javascript" src="js/common_js/my_tools.js"></script>
	<script>
		(function($,document){
			//��ת�������ջ���ַҳ��
			$(".set_delivery_address").bind('click',function(){
				window.location.href="select_delivery_address.html";
			});
			
		})(jQuery,document);
	</script>
</html>