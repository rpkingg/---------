(function($, document) {
	//�ϸ�ҳ�������
	var params = new queryString();
	var mobileNum = params["mobileNum"];
	var amount = params["amount"];
	var feeId = params["feeId"];
	//֧��������֧������΢��
	//Ĭ��֧����
	var payWay = "ali_pay";
	var aliPay = "ali_pay";
	var weChat = "wechat_pay";
	//��ñ��ش洢�Ķ���
	var localStorageObj = window.localStorage;
	//�������
	var order_no = "";
	//��������
	$('.footer_pay_now').on('click', function() {
		//�µ��ӿ�
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
			$(".pay-wechat-span").text("��" + total);
			$('#pay-order').show();
		} else {
			console.log("�µ�ʧ�ܣ�");
		}
	});

	//���ȷ������رյ���
	$('.cancel-pay').on('click', function() {
		//order_pay_way��֧����=0��΢��=1
		if(payWay == aliPay) {
			$('#pay-order').hide();
			localStorageObj.setItem("order_num", order_no);
			localStorageObj.setItem("order_pay_way", "0");
			//order_pay_type����:0���ѳ�ֵ1������ֵ2��Ʒ����
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
	$(".pay_phone_money,.goods_total,.payment_money").text("��" + amount);
	$(".total-money").text(amount);
	//�绰��ʽ
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
	//֧�������ʾ��ѡ״̬
	$(".pay-way").on("click", function() {
		
		//��΢��֧���ӿ����ߺ�ȡ���˴��жϺ�ע��
		//payWay = $(this).find("span").attr("id");
		if(payWay == aliPay) {
			/*$(this).find(".chose").show();
			$(this).siblings().find(".chose").hide();*/
		}
	});
})(jQuery, document);
