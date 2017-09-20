<%@ page contentType="text/html;charset=GBK" language="java" %>
<!DOCTYPE html>
<html lang="en">

	<head>
		<meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<meta http-equiv="Content-Type" content="text/html;charset=GBK" />
		<meta content="yes" name="apple-mobile-web-app-capable" />
		<meta content="black" name="apple-mobile-web-app-status-bar-style" />
		<meta content="telephone=no" name="format-detection" />
		<meta http-equiv="Cache-Control" content="no-cache"/>
		<title>我的订单</title>
		<link rel="stylesheet" href="css/common_css/initialization_style.css" />
		<link rel="stylesheet" href="css/common_css/public_style.css" />
		<link rel="stylesheet" href="css/my-order.css">
		<script type="text/javascript" src="js/common_js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="js/common_js/set_fontsize.js"></script>
		<script type="text/javascript" src="js/common_js/vconsole.min.js"></script>
		<script type="text/javascript">
			function callByNativeWithParams(msg){
				/*var msg = JSON.parse(msg);*/
				var msg = msg;
				if(msg =="panel1"){
					$("#all").removeClass("selected");
					$("#waitting_pay").addClass("selected");
					$("#all_num_counts").hide();
					$("#payment_num_counts").show();
					$("#panel1").hide();
					$("#panel2").show();
				}
				else if(msg =="panel2"){
					$("#all").removeClass("selected");
					$("#waitting_goods").addClass("selected");
					$("#all_num_counts").hide();
					$("#shipment_num_counts").show();
					$("#panel1").hide();
					$("#panel3").show();
				}
				else if(msg =="panel3"){
					$("#all").removeClass("selected");
					$("#waitting_get").addClass("selected");
					$("#all_num_counts").hide();
					$("#pending_num_counts").show();
					$("#panel1").hide();
					$("#panel4").show();
				}
				else if(msg =="panel4"){
					$("#all").removeClass("selected");
					$("#waitting_discuss").addClass("selected");
					$("#all_num_counts").hide();
					$("#evaluation_num_counts").show();
					$("#panel1").hide();
					$("#panel5").show();
				}
				else if(msg =="panel5"){
					$("#all").removeClass("selected");
					$("#waitting_pay").addClass("selected");
					$("#all_num_counts").hide();
					$("#evaluation_num_counts").show();
				}
				return;
			}
		</script>
	</head>

	<body class="body-sty">
		<!--<div class="order-header">
			<div class="order-header-title">我的订单</div>
			<div class="order-header-left-container">
				<div class="order-header-left-return-container">
					<div class="order-header-left-return-arrow-container">
						<div class="common-table">
							<div class="common-table-cell-middle-center">
								<img src="img/back_btn@2x.png" srcset="img/back_btn@2x.png, back_btn@3x.png" alt="" class="order_header_img">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>-->
		<!--顶部通用导航栏-->
		<div class="tab-box">
			<div class="tab-list">
				<div class="tab-item">
					<div class="tab selected" id="all">
						<span>全部</span>
						<div class="count-point" id="all_num_counts">0</div>
					</div>
				</div>
				<div class="tab-item">
					<div class="tab" id="waitting_pay">
						<span>待付款</span>
						<div class="count-point" id="payment_num_counts">0</div>
					</div>
				</div>
				<div class="tab-item">
					<div class="tab" id="waitting_goods">
						<span>待发货</span>
						<div class="count-point" id="shipment_num_counts">0</div>
					</div>
				</div>
				<div class="tab-item">
					<div class="tab" id="waitting_get">
						<span>待收货</span>
						<div class="count-point" id="pending_num_counts">0</div>
					</div>
				</div>
				<div class="tab-item">
					<div class="tab" id="waitting_discuss">
						<span>待评价</span>
						<div class="count-point" id="evaluation_num_counts">0</div>
					</div>
				</div>
			</div>
		</div>

		<!--1 全部-->
		<div id="panel1" class="car-container">
			<!--<div class="order_container">
				<div class="goods-item">
					<div class="shop_name_container">
						<span class="shop_name">百联中环店</span>
					</div>
				</div>
				<div class="goods-item">
					<div class="bottom-box">
						<div class="line"></div>
						<div class="good">
							<div class="good-photo">
								<img src="img/product_pic@2x.png" />
							</div>
							<div class="good-info">
								<div class="row1">
									<div class="good-name">魅蓝 魅蓝X</div>
									<div class="good-price">￥350</div>
								</div>
								<div class="row2">
									<div class="good-color">银色 32G 移动版 套餐一</div>
									<div class="good-count">x1</div>
								</div>
							</div>
						</div>
					</div>
					<div class="line_all"></div>
					<div class="bottom-info-box add-h">
						<div class="order-fee-div">￥5688<span class="order-fee-span">（含运费：￥10）</span></div>
						<span class="order-count-span">合计：</span>
						<span class="order-count-span2">共计2件</span>
					</div>
					<div class="bottom-info-box add-h">
						<span class="order-close">订单已关闭</span>
						<div class="add-css order-again">再来一单</div>
					</div>
				</div>
			</div>-->
		</div>

		<!--2 待付款页-->
		<div id="panel2" class="car-container paddBotm order-panel">
			<!--<div class="order_container">
				<div class="goods-item">
					<div class="shop_name_container">
						<span class="shop_name">百联中环店</span>
						<span class="order_pay_online">在线付款</span>
					</div>
				</div>
				<div class="goods-item">
					<div class="bottom-box">
						<div class="line"></div>
						<div class="good">
							<div class="good-photo">
								<img src="img/product_pic@2x.png" />
							</div>
							<div class="good-info">
								<div class="row1">
									<div class="good-name">魅蓝 魅蓝X</div>
									<div class="good-price">￥350</div>
								</div>
								<div class="row2">
									<div class="good-color">银色 32G 移动版 套餐一</div>
									<div class="good-count">x1</div>
								</div>
							</div>
						</div>
					</div>
					<div class="line_all"></div>
					<div class="bottom-info-box add-h">
						<div class="order-fee-div">￥5688<span class="order-fee-span">（含运费：￥10）</span></div>
						<span class="order-count-span">合计：</span>
						<span class="order-count-span2">共计2件</span>
					</div>
					<div class="bottom-info-box add-h">
						<div class="btn-close add-css order-again">付款</div>
						<div class="add-css order-cencle">取消订单</div>
					</div>
				</div>
			</div>-->
		</div>

		<!--3 待发货页-->
		<div id="panel3" class="car-container paddBotm order-panel">
			<!--<div class="order_container">
				<div class="goods-item">
					<div class="shop_name_container">
						<span class="shop_name">百联中环店</span>
						<span class="order_pay_online">在线付款</span>
					</div>
					<div class="line"></div>
				</div>

				<div class="goods-item">

					<div class="bottom-box">
						<div class="good">
							<div class="good-photo">
								<img src="img/product_pic@2x.png" />
							</div>
							<div class="good-info">
								<div class="row1">
									<div class="good-name">苹果 iPhone 7</div>
									<div class="good-price">￥350</div>
								</div>
								<div class="row2">
									<div class="good-color">红色 32G 移动版 套餐一</div>
									<div class="good-count">x1</div>
								</div>
							</div>
						</div>
						<div class="line"></div>
						<div class="good">
							<div class="good-photo">
								<img src="img/product_pic@2x.png" />
							</div>
							<div class="good-info">
								<div class="row1">
									<div class="good-name">魅蓝 魅蓝X</div>
									<div class="good-price">￥350</div>
								</div>
								<div class="row2">
									<div class="good-color">银色 32G 移动版 套餐一</div>
									<div class="good-count">x1</div>
								</div>
							</div>
						</div>
					</div>
					<div class="line_all"></div>
					<div class="bottom-info-box add-h">
						<div class="order-fee-div">￥5688<span class="order-fee-span">（含运费：￥10）</span></div>
						<span class="order-count-span">合计：</span>
						<span class="order-count-span2">共计2件</span>
					</div>
					<div class="bottom-info-box add-h">
						<div class="add-css order-deliver-goods">提醒发货</div>
					</div>
				</div>
			</div>-->
		</div>

		<!--4 待收货页-->
		<div id="panel4" class="car-container paddBotm order-panel">
			<!--<div class="order_container">
				<div class="goods-item">
					<div class="shop_name_container">
						<span class="shop_name">百联中环店</span>
						<span class="order_pay_online">在线付款</span>
					</div>
					<div class="line"></div>
				</div>

				<div class="goods-item">

					<div class="bottom-box">
						<div class="good">
							<div class="good-photo">
								<img src="img/product_pic@2x.png" />
							</div>
							<div class="good-info">
								<div class="row1">
									<div class="good-name">苹果 iPhone 7</div>
									<div class="good-price">￥350</div>
								</div>
								<div class="row2">
									<div class="good-color">红色 32G 移动版 套餐一</div>
									<div class="good-count">x1</div>
								</div>
							</div>
						</div>
						<div class="line"></div>
						<div class="good">
							<div class="good-photo">
								<img src="img/product_pic@2x.png" />
							</div>
							<div class="good-info">
								<div class="row1">
									<div class="good-name">魅蓝 魅蓝X</div>
									<div class="good-price">￥350</div>
								</div>
								<div class="row2">
									<div class="good-color">银色 32G 移动版 套餐一</div>
									<div class="good-count">x1</div>
								</div>
							</div>
						</div>
					</div>
					<div class="line_all"></div>
					<div class="bottom-info-box add-h">
						<div class="order-fee-div">￥5688<span class="order-fee-span">（含运费：￥10）</span></div>
						<span class="order-count-span">合计：</span>
						<span class="order-count-span2">共计2件</span>
					</div>
					<div class="bottom-info-box add-h">
						<div class="add-css order-deliver-goods">收货并付款</div>
						<div class="add-css order-cencle">查看物流</div>
					</div>
				</div>
			</div>-->
		</div>

		<!--5 待评价页-->
		<div id="panel5" class="car-container paddBotm order-panel">
			<!--<div class="order_container">
				<div class="goods-item">
					<div class="shop_name_container">
						<span class="shop_name">百联中环店</span>
						<span class="order_pay_online">货到付款</span>
					</div>
					<div class="line"></div>
				</div>

				<div class="goods-item">
					<div class="bottom-box">
						<div class="good">
							<div class="good-photo">
								<img src="img/product_pic@2x.png" />
							</div>
							<div class="good-info">
								<div class="row1">
									<div class="good-name">苹果 iPhone 7</div>
									<div class="good-price">￥350</div>
								</div>
								<div class="row2">
									<div class="good-color">红色 32G 移动版 套餐一</div>
									<div class="good-count">x1</div>
								</div>
							</div>
						</div>
						<div class="line"></div>
						<div class="good">
							<div class="good-photo">
								<img src="img/product_pic@2x.png" />
							</div>
							<div class="good-info">
								<div class="row1">
									<div class="good-name">魅蓝 魅蓝X</div>
									<div class="good-price">￥350</div>
								</div>
								<div class="row2">
									<div class="good-color">银色 32G 移动版 套餐一</div>
									<div class="good-count">x1</div>
								</div>
							</div>
						</div>
					</div>
					<div class="line_all"></div>
					<div class="bottom-info-box add-h">
						<div class="order-fee-div">￥5688<span class="order-fee-span">（含运费：￥10）</span></div>
						<span class="order-count-span">合计：</span>
						<span class="order-count-span2">共计2件</span>
					</div>
					<div class="bottom-info-box add-h">
						<div class="add-css order-again disscuss">评价</div>
						<div class="add-css order-cencle deleteAlert">删除订单</div>
					</div>
				</div>
			</div>-->
		</div>

		<!-- 支付弹窗 -->
		<div id="pay-order" class="notice-pay">
			<div class="shadow"></div>
			<div class="chose-pay">
				<div class="chose-pay-text"><span>选择付款方式</span></div>
				<div class="chose-pay-div">
					<img src="img/cencle_pay.png" class="chose-pay-img" />
				</div>
			</div>
			<div class="pay-content">
				<div class="pay-wechat  pay-center">
					<p class="pay-money">金额<span class="pay-wechat-span">￥1700</span> 请在30分钟内完成支付</p>
				</div>
				<div class="pay-wechat pay-way-chose intro" id="wechat">
					<img src="img/wechat.png" class="brand">
						<span>微信支付</span>
					<img src="img/choose.png" class="chose chose-pay-yes" style="display: block;">
					<img src="img/choose_no.png" class="chose-pay-no">
				</div>
				<div class="pay-wechat pay-way-chose" id="alipay">
					<img src="img/alipay.png" class="brand">
						<span>支付宝支付</span>
					<img src="img/choose.png" class="chose chose-pay-yes1">
					<img src="img/choose_no.png" class="chose-pay-no">
				</div>
				<div class="blank"></div>
			</div>
			<div class="sure-pay">确定支付</div>
		</div>

		<!-- 删除订单弹窗 -->
		<div class="delete-order" style="display: none;">
			<div class="shadow"></div>
			<div class="content">
				<div class="inner-box">
					<div class="sureDelete">确定删除订单？</div>
					<div class="ture-false">
						<span class="ofcourse">确定</span>
						<span class="ture-cancel">取消</span>
					</div>
				</div>
			</div>
		</div>

		<!-- 待发货页面退款订单弹窗 -->
		<div class="return-money">
			<div class="shadow"></div>
			<div class="content">
				<div class="inner-box">
					<div class="sureDelete">是否确认退款，确认退款后请到 客服中心查询售后？
					</div>
					<div class="ture-false">
						<span class="ofcourse changeColor">取消</span>
						<span class="sure-cancel">确定</span>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript" src="js/common_js/change_fontsize.js"></script>
		<script type="text/javascript" src="js/common_js/my_tools.js"></script>
		<script type="text/javascript">
			(function($, document) {
				var localStorageObj = window.localStorage;
				$(".tab").on("click", function(e) {
					var tabIndex = $(this).parent().index();
					$(".tab-list .tab-item").each(function() {
						if($(this).index() == tabIndex) {
							$(this).children().addClass("selected");
							$(this).find('.count-point').show();
						} else {
							$(this).children().removeClass("selected");
							$(this).find('.count-point').hide();
						}
					});

					switch(tabIndex) {
						case 0:
							showHidePanel(tabIndex + 1);
							break;
						case 1:
							showHidePanel(tabIndex + 1);
							break;
						case 2:
							showHidePanel(tabIndex + 1);
							break;
						case 3:
							showHidePanel(tabIndex + 1);
							break;
						case 4:
							showHidePanel(tabIndex + 1);
							break;
						case 5:
							showHidePanel(tabIndex + 1);
							break;
						default:
							break;
					}
				});

				function showHidePanel(index) {
					$("#panel" + index).show().siblings(".car-container").hide();
				}
				//获得本地存储的对象
				var localStorageObj = window.localStorage;
				//接口路径(全部订单)
				var urlPath_one = "mrsyg/kquser/MyOrder.form";
				var need_data_all = {};
				var data_one = myAjax(urlPath_one, need_data_all);
				if(data_one != undefined) {
					init(data_one, "panel1", "all_num_counts");
				}
				//接口路径（待付款）
				//mrsyg/kquser/MyOrder.form?order_status=1
				var urlPath_payment = "mrsyg/kquser/MyOrder.form";
				var need_data_payment = {
					"order_status": "1"
				}
				var data_payment = myAjax(urlPath_payment, need_data_payment);
				if(data_payment != undefined) {
					init(data_payment, "panel2", "payment_num_counts");
				}
				//接口路径（待发货）
				var urlPath_shipment = "mrsyg/kquser/MyOrder.form";
				var need_data_shipment = {
					"order_status": "2"
				}
				var data_shipment = myAjax(urlPath_shipment, need_data_shipment);
				if(data_shipment != undefined) {
					init(data_shipment, "panel3", "shipment_num_counts");
				}
				//接口路径（待收货）
				var urlPath_pending = "mrsyg/kquser/MyOrder.form";
				var need_data_pending = {
					"order_status": "3"
				}
				var data_pending = myAjax(urlPath_pending, need_data_pending);
				if(data_pending != undefined) {
					init(data_pending, "panel4", "pending_num_counts");
				}
				//接口路径（待评价）
				var urlPath_evaluation = "mrsyg/kquser/MyOrder.form";
				var need_data_evaluation = {
					"order_status": "4"
				}
				var data_evaluation = myAjax(urlPath_evaluation, need_data_evaluation);
				if(data_evaluation != undefined) {
					init(data_evaluation, "panel5", "evaluation_num_counts");
				}

				function init(datas, note_id, orderNum_id) {
					//订单数量
					if(datas.orderinfo){
						var orderNum = datas.orderinfo.length;
						$("#" + orderNum_id).text(orderNum);
					}
					$.each(datas.orderinfo, function(index, getdata) {
						//店铺名称
						var shop_name = getdata.shop_name;
						//店铺id
						var shop_id = getdata.shop_id;
						//订单编号
						var order_no = getdata.order_no;
						//付款方式(0在线支付1货到付款)
						var pay_way = getdata.pay_way;
						var payWay = "";
						if(pay_way == 1) {
							payWay = "货到付款";
						} else if(pay_way == 0) {
							payWay = "在线支付";
						}
						//配送方式:0到店自提1送货上门
						var delivery_way = getdata.delivery_way;
						//订单状态（1未付款2待发货3待收货4待评价5订单完成）
						var order_status = getdata.order_status;

						var productString = ""; //商品信息
						var productNums = 0; //每个订单下商品的总数
						var pay_amount = 0; //每个订单下商品的总金额
						$.each(getdata.goodsinfo, function(index, getData) {
							//商品图片
							var picture_url = getData.picture_url;
							//商品名称
							var product_name = getData.product_name;
							//商品id
							var product_id = getData.product_id;
							//商品价格
							var product_price = getData.product_price;
							//商品数量
							var product_number = getData.product_number;
							productNums = productNums + parseInt(product_number);
							pay_amount = pay_amount + parseInt(product_number) * parseFloat(product_price);
							//商品颜色
							var color = getData.color;
							//商品容量
							var memory_capacity = getData.memory_capacity;
							//运营商名称
							var supplier_name = getData.supplier_desc;
							//套餐名称
							var contract_name = getData.contract_name;
							productString = productString + '<div class="line" data-product-id = "'+product_id+'"></div>' +
								'<div class="good">' +
								'<div class="good-photo">' +
								'<img class="good-url" src="' + picture_url + '">' +
								'</div>' +
								'<div class="good-info">' +
								'<div class="row1">' +
								'<div class="good-name">' + product_name + '</div>' +
								'<div class="good-price">￥' + product_price + '</div>' +
								'</div>' +
								'<div class="row2">' +
								'<div class="good-color">' + color + ' ' + memory_capacity + ' ' + supplier_name + ' ' + contract_name + '</div>' +
								'<div class="good-count">x' + product_number + '</div>' +
								'</div>' +
								'</div>' +
								'</div>';
						});
						var bottom_string = "";
						switch(order_status) {
							case "1":
								bottom_string = '<div class="bottom-info-box add-h">' +
									'<div class="btn-close add-css order-again pay_order_btn">付款</div>' +
									'<div class="add-css order-cencle cancle_order_btn">取消订单</div>' +
									'</div>';
								break;
							case "2":
								bottom_string = '<div class="bottom-info-box add-h">' +
									'<div class="add-css order-deliver-goods remark_order_btn">提醒发货</div>' +
									'</div>';
								break;
							case "3":
								if(pay_way == 1) {
									bottom_string = '<div class="bottom-info-box add-h">' +
										'<div class="add-css order-deliver-goods pay_and_pending_order_btn">收货并付款</div>' +
										'<div class="add-css order-cencle check_logistics_btn" id="' + delivery_way + '">查看物流</div>' +
										'</div>';
								} else if(pay_way == 0) {
									bottom_string = '<div class="bottom-info-box add-h">' +
										'<div class="add-css order-deliver-goods sure_order_btn">确认收货</div>' +
										'<div class="add-css order-cencle check_logistics_btn" id="' + delivery_way + '">查看物流</div>' +
										'</div>';
								}

								break;
							case "4":
								bottom_string = '<div class="bottom-info-box add-h">' +
									'<div class="add-css order-again evaluation_order_btn">评价</div>' +
									'<div class="add-css order-cencle deleteAlert delete_order_btn">删除订单</div>' +
									'</div>';
								break;
							case "5":
								bottom_string = '<div class="bottom-info-box add-h">' +
									'<span class="order-close">订单已关闭</span>' +
									'<div class="add-css order-again again_order_btn">再来一单</div>' +
									'</div>';
								break;
							default:
								break;
						}

						var needString = '<div class="order_container" id="' + order_no + '">' +
							'<div class="goods-item">' +
							'<div class="shop_name_container">' +
							'<span class="shop_name">' + shop_name + '</span>' +
							'<span class="order_pay_online">' + payWay + '</span>' +
							'</div>' +
							'</div>' +
							'<div class="goods-item">' +
							'<div class="bottom-box">' + productString + '</div>' +
							'<div class="line_all"></div>' +
							'<div class="bottom-info-box add-h">' +
							'<div class="order-fee-div">￥' + pay_amount.toFixed(2) + '<span class="order-fee-span">（含运费：￥0.00）</span></div>' +
							'<span class="order-count-span">合计：</span>' +
							'<span class="order-count-span2">共计' + productNums + '件</span>' +
							'</div>' + bottom_string +
							'</div>' +
							'</div>';
						switch(note_id) {
							case "panel1":
								$(needString).appendTo("#" + note_id);
								break;
							case "panel2":
								$(needString).appendTo("#" + note_id);
								break;
							case "panel3":
								$(needString).appendTo("#" + note_id);
								break;
							case "panel4":
								$(needString).appendTo("#" + note_id);
								break;
							case "panel5":
								$(needString).appendTo("#" + note_id);
								break;
							default:
								break;
						}

					});
				}

				//取消订单
				$(".car-container").on("click", ".cancle_order_btn", function() {
					//订单编号
					var orderNum = $(this).parents(".order_container").attr("id");
					alert("取消订单orderNum=" + orderNum);
					//接口路径
					var urlPath_cancelOrder = "mrsyg/kquser/OrderCancel.form";
					var need_data_cancelOrder = {
						"order_no": orderNum
					}
					var data_cancelOrder = myAjax(urlPath_cancelOrder, need_data_cancelOrder);
					if(data_cancelOrder != undefined) {
						alert("取消订单成功");
					}
					var counts = parseInt($("#payment_num_counts").text());
					var counts = counts-1;
					$("#payment_num_counts").text(counts)
					$(this).parents(".order_container").remove();
				});
				//付款
				var pay_orderNum = "";
				$(".car-container").on("click", ".pay_order_btn", function() {
					//订单编号
					pay_orderNum = $(this).parents(".order_container").attr("id");
					//支付金额
					var needPay = $(this).parent().siblings(".bottom-info-box").find(".order-fee-div").text();
					$(".pay-wechat-span").text(needPay);
					alert("付款orderNum=" + pay_orderNum);
					$("#pay-order").show();
				});
				//提醒发货
				$(".car-container").on("click", ".remark_order_btn", function() {
					//订单编号
					var orderNum = $(this).parents(".order_container").attr("id");
					alert("提醒发货orderNum=" + orderNum);
				});
				//查看物流
				$(".car-container").on("click", ".check_logistics_btn", function() {
					//配送方式:0到店自提1送货上门
					var deliveryWay = $(this).attr("id");
					if(deliveryWay == "1") {
						//订单编号
						var orderNum = $(this).parents(".order_container").attr("id");
						alert("查看物流");
						localStorageObj.setItem("my_order_id", orderNum);
						native.openWebView("express-infor.jsp");
					} else {
						alert("您选择的配送方式为到店自提，没有物流信息");
					}
				});
				//收货并付款
				$(".car-container").on("click", ".pay_and_pending_order_btn", function() {
					//订单编号
					var orderNum = $(this).parents(".order_container").attr("id");
					//支付金额
					var needPay = $(this).parent().siblings(".bottom-info-box").find(".order-fee-div").text();
					$(".pay-wechat-span").text(needPay);
					alert("收货并付款orderNum=" + orderNum);
					$("#pay-order").show();
				});
				//确认收货
				$(".car-container").on("click", ".sure_order_btn", function() {
					//订单编号
					var orderNum = $(this).parents(".order_container").attr("id");
					alert("确认收货orderNum=" + orderNum);
					var urlPath_takenOrder = "mrsyg/kquser/OrderTaken.form";
					var need_data_takenOrder = {
						"order_no": orderNum
					}
					var data_takenOrder = myAjax(urlPath_takenOrder, need_data_takenOrder);
					if(data_takenOrder != undefined) {
						alert("确认收货成功");
					}
					var counts = parseInt($("#pending_num_counts").text());
					var counts = counts-1;
					$("#pending_num_counts").text(counts)
					$(this).parents(".order_container").remove();
				});
				//删除订单
				$(".car-container").on("click", ".delete_order_btn", function() {
					//订单编号
					var $_this = $(this);
					var orderNum = $(this).parents(".order_container").attr("id");
					alert("删除订单orderNum=" + orderNum);
					//$(".delete-order").show();
					var urlPath_deleteOrder = "mrsyg/kquser/OrderDelete.form";
					var need_data_deleteOrder = {
						"order_no": orderNum
					}
					var data_deleteOrder = myAjax(urlPath_deleteOrder, need_data_deleteOrder);
					if(data_deleteOrder != undefined) {
						$_this.parents(".order_container").empty();
						alert("删除订单成功");
					}
					var counts = parseInt($("#evaluation_num_counts").text());
					var counts = counts-1;
					$("#evaluation_num_counts").text(counts)
					$(this).parents(".order_container").remove();
				});
				//评价
				$(".car-container").on("click", ".evaluation_order_btn", function() {
					//订单编号data-product-id
					var product_id = $(".line").attr("data-product-id")
					var orderNum = $(this).parents(".order_container").attr("id");
					var title = $(".good-name").text();
					var text = $(".good-color").text();
					var imageUrl = $(".good-url").attr("src");
					var order_no = $(".order_container").attr("id")
					var Persion ={
						title:title,
						text:text,
						imageUrl:imageUrl,
						order_no:order_no,
						product_id:product_id
					}
					native.openCommentView(JSON.stringify(Persion));
				});
				//再来一单
				$(".car-container").on("click", ".again_order_btn", function() {
					//订单编号
					var orderNum = $(this).parents(".order_container").attr("id");
					alert("再来一单orderNum=" + orderNum);
				});
				//订单详情
				$(".car-container").on("click", ".bottom-box", function() {
					//订单编号
					var orderNum = $(this).parents(".order_container").attr("id");
					localStorageObj.setItem("my_order_id", orderNum);
					native.openWebView ("my_order_details.jsp");
				});

				//点击确定付款关闭弹窗
				$(".cancel-pay").on("click", function() {
					$("#pay-order").hide();
				});

				//点击关闭取消订单弹窗
				$(".close img").on("click", function() {
					$("#close-order-panel").hide();
				});

				//待评价页面删除订单弹框，点击取消，隐藏弹框
				$(".ture-cancel").on("click", function() {
					$(".delete-order").hide();
				});

				//支付点击显示勾选状态
				$("#wechat").on("click",function(){
					$(this).find(".chose-pay-yes").show();
					$(".chose-pay-yes1").hide();
					$("#wechat").addClass("intro");
					$("#alipay").removeClass("intro");
				})

				$("#alipay").on("click",function(){
					$(this).find(".chose-pay-yes1").show();
					$(".chose-pay-yes").hide();
					$("#alipay").addClass("intro");
					$("#wechat").removeClass("intro");
				})
				/*$(".pay-way-chose").on("click", function() {
					$(this).find(".chose").show();
					$(this).siblings().find(".chose").hide();
				});*/

				//点击X关闭支付弹窗
				$(".chose-pay-img").on("click", function() {
					$("#pay-order").hide();
				});

				//点击确定支付
				$(".sure-pay").on("click",function(){
					if($("#alipay").hasClass("intro")){
						localStorageObj.setItem("order_num", pay_orderNum);
						//order_pay_way付款方式:0支付宝1微信
						localStorageObj.setItem("order_pay_way", "0");
						//order_pay_type类型:0话费充值1流量充值2商品消费
						localStorageObj.setItem("order_pay_type","2");
						//微信支付
						var data = '<div class="iframe_container" id="iframe_alipayment">' +
						'<iframe id="iframe_alipayment_id" src="alipayment.jsp" width="100%" height="100%" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>' +
						'</div>';
						$(data).appendTo("body");
						$("#iframe_alipayment").show();
						$(".notice-pay").hide();
					}
					else{
					alert("微信支付尚未开通")
					}
				})
			})(jQuery, document);
		</script>
	</body>

</html>