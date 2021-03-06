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
		<title>物流信息</title>
		<link rel="stylesheet" href="css/common_css/initialization_style.css" />
		<link rel="stylesheet" href="css/common_css/public_style.css" />
		<link rel="stylesheet" href="css/express-infor.css" />
		<script type="text/javascript" src="js/common_js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="js/common_js/set_fontsize.js"></script>
	</head>

	<body>
		<header class="charge-title">
			物流信息
			<a class="title-back"></a>
		</header>
		<div class="expressor-wrapper">
			<img src="img/expressor@2x.png" />
			<div class="expressor-infor">
				<p><span>配送店铺：</span><em id="shop_name"></em></p>
				<p><span>配送员：</span><em id="delivery_name"></em><b id="phone_num"></b></p>
			</div>
		</div>
		<div class="express-track">
			<h5>订单跟踪</h5>
			<div id="delivery_container">
				<!--<div class="end-track">
					<p class="track-mes">【合肥市】已签收，签收人：他人收 丰巢</p>
					<p class="track-time">2017-06-22 12:20:14</p>
				</div>
				<div class="sending-track">
					<p class="track-sending-mes">迪信通手机配送站 潜山路站 揽投站已接收投递员已在派件中有问题请联系派件员（投递员姓名：许骏容；联系电话：
						<span>18758978785</span></p>
					<p class="track-time">2017-06-22 12:20:14</p>
				</div>
				<div class="normal-track">
					<p class="track-mes">商品出库</p>
					<p class="track-time">2017-06-22 12:20:14</p>
				</div>
				<div class="normal-track">
					<p class="track-mes">订单分配给中环百联店</p>
					<p class="track-time">2017-06-22 12:20:14</p>
				</div>
				<div class="first-track">
					<p class="track-mes">订单提交成功</p>
					<p class="track-time">2017-06-22 12:20:14</p>
				</div>-->
			</div>
		</div>
	</body>
	<script type="text/javascript" src="js/common_js/change_fontsize.js"></script>
	<script type="text/javascript" src="js/common_js/my_tools.js"></script>
	<script>
		(function($, document) {
			//获得本地存储的对象
			var localStorageObj = window.localStorage;

			//接口路径
			var urlPath_orderLogistics = "mrsyg/kquser/OrderLogistics.form";
			var need_data_orderLogistics = {
				"order_no": localStorageObj.getItem(my_order_id)
			}
			var data_orderLogistics = myAjax(urlPath_orderLogistics, need_data_orderLogistics);
			if(data_orderLogistics != undefined) {
				init(data_orderLogistics);
			}

			function init(datas) {
				//配送店铺
				var delivery_shop = datas.delivery_shop;
				$("#shop_name").text(delivery_shop);
				//配送员名称
				var delivery_name = datas.delivery_name;
				$("#delivery_name").text(delivery_name);
				//配送员电话
				var delivery_phone = datas.delivery_phone;
				$("#phone_num").text(delivery_phone);

				var logisticsString = "";
				$.each(datas.data, function(index, getdata) {
					//物流描述
					var logistics_desc = getdata.logistics_desc;
					//物流时间
					var created_at = getdata.created_at;
					//物流状态:1.提交订单 2.分配店铺 3.商品发货 4.配送信息 5.确认签收
					var logistics_status = getdata.logistics_status;
					switch(logistics_status) {
						case "1":
							logisticsString = '<div class="first-track">' +
								'<p class="track-mes">' + logistics_desc + '</p>' +
								'<p class="track-time">' + created_at + '</p>' +
								'</div>' + logisticsString;
							break;
						case "2":
							logisticsString = '<div class="normal-track">' +
								'<p class="track-mes">' + logistics_desc + '</p>' +
								'<p class="track-time">' + created_at + '</p>' +
								'</div>' + logisticsString;
							break;
						case "3":
							logisticsString = '<div class="normal-track">' +
								'<p class="track-mes">' + logistics_desc + '</p>' +
								'<p class="track-time">' + created_at + '</p>' +
								'</div>' + logisticsString;
							break;
						case "4":
							logisticsString = '<div class="sending-track">' +
								'<p class="track-sending-mes">' + logistics_desc + '（投递员姓名：' + delivery_name + '；联系电话：' +
								'<span>' + delivery_phone + '</span></p>' +
								'<p class="track-time">' + created_at + '</p>' +
								'</div>' + logisticsString;
							break;
						case "5":
							logisticsString = '<div class="end-track">' +
								'<p class="track-mes">' + logistics_desc + '</p>' +
								'<p class="track-time">' + created_at + '</p>' +
								'</div>' + logisticsString;
							break;
						default:
							break;
					}
				});
				$(logisticsString).appendTo("#delivery_container");
			}

		})(jQuery, document)
	</script>

</html>