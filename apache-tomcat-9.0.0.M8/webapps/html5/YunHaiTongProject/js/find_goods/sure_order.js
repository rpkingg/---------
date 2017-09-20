(function($, doc) {
	$.init();
	$.ready(function() {
		//���ʽ
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
		//���ͷ�ʽ
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

//��ñ��ش洢�Ķ���
var localStorageObj = window.localStorage;
var order_no="";//�������
var order_name="goods";//��������
var order_price="0.1";//�����۸�
var order_show_page="http://120.76.190.223:8988/html5/YunHaiTongProject/pay_success.html";//չʾҳ�������


//�ӿ�·����ȷ�϶�����
//mrsyg/kqgoods/PurchaseNow.form?product_detail_id=1&product_number=1&contract_id=1
var urlPath_one = "mrsyg/kqgoods/PurchaseNow.form";
var need_data = {
	"product_detail_id": localStorageObj.getItem("product_detail_id"),
	"product_number": localStorageObj.getItem("product_count"),
	"contract_id": localStorageObj.getItem("product_contract_id")
};
var data_one = myAjax(urlPath_one, need_data);
if(data_one != undefined) {
	init(data_one);
}

//��ȡ�ջ���ַid(Ĭ�϶�λ���ջ���ַidΪ��)
var address_id_from_other = localStorage.getItem("receiver_address_id");
if(address_id_from_other.length > 0) {
	//��ʾ�ջ���ַ
	$(".has-default-address").show();
} else {
	//��ʾѡ���ջ���ַ
	$(".no-default-address").show();
}

//ѡ���ջ���ַ�¼�
$('.get-goods-address').click(function(e) {
	//��ʾ�ջ���ַҳ��
	$("#iframe_select_address").show();
});
//��ѡ���ջ���ַ����ҳ��ر�ʱ����ǰҳ������ѡ����ջ���ַ����Ϣ
$($("#iframe_select_address_id")[0].contentWindow).on("setReceiverAddress", function() {
	//�����ջ���ַid
	alert("��ʾѡ�е��ջ���ַ");
	//�����ջ�������
	$("#receiver_name_id").text(localStorageObj.getItem("receiver_name"));
	//�����ջ��˵绰
	$("#receiver_phone_id").text(localStorageObj.getItem("receiver_phone"));
	//�����ջ���ַ
	$("#receiver_address_id").text(localStorageObj.getItem("selected_address"));
	//����ѡ���ջ���ַ
	$(".no-default-address").hide();
	//��ʾ�ջ���ַ
	$(".has-default-address").show();
});

//�����ŵ� ѡ���¼�
$('.distribution-store').click(function(e) {
	//��ʾѡ�����ҳ��
	$("#iframe_select_store").show();
});
//��ѡ�������ŵ����ҳ��ر�ʱ����ǰҳ������ѡ��ĵ�����Ϣ
$($("#iframe_select_store_id")[0].contentWindow).on("setShopInfo", function() {
	//���õ���id
	$(".distribution-store-base").attr("id", localStorageObj.getItem("shop_id"));
	//���õ�������
	$("#shop_grade_score_container").empty();
	$("#shop_name_id").text(localStorageObj.getItem("shop_name"));
	//���õ��̵ȼ�
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
	//���õ��̵�ַ
	$("#shop_address_id").text(localStorageObj.getItem("shop_address"));
});

//ѡ����Ʒ����ȯ�¼�
$('.goods-voucher').click(function(e) {
	//��ʾѡ���Ż�ȯҳ��
	$("#iframe_select_vouchers").show();
});
//��ѡ���Ż�ȯ����ҳ��ر�ʱ����ǰҳ������ѡ����Ż�ȯ
$($("#iframe_select_vouchers_id")[0].contentWindow).on("setServeAmount", function() {
	//�����Ż�ȯ���
	$("#voucher-sum").text("-��" + localStorageObj.getItem("coupon_amount"));
	//����--С��--���
	var sub_total = parseFloat(localStorageObj.getItem("product_sum_prices")) - parseFloat(localStorageObj.getItem("coupon_amount"));
	$("#sub_total").text("��" + sub_total);
	//����--��֧��--���
	$("#need_pay").text("��" + sub_total);
	//����--֧������--���
	$("#pop_up_money").text("��" + sub_total);
});

//����֧���¼�������ѡ��֧����ʽ����
$('.pay-now').click(function(e) {
	//�����ж��Ƿ�ѡ�����ջ���ַ����Ϊ�գ�
	var isSelectedReceiverAddress = localStorageObj.getItem("receiver_address_id");
	if(isSelectedReceiverAddress.length > 0) {
		//��ø��ʽ(0����֧��1��������)
		var pay_way = $("#payModeText").text().trim();
		if(pay_way == "��������") {
			pay_way = 1;
		} else if(pay_way == "����֧��") {
			pay_way = 0;
		}
		//������ͷ�ʽ(0��������1�ͻ�����)
		var delivery_way = $("#distributionModeText").text();
		if(delivery_way == "��������") {
			delivery_way = 0;
		} else if(delivery_way == "�ͻ�����") {
			delivery_way = 1;
		}
		//���ɶ���
		//�ӿ�·�������ɶ�����
		//mrsyg/kqgoods/BuildOrder.form?product_detail_id=1&contract_id=1&product_number=1&address_id=162&pay_way=0&delivery_way=0&shop_id=25&coupon_id=
		var urlPath_builderOrder = "mrsyg/kqgoods/BuildOrder.form";
		var need_builderOrder = {
			"product_detail_id": localStorageObj.getItem("product_detail_id"),
			"contract_id": localStorageObj.getItem("product_contract_id"),
			"product_number": localStorageObj.getItem("product_count"),
			"address_id": localStorageObj.getItem("receiver_address_id"),
			"pay_way": pay_way,
			"delivery_way": delivery_way,
			"shop_id": localStorageObj.getItem("shop_id"),
			"coupon_id": localStorageObj.getItem("coupon_id")
		};
		
		var data_builderOrder = myAjax(urlPath_builderOrder, need_builderOrder);
		if(data_builderOrder != undefined) {
			//��÷��صĶ������
			order_no = data_builderOrder.order_no;
			if(pay_way == 0) {
				//����֧����ʽѡ���
				$('.backdrop').show();
				$('.select-pay-tool-container').show();
				$("body").on("touchmove", function(event) {
					event.preventDefault;
				}, false);
			} else {
				//��ת���ҵĶ���ҳ��
				window.location.href = "my_order.html";
			}
		}
	} else {
		alert("��ѡ���ջ���ַ");
	}
});

//ȡ������֧��
$('.backdrop,.icon-guanbi').click(function(e) {
	$('.select-pay-tool-container').hide();
	$('.backdrop').hide();
	$("body").off("touchmove");
});


//֧������΢��֧�����л�
var payWay="";
$('.pay-tool-item').click(function() {
	payWay=$(this).find(".pay-tool-name").attr("id");
	if($(this).find('.iconfont').hasClass('icon-quan')) {
		$(this).find('.iconfont').removeClass('icon-quan');
		$(this).find('.iconfont').addClass('icon-xuanzedui');
		$(this).siblings('div').find('.iconfont').removeClass('icon-xuanzedui');
		$(this).siblings('div').find('.iconfont').addClass('icon-quan');
	}
});

//ȷ��֧��
$('.sure-pay-opt-nar').click(function(e) {
	if (payWay=="1") {
		//֧����֧��
		alert("֧����");
		$("#WIDout_trade_no").val(order_no);
		$("#WIDsubject").val(order_name);
		$("#WIDtotal_fee").val(order_price);
		$("#WIDshow_url").val(order_show_page);
		$("#WIDbody").val(order_no);
		$("#payFrom").submit();
	} else if(payWay=="2"){
		localStorageObj.setItem("order_num",order_no);
		localStorageObj.setItem("order_pay_way","1");
		//΢��֧��
		var data='<div class="iframe_container" id="iframe_alipayment">'+
			'<iframe id="iframe_alipayment_id" src="alipayment.html" width="100%" height="100%" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>'+
			'</div>';
		$(data).appendTo("body");
		$("#iframe_alipayment").show();
		alert("΢��");
	}
	
});

function init(data) {
	//�ջ���ַ
	var address_id = data.address_id;
	alert("address_id="+address_id);
	localStorageObj.setItem("receiver_address_id", address_id);
	//�ջ�������
	var receiver_name = data.receiver_name;
	alert("receiver_name="+receiver_name);
	$("#receiver_name_id").text(receiver_name);
	//�ջ��˵绰
	var receiver_phone = data.receiver_phone;
	$("#receiver_phone_id").text(receiver_phone);
	//����������
	var receiver_area = data.receiver_area;
	//��ϸ��ַ
	var detail_address = data.detail_address;
	$("#receiver_address_id").text(receiver_area + " " + detail_address);
	//Ĭ�ϸ��ʽ(0����֧��1��������)
	var pay_way = data.pay_way;
	if(pay_way == 0) {
		$("#payModeText").text("����֧��");
	} else if(pay_way == 1) {
		$("#payModeText").text("��������");
	}
	//��������
	var shop_name = data.shop_name;
	localStorageObj.setItem("shop_name", shop_name);
	$("#shop_name_id").text(shop_name);
	//���̵ȼ�
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
	//���̵�ַ
	var shop_address = data.shop_address;
	$("#shop_address_id").text(shop_address);
	//����id
	var shop_id = data.shop_id;
	localStorage.setItem("shop_id", shop_id);
	$(".distribution-store-base").attr("id", shop_id);
	//Ĭ�����ͷ�ʽ(0��������1�ͻ�����)
	var delivery_way = data.delivery_way;
	if(delivery_way == 0) {
		$("#distributionModeText").text("��������");
	} else if(delivery_way == 1) {
		$("#distributionModeText").text("�ͻ�����");
	}
	//��Ʒid
	var product_id = data.product_id;
	//��ƷͼƬ
	var picture_url = data.picture_url;
	$("#product_pic_id").attr("src", picture_url);
	//��Ʒ����
	var product_name = data.product_name;
	$("#product_name_id").text(product_name);
	//��Ʒ�۸�
	var product_price = data.product_price;
	$("#product_price_id").text(product_price);
	//��Ʒ����
	var product_number = data.product_number;
	$("#product_count_id").text(product_number);
	//��Ʒ��ɫ
	var color = data.color;
	//��Ʒ�ڴ�����
	var memory_capacity = data.memory_capacity;
	//��Ʒ��Ӫ��
	var supplier_desc = data.supplier_desc;
	//��Ʒ�ײ�����
	var contract_name = data.contract_name;
	$("#product_par").text(color + " " + memory_capacity + " " + supplier_desc + " " + contract_name);
	//��Ʒ�ܼ�
	var price_sum = data.price_sum;
	//������Ʒ�ܼ�
	$("#product_sum_price").text(price_sum);
	//����--С��--���
	$("#sub_total").text("��" + price_sum);
	//����--��֧��--���
	$("#need_pay").text("��" + price_sum);
	//����--֧������--���
	$("#pop_up_money").text("��" + price_sum);
	localStorageObj.setItem("product_sum_prices", price_sum);
}