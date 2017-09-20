(function($, doc) {
	$.init();
	$.ready(function() {
		//地址
		var cityPicker3 = new $.PopPicker({
			layer: 3
		});
		cityPicker3.setData(cityData);

		document.getElementById('userArea').addEventListener('tap', function(event) {
			document.activeElement.blur();
			cityPicker3.show(function(items) {
				if(!(items[2] || {}).text) {
					var cityDom = (items[0] || {}).text + " " + (items[1] || {}).text;
				} else {
					var cityDom = (items[0] || {}).text + " " + (items[1] || {}).text + " " + (items[2] || {}).text;
				}
				var hcity = (items[0] || {}).text + "";
				if(hcity != null && hcity != "") {
					doc.getElementById('getGoodsUserOfProvince').innerHTML = hcity;
				}

				var hproper = (items[1] || {}).text + "";
				if(hproper != null && hproper != "") {
					doc.getElementById('getGoodsUserOfCity').innerHTML = hproper;
				}

				var harea = (items[2] || {}).text + "";
				if(harea != null && harea != "") {
					if(harea == 'undefined') {
						doc.getElementById('getGoodsUserOfAreas').innerHTML = '';
					} else {
						doc.getElementById('getGoodsUserOfAreas').innerHTML = harea;
					}
				}
			});
		}, false);
	});
})(mui, document);

//获取本地存储对象
var localStorageObj = window.localStorage;
//获取收货人姓名
var receiver_name = localStorageObj.getItem("edit_address_name");
$("#userName").val(receiver_name);
//获取收货人电话
var receiver_phone = localStorageObj.getItem("edit_address_phone");
$("#userIphone").val(receiver_phone);
//获取收货地址的省市区
var address_area = localStorageObj.getItem("edit_address_area");
$("#getGoodsUserOfProvince").text(address_area);
//获取收货地址的详细信息
var address_detail_area = localStorageObj.getItem("edit_address_detail");
$("#user_detail_address").val(address_detail_area);
//alert("收货人姓名="+receiver_name);
//alert("收货人电话="+receiver_phone);
//alert("收货地址的省市区="+address_area);
//alert("收货地址的详细信息="+address_detail_area);

//保存或者修改信息
$(".save-address-btn").bind("click", function() {
	//获取收货人姓名
	var edit_name = $("#userName").val().trimLeft();
	//获取收货人电话
	var edit_phone = $("#userIphone").val().trimLeft();
	//获取收货地区
	var edit_area = ($("#getGoodsUserOfProvince").text() + $("#getGoodsUserOfCity").text() + $("#getGoodsUserOfAreas").text()).trimLeft();
	//获取详细地址
	var edit_detail_area = $("#user_detail_address").val().trimLeft();
	//获取收货地址id
	var edit_address_id = localStorageObj.getItem("edit_address_id");

	//点击保存时，判断类型（edit--编辑，add--新增）
	var saveType = localStorageObj.getItem("add_or_edit_flag");
	if(edit_name.length > 0) {
		if(edit_phone.length > 0) {
			if(isMobile(edit_phone)) {
				if(edit_area.length > 0) {
					if(edit_detail_area.length > 0) {
						if(saveType == "edit") {
							//编辑收货地址的接口
							var urlPath_modAddress = "mrsyg/kquser/ModifyAddress.form";
							var need_modAddress = {
								"address_id": edit_address_id,
								"receiver_name": edit_name,
								"receiver_phone": edit_phone,
								"receiver_area": edit_area,
								"detail_address": edit_detail_area
							};
							var data_modAddress = myAjax(urlPath_modAddress, need_modAddress);
							if(data_modAddress != undefined) {
								alert("修改地址成功");
								//返回管理收货地址界面更更新收货地址的信息
								window.parent.document.getElementById("iframe_addOrEdit_address").style.display = "none";
								//页面之间通讯（当当前页面关闭的时候，父页面做一些事情）
								window.parent.$(window).trigger("setReceiverAddress");
							} else {
								alert("修改地址失败");
							}
						} else if(saveType == "add") {
							//新增收货地址的接口
							//mrsyg/kquser/AddAddress.form?receiver_name=刘翔&receiver_phone=15812344321&receiver_area=上海上海普陀区&detail_address=金沙江路1678号
							var urlPath_addAddress = "mrsyg/kquser/AddAddress.form";
							var need_addAddress = {
								"receiver_name": edit_name,
								"receiver_phone": edit_phone,
								"receiver_area": edit_area,
								"detail_address": edit_detail_area
							};
							var data_addAddress = myAjax(urlPath_addAddress, need_addAddress);
							if(data_addAddress != undefined) {
								localStorageObj.setItem("new_address_id",data_addAddress.address_id);
								localStorageObj.setItem("new_address_name",edit_name);
								localStorageObj.setItem("new_address_phone",edit_phone);
								localStorageObj.setItem("new_address_area",edit_area);
								localStorageObj.setItem("new_address_detail",edit_detail_area);
								alert("新增地址成功");
								//window.location.href="javascript:history.go(-1);";
								//返回选择收货地址界面更新收货地址信息
								window.parent.document.getElementById("iframe_addOrEdit_address").style.display="none";
								//页面之间通讯（当当前页面关闭的时候，父页面做一些事情）
								window.parent.$(window).trigger("setNewAddress");
							} else {
								alert("新增地址失败");
							}
						}
					} else {
						alert("请输入收货详细地址");
					}
				} else {
					alert("请输入收货地区");
				}
			} else {
				alert("请输入正确的手机号码");
			}
		} else {
			alert("请输入收货人电话");
		}
	} else {
		alert("请输入收货人名称");
	}

});