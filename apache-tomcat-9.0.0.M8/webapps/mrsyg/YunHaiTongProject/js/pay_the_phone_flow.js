(function($, document) {
	var feeId = 1;
	$("#bill_container").on("click", ".phone_bill_item", function() {
		$(".phone_bill_item").removeClass("pay_bill_selected");
		$(this).addClass("pay_bill_selected");
		var amount = $(this).attr("fee");
		$(".amount").text(amount);
		feeId = $(this).attr("fee_id");
	});
	$(".pay_bill_btn").bind("click", function() {
		var amount = $(".amount").text();
		var mobileNum = $(".phone_input_container_num").val().replace(/\s/g, '');
		if(isMobile(mobileNum)) {
			var hrefString = '?mobileNum=' + mobileNum + "&amount=" + amount + "&feeId=" + feeId;
			native.openWebView("pay_flow.jsp" + hrefString);
		} else {
			console.log("��������ȷ���ֻ��ţ�");
			return false;
		}
	})
	//�ӿ�·�������--������չʾ
	//http://120.76.190.223:8988/mrsyg/kqgoods/FlowFee.form
	var urlPath_bill = "mrsyg/kqgoods/FlowFee.form";
	var need_data_comment = {};

	var data = myAjax(urlPath_bill, need_data_comment);
	if(data != undefined) {
		init(data);
	}
	
	//�ӿ�·�����û���Ϣ--�仰��չʾ
	//http://120.76.190.223:8988/mrsyg/kquser/UserInfo.form
	var urlPath_user = "mrsyg/kquser/UserInfo.form";
	var need_data_user = {};
	
	var user_data = myAjax(urlPath_user, need_data_user);
	if(user_data != undefined) {
		var phone = user_data.phone;
		var result = [];
		for(var i = 0; i < phone.length; i++) {
			if(i == 3 || i == 7) {
				result.push(" ");
				result.push(phone.charAt(i));
			} else {
				result.push(phone.charAt(i));
			}
		}
		$(".phone_input_container_num").val(result.join(""));
	}
	
	function init(datas) {
		$("#bill_container").empty();
		var finalString = '';
		var endString = '</div>';
		$.each(data.feeinfo, function(index, getdatas) {
			//����id
			var flow_id = getdatas.flow_id;
			//��������
			var flow_name = getdatas.flow_name;
			//�������
			var flow_fee = getdatas.flow_fee;
			//�ж��Ƿ�Ϊ��һ������
			var headString = index >= 3 ? '<div class="second_line_container">' : '<div class="first_line_container">';
			var feeString = '<a class="phone_bill_item" fee_id = "' + flow_id + '" fee="' + flow_fee + '">' + flow_name + '</a>';
			if(0 == index) {
				feeString = '<a class="phone_bill_item pay_bill_selected" fee_id = "' + flow_id + '" fee="' + flow_fee + '">' + flow_name + '</a>';
				$(".amount").text(flow_fee);
			}
			if(index % 3 == 0) {
				finalString += headString + feeString;
			} else {
				finalString += feeString;
			}
			if(index % 3 == 2) {
				finalString += endString;
			}
		})
		$(finalString).appendTo("#bill_container");
	};
	//�ֻ�����У��
	function isDig() {
		//����������ʽ
		var re = /^[0-9]+$/;
		var count = $(".phone_input_container_num").val();
		if(!re.test(count)) {
			$(".phone_input_container_num").val("");
		}
	};
})(jQuery, document);