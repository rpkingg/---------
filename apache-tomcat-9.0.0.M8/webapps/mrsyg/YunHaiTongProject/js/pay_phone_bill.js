(function($, document) {
	//上个页面的数据
	var params = new queryString();
	var mobileNum = params["mobileNum"];
	var amount = params["amount"];
	var feeId = params["feeId"];
	//支付渠道：支付宝或微信
	//默认支付宝
	var payWay = "ali_pay";
	var aliPay = "ali_pay";
	var weChat = "wechat_pay";
	//获得本地存储的对象
	var localStorageObj = window.localStorage;
	//订单编号
	var order_no = "";
	//点击付款弹窗
	$('.footer_pay_now').on('click', function() {
		//下单接口
		//http://120.76.190.223:8988/mrsyg/kqgoods/RechargeOrder.form?phone=13333333333&parameter_id=1&type=1
		var urlPath_one = "mrsyg/kqgoods/RechargeOrder.form";
		var need_data = {
			"phone": mobileNum,
			"parameter_id": feeId,
			"type": 0
		};

		var data_one = myAjax(urlPath_one, need_data);
		if(data_one != undefined) {
			order_no = data_one.order_no;
			var total = $(".total-money").text();
			$(".pay-wechat-span").text("￥" + total);
			$('#pay-order').show();
		} else {
			console.log("下单失败！");
		}
	});

	//点击确定付款关闭弹窗
	$('.cancel-pay').on('click', function() {
		//order_pay_way：支付宝=0，微信=1
		if(payWay == aliPay) {
			$('#pay-order').hide();
			localStorageObj.setItem("order_num", order_no);
			localStorageObj.setItem("order_pay_way", "0");
			//order_pay_type类型:0话费充值1流量充值2商品消费
			localStorageObj.setItem("order_pay_type", "0");

			var data = '<div class="iframe_container" id="iframe_alipayment">' +
				'<iframe id="iframe_alipayment_id" src="alipayment.jsp" width="100%" height="100%" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>' +
				'</div>';
			$(data).appendTo("body");
			$("#iframe_alipayment").show();
		} else if(payWay == weChat) {
			//$('#pay-order').hide();
		}
	});
	$(".pay_phone_num").text(setTelNum(mobileNum));
	$(".pay_phone_money,.goods_total,.payment_money").text("￥" + amount);
	$(".total-money").text(amount);
	//电话格式
	function setTelNum(value) {
		value = value.replace(/\s*/g, "");
		var result = [];
		for(var i = 0; i < value.length; i++) {
			if(i == 3 || i == 7) {
				result.push(" " + value.charAt(i));
			} else {
				result.push(value.charAt(i));
			}
		}
		return value = result.join("");
	}
	//支付点击显示勾选状态
	$(".pay-way").on("click", function() {
		
		//当微信支付接口上线后取消此处判断和注释
		//payWay = $(this).find("span").attr("id");
		if(payWay == aliPay) {
			/*$(this).find(".chose").show();
			$(this).siblings().find(".chose").hide();*/
		}
	});
})(jQuery, document);
