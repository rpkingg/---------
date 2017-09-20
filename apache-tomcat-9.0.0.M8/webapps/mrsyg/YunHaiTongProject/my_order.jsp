<%@ page contentType="text/html;charset=GBK" language="java" %>
<%@ include file="/YunHaiTongProject/common/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="en">

	<head>
		<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<meta http-equiv="Content-Type" content="text/html;charset=GBK" />
		<meta content="yes" name="apple-mobile-web-app-capable" />
		<meta content="black" name="apple-mobile-web-app-status-bar-style" />
		<meta content="telephone=no" name="format-detection" />
		<meta http-equiv="Cache-Control" content="no-cache" />
		<title>�ҵĶ���</title>
		<link rel="stylesheet" href="css/common_css/initialization_style.css" />
		<link rel="stylesheet" href="css/common_css/public_style.css" />
		<link rel="stylesheet" href="css/my-order.css?ts=${ts}">
		<script type="text/javascript" src="js/common_js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="js/common_js/set_fontsize.js"></script>
		<script type="text/javascript">
			function callByNativeWithParams(msg) {
				var msg = msg;
				if(msg == "panel1") {
					$("#all").removeClass("selected");
					$("#waitting_pay").addClass("selected");
					$("#all_num_counts").hide();
					$("#payment_num_counts").show();
					$("#panel1").hide();
					$("#panel2").show();
				} else if(msg == "panel2") {
					$("#all").removeClass("selected");
					$("#waitting_goods").addClass("selected");
					$("#all_num_counts").hide();
					$("#shipment_num_counts").show();
					$("#panel1").hide();
					$("#panel3").show();
				} else if(msg == "panel3") {
					$("#all").removeClass("selected");
					$("#waitting_get").addClass("selected");
					$("#all_num_counts").hide();
					$("#pending_num_counts").show();
					$("#panel1").hide();
					$("#panel4").show();
				} else if(msg == "panel4") {
					$("#all").removeClass("selected");
					$("#waitting_discuss").addClass("selected");
					$("#all_num_counts").hide();
					$("#evaluation_num_counts").show();
					$("#panel1").hide();
					$("#panel5").show();
				} else if(msg == "panel5") {
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
			<div class="order-header-title">�ҵĶ���</div>
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
		<!--����ͨ�õ�����-->
		<div class="tab-box">
			<div class="tab-list">
				<div class="tab-item">
					<div class="tab selected" id="all">
						<span>ȫ��</span>
						<div class="count-point show_count" id="all_num_counts">0</div>
					</div>
				</div>
				<div class="tab-item">
					<div class="tab" id="waitting_pay">
						<span>������</span>
						<div class="count-point" id="payment_num_counts">0</div>
					</div>
				</div>
				<div class="tab-item">
					<div class="tab" id="waitting_goods">
						<span>������</span>
						<div class="count-point" id="shipment_num_counts">0</div>
					</div>
				</div>
				<div class="tab-item">
					<div class="tab" id="waitting_get">
						<span>���ջ�</span>
						<div class="count-point" id="pending_num_counts">0</div>
					</div>
				</div>
				<div class="tab-item">
					<div class="tab" id="waitting_discuss">
						<span>������</span>
						<div class="count-point" id="evaluation_num_counts">0</div>
					</div>
				</div>
			</div>
		</div>

		<!--1 ȫ��-->
		<div id="panel1" class="car-container" style="margin-top: -0.2rem;">
			<!--<div class="order_container">
				<div class="goods-item">
					<div class="shop_name_container">
						<span class="shop_name">�����л���</span>
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
									<div class="good-name">���� ����X</div>
									<div class="good-price">��350</div>
								</div>
								<div class="row2">
									<div class="good-color">��ɫ 32G �ƶ��� �ײ�һ</div>
									<div class="good-count">x1</div>
								</div>
							</div>
						</div>
					</div>
					<div class="line_all"></div>
					<div class="bottom-info-box add-h">
						<div class="order-fee-div">��5688<span class="order-fee-span">�����˷ѣ���10��</span></div>
						<span class="order-count-span">�ϼƣ�</span>
						<span class="order-count-span2">����2��</span>
					</div>
					<div class="bottom-info-box add-h">
						<span class="order-close">�����ѹر�</span>
						<div class="add-css order-again">����һ��</div>
					</div>
				</div>
			</div>-->
			<!--���޶���-->
			<div class="no_order" id="no_order_one">
				<img class="no_order_pic" src="img/no_order.png" />
				<div class="no_order_content" style="">���޶���</div>
			</div>
		</div>

		<!--2 ������ҳ-->
		<div id="panel2" class="car-container paddBotm order-panel">
			<!--<div class="order_container">
				<div class="goods-item">
					<div class="shop_name_container">
						<span class="shop_name">�����л���</span>
						<span class="order_pay_online">���߸���</span>
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
									<div class="good-name">���� ����X</div>
									<div class="good-price">��350</div>
								</div>
								<div class="row2">
									<div class="good-color">��ɫ 32G �ƶ��� �ײ�һ</div>
									<div class="good-count">x1</div>
								</div>
							</div>
						</div>
					</div>
					<div class="line_all"></div>
					<div class="bottom-info-box add-h">
						<div class="order-fee-div">��5688<span class="order-fee-span">�����˷ѣ���10��</span></div>
						<span class="order-count-span">�ϼƣ�</span>
						<span class="order-count-span2">����2��</span>
					</div>
					<div class="bottom-info-box add-h">
						<div class="btn-close add-css order-again">����</div>
						<div class="add-css order-cencle">ȡ������</div>
					</div>
				</div>
			</div>-->
			<!--���޶���-->
			<div class="no_order" id="no_order_two">
				<img class="no_order_pic" src="img/no_order.png" />
				<div class="no_order_content" style="">���޶���</div>
			</div>
		</div>

		<!--3 ������ҳ-->
		<div id="panel3" class="car-container paddBotm order-panel">
			<!--<div class="order_container">
				<div class="goods-item">
					<div class="shop_name_container">
						<span class="shop_name">�����л���</span>
						<span class="order_pay_online">���߸���</span>
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
									<div class="good-name">ƻ�� iPhone 7</div>
									<div class="good-price">��350</div>
								</div>
								<div class="row2">
									<div class="good-color">��ɫ 32G �ƶ��� �ײ�һ</div>
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
									<div class="good-name">���� ����X</div>
									<div class="good-price">��350</div>
								</div>
								<div class="row2">
									<div class="good-color">��ɫ 32G �ƶ��� �ײ�һ</div>
									<div class="good-count">x1</div>
								</div>
							</div>
						</div>
					</div>
					<div class="line_all"></div>
					<div class="bottom-info-box add-h">
						<div class="order-fee-div">��5688<span class="order-fee-span">�����˷ѣ���10��</span></div>
						<span class="order-count-span">�ϼƣ�</span>
						<span class="order-count-span2">����2��</span>
					</div>
					<div class="bottom-info-box add-h">
						<div class="add-css order-deliver-goods">���ѷ���</div>
					</div>
				</div>
			</div>-->
			<!--���޶���-->
			<div class="no_order" id="no_order_three">
				<img class="no_order_pic" src="img/no_order.png" />
				<div class="no_order_content" style="">���޶���</div>
			</div>
		</div>

		<!--4 ���ջ�ҳ-->
		<div id="panel4" class="car-container paddBotm order-panel">
			<!--<div class="order_container">
				<div class="goods-item">
					<div class="shop_name_container">
						<span class="shop_name">�����л���</span>
						<span class="order_pay_online">���߸���</span>
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
									<div class="good-name">ƻ�� iPhone 7</div>
									<div class="good-price">��350</div>
								</div>
								<div class="row2">
									<div class="good-color">��ɫ 32G �ƶ��� �ײ�һ</div>
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
									<div class="good-name">���� ����X</div>
									<div class="good-price">��350</div>
								</div>
								<div class="row2">
									<div class="good-color">��ɫ 32G �ƶ��� �ײ�һ</div>
									<div class="good-count">x1</div>
								</div>
							</div>
						</div>
					</div>
					<div class="line_all"></div>
					<div class="bottom-info-box add-h">
						<div class="order-fee-div">��5688<span class="order-fee-span">�����˷ѣ���10��</span></div>
						<span class="order-count-span">�ϼƣ�</span>
						<span class="order-count-span2">����2��</span>
					</div>
					<div class="bottom-info-box add-h">
						<div class="add-css order-deliver-goods">�ջ�������</div>
						<div class="add-css order-cencle">�鿴����</div>
					</div>
				</div>
			</div>-->
			<!--���޶���-->
			<div class="no_order" id="no_order_four">
				<img class="no_order_pic" src="img/no_order.png" />
				<div class="no_order_content" style="">���޶���</div>
			</div>
		</div>

		<!--5 ������ҳ-->
		<div id="panel5" class="car-container paddBotm order-panel">
			<!--<div class="order_container">
				<div class="goods-item">
					<div class="shop_name_container">
						<span class="shop_name">�����л���</span>
						<span class="order_pay_online">��������</span>
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
									<div class="good-name">ƻ�� iPhone 7</div>
									<div class="good-price">��350</div>
								</div>
								<div class="row2">
									<div class="good-color">��ɫ 32G �ƶ��� �ײ�һ</div>
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
									<div class="good-name">���� ����X</div>
									<div class="good-price">��350</div>
								</div>
								<div class="row2">
									<div class="good-color">��ɫ 32G �ƶ��� �ײ�һ</div>
									<div class="good-count">x1</div>
								</div>
							</div>
						</div>
					</div>
					<div class="line_all"></div>
					<div class="bottom-info-box add-h">
						<div class="order-fee-div">��5688<span class="order-fee-span">�����˷ѣ���10��</span></div>
						<span class="order-count-span">�ϼƣ�</span>
						<span class="order-count-span2">����2��</span>
					</div>
					<div class="bottom-info-box add-h">
						<div class="add-css order-again disscuss">����</div>
						<div class="add-css order-cencle deleteAlert">ɾ������</div>
					</div>
				</div>
			</div>-->
			<!--���޶���-->
			<div class="no_order" id="no_order_five">
				<img class="no_order_pic" src="img/no_order.png" />
				<div class="no_order_content" style="">���޶���</div>
			</div>
		</div>

		<!-- ֧������ -->
		<div id="pay-order" class="notice-pay">
			<div class="shadow"></div>
			<div class="chose-pay">
				<div class="chose-pay-text"><span>ѡ�񸶿ʽ</span></div>
				<div class="chose-pay-div">
					<img src="img/cencle_pay.png" class="chose-pay-img" />
				</div>
			</div>
			<div class="pay-content">
				<div class="pay-wechat  pay-center">
					<p class="pay-money">���<span class="pay-wechat-span">��1700</span> ����30���������֧��</p>
				</div>
				<div class="pay-wechat pay-way-chose" id="alipay">
					<img src="img/alipay.png" class="brand">
					<span>֧����֧��</span>
					<img src="img/choose.png" class="chose chose-pay-yes">
					<img src="img/choose_no.png" class="chose-pay-no">
				</div>
				<div class="pay-wechat pay-way-chose" id="wechat">
					<div class="mask_gray"></div>
					<img src="img/wechat.png" class="brand">
					<span>΢��֧��</span>
					<img src="img/choose.png" class="chose">
					<img src="img/choose_no.png" class="chose-pay-no">
				</div>
				<!--<div class="blank"></div>-->
			</div>
			<div class="sure-pay">ȷ��֧��</div>
		</div>

		<!-- ɾ���������� -->
		<div class="delete-order" style="display: none;">
			<div class="shadow"></div>
			<div class="content">
				<div class="inner-box">
					<div class="sureDelete">ȷ��ɾ��������</div>
					<div class="ture-false">
						<span class="ofcourse">ȷ��</span>
						<span class="ture-cancel">ȡ��</span>
					</div>
				</div>
			</div>
		</div>

		<!-- ������ҳ���˿������ -->
		<div class="return-money">
			<div class="shadow"></div>
			<div class="content">
				<div class="inner-box">
					<div class="sureDelete">�Ƿ�ȷ���˿ȷ���˿���뵽 �ͷ����Ĳ�ѯ�ۺ�
					</div>
					<div class="ture-false">
						<span class="ofcourse changeColor">ȡ��</span>
						<span class="sure-cancel">ȷ��</span>
					</div>
				</div>
			</div>
		</div>
		<c:if test="${DEBUG}">
			<script type="text/javascript" src="js/common_js/vconsole.min.js"></script>
		</c:if>
		<script type="text/javascript" src="js/common_js/change_fontsize.js"></script>
		<script type="text/javascript" src="js/common_js/my_tools.js?ts=${ts}"></script>
		
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
						default:
							break;
					}
				});

				function showHidePanel(index) {
					$("#panel" + index).show().siblings(".car-container").hide();
				}
				//��ñ��ش洢�Ķ���
				var localStorageObj = window.localStorage;
				//�ӿ�·��(ȫ������)
				var urlPath_one = "mrsyg/kquser/MyOrder.form";
				var need_data_all = {};
				var data_one = myAjax(urlPath_one, need_data_all);
				if(data_one != undefined && data_one.hasOwnProperty("orderinfo")) {
					init(data_one, "panel1", "all_num_counts", "no_order_one");
				}
				//�ӿ�·���������
				//mrsyg/kquser/MyOrder.form?order_status=1
				var urlPath_payment = "mrsyg/kquser/MyOrder.form";
				var need_data_payment = {
					"order_status": "1"
				}
				var data_payment = myAjax(urlPath_payment, need_data_payment);
				if(data_payment != undefined && data_payment.hasOwnProperty("orderinfo")) {
					init(data_payment, "panel2", "payment_num_counts", "no_order_two");
				}
				//�ӿ�·������������
				var urlPath_shipment = "mrsyg/kquser/MyOrder.form";
				var need_data_shipment = {
					"order_status": "2"
				}
				var data_shipment = myAjax(urlPath_shipment, need_data_shipment);
				if(data_shipment != undefined && data_shipment.hasOwnProperty("orderinfo")) {
					init(data_shipment, "panel3", "shipment_num_counts", "no_order_three");
				}
				//�ӿ�·�������ջ���
				var urlPath_pending = "mrsyg/kquser/MyOrder.form";
				var need_data_pending = {
					"order_status": "3"
				}
				var data_pending = myAjax(urlPath_pending, need_data_pending);
				if(data_pending != undefined && data_pending.hasOwnProperty("orderinfo")) {
					init(data_pending, "panel4", "pending_num_counts", "no_order_four");
				}
				//�ӿ�·���������ۣ�
				var urlPath_evaluation = "mrsyg/kquser/MyOrder.form";
				var need_data_evaluation = {
					"order_status": "4"
				}
				var data_evaluation = myAjax(urlPath_evaluation, need_data_evaluation);
				if(data_evaluation != undefined && data_evaluation.hasOwnProperty("orderinfo")) {
					init(data_evaluation, "panel5", "evaluation_num_counts", "no_order_five");
				}

				function init(datas, note_id, orderNum_id, no_order) {
					//��������
					if(datas.orderinfo) {
						var orderNum = datas.orderinfo.length;
						$("#" + orderNum_id).text(orderNum);
						$("#" + no_order).hide();
						console.log("����tab����orderNum=" + orderNum + ",orderNum_id=" + orderNum_id);
					}
					$.each(datas.orderinfo, function(index, getdata) {
						//��������
						var shop_name = getdata.shop_name;
						//����id
						var shop_id = getdata.shop_id;
						//�������
						var order_no = getdata.order_no;
						//�仰�ѳ�������֧�����
						var payAmount = getdata.pay_amount;
						//����ʱ��
						var created_at = getdata.created_at;

						//���ʽ(0����֧��1��������)
						var pay_way = getdata.pay_way;
						var payWay = "";
						if(pay_way == 1) {
							payWay = "��������";
						} else if(pay_way == 0) {
							payWay = "����֧��";
						}
						//���ͷ�ʽ:0��������1�ͻ�����
						var delivery_way = getdata.delivery_way;
						//����״̬��1δ����2������3���ջ�4������5������ɣ�
						var order_status = getdata.order_status;
						//�������ͣ� "2"������Ʒ������"0"�仰�Ѷ���,"1"������������
						var order_type = getdata.order_type;

						var productString = ""; //��Ʒ��Ϣ
						var productNums = 0; //ÿ����������Ʒ������
						var pay_amount = 0; //ÿ����������Ʒ���ܽ��

						if(order_type == "2") {
							$.each(getdata.goodsinfo, function(index, getData) {
								//��ƷͼƬ
								var picture_url = getData.picture_url;
								//��Ʒ����
								var product_name = getData.product_name;
								//��Ʒid
								var product_id = getData.product_id;
								//��Ʒ�۸�
								var product_price = getData.product_price;
								//��Ʒ����
								var product_number = getData.product_number;
								productNums = productNums + parseInt(product_number);
								pay_amount = pay_amount + parseInt(product_number) * parseFloat(product_price);
								//��Ʒ��ɫ
								var color = getData.color;
								color = color.trim();
								//��Ʒ����
								var memory_capacity = getData.memory_capacity;
								memory_capacity = memory_capacity.trim();
								//��Ӫ������
								var supplier_name = getData.supplier_desc;
								supplier_name = supplier_name.trim();
								//�ײ�����
								var contract_name = getData.contract_name;
								contract_name = contract_name.trim();
								productString = productString + '<div class="line" data-product-id = "' + product_id + '"></div>' +
									'<div class="good">' +
									'<div class="good-photo">' +
									'<img class="good-url" src="' + picture_url + '">' +
									'</div>' +
									'<div class="good-info">' +
									'<div class="row1">' +
									'<div class="good-name">' + product_name + '</div>' +
									'<div class="good-price">��' + product_price + '</div>' +
									'</div>' +
									'<div class="row2">' +
									'<div class="good-color">' + color + ' ' + memory_capacity + ' ' + supplier_name + ' ' + contract_name + '</div>' +
									'<div class="good-count">x' + product_number + '</div>' +
									'</div>' +
									'</div>' +
									'</div>';
							});
						} else {
							var goods_pic = "";
							var goods_des = "";
							if(order_type == "0") { //�仰��
								goods_pic = "img/pay_bill.png";
							} else if(order_type == "1") { //������
								goods_pic = "img/pay_flow.png";
							}
							productNums = 1;
							$.each(getdata.goodsinfo, function(index, getData) {
								//��Ʒ����
								var product_name = getData.product_name;
								//��Ʒid
								var product_id = getData.product_id;
								//��Ʒ�۸�
								var product_price = getData.product_price;
								pay_amount = parseFloat(product_price);
								productString = '<div class="line" data-product-id = "' + product_id + '"></div>' +
									'<div class="good">' +
									'<div class="good-photo">' +
									'<img class="good-url" src="' + goods_pic + '">' +
									'</div>' +
									'<div class="good-info">' +
									'<div class="row1">' +
									'<div class="good-name">' + product_name + '</div>' +
									'<div class="good-price">��' + product_price + '</div>' +
									'</div>' +
									'<div class="row2">' +
									'<div class="good-color"></div>' +
									'<div class="good-count">x1</div>' +
									'</div>' +
									'</div>' +
									'</div>';
							});

						}
						var bottom_string = "";
						switch(order_status) {
							case "1":
								bottom_string = '<div class="bottom-info-box add-h">' +
									'<div class="btn-close add-css order-again pay_order_btn" order-type="' + order_type + '">����</div>' +
									'<div class="add-css order-cencle cancle_order_btn">ȡ������</div>' +
									'</div>';
								break;
							case "2":
								bottom_string = '<div class="bottom-info-box add-h">' +
									'<div class="add-css order-deliver-goods remark_order_btn">���ѷ���</div>' +
									'</div>';
								break;
							case "3":
								bottom_string = '<div class="bottom-info-box add-h">' +
									'<div class="add-css order-deliver-goods sure_order_btn">ȷ���ջ�</div>' +
									'<div class="add-css order-cencle check_logistics_btn" id="' + delivery_way + '">�鿴����</div>' +
									'</div>';
								break;
							case "4":
								bottom_string = '<div class="bottom-info-box add-h">' +
									'<div class="add-css order-again evaluation_order_btn">����</div>' +
									'<div class="add-css order-cencle deleteAlert delete_order_btn">ɾ������</div>' +
									'</div>';
								break;
							case "5":
								bottom_string = '<div class="bottom-info-box add-h">' +
									'<span class="order-close">�����ѹر�</span>' +
									'</div>';
								break;
							default:
								break;
						}

						var needString = '<div class="order_container" id="' + order_no + '">' +
							'<div class="goods-item">' +
							'<div class="shop_name_container">' +
							'<span class="shop_name one_line_font">' + shop_name + '</span>' +
							'<span class="order_pay_online">' + created_at + '-' + payWay + '</span>' +
							'</div>' +
							'</div>' +
							'<div class="goods-item">' +
							'<div class="bottom-box" order-type="' + order_type + '">' + productString + '</div>' +
							'<div class="line_all"></div>' +
							'<div class="bottom-info-box add-h">' +
							'<div class="order-fee-div">��' + pay_amount.toFixed(2) + '<span class="order-fee-span">�����˷ѣ���0.00��</span></div>' +
							'<span class="order-count-span">�ϼƣ�</span>' +
							'<span class="order-count-span2">����' + productNums + '��</span>' +
							'</div>' + bottom_string +
							'</div>' +
							'</div>';
						switch(note_id) {
							case "panel1":
								$(needString).appendTo("#panel1");
								break;
							case "panel2":
								$(needString).appendTo("#panel2");
								break;
							case "panel3":
								$(needString).appendTo("#panel3");
								break;
							case "panel4":
								$(needString).appendTo("#panel4");
								break;
							case "panel5":
								$(needString).appendTo("#panel5");
								break;
							default:
								break;
						}

					});
				}

				//ȡ������
				$(".car-container").on("click", ".cancle_order_btn", function() {
					//�������
					var orderNum = $(this).parents(".order_container").attr("id");
					console.log("ȡ������orderNum=" + orderNum);
					//�ӿ�·��
					var urlPath_cancelOrder = "mrsyg/kquser/OrderCancel.form";
					var need_data_cancelOrder = {
						"order_no": orderNum
					}
					var data_cancelOrder = myAjax(urlPath_cancelOrder, need_data_cancelOrder);
					if(data_cancelOrder != undefined) {
						popHtml("ȡ�������ɹ�");
						//ˢ��ȫ������
						$("#panel1").empty();
						$("#all_num_counts").text("0");
						var data_one = myAjax(urlPath_one, need_data_all);
						if(data_one != undefined && data_one.hasOwnProperty("orderinfo")) {
							init(data_one, "panel1", "all_num_counts");
						}
						var allNum = $("#all_num_counts").text();
						if(allNum == 0) {
							var noOrderStringOne = '<div class="no_order" id="no_order_one">' +
								'<img class="no_order_pic" src="img/no_order.png" />' +
								'<div class="no_order_content" style="">���޶���</div>' +
								'</div>';
							$(noOrderStringOne).appendTo("#panel1");
						}
						//ˢ�´�����
						$("#panel2").empty();
						$("#payment_num_counts").text("0");
						var data_payment = myAjax(urlPath_payment, need_data_payment);
						if(data_payment != undefined && data_payment.hasOwnProperty("orderinfo")) {
							init(data_payment, "panel2", "payment_num_counts");
						}
						var paymentNum = $("#payment_num_counts").text();
						if(paymentNum == 0) {
							var noOrderString = '<div class="no_order" id="no_order_two">' +
								'<img class="no_order_pic" src="img/no_order.png" />' +
								'<div class="no_order_content" style="">���޶���</div>' +
								'</div>';
							$(noOrderString).appendTo("#panel2");
						}
					}
				});
				//����
				var pay_orderNum = "";
				var pay_orderType = "";
				$(".car-container").on("click", ".pay_order_btn", function() {
					//�������
					pay_orderNum = $(this).parents(".order_container").attr("id");
					pay_orderType = $(this).attr("order-type");
					//֧�����
					var needPay = $(this).parent().siblings(".bottom-info-box").find(".order-fee-div").text();
					$(".pay-wechat-span").text(needPay);
					console.log("����orderNum=" + pay_orderNum + ",pay_orderType=" + pay_orderType);
					$("#pay-order").show();
				});
				//���ѷ���
				$(".car-container").on("click", ".remark_order_btn", function() {
					//�������
					var orderNum = $(this).parents(".order_container").attr("id");
					//alert("���ѷ���orderNum=" + orderNum);
					//�ӿ�·��
					var urlPath_remindDelivery = "mrsyg/kquser/RemindDelivery.form";
					var need_data_remindDelivery = {
						"order_no": orderNum
					}
					var data_remindDelivery = myAjax(urlPath_remindDelivery, need_data_remindDelivery);
					if(typeof(data_remindDelivery) != "undefined") {
						popHtml("���������ң����췢����");
					}
				});

				//�鿴����
				$(".car-container").on("click", ".check_logistics_btn", function() {
					//���ͷ�ʽ:0��������1�ͻ�����
					var deliveryWay = $(this).attr("id");
					if(deliveryWay == "1") {
						//�������
						var orderNum = $(this).parents(".order_container").attr("id");
						console.log("�鿴����");
						window.location.href = "express-infor.jsp?jump_order_id=" + orderNum;
					} else {
						popHtml("��ѡ������ͷ�ʽΪ�������ᣬû��������Ϣ");
					}
				});

				//ȷ���ջ�
				$(".car-container").on("click", ".sure_order_btn", function() {
					//�������
					var orderNum = $(this).parents(".order_container").attr("id");
					console.log("ȷ���ջ�orderNum=" + orderNum);
					var urlPath_takenOrder = "mrsyg/kquser/OrderTaken.form";
					var need_data_takenOrder = {
						"order_no": orderNum
					}
					var data_takenOrder = myAjax(urlPath_takenOrder, need_data_takenOrder);
					if(data_takenOrder != undefined) {
						var counts = parseInt($("#pending_num_counts").text());
						var counts = counts - 1;
						$("#pending_num_counts").text(counts)
						$(this).parents(".order_container").remove();
						popHtml("ȷ���ջ��ɹ�");
						window.location.href = "my_order.jsp";
					}

				});

				//ɾ������
				$(".car-container").on("click", ".delete_order_btn", function() {
					//�������
					var $_this = $(this);
					var orderNum = $(this).parents(".order_container").attr("id");
					console.log("ɾ������orderNum=" + orderNum);
					//$(".delete-order").show();
					var urlPath_deleteOrder = "mrsyg/kquser/OrderDelete.form";
					var need_data_deleteOrder = {
						"order_no": orderNum
					}
					var data_deleteOrder = myAjax(urlPath_deleteOrder, need_data_deleteOrder);
					if(data_deleteOrder != undefined) {
						popHtml("ɾ�������ɹ�");
						//ˢ��ȫ������
						$("#panel1").empty();
						$("#all_num_counts").text("0");
						var data_one = myAjax(urlPath_one, need_data_all);
						if(data_one != undefined && data_one.hasOwnProperty("orderinfo")) {
							init(data_one, "panel1", "all_num_counts");
						}
						var allNum = $("#all_num_counts").text();
						if(allNum == 0) {
							var noOrderStringOne = '<div class="no_order" id="no_order_one">' +
								'<img class="no_order_pic" src="img/no_order.png" />' +
								'<div class="no_order_content" style="">���޶���</div>' +
								'</div>';
							$(noOrderStringOne).appendTo("#panel1");
						}
						//ˢ�´�����
						$("#panel5").empty();
						$("#evaluation_num_counts").text("0");
						var data_evaluation = myAjax(urlPath_evaluation, need_data_evaluation);
						if(data_evaluation != undefined && data_evaluation.hasOwnProperty("orderinfo")) {
							init(data_evaluation, "panel5", "evaluation_num_counts");
						}
						var evaluationNum = $("#evaluation_num_counts").text();
						if(evaluationNum == 0) {
							var noOrderString = '<div class="no_order" id="no_order_five">' +
								'<img class="no_order_pic" src="img/no_order.png" />' +
								'<div class="no_order_content" style="">���޶���</div>' +
								'</div>';
							$(noOrderString).appendTo("#panel5");
						}
					}

				});
				//����
				$(".car-container").on("click", ".evaluation_order_btn", function() {
					//��Ʒid ---> data-product-id
					//var product_id = $(this).parent().siblings(".bottom-box").find(".line").attr("data-product-id")
					var need_product_id = "";
					var product_num = 0;
					var need_title = "";
					var need_text = "";
					$(this).parent().siblings(".bottom-box").find(".line").each(function(i, obj) {
						if(i == 0) {
							need_product_id = $(obj).attr("data-product-id");
						}
						product_num = product_num + 1;
					});
					//					var title = $(this).parent().siblings(".bottom-box").find(".good-name").text();
					//					var text = $(this).parent().siblings(".bottom-box").find(".good-color").text();
					$(this).parent().siblings(".bottom-box").find(".good-name").each(function(i, obj) {
						if(i == 0) {
							need_title = $(obj).text();
						}
					});
					$(this).parent().siblings(".bottom-box").find(".good-color").each(function(i, obj) {
						if(i == 0) {
							need_text = $(obj).text();
						}
					});
					var imageUrl = $(this).parent().siblings(".bottom-box").find(".good-url").attr("src");
					var order_no = $(this).parents(".order_container").attr("id")
					if(product_num > 1) {
						need_title = need_title + "��" + product_num + "����Ʒ";
					}
					console.log("product_id=" + need_product_id + ",title=" + need_title + ",text=" + need_text + ",imageUrl=" + imageUrl + ",order_no=" + order_no)

					var Persion = {
						title: need_title,
						text: need_text,
						imageUrl: imageUrl,
						order_no: order_no,
						product_id: need_product_id
					}
					native.openCommentView(JSON.stringify(Persion));
				});

				//��������
				$(".car-container").on("click", ".bottom-box", function() {
					//�������
					var orderNum = $(this).parents(".order_container").attr("id");
					//��������
					var orderType = $(this).attr("order-type");
					console.log("�������飬��������=orderType" + orderType);
					if(orderType == "2") {
						native.openWebView("my_order_details.jsp?jump_order_num=" + orderNum);
					} else {
						popHtml("�Բ��𣬴˶����޷��鿴����");
					}

				});

				//���ȷ������رյ���
				$(".cancel-pay").on("click", function() {
					$("#pay-order").hide();
				});

				//����ر�ȡ����������
				$(".close img").on("click", function() {
					$("#close-order-panel").hide();
				});

				//������ҳ��ɾ���������򣬵��ȡ�������ص���
				$(".ture-cancel").on("click", function() {
					$(".delete-order").hide();
				});

				//ѡ��֧����ʽ
				var payType = "alipay";
				$(".pay-way-chose").bind("click", function() {
					payType = $(this).attr("id");
					if(payType == "wechat") {
						popHtml("΢��֧����δ��ͨ");
						payType = "alipay";
					} else {
						//					if(!$(this).find(".chose").hasClass("chose-pay-yes")) {
						//						$(this).find(".chose").addClass("chose-pay-yes");
						//						$(this).siblings(".pay-way-chose").find(".chose").removeClass("chose-pay-yes");
						//					}
					}

				});
				//���X�ر�֧������
				$(".chose-pay-img").on("click", function() {
					$("#pay-order").hide();
				});

				//���ȷ��֧��
				$(".sure-pay").on("click", function() {
					if(payType == "alipay") {
						localStorageObj.setItem("order_num", pay_orderNum);
						//order_pay_way���ʽ:0֧����1΢��
						localStorageObj.setItem("order_pay_way", "0");
						//order_pay_type����:0���ѳ�ֵ1������ֵ2��Ʒ����
						localStorageObj.setItem("order_pay_type", pay_orderType);
						console.log("����֧������pay_orderType=" + pay_orderType);
						//΢��֧��
						var data = '<div class="iframe_container" id="iframe_alipayment">' +
							'<iframe id="iframe_alipayment_id" src="alipayment.jsp" width="100%" height="100%" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>' +
							'</div>';
						$(data).appendTo("body");
						$("#iframe_alipayment").show();
					} else {
						popHtml("΢��֧����δ��ͨ")
					}
				});

			})(jQuery, document);
		</script>
	</body>

</html>
