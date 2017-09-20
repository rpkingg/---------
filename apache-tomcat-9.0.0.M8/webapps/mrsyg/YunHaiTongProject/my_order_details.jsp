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
		<title>��������</title>
		<link rel="stylesheet" href="css/common_css/initialization_style.css" />
		<link rel="stylesheet" href="css/common_css/public_style.css" />
		<link rel="stylesheet" href="css/my_order_details.css" />
		<script type="text/javascript" src="js/common_js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="js/common_js/set_fontsize.js"></script>
	</head>

	<body>
		<div>
			<div class="title_content">��������</div>
			<img class="title_back" src="img/back_btn@2x.png" srcset="img/back_btn@2x.png 2x,img/back_btn@3x.png 3x" />
		</div>
		<!--������-->
		<div class="payment_and_shipments_bg display_none" id="payment">
			<img class="payment_and_shipments_img" src="img/pending_payment@2x.png" srcset="img/pending_payment@2x.png 2x,img/pending_payment@3x.png 3x" />
			<div class="payment_and_shipments_content">�ȴ�����<span>(ʣ��27��12��19�رն���)</span></div>
		</div>
		<!--������-->
		<div class="payment_and_shipments_bg display_none" id="shipment">
			<img class="payment_and_shipments_img" src="img/pending_shipment@2x.png" srcset="img/pending_shipment@2x.png 2x,img/pending_shipment@3x.png 3x" />
			<div class="payment_and_shipments_content">�Ѹ��������</div>
		</div>
		<!--���ջ�-->
		<div class="received_bg display_none" id="received">
			<img class="payment_and_shipments_img" src="img/pending_received@2x.png" srcset="img/pending_received@2x.png 2x,img/pending_received@3x.png 3x" />
			<div class="received_content_container">
				<div class="received_content_container_title">�ѷ���</div>
				<div class="logistics_information">������Ϣ��<span>���л���������</span></div>
				<div class="delivery_clerk">����Ա��<span>����</span><span class="delivery_clerk_phone">13755555555</span></div>
			</div>
			<img class="logistics_information_btn" src="img/right_btn_white@2x.png" srcset="img/right_btn_white@2x.png 2x,img/right_btn_white@3x.png 3x" />
		</div>
		<!--������-->
		<div class="payment_and_shipments_bg display_none" id="evaluate">
			<img class="evaluate_img" src="img/pending_evaluate@2x.png" srcset="img/pending_evaluate@2x.png 2x,img/pending_evaluate@3x.png 3x" />
			<div class="payment_and_shipments_content">���׳ɹ�</div>
		</div>
		<div class="margin_top_six">
			<div class="background_color_FF">
				<div class="received_message_container">
					<img class="received_message_container_img" src="img/receiver_address@2x.png" srcset="" />
					<div class="received_message_container_name">������139556672345��</div>
				</div>
				<div class="received_message_container_address">
					�Ϻ��� ������ ��ɳ��·�����л�����6��¥1678��
				</div>
			</div>
		</div>
		<div class="margin_top_six">
			<div class="background_color_FF">
				<div class="shop_container">
					<div class="shop_container_name"><span id="shop_name">�����л���</span><span class="shop_container_name_span" id="pay_type">���߸���</span></div>
				</div>
				<div class="line"></div>
				<div id="product_out_container">
					<!--<div class="product_container">
						<img class="product_container_img" src="" srcset="" />
						<div class="product_container_content">
							<div class="product_container_name">ƻ�� iPhone 7</div>
							<div class="product_container_des">��ɫ 32G �ƶ��� �ײ�һ</div>
						</div>
						<div class="product_container_price">��5688</div>
						<div class="product_container_num">��1</div>
					</div>
					<div class="line"></div>-->
				</div>
				<div class="product_sum_money">��Ʒ�ܼۣ�<span id="product_sum_money_span">��5688</span></div>
				<div class="product_freight">��Ʒ�˷ѣ�<span>��0.00</span></div>
				<!--������-->
				<div class="voucher_container_other display_none">��Ʒ�Ż�ȯ��<span class="voucher_span">-��10</span></div>
				<!--��������-->
				<div class="product_voucher_container display_none">��Ʒ�Ż�ȯ��
					<span class="voucher_price voucher_span">-��10</span>
					<img src="img/rigth_btn_gray@2x.png" srcset="img/rigth_btn_gray@2x.png 2x,img/rigth_btn_gray@3x.png 3x" />
				</div>
				<div class="need_pay_all">
					<span id="need_pay_all_content">�踶��</span>��<span class="need_pay_all_money">��5688</span>
				</div>
			</div>
		</div>
		<div class="margin_top_six order_information">
			<div class="background_color_FF order_information_container">
				<div class="order_number">������ţ�<span id="order_serialNumber_span"></span></div>
				<div class="transaction_number">���ױ�ţ�<span id="transaction_number_span"></span></div>
				<div class="creation_time">����ʱ�䣺<span id="creation_time_span"></span></div>
			</div>
		</div>
		<div class="background_color_FF order_detail_bottom_container">
			<img class="bottom_container_img" src="img/contact_merchant@2x.png" srcset="img/contact_merchant@2x.png 2x,img/contact_merchant@3x.png 3x" />
			<div class="bottom_container_contact_merchant">��ϵ�̼�</div>
			<a class="bottom_container_cancle_order">ȡ������</a>
			<a class="bottom_container_pay">����</a>
		</div>
	</body>
	<script type="text/javascript" src="js/common_js/change_fontsize.js"></script>
	<script type="text/javascript" src="js/common_js/my_tools.js"></script>
	<script>
		(function($, document) {
			//��ñ��ش洢�Ķ���
			var localStorageObj = window.localStorage;

			//�ӿ�·���������
			var urlPath_orderDetail = "mrsyg/kquser/OrderDetail.form";
			var need_data_orderDetail = {
				"order_no": localStorageObj.getItem("my_order_id")
			}
			var data_orderDetail = myAjax(urlPath_orderDetail, need_data_orderDetail);
			if(data_orderDetail != undefined) {
				init(data_orderDetail);
			}

			function init(data) {
				//����״̬(1δ����2������3���ջ�4������)
				var order_status = data.order_status;
				//�ջ�������
				var receiver_name = data.receiver_name;
				//�ջ��˵绰
				var receiver_phone = data.receiver_phone;
				$(".received_message_container_name").text(receiver_name + "(" + receiver_phone + ")");
				//�ջ��˵�ַ
				var receiver_area = data.receiver_area;
				$(".received_message_container_address").text(receiver_area);
				//��������
				var shop_name = data.shop_name;
				$("#shop_name").text(shop_name);
				//����id
				var shop_id = data.shop_id;
				//���ʽ--0����֧��1��������
				var pay_way = data.pay_way;
				if(pay_way == "0") {
					pay_way = "����֧��";
				} else if(pay_way == "1") {
					pay_way = "��������";
				}
				//�������
				var order_no = data.order_no;
				$("#order_serialNumber_span").text(order_no);
				//���ױ��
				var serial_no = data.serial_no;
				$("#transaction_number_span").text(serial_no);
				//����ʱ��
				var created_at = data.created_at;
				$("#creation_time_span").text(created_at);
				//�Ż�ȯ���
				var coupon_amount = data.coupon_amount;
				coupon_amount = parseFloat(coupon_amount);
				if(coupon_amount > 0) {
					$(".voucher_span").text("-��" + coupon_amount);
				} else {
					$(".voucher_span").text("��");
					coupon_amount = 0;
				}
				//��Ʒ�ܼ�
				var pay_amount = data.pay_amount;
				$("#product_sum_money_span").text("��" + pay_amount);
				$(".need_pay_all_money").text("��" + (pay_amount - coupon_amount));
				//���̵绰
				var shop_mobile = data.shop_mobile;
				//��Ʒ��Ϣ
				$.each(data.goodsinfo, function(index, getData) {
					//��Ʒ����
					var product_name = getData.product_name;
					//��Ʒid
					var product_id = getData.product_id;
					//��Ʒ��ɫ
					var color = getData.color;
					//��Ʒ����
					var memory_capacity = getData.memory_capacity;
					//��Ӧ������
					var supplier_name = getData.supplier_name;
					//�ײ�����
					var contract_name = getData.contract_name;
					//��Ʒ�۸�
					var product_price = getData.product_price;
					//��Ʒ����
					var product_number = getData.product_number;
					//��ƷͼƬ��2x��
					var picture_url2x = getData.picture_url2x;
					//��ƷͼƬ��3x��
					var picture_url3x = getData.picture_url3x;
					var html = '<div class="product_container">' +
						'<img class="product_container_img" src="' + picture_url2x + '" srcset="' + picture_url2x + ' 2x,' + picture_url3x + ' 3x" />' +
						'<div class="product_container_content">' +
						'<div class="product_container_name">' + product_name + '</div>' +
						'<div class="product_container_des">' + color + ' ' + memory_capacity + ' ' + supplier_name + ' ' + contract_name + '</div>' +
						'</div>' +
						'<div class="product_container_price">��' + product_price + '</div>' +
						'<div class="product_container_num">��' + product_number + '</div>' +
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

			//��֧��
			function show_payment() {
				$("#payment").show();
				$(".product_voucher_container").show();
			}
			//������
			function show_shipments() {
				$("#shipment").show();
				$(".voucher_container_other").show();
				$("#need_pay_all_content").text("�Ѹ���");
				$(".bottom_container_pay").text("���ѷ���");
				$(".bottom_container_pay").css("color", "#777777");
				$(".bottom_container_pay").css("border-color", "#DDDDDD");
			}
			//���ջ�
			function show_received() {
				$("#received").show();
				$(".voucher_container_other").show();
				$("#need_pay_all_content").text("�Ѹ���");
				$(".bottom_container_cancle_order").text("�鿴����");
				$(".bottom_container_pay").text("ȷ�϶���");
				$(".bottom_container_pay").css("color", "#777777");
				$(".bottom_container_pay").css("border-color", "#DDDDDD");
			}
			//������
			function show_evaluate() {
				$("#evaluate").show();
				$(".voucher_container_other").show();
				$("#need_pay_all_content").text("�Ѹ���");
				$(".bottom_container_cancle_order").text("ɾ������");
				$(".bottom_container_pay").text("����");
			}

		})(jQuery, document);
	</script>

</html>