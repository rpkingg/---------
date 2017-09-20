$(function() {
	//��ȡ���ش洢����
	var localStorageObj = window.localStorage;

	//����Ĭ���ջ���ַ
	$(".manage-address-container").on("click", ".set-default", function() {
		if($(this).find('.iconfont').hasClass('icon-quan')) {
			$(this).parents('.manage-address-container').find('.set-default .iconfont').removeClass('icon-xuanzedui');
			$(this).parents('.manage-address-container').find('.set-default span:nth-child(even)').removeClass('default-text');
			$(this).parents('.manage-address-container').find('.set-default .iconfont').addClass('icon-quan');
			$(this).find('.iconfont').addClass('icon-xuanzedui');
			$(this).find('span:nth-child(even)').addClass('default-text');
			//����ջ���ַid
			var receiver_id = $(this).parents(".goods-address-item").attr("id");
			var urlPath_defaultAddress = "mrsyg/kquser/DefaultAddress.form";
			var need_defaultAddress = {
				"address_id": receiver_id
			};
			var data_defaultAddress = myAjax(urlPath_defaultAddress, need_defaultAddress);
			if(data_defaultAddress != undefined) {
				alert("���óɹ�");
			}
		}
	});

	//ɾ���ջ���ַ
	$(".manage-address-container").on("click", ".del-address", function() {
		//��õ�ַid
		var addressId = $(this).parents(".goods-address-item").attr("id");
		var urlPath_delAddress = "mrsyg/kquser/DeleteAddress.form";
		var need_delAddress = {
			"address_id": addressId
		};
		var data_delAddress = myAjax(urlPath_delAddress, need_delAddress);
		if(data_delAddress != undefined) {
			alert("ɾ����ַ�ɹ�");
			$(this).parents(".goods-address-item").empty();
		}
	});

	//�༭�ջ���ַ
	$(".manage-address-container").on("click", ".edit-address", function() {
		localStorageObj.setItem("add_or_edit_flag", "edit");
		//��ȡ�ջ�������
		var name = $(this).parent().siblings(".goods-address").find(".receiver_name").text();
		localStorageObj.setItem("edit_address_name", name);
		//��ȡ�ջ��˵绰
		var phone = $(this).parent().siblings(".goods-address").find(".receiver_phone").text();
		localStorageObj.setItem("edit_address_phone", phone);
		//�ջ�����
		var arrdess_area = $(this).parent().siblings(".goods-address").find(".receiver_area").text();
		localStorageObj.setItem("edit_address_area", arrdess_area);
		//�ջ���ϸ��ַ
		var detail_area = $(this).parent().siblings(".goods-address").find(".receiver_detail_area").text();
		localStorageObj.setItem("edit_address_detail", detail_area);
		//�ջ���ַid
		var arrdess_id = $(this).parents(".goods-address-item").attr("id");
		localStorageObj.setItem("edit_address_id", arrdess_id);
		var needString = '<div class="iframe_container" id="iframe_addOrEdit_address">' +
			'<iframe id="iframe_addOrEdit_address_id" src="addOrEdit_address.html" width="100%" height="100%" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>' +
			'</div>';
		$(needString).appendTo("body");
		$("#iframe_addOrEdit_address").show();
	});
	//���༭�ջ���ַ����ҳ��ر�ʱ����ǰҳ�����ñ༭���ջ���ַ
	$($("#iframe_addOrEdit_address_id")[0].contentWindow).on("setReceiverAddress", function() {
		//�༭���ջ���ַid
		var editAddress_id = localStorageObj.getItem("edit_address_id");
		//��ȡ�༭���ջ�������
		var edit_name = localStorageObj.getItem("edit_address_name");
		//��ȡ�༭���ջ��˵绰
		var edit_phone = localStorageObj.getItem("edit_address_phone");
		//��ȡ�ջ�����
		var edit_area = localStorageObj.getItem("edit_address_area");
		//��ȡ�ջ���ϸ��ַ
		var edit_detail_area = localStorageObj.getItem("edit_address_detail");
		$(".goods-address-item").each(function(index, obj) {
			if($(obj).attr("id") == editAddress_id) {
				//���������Ϣ
				$(obj).find(".receiver_name").text(edit_name);
				$(obj).find(".receiver_phone").text(edit_phone);
				$(obj).find(".receiver_area").text(edit_area);
				$(obj).find(".receiver_detail_area").text(edit_detail_area);
			}
		});
	});
	
	//����ջ���ַ
	$(".add_new_address").bind("click",function(){
		localStorageObj.setItem("add_or_edit_flag", "add");
		$("#iframe_addOrEdit_address").show();
	});
	//�������ջ���ַ����ҳ��ر�ʱ����ǰҳ�������������ջ���ַ����Ϣ
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
		var needString = '<div class="goods-address-item col-xs-12" id="' + newid + '">' +
				'<div class="goods-address col-xs-12">' +
				'<span class="address-user-info col-xs-12"><span class="receiver_name">' + newname + '</span>(<span class="receiver_phone">' + newphone + '</span>)</span>' +
				'<span class="address-detail-info col-xs-12">' +
				'<span class="receiver_area">' + newarea + '</span>' +
				'<span class="receiver_detail_area">' + newdetailarea + '</span></span>' +
				'</div>' +
				'<div class="address-opt-bar col-xs-12">' +
				'<div class="set-default col-xs-6" set-default-get-goods-address>' +
				'<span class="iconfont icon-quan"></span>' +
				'<span>��ΪĬ��</span>' +
				'</div>' +
				'<div class="del-address col-xs-2 col-xs-offset-1 text-right">' +
				'<span class="iconfont icon-shanchu"></span>' +
				'<span>ɾ��</span>' +
				' </div>' +
				'<div class="edit-address col-xs-2 col-xs-offset-1 text-right">' +
				'<span class="iconfont icon-bianji2"></span>' +
				'<span>�༭</span>' +
				' </div>' +
				'</div>' +
				'</div>';
			$(needString).appendTo(".manage-address-container");
	});
	

	//�ӿ�·���������ջ���ַ-��ʼ����
	//mrsyg/kquser/MyAddress.form
	var urlPath_address = "mrsyg/kquser/MyAddress.form";
	var need_address = {};
	var data_address = myAjax(urlPath_address, need_address);
	if(data_address != undefined) {
		initAddress(data_address);
	}

	function initAddress(datas) {
		$.each(datas.data, function(index, getdata) {
			//��ַid
			var address_id = getdata.address_id;
			//�ջ�������
			var receiver_name = getdata.receiver_name;
			//�ջ���id
			var customer_id = getdata.customer_id;
			//�ջ��˵绰
			var receiver_phone = getdata.receiver_phone;
			//�ջ�����
			var receiver_area = getdata.receiver_area;
			//�ջ���ϸ��ַ
			var detail_address = getdata.detail_address;
			//�Ƿ���Ĭ���ջ���ַ��1��ʾ�ǣ�0 ��ʾ���ǣ�
			var address_flag = getdata.address_flag;
			var addressFlagClass = "";
			var needIcon = "icon-quan";
			if(address_flag == 1) {
				addressFlagClass = 'class="default-text"';
				needIcon = "icon-xuanzedui";
			}
			var needString = '<div class="goods-address-item col-xs-12" id="' + address_id + '">' +
				'<div class="goods-address col-xs-12">' +
				'<span class="address-user-info col-xs-12"><span class="receiver_name">' + receiver_name + '</span>(<span class="receiver_phone">' + receiver_phone + '</span>)</span>' +
				'<span class="address-detail-info col-xs-12">' +
				'<span class="receiver_area">' + receiver_area + '</span>' +
				'<span class="receiver_detail_area">' + detail_address + '</span></span>' +
				'</div>' +
				'<div class="address-opt-bar col-xs-12">' +
				'<div class="set-default col-xs-6" set-default-get-goods-address>' +
				'<span class="iconfont ' + needIcon + '"></span>' +
				'<span ' + addressFlagClass + '>��ΪĬ��</span>' +
				'</div>' +
				'<div class="del-address col-xs-2 col-xs-offset-1 text-right">' +
				'<span class="iconfont icon-shanchu"></span>' +
				'<span>ɾ��</span>' +
				' </div>' +
				'<div class="edit-address col-xs-2 col-xs-offset-1 text-right">' +
				'<span class="iconfont icon-bianji2"></span>' +
				'<span>�༭</span>' +
				' </div>' +
				'</div>' +
				'</div>';
			$(needString).appendTo(".manage-address-container");
		});
	}

})