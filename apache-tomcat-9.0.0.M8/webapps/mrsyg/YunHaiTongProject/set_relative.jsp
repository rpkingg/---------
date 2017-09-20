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
		<meta http-equiv="Cache-Control" content="no-cache" />
		<title>����</title>
		<link rel="stylesheet" href="css/common_css/initialization_style.css?ts=${ts}" />
		<link rel="stylesheet" href="css/common_css/public_style.css?ts=${ts}" />
		<link rel="stylesheet" href="css/set_relative.css?ts=${ts}" />
		<script type="text/javascript" src="js/common_js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="js/common_js/set_fontsize.js?ts=${ts}"></script>
	</head>

	<body class="background_color_FF">
		<div class="relative_logo_container">
			<div class="relative_logo_img_container">
				<img src="img/yunhaitong_logo@2x.png" srcset="img/yunhaitong_logo@2x.png 2x,img/yunhaitong_logo@3x.png 3x" />
			</div>
			<div class="relative_version">����ͨv1.0-DEV</div>
		</div>
		<div class="evaluate_brief_introduction">
			<div class="relative_evaluate" id="relative_evaluate">
				<div>ȥ����</div>
				<img src="img/rigth_btn_gray@2x.png" srcset="img/rigth_btn_gray@2x.png 2x,img/rigth_btn_gray@3x.png 3x" />
			</div>
			<div class="relative_brief_introdution" id="relative_brief_introdution">
				<div>����ͨ���</div>
				<img src="img/rigth_btn_gray@2x.png" srcset="img/rigth_btn_gray@2x.png 2x,img/rigth_btn_gray@3x.png 3x" />
			</div>

		</div>
	</body>
	<script type="text/javascript" src="js/common_js/change_fontsize.js?ts=${ts}"></script>
	<c:if test="${DEBUG}">
		<script type="text/javascript" src="js/common_js/vconsole.min.js"></script>
	</c:if>
	<script type="text/javascript" src="js/common_js/my_tools.js?ts=${ts}"></script>
	<script>
		(function($, document) {
			var bodyHeight = $("body").height();
			var htmlHeight = $("html").height();
			console.log("bodyHeight="+bodyHeight+"htmlHeight="+htmlHeight)

			//ȥ����
			$("#relative_evaluate").bind("click", function() {
				//�ж��ǰ�׿����IOS
				var ua = navigator.userAgent.toLowerCase();
				if(/iphone|ipad|ipod/.test(ua)) {
					//alert("iphone");
					location.href = "https://www.apple.com/cn/itunes/charts/"; 
				} else if(/android/.test(ua)) {
					//alert("android");
					location.href = "http://android.myapp.com"; 
				}
			});
			//�������ͨ���
			$("#relative_brief_introdution").bind("click", function(){
				location.href = "brif_introduction.jsp";
			});
			
			//���Դ���
			$(".relative_logo_container").bind("click",function(){
				native.callAliPay("111");
			});
	
		})(jQuery, document);
	</script>

</html>
