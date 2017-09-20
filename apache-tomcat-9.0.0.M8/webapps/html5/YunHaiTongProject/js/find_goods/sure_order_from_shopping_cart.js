(function($, doc) {
	$.init();
	$.ready(function() {
		//付款方式
		var payModePicker = new $.PopPicker({
			layer: 1
		});
		payModePicker.setData(payModeData);

		document.getElementById('payModecontainer').addEventListener('tap', function(event) {
			document.activeElement.blur();
			payModePicker.show(function(items) {
				var payModeDom = (items[0] || {}).text + " ";
				doc.getElementById('payModeText').innerHTML = payModeDom;
			});
		}, false);
		//配送方式
		var distributionModePicker = new $.PopPicker({
			layer: 1
		});
		distributionModePicker.setData(distributionModeData);

		document.getElementById('distributionModeInfo').addEventListener('tap', function(event) {
			document.activeElement.blur();
			distributionModePicker.show(function(items) {
				var distributionModeDom = (items[0] || {}).text + " ";
				doc.getElementById('distributionModeText').innerHTML = distributionModeDom;
			});
		}, false);

	});
})(mui, document);

//获得本地存储的对象
var localStorageObj = window.localStorage;
var order_no = ""; //订单编号
var order_name = "goods"; //订单名称
var order_price = "0.1"; //订单价格
var order_show_page = "http://120.76.190.223:8988/html5/YunHaiTongProject/pay_success.html"; //展示页面的链接

//接口路径（确认订单--初始化页面）
//mrsyg/kqgoods/SubmitCart.form?cart_ids=1
var urlPath_one = "mrsyg/kqgoods/SubmitCart.form";
var need_data = {
	"cart_ids": localStorageObj.getItem("shopping_cart_ids")
};
alert("cart_ids="+localStorageObj.getItem("shopping_cart_ids"));
var data_one = myAjax(urlPath_one, need_data);
if(data_one != undefined) {
	init(data_one);
}

//获取收货地址id(默认定位的收货地址id为空)
var address_id_from_other = localStorage.getItem("receiver_address_id");
if(address_id_from_other.length > 0) {
	//显示收货地址
	$(".has-default-address").show();
} else {
	//显示选择收货地址
	$(".no-default-address").show();
}

//选择收货地址事件
$('.get-goods-address').click(function(e) {
	//显示收货地址页面
	$("#iframe_select_address").show();
});
//当选择收货地址的子页面关闭时，当前页面设置选择的收货地址的信息
$($("#iframe_select_address_id")[0].contentWindow).on("setReceiverAddress", function() {
	//设置收货地址id
	//设置收货人名称
	$("#receiver_name_id").text(localStorageObj.getItem("receiver_name"));
	//设置收货人电话
	$("#receiver_phone_id").text(localStorageObj.getItem("receiver_phone"));
	//设置收货地址
	$("#receiver_address_id").text(localStorageObj.getItem("selected_address"));
	//隐藏选择收货地址
	$(".no-default-address").hide();
	//显示收货地址
	$(".has-default-address").show();
});

//配送门店 选择事件
$('.distribution-store').click(function(e) {
	//显示选择店铺页面
	$("#iframe_select_store").show();
});
//当选择配送门店的子页面关闭时，当前页面设置选择的店铺信息
$($("#iframe_select_store_id")[0].contentWindow).on("setShopInfo", function() {
	//设置店铺id
	$(".distribution-store-base").attr("id", localStorageObj.getItem("shop_id"));
	//设置店铺名称
	$("#shop_grade_score_container").empty();
	$("#shop_name_id").text(localStorageObj.getItem("shop_name"));
	//设置店铺等级
	var shop_grade = parseFloat(localStorageObj.getItem("shop_grade"));
	var redStards = "";
	var grayStards = "";
	var shopGrade = '<span class="store-score-text">' + shop_grade + '</span>';
	for(var i = 0; i < shop_grade; i++) {
		redStards = redStards + '<span class="iconfont icon-g score"></span>';
	}
	for(var i = 0; i < 5 - shop_grade; i++) {
		grayStards = grayStards + '<span class="iconfont icon-g"></span>';
	}
	$(redStards + grayStards + shopGrade).appendTo("#shop_grade_score_container");
	//设置店铺地址
	$("#shop_address_id").text(localStorageObj.getItem("shop_address"));
});

