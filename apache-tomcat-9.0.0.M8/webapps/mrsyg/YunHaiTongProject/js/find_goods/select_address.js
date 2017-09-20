$(function() {
	//获得本地存储的对象
	var localStorageObj = window.localStorage;

	//点击数据后返回确定订单界面或者返回商品详情页面
	$("body").on("click", ".goods-address-item", function() {
		//判断是否可用（0表示是，1表示不是）
		var userFlag = $(this).attr("userFlag");
		if(userFlag == 0) {
			//获取地址id
			var address_id = $(this).attr("id");
			localStorageObj.setItem("receiver_address_id", address_id);
			//获得收货地址
			var selected_address = $(this).find("#address_content_id").text();
			localStorageObj.setItem("selected_address", selected_address);
			//获得收货人名称
			var receiver_name = $(this).find("#receiver_name_id").text();
			localStorageObj.setItem("receiver_name", receiver_name);
			//获得收货人电话
			var receiver_phone = $(this).find("#receiver_phone_id").text();
			localStorageObj.setItem("receiver_phone", receiver_phone);

			$(this).find(".selected-address").addClass("icon-xuanzedui");
			$(this).siblings().find(".selected-address").removeClass("icon-xuanzedui");

			//返回确认订单界面更新收货地址信息
			window.parent.document.getElementById("iframe_select_address").style.display = "none";
			//页面之间通讯（当当前页面关闭的时候，父页面做一些事情）
			window.parent.$(window).trigger("setReceiverAddress");

		} else if(userFlag == 1) {
			alert("对不起，此地址不在服务区");
		}
	});

	//新增收货地址
	$(".add_new_address_btn").bind("click", function() {
		localStorageObj.setItem("add_or_edit_flag", "add");
		//window.location.href="addOrEdit_address.html";
		$("#iframe_addOrEdit_address").show();
	});
	//当选择收货地址的子页面关闭时，当前页面设置选择的收货地址的信息
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

	//接口路径（选择收货地址）
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
			//收货地址id
			var address_id = getdata.address_id;
			//收货人姓名
			var receiver_name = getdata.receiver_name;
			//收货人电话
			var receiver_phone = getdata.receiver_phone;
			//收货人地区
			var receiver_area = getdata.receiver_area;
			//收货人详细地址
			var detail_address = getdata.detail_address;
			//是否是默认地址：1表示是，0 表示不是
			var address_flag = getdata.address_flag;
			var default_address = "";
			if(address_flag == 1) {
				default_address = '<span class="default-address-tip">[默认地址]</span>';
			}
			//地址是否可选择（0表示是，1表示不是）
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