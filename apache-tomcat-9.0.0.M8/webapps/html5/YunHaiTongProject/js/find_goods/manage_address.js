$(function() {
	//获取本地存储对象
	var localStorageObj = window.localStorage;

	//设置默认收货地址
	$(".manage-address-container").on("click", ".set-default", function() {
		if($(this).find('.iconfont').hasClass('icon-quan')) {
			$(this).parents('.manage-address-container').find('.set-default .iconfont').removeClass('icon-xuanzedui');
			$(this).parents('.manage-address-container').find('.set-default span:nth-child(even)').removeClass('default-text');
			$(this).parents('.manage-address-container').find('.set-default .iconfont').addClass('icon-quan');
			$(this).find('.iconfont').addClass('icon-xuanzedui');
			$(this).find('span:nth-child(even)').addClass('default-text');
			//获得收货地址id
			var receiver_id = $(this).parents(".goods-address-item").attr("id");
			var urlPath_defaultAddress = "mrsyg/kquser/DefaultAddress.form";
			var need_defaultAddress = {
				"address_id": receiver_id
			};
			var data_defaultAddress = myAjax(urlPath_defaultAddress, need_defaultAddress);
			if(data_defaultAddress != undefined) {
				alert("设置成功");
			}
		}
	});

	//删除收货地址
	$(".manage-address-container").on("click", ".del-address", function() {
		//获得地址id
		var addressId = $(this).parents(".goods-address-item").attr("id");
		var urlPath_delAddress = "mrsyg/kquser/DeleteAddress.form";
		var need_delAddress = {
			"address_id": addressId
		};
		var data_delAddress = myAjax(urlPath_delAddress, need_delAddress);
		if(data_delAddress != undefined) {
			alert("删除地址成功");
			$(this).parents(".goods-address-item").empty();
		}
	});

	//编辑收货地址
	$(".manage-address-container").on("click", ".edit-address", function() {
		localStorageObj.setItem("add_or_edit_flag", "edit");
		//获取收货人姓名
		var name = $(this).parent().siblings(".goods-address").find(".receiver_name").text();
		localStorageObj.setItem("edit_address_name", name);
		//获取收货人电话
		var phone = $(this).parent().siblings(".goods-address").find(".receiver_phone").text();
		localStorageObj.setItem("edit_address_phone", phone);
		//收货地区
		var arrdess_area = $(this).parent().siblings(".goods-address").find(".receiver_area").text();
		localStorageObj.setItem("edit_address_area", arrdess_area);
		//收货详细地址
		var detail_area = $(this).parent().siblings(".goods-address").find(".receiver_detail_area").text();
		localStorageObj.setItem("edit_address_detail", detail_area);
		//收货地址id
		var arrdess_id = $(this).parents(".goods-address-item").attr("id");
		localStorageObj.setItem("edit_address_id", arrdess_id);
		var needString = '<div class="iframe_container" id="iframe_addOrEdit_address">' +
			'<iframe id="iframe_addOrEdit_address_id" src="addOrEdit_address.html" width="100%" height="100%" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>' +
			'</div>';
		$(needString).appendTo("body");
		$("#iframe_addOrEdit_address").show();
	});
	//当编辑收货地址的子页面关闭时，当前页面设置编辑的收货地址
	$($("#iframe_addOrEdit_address_id")[0].contentWindow).on("setReceiverAddress", function() {
		//编辑的收货地址id
		var editAddress_id = localStorageObj.getItem("edit_address_id");
		//获取编辑的收货人姓名
		var edit_name = localStorageObj.getItem("edit_address_name");
		//获取编辑的收货人电话
		var edit_phone = localStorageObj.getItem("edit_address_phone");
		//获取收货地区
		var edit_area = localStorageObj.getItem("edit_address_area");
		//获取收货详细地址
		var edit_detail_area = localStorageObj.getItem("edit_address_detail");
		$(".goods-address-item").each(function(index, obj) {
			if($(obj).attr("id") == editAddress_id) {
				//设置相关信息
				$(obj).find(".receiver_name").text(edit_name);
				$(obj).find(".receiver_phone").text(edit_phone);
				$(obj).find(".receiver_area").text(edit_area);
				$(obj).find(".receiver_detail_area").text(edit_detail_area);
			}
		});
	});
	
	//添加收货地址
	$(".add_new_address").bind("click",function(){
		localStorageObj.setItem("add_or_edit_flag", "add");
		$("#iframe_addOrEdit_address").show();
	});
	//当新增收货地址的子页面关闭时，当前页面设置新增的收货地址的信息
	$($("#iframe_addOrEdit_address_id")[0].contentWindow).on("setNewAddress", function() {
		//收货地址id
		var newid=localStorageObj.getItem("new_address_id");
		//收货人名称
		var newname=localStorageObj.getItem("new_address_name");
		//收货人电话
		var newphone=localStorageObj.getItem("new_address_phone");
		//收货地址(省市区)
		var newarea=localStorageObj.getItem("new_address_area");
		//收货地址(详细地址)
		var newdetailarea=localStorageObj.getItem("new_address_detail");
		alert("地址="+newname+"--"+newphone+"--"+newarea+"--"+newdetailarea);
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
				'<span>设为默认</span>' +
				'</div>' +
				'<div class="del-address col-xs-2 col-xs-offset-1 text-right">' +
				'<span class="iconfont icon-shanchu"></span>' +
				'<span>删除</span>' +
				' </div>' +
				'<div class="edit-address col-xs-2 col-xs-offset-1 text-right">' +
				'<span class="iconfont icon-bianji2"></span>' +
				'<span>编辑</span>' +
				' </div>' +
				'</div>' +
				'</div>';
			$(needString).appendTo(".manage-address-container");
	});
	

	//接口路径（管理收货地址-初始化）
	//mrsyg/kquser/MyAddress.form
	var urlPath_address = "mrsyg/kquser/MyAddress.form";
	var need_address = {};
	var data_address = myAjax(urlPath_address, need_address);
	if(data_address != undefined) {
		initAddress(data_address);
	}

	function initAddress(datas) {
		$.each(datas.data, function(index, getdata) {
			//地址id
			var address_id = getdata.address_id;
			//收货人姓名
			var receiver_name = getdata.receiver_name;
			//收货人id
			var customer_id = getdata.customer_id;
			//收货人电话
			var receiver_phone = getdata.receiver_phone;
			//收货地区
			var receiver_area = getdata.receiver_area;
			//收货详细地址
			var detail_address = getdata.detail_address;
			//是否是默认收货地址（1表示是，0 表示不是）
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
				'<span ' + addressFlagClass + '>设为默认</span>' +
				'</div>' +
				'<div class="del-address col-xs-2 col-xs-offset-1 text-right">' +
				'<span class="iconfont icon-shanchu"></span>' +
				'<span>删除</span>' +
				' </div>' +
				'<div class="edit-address col-xs-2 col-xs-offset-1 text-right">' +
				'<span class="iconfont icon-bianji2"></span>' +
				'<span>编辑</span>' +
				' </div>' +
				'</div>' +
				'</div>';
			$(needString).appendTo(".manage-address-container");
		});
	}

})