//选择商品抵用券事件
$('.goods-voucher').click(function(e) {
	//显示选择优惠券页面
	$("#iframe_select_vouchers").show();
});
//当选择优惠券的子页面关闭时，当前页面设置选择的优惠券
$($("#iframe_select_vouchers_id")[0].contentWindow).on("setServeAmount", function() {
	//设置优惠券金额
	$("#voucher-sum").text("-￥" + localStorageObj.getItem("coupon_amount"));
	//设置--小计--金额
	var sub_total = parseFloat(localStorageObj.getItem("product_sum_prices")) - parseFloat(localStorageObj.getItem("coupon_amount"));
	$("#sub_total").text("￥" + sub_total);
	//设置--需支付--金额
	$("#need_pay").text("￥" + sub_total);
	//设置--支付弹窗--金额
	$("#pop_up_money").text("￥" + sub_total);
});

//立即支付事件，弹出选择支付方式界面
$('.pay-now').click(function(e) {
	//用于判断是否选择了收货地址（不为空）
	var isSelectedReceiverAddress = localStorageObj.getItem("receiver_address_id");
	if(isSelectedReceiverAddress.length > 0) {
		//获得付款方式(0在线支付1货到付款)
		var pay_way = $("#payModeText").text().trim();
		if(pay_way == "货到付款") {
			pay_way = 1;
		} else if(pay_way == "在线支付") {
			pay_way = 0;
		}
		//获得配送方式(0到店自提1送货上门)
		var delivery_way = $("#distributionModeText").text();
		if(delivery_way == "到店自提") {
			delivery_way = 0;
		} else if(delivery_way == "送货上门") {
			delivery_way = 1;
		}
		//生成订单
		//接口路径（生成订单）
		//mrsyg/kqgoods/BuildOrder.form?product_detail_id=1&contract_id=1&product_number=1&address_id=162&pay_way=0&delivery_way=0&shop_id=25&coupon_id=
		var urlPath_builderOrder = "mrsyg/kqgoods/GenerateOrder.form";
		var need_builderOrder = {
			"cart_ids":localStorageObj.getItem("shopping_cart_ids"),
			"address_id": localStorageObj.getItem("receiver_address_id"),
			"pay_way": pay_way,
			"delivery_way": delivery_way,
			"shop_id": localStorageObj.getItem("shop_id"),
			"coupon_id": localStorageObj.getItem("coupon_id")
		};

		var data_builderOrder = myAjax(urlPath_builderOrder, need_builderOrder);
		if(data_builderOrder != undefined) {
			//获得返回的订单编号
			order_no = data_builderOrder.order_no;
			if(pay_way == 0) {
				//弹出支付方式选择框
				$('.backdrop').show();
				$('.select-pay-tool-container').show();
				$("body").on("touchmove", function(event) {
					event.preventDefault;
				}, false);
			} else {
				//跳转到我的订单页面
				window.location.href = "my_order.html";
			}
		}
	} else {
		alert("请选择收货地址");
	}
});

//取消立即支付
$('.backdrop,.icon-guanbi').click(function(e) {
	$('.select-pay-tool-container').hide();
	$('.backdrop').hide();
	$("body").off("touchmove");
});

//支付宝和微信支付的切换
var payWay = "";
$('.pay-tool-item').click(function() {
	payWay = $(this).find(".pay-tool-name").attr("id");
	if($(this).find('.iconfont').hasClass('icon-quan')) {
		$(this).find('.iconfont').removeClass('icon-quan');
		$(this).find('.iconfont').addClass('icon-xuanzedui');
		$(this).siblings('div').find('.iconfont').removeClass('icon-xuanzedui');
		$(this).siblings('div').find('.iconfont').addClass('icon-quan');
	}
});

//确认支付
$('.sure-pay-opt-nar').click(function(e) {
	if(payWay == "1") {
		//支付宝支付
		alert("支付宝");
		$("#WIDout_trade_no").val(order_no);
		$("#WIDsubject").val(order_name);
		$("#WIDtotal_fee").val(order_price);
		$("#WIDshow_url").val(order_show_page);
		$("#WIDbody").val(order_no);
		$("#payFrom").submit();
	} else if(payWay == "2") {
		//微信支付
		$("#iframe_alipayment").show();
		alert("微信");
	}

});

