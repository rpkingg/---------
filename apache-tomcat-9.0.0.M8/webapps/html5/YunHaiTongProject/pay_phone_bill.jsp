<%@ page contentType="text/html;charset=GBK" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0, user-scalable=no" />
		<meta http-equiv="Content-Type" content="text/html;charset=GBK" />
		<meta content="yes" name="apple-mobile-web-app-capable" />
		<meta content="black" name="apple-mobile-web-app-status-bar-style" />
		<meta content="telephone=no" name="format-detection" />
		<meta http-equiv="Cache-Control" content="no-cache" />
		<title>�����µ�:�仰��</title>
		<link rel="stylesheet" href="css/common_css/initialization_style.css" />
		<link rel="stylesheet" href="css/common_css/public_style.css" />
		<link rel="stylesheet" href="css/pay_phone_bill.css">
		<script type="text/javascript" src="js/common_js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="js/common_js/set_fontsize.js"></script>
	</head>

	<body>
		<div class="search_container">
			<div class="search_box">
				<div>
					<div>
						<span class="pay_phone_title">�㽫Ϊ�˺����ֵ:</span>
						<span class="pay_phone_num">139 6503 9258</span>
					</div>
				</div>
			</div>
		</div>
		<div class="line_interval"></div>
		<div class="product_container">
			<div class="car_container">
				<div class="goods_item">
					<div class="bottom_box">
						<div class="inquiry_header_div">
							<img src="img/pay_bill.png" class="pay_phone_img" />
						</div>
						<div class="pay_phone_text">�仰��</div>
						<div class="pay_phone_money">��100</div>
						<div class="line line_top"></div>
						<div class="good">
							<div class="good_info">
								<div class="row1">
									<div class="good_name">��Ʒ�ܼ�</div>
									<div class="goods_total">��100</div>
								</div>
								<div class="row2">
									<div class="pay_phone_way">��Ʒ����ȯ:</div>
									<div class="goods_voucher">������</div>
								</div>
							</div>
						</div>
						<div class="payment_required">
							<div class="pay_phone_way payment_text">�踶��:</div>
							<div class="payment_money">��100</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="footer_pay">
			<div class="payment_required">
				<div class="footer_pay_text" style="">��֧��:</div>
				<div class="footer_pay_money">��<span class="total-money">100<span></div>
				<div class="footer_pay_now">����֧��</div>
			</div>
		</div>

		<!-- ������ҳ��֧������ -->
		<div id="pay-order" class="notice-pay">
			<div class="shadow"></div>
			<div class="chose-pay">
				<span>ѡ�񸶿ʽ</span>
				</div>
				<div class="pay-content">
					<div class="pay-wechat pay-way pay-center">
						<p>���<span class="pay-wechat-span">��1700</span> ����30���������֧��</p>
					</div>
					<div class="pay-wechat pay-way">
						<img src="img/wechat.png" class="brand">
						<span id="wechat_pay">΢��֧��</span>
						<img src="img/choose.png" class="chose chose-pay-yes" style="display: block;">
						<img src="img/choose_no.png" class="chose-pay-no">
					</div>
					<div class="pay-wechat pay-way">
						<img src="img/alipay.png" class="brand">
						<span id="ali_pay">֧����֧��</span>
						<img src="img/choose.png" class="chose chose-pay-yes1">
						<img src="img/choose_no.png" class="chose-pay-no">
					</div>
					<div class="blank"></div>
				</div>
				<div class="cancel-pay">ȷ��֧��</div>
			</div>

	</body>
	<script type="text/javascript" src="js/common_js/change_fontsize.js"></script>
	<script type="text/javascript" src="js/common_js/my_tools.js"></script>
	<script type="text/javascript">
		//�ϸ�ҳ�������
		var params = new queryString();
		var mobileNum = params["mobileNum"];
		var amount = params["amount"];
		var feeId = params["feeId"];
		//֧��������֧������΢��
		var payWay = "wechat_pay";
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
				alert("�µ�ʧ�ܣ�");
			}
		});

		//���ȷ������رյ���
		$('.cancel-pay').on('click', function() {
			$('#pay-order').hide();
			//order_pay_way��֧����=0��΢��=1
			if(payWay == aliPay) {
				localStorageObj.setItem("order_num", order_no);
				localStorageObj.setItem("order_pay_way", "0");
				//order_pay_type����:0���ѳ�ֵ1������ֵ2��Ʒ����
				localStorageObj.setItem("order_pay_type","0");
				

				var data = '<div class="iframe_container" id="iframe_alipayment">' +
					'<iframe id="iframe_alipayment_id" src="alipayment.html" width="100%" height="100%" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>' +
					'</div>';
				$(data).appendTo("body");
				$("#iframe_alipayment").show();
			} else if(payWay == weChat) {

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
			payWay = $(this).find("span").attr("id");
			$(this).find(".chose").show();
			$(this).siblings().find(".chose").hide();
		});
	</script>

</html>