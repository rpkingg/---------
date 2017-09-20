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
		<title>订单详情</title>
		<link rel="stylesheet" href="css/common_css/initialization_style.css" />
		<link rel="stylesheet" href="css/common_css/public_style.css" />
		<link rel="stylesheet" href="css/my_order_details.css" />
		<script type="text/javascript" src="js/common_js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="js/common_js/set_fontsize.js"></script>
	</head>

	<body>
		<div>
			<div class="title_content">订单详情</div>
			<img class="title_back" src="img/back_btn@2x.png" srcset="img/back_btn@2x.png 2x,img/back_btn@3x.png 3x" />
		</div>
		<!--待付款-->
		<div class="payment_and_shipments_bg display_none" id="payment">
			<img class="payment_and_shipments_img" src="img/pending_payment@2x.png" srcset="img/pending_payment@2x.png 2x,img/pending_payment@3x.png 3x" />
			<div class="payment_and_shipments_content">等待付款<span>(剩余27：12：19关闭订单)</span></div>
		</div>
		<!--待发货-->
		<div class="payment_and_shipments_bg display_none" id="shipment">
			<img class="payment_and_shipments_img" src="img/pending_shipment@2x.png" srcset="img/pending_shipment@2x.png 2x,img/pending_shipment@3x.png 3x" />
			<div class="payment_and_shipments_content">已付款，待发货</div>
		</div>
		<!--待收货-->
		<div class="received_bg display_none" id="received">
			<img class="payment_and_shipments_img" src="img/pending_received@2x.png" srcset="img/pending_received@2x.png 2x,img/pending_received@3x.png 3x" />
			<div class="received_content_container">
				<div class="received_content_container_title">已发货</div>
				<div class="logistics_information">物流信息：<span>由中环百联配送</span></div>
				<div class="delivery_clerk">配送员：<span>王静</span><span class="delivery_clerk_phone">13755555555</span></div>
			</div>
			<img class="logistics_information_btn" src="img/right_btn_white@2x.png" srcset="img/right_btn_white@2x.png 2x,img/right_btn_white@3x.png 3x" />
		</div>
		<!--待评价-->
		<div class="payment_and_shipments_bg display_none" id="evaluate">
			<img class="evaluate_img" src="img/pending_evaluate@2x.png" srcset="img/pending_evaluate@2x.png 2x,img/pending_evaluate@3x.png 3x" />
			<div class="payment_and_shipments_content">交易成功</div>
		</div>
		<div class="margin_top_six">
			<div class="background_color_FF">
				<div class="received_message_container">
					<img class="received_message_container_img" src="img/receiver_address@2x.png" srcset="" />
					<div class="received_message_container_name">张三（139556672345）</div>
				</div>
				<div class="received_message_container_address">
					上海市 普陀区 金沙江路绿洲中环中心6号楼1678室
				</div>
			</div>
		</div>
		<div class="margin_top_six">
			<div class="background_color_FF">
				<div class="shop_container">
					<div class="shop_container_name"><span id="shop_name">百联中环店</span><span class="shop_container_name_span" id="pay_type">在线付款</span></div>
				</div>
				<div class="line"></div>
				<div id="product_out_container">
					<!--<div class="product_container">
						<img class="product_container_img" src="" srcset="" />
						<div class="product_container_content">
							<div class="product_container_name">苹果 iPhone 7</div>
							<div class="product_container_des">红色 32G 移动版 套餐一</div>
						</div>
						<div class="product_container_price">￥5688</div>
						<div class="product_container_num">×1</div>
					</div>
					<div class="line"></div>-->
				</div>
				<div class="product_sum_money">商品总价：<span id="product_sum_money_span">￥5688</span></div>
				<div class="product_freight">商品运费：<span>￥0.00</span></div>
				<!--其它用-->
				<div class="voucher_container_other display_none">商品优惠券：<span class="voucher_span">-￥10</span></div>
				<!--待付款用-->
				<div class="product_voucher_container display_none">商品优惠券：
					<span class="voucher_price voucher_span">-￥10</span>
					<img src="img/rigth_btn_gray@2x.png" srcset="img/rigth_btn_gray@2x.png 2x,img/rigth_btn_gray@3x.png 3x" />
				</div>
				<div class="need_pay_all">
					<span id="need_pay_all_content">需付款</span>：<span class="need_pay_all_money">￥5688</span>
				</div>
			</div>
		</div>
		<div class="margin_top_six order_information">
			<div class="background_color_FF order_information_container">
				<div class="order_number">订单编号：<span id="order_serialNumber_span"></span></div>
				<div class="transaction_number">交易编号：<span id="transaction_number_span"></span></div>
				<div class="creation_time">创建时间：<span id="creation_time_span"></span></div>
			</div>
		</div>
		<div class="background_color_FF order_detail_bottom_container">
			<img class="bottom_container_img" src="img/contact_merchant@2x.png" srcset="img/contact_merchant@2x.png 2x,img/contact_merchant@3x.png 3x" />
			<div class="bottom_container_contact_merchant">联系商家</div>
			<a class="bottom_container_cancle_order">取消订单</a>
			<a class="bottom_container_pay">付款</a>
		</div>
	</body>
	<script type="text/javascript" src="js/common_js/change_fontsize.js"></script>
	<script type="text/javascript" src="js/common_js/my_tools.js"></script>
	<script>
		(function($, document) {
			//获得本地存储的对象
			var localStorageObj = window.localStorage;

			//接口路径（待付款）
			var urlPath_orderDetail = "mrsyg/kquser/OrderDetail.form";
			var need_data_orderDetail = {
				"order_no": localStorageObj.getItem("my_order_id")
			}
			var data_orderDetail = myAjax(urlPath_orderDetail, need_data_orderDetail);
			if(data_orderDetail != undefined) {
				init(data_orderDetail);
			}

			function init(data) {
				//订单状态(1未付款2待发货3待收货4待评价)
				var order_status = data.order_status;
				//收货人姓名
				var receiver_name = data.receiver_name;
				//收货人电话
				var receiver_phone = data.receiver_phone;
				$(".received_message_container_name").text(receiver_name + "(" + receiver_phone + ")");
				//收货人地址
				var receiver_area = data.receiver_area;
				$(".received_message_container_address").text(receiver_area);
				//店铺名称
				var shop_name = data.shop_name;
				$("#shop_name").text(shop_name);
				//店铺id
				var shop_id = data.shop_id;
				//付款方式--0在线支付1货到付款
				var pay_way = data.pay_way;
				if(pay_way == "0") {
					pay_way = "在线支付";
				} else if(pay_way == "1") {
					pay_way = "货到付款";
				}
				//订单编号
				var order_no = data.order_no;
				$("#order_serialNumber_span").text(order_no);
				//交易编号
				var serial_no = data.serial_no;
				$("#transaction_number_span").text(serial_no);
				//创建时间
				var created_at = data.created_at;
				$("#creation_time_span").text(created_at);
				//优惠券金额
				var coupon_amount = data.coupon_amount;
				coupon_amount = parseFloat(coupon_amount);
				if(coupon_amount > 0) {
					$(".voucher_span").text("-￥" + coupon_amount);
				} else {
					$(".voucher_span").text("无");
					coupon_amount = 0;
				}
				//商品总价
				var pay_amount = data.pay_amount;
				$("#product_sum_money_span").text("￥" + pay_amount);
				$(".need_pay_all_money").text("￥" + (pay_amount - coupon_amount));
				//店铺电话
				var shop_mobile = data.shop_mobile;
				//商品信息
				$.each(data.goodsinfo, function(index, getData) {
					//商品名称
					var product_name = getData.product_name;
					//商品id
					var product_id = getData.product_id;
					//商品颜色
					var color = getData.color;
					//商品容量
					var memory_capacity = getData.memory_capacity;
					//供应商名字
					var supplier_name = getData.supplier_name;
					//套餐名字
					var contract_name = getData.contract_name;
					//商品价格
					var product_price = getData.product_price;
					//商品数量
					var product_number = getData.product_number;
					//商品图片（2x）
					var picture_url2x = getData.picture_url2x;
					//商品图片（3x）
					var picture_url3x = getData.picture_url3x;
					var html = '<div class="product_container">' +
						'<img class="product_container_img" src="' + picture_url2x + '" srcset="' + picture_url2x + ' 2x,' + picture_url3x + ' 3x" />' +
						'<div class="product_container_content">' +
						'<div class="product_container_name">' + product_name + '</div>' +
						'<div class="product_container_des">' + color + ' ' + memory_capacity + ' ' + supplier_name + ' ' + contract_name + '</div>' +
						'</div>' +
						'<div class="product_container_price">￥' + product_price + '</div>' +
						'<div class="product_container_num">×' + product_number + '</div>' +
						'</div>' +
						'<div class="line"></div>';
					$(html).appendTo("#product_out_container");
				});

				switch(order_status) {
					case "1":
						show_payment();
						break;
					case "2":
						show_shipments();
						break;
					case "3":
						show_received();
						break;
					case "4":
						show_evaluate();
						break;
					default:
						break;
				}
			}

			//待支付
			function show_payment() {
				$("#payment").show();
				$(".product_voucher_container").show();
			}
			//待发货
			function show_shipments() {
				$("#shipment").show();
				$(".voucher_container_other").show();
				$("#need_pay_all_content").text("已付款");
				$(".bottom_container_pay").text("提醒发货");
				$(".bottom_container_pay").css("color", "#777777");
				$(".bottom_container_pay").css("border-color", "#DDDDDD");
			}
			//待收货
			function show_received() {
				$("#received").show();
				$(".voucher_container_other").show();
				$("#need_pay_all_content").text("已付款");
				$(".bottom_container_cancle_order").text("查看物流");
				$(".bottom_container_pay").text("确认订单");
				$(".bottom_container_pay").css("color", "#777777");
				$(".bottom_container_pay").css("border-color", "#DDDDDD");
			}
			//待评价
			function show_evaluate() {
				$("#evaluate").show();
				$(".voucher_container_other").show();
				$("#need_pay_all_content").text("已付款");
				$(".bottom_container_cancle_order").text("删除订单");
				$(".bottom_container_pay").text("评价");
			}

		})(jQuery, document);
	</script>

</html>