function init(data) {
	//收货地址
	var address_id = data.address_id;
	alert("address_id=" + address_id);
	localStorageObj.setItem("receiver_address_id", address_id);
	//收货人姓名
	var receiver_name = data.receiver_name;
	alert("receiver_name=" + receiver_name);
	$("#receiver_name_id").text(receiver_name);
	//收货人电话
	var receiver_phone = data.receiver_phone;
	$("#receiver_phone_id").text(receiver_phone);
	//接收人区域
	var receiver_area = data.receiver_area;
	//详细地址
	var detail_address = data.detail_address;
	$("#receiver_address_id").text(receiver_area + " " + detail_address);
	//默认付款方式(0在线支付1货到付款)
	var pay_way = data.pay_way;
	if(pay_way == 0) {
		$("#payModeText").text("在线支付");
	} else if(pay_way == 1) {
		$("#payModeText").text("货到付款");
	}
	//店铺名称
	var shop_name = data.shop_name;
	localStorageObj.setItem("shop_name", shop_name);
	$("#shop_name_id").text(shop_name);
	//店铺等级
	var shop_grade = data.shop_grade;
	var redStards = "";
	var grayStards = "";
	var shopGrade = '<span class="store-score-text">' + shop_grade + '</span>';
	for(var i = 0; i < shop_grade; i++) {
		redStards = redStards + '<span class="iconfont icon-g score"></span>';
	}
	for(var i = 0; i < 5 - shop_grade; i++) {
		grayStards = grayStards + '<span class="iconfont icon-g"></span>';
	}
	$("#shop_grade_score_container").empty();
	$(redStards + grayStards + shopGrade).appendTo("#shop_grade_score_container");
	//店铺地址
	var shop_address = data.shop_address;
	$("#shop_address_id").text(shop_address);
	//店铺id
	var shop_id = data.shop_id;
	localStorage.setItem("shop_id", shop_id);
	$(".distribution-store-base").attr("id", shop_id);
	//默认配送方式(0到店自提1送货上门)
	var delivery_way = data.delivery_way;
	if(delivery_way == 0) {
		$("#distributionModeText").text("到店自提");
	} else if(delivery_way == 1) {
		$("#distributionModeText").text("送货上门");
	}

	//商品id
	var product_id = data.product_id;
	//商品图片
	var picture_url = data.picture_url;
	$("#product_pic_id").attr("src", picture_url);
	//商品名称
	var product_name = data.product_name;
	$("#product_name_id").text(product_name);
	//商品价格
	var product_price = data.product_price;
	$("#product_price_id").text(product_price);
	//商品数量
	var product_number = data.product_number;
	$("#product_count_id").text(product_number);
	//商品颜色
	var color = data.color;
	//商品内存容量
	var memory_capacity = data.memory_capacity;
	//商品运营商
	var supplier_desc = data.supplier_desc;
	//商品套餐名称
	var contract_name = data.contract_name;
	//商品总价
	var price_sum=0;
	$.each(data.goodsinfo, function(index, getdata) {
		//商品详情id
		var product_detail_id = getdata.product_detail_id;
		//商品id
		var product_id = getdata.product_id;
		//商品图片
		var picture_url = getdata.picture_url;
		//商品名称
		var product_name = getdata.product_name;
		//商品价格
		var product_price = getdata.product_price;
		//商品数量
		var product_number = getdata.product_number;
		price_sum=price_sum+parseFloat(product_price)*parseInt(product_number);
		//商品颜色
		var color = getdata.color;
		//商品内存容量
		var memory_capacity = getdata.memory_capacity;
		//商品运营商
		var supplier_desc = getdata.supplier_desc;
		//商品套餐名称
		var contract_name = getdata.contract_name;
		var productString = '<div class="goods-selected-info col-xs-12">' +
			'<div class="goods-pic col-xs-2">' +
			'<img id="product_pic_id" src="'+picture_url+'">' +
			'</div>' +
			'<div class="goods-base-info col-xs-8 text-left">' +
			'<span class="goods-name col-xs-12">'+product_name+'</span>' +
			'<span class="goods-attr col-xs-12">'+ color +' ' + memory_capacity + ' ' + supplier_desc + ' ' + contract_name + '</span>' +
			'</div>' +
			'<div class="goods-price-num col-xs-2 text-right">' +
			'<span class="goods-price col-xs-12">￥'+product_price+'</span>' +
			'<span class="buy-num col-xs-12">x'+product_number+'</span>' +
			'</div>' +
			'</div>';
		$(productString).appendTo("#product_container");
	});

	//设置商品总价
	$("#product_sum_price").text(price_sum);
	//设置--小计--金额
	$("#sub_total").text("￥" + price_sum);
	//设置--需支付--金额
	$("#need_pay").text("￥" + price_sum);
	//设置--支付弹窗--金额
	$("#pop_up_money").text("￥" + price_sum);
	localStorageObj.setItem("product_sum_prices", price_sum);
}