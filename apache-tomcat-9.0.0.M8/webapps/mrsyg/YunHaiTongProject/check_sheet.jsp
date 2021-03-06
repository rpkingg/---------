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
		<title>加关注查话费</title>
		<link rel="stylesheet" href="css/common_css/initialization_style.css" />
		<link rel="stylesheet" href="css/common_css/public_style.css" />
		<link rel="stylesheet" href="css/check_sheet.css" />
		<script type="text/javascript" src="js/common_js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="js/common_js/set_fontsize.js"></script>
	</head>

	<body>
		<div class="margin_top_six">
			<div class="background_color_FF" id="check_sheet_out_container">
				<!--<div class="check_sheet_container">
					<img class="check_sheet_adviser_pic" src="img/adviser_one@2x.png" srcset="img/adviser_one@2x.png 2x,img/adviser_one@3x.png 3x" />
					<div class="adviser_name_shop_container">
						<div class="adviser_name">李洋洋</div>
						<div class="adviser_shop_name">迪信通总店</div>
					</div>
					<div class="check_check">+&nbsp;聊聊</div>
				</div>
				<div class="check_sheet_container">
					<img class="check_sheet_adviser_pic" src="img/adviser_one@2x.png" srcset="img/adviser_one@2x.png 2x,img/adviser_one@3x.png 3x" />
					<div class="adviser_name_shop_container">
						<div class="adviser_name">丁凯</div>
						<div class="adviser_shop_name">百联中环店</div>
					</div>
					<div class="check_sheet">查话单</div>
				</div>-->
			</div>
		</div>
	</body>
	<script type="text/javascript" src="js/common_js/change_fontsize.js"></script>
	<script type="text/javascript" src="js/common_js/my_tools.js"></script>
	<script>
		(function($, document) {
			//接口路径
			var urlPath_one = "mrsyg/kqgoods/CheckSheet.form";
			var need_data={"customer_id":"155"};
			var data_one = myAjax(urlPath_one,need_data);
			if(data_one != undefined) {
				init(data_one);
			}

			function init(data) {
				$.each(data.userinfo, function(index, getData) {
					//营业员头像
					var customer_picture = getData.customer_picture;
					//营业员名称
					var customer_name = getData.customer_name;
					//营业员id
					var assistant_id = getData.assistant_id;
					//云信用户名
					var im_username = getData.im_username;
					//客户的accid
					var im_uuid = getData.im_uuid;
					//营业员所属店铺名称
					var shop_name = getData.shop_name;
					//是否关注(-1已关注,1未关注)
					var focus_flag = getData.focus_flag;
					var is_follow = "";
					if(focus_flag == "-1") {
						is_follow = '<div class="check_check">+&nbsp;聊聊</div>';
					} else if(focus_flag == "1") {
						is_follow = '<div class="check_sheet">查话单</div>';
					}
					var needString = '<div class="check_sheet_container">' +
						'<img class="check_sheet_adviser_pic" src="'+customer_picture+'"/>' +
						'<div class="adviser_name_shop_container">' +
						'<div class="adviser_name">'+customer_name+'</div>' +
						'<div class="adviser_shop_name">'+shop_name+'</div>' +
						'</div>' +is_follow+
						'</div>';
					$(needString).appendTo("#check_sheet_out_container");
				});
			}

		})(jQuery, document);
	</script>

</html>