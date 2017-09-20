$(function() {
	//��ñ��ش洢�Ķ���
	var localStorageObj = window.localStorage;

	//������ݺ󷵻�ȷ������������߷�����Ʒ����ҳ��
	$("body").on("click", ".goods-address-item", function() {
		//�ж��Ƿ���ã�0��ʾ�ǣ�1��ʾ���ǣ�
		var userFlag = $(this).attr("userFlag");
		if(userFlag == 0) {
			//��ȡ��ַid
			var address_id = $(this).attr("id");
			localStorageObj.setItem("receiver_address_id", address_id);
			//����ջ���ַ
			var selected_address = $(this).find("#address_content_id").text();
			localStorageObj.setItem("selected_address", selected_address);
			//����ջ�������
			var receiver_name = $(this).find("#receiver_name_id").text();
			localStorageObj.setItem("receiver_name", receiver_name);
			//����ջ��˵绰
			var receiver_phone = $(this).find("#receiver_phone_id").text();
			localStorageObj.setItem("receiver_phone", receiver_phone);

			$(this).find(".selected-address").addClass("icon-xuanzedui");
			$(this).siblings().find(".selected-address").removeClass("icon-xuanzedui");

			//����ȷ�϶�����������ջ���ַ��Ϣ
			window.parent.document.getElementById("iframe_select_address").style.display = "none";
			//ҳ��֮��ͨѶ������ǰҳ��رյ�ʱ�򣬸�ҳ����һЩ���飩
			window.parent.$(window).trigger("setReceiverAddress");

		} else if(userFlag == 1) {
			alert("�Բ��𣬴˵�ַ���ڷ�����");
		}
	});

	//�����ջ���ַ
	$(".add_new_address_btn").bind("click", function() {
		localStorageObj.setItem("add_or_edit_flag", "add");
		//window.location.href="addOrEdit_address.html";
		$("#iframe_addOrEdit_address").show();
	});
	//��ѡ���ջ���ַ����ҳ��ر�ʱ����ǰҳ������ѡ����ջ���ַ����Ϣ
	$($("#iframe_addOrEdit_address_id")[0].contentWindow).on("setNewAddress", function() {
		//�ջ���ַid
		var newid=localStorageObj.getItem("new_address_id");
		//�ջ�������
		var newname=localStorageObj.getItem("new_address_name");
		//�ջ��˵绰
		var newphone=localStorageObj.getItem("new_address_phone");
		//�ջ���ַ(ʡ����)
		var newarea=localStorageObj.getItem("new_address_area");
		//�ջ���ַ(��ϸ��ַ)
		var newdetailarea=localStorageObj.getItem("new_address_detail");
		alert("��ַ="+newname+"--"+newphone+"--"+newarea+"--"+newdetailarea);
		var needString = '<div class="goods-address-item col-xs-12" id="' + newid + '" userFlag="1">' +
				'<div class="select-icon col-xs-1">' +
				'<span class="selected-address iconfont icon-quan"></span>' +
				'</div>' +
				'<div class="goods-address col-xs-11 pull-right">' +
				'<span class="address-user-info col-xs-12"><span id="receiver_name_id">' + newname + '</span>(<span id="receiver_phone_id">' + newphone + '</span>)</span>' +
				'<span class="address-detail-info col-xs-12">' + 
				'<span id="address_content_id">' + newarea + newdetailarea + '</span>' +
				' </span>' +
				'</div>' +
				'</div>';
			$(needString).appendTo("#goods_address_container");
	});

	//�ӿ�·����ѡ���ջ���ַ��
	//mrsyg/kqgoods/SelectAddress.form
	var urlPath_one = "mrsyg/kqgoods/SelectAddress.form";
	var need_data = {};
	var data_one = myAjax(urlPath_one, need_data);
	if(data_one != undefined) {
		init(data_one);
	}

	function init(datas) {
		if(datas.data == undefined) {
			$(".no_address").show();
		}
		$.each(datas.data, function(index, getdata) {
			//�ջ���ַid
			var address_id = getdata.address_id;
			//�ջ�������
			var receiver_name = getdata.receiver_name;
			//�ջ��˵绰
			var receiver_phone = getdata.receiver_phone;
			//�ջ��˵���
			var receiver_area = getdata.receiver_area;
			//�ջ�����ϸ��ַ
			var detail_address = getdata.detail_address;
			//�Ƿ���Ĭ�ϵ�ַ��1��ʾ�ǣ�0 ��ʾ����
			var address_flag = getdata.address_flag;
			var default_address = "";
			if(address_flag == 1) {
				default_address = '<span class="default-address-tip">[Ĭ�ϵ�ַ]</span>';
			}
			//��ַ�Ƿ��ѡ��0��ʾ�ǣ�1��ʾ���ǣ�
			var use_flag = getdata.use_flag;
			var needString = '<div class="goods-address-item col-xs-12" id="' + address_id + '" userFlag="' + use_flag + '">' +
				'<div class="select-icon col-xs-1">' +
				'<span class="selected-address iconfont icon-quan"></span>' +
				'</div>' +
				'<div class="goods-address col-xs-11 pull-right">' +
				'<span class="address-user-info col-xs-12"><span id="receiver_name_id">' + receiver_name + '</span>(<span id="receiver_phone_id">' + receiver_phone + '</span>)</span>' +
				'<span class="address-detail-info col-xs-12">' + default_address +
				'<span id="address_content_id">' + receiver_area + detail_address + '</span>' +
				' </span>' +
				'</div>' +
				'</div>';
			$(needString).appendTo("#goods_address_container");
		});
	}
})