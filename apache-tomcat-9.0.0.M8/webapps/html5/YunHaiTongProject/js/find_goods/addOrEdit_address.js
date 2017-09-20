(function($, doc) {
	$.init();
	$.ready(function() {
		//��ַ
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

//��ȡ���ش洢����
var localStorageObj = window.localStorage;
//��ȡ�ջ�������
var receiver_name = localStorageObj.getItem("edit_address_name");
$("#userName").val(receiver_name);
//��ȡ�ջ��˵绰
var receiver_phone = localStorageObj.getItem("edit_address_phone");
$("#userIphone").val(receiver_phone);
//��ȡ�ջ���ַ��ʡ����
var address_area = localStorageObj.getItem("edit_address_area");
$("#getGoodsUserOfProvince").text(address_area);
//��ȡ�ջ���ַ����ϸ��Ϣ
var address_detail_area = localStorageObj.getItem("edit_address_detail");
$("#user_detail_address").val(address_detail_area);
//alert("�ջ�������="+receiver_name);
//alert("�ջ��˵绰="+receiver_phone);
//alert("�ջ���ַ��ʡ����="+address_area);
//alert("�ջ���ַ����ϸ��Ϣ="+address_detail_area);

//��������޸���Ϣ
$(".save-address-btn").bind("click", function() {
	//��ȡ�ջ�������
	var edit_name = $("#userName").val().trimLeft();
	//��ȡ�ջ��˵绰
	var edit_phone = $("#userIphone").val().trimLeft();
	//��ȡ�ջ�����
	var edit_area = ($("#getGoodsUserOfProvince").text() + $("#getGoodsUserOfCity").text() + $("#getGoodsUserOfAreas").text()).trimLeft();
	//��ȡ��ϸ��ַ
	var edit_detail_area = $("#user_detail_address").val().trimLeft();
	//��ȡ�ջ���ַid
	var edit_address_id = localStorageObj.getItem("edit_address_id");

	//�������ʱ���ж����ͣ�edit--�༭��add--������
	var saveType = localStorageObj.getItem("add_or_edit_flag");
	if(edit_name.length > 0) {
		if(edit_phone.length > 0) {
			if(isMobile(edit_phone)) {
				if(edit_area.length > 0) {
					if(edit_detail_area.length > 0) {
						if(saveType == "edit") {
							//�༭�ջ���ַ�Ľӿ�
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
								alert("�޸ĵ�ַ�ɹ�");
								//���ع����ջ���ַ����������ջ���ַ����Ϣ
								window.parent.document.getElementById("iframe_addOrEdit_address").style.display = "none";
								//ҳ��֮��ͨѶ������ǰҳ��رյ�ʱ�򣬸�ҳ����һЩ���飩
								window.parent.$(window).trigger("setReceiverAddress");
							} else {
								alert("�޸ĵ�ַʧ��");
							}
						} else if(saveType == "add") {
							//�����ջ���ַ�Ľӿ�
							//mrsyg/kquser/AddAddress.form?receiver_name=����&receiver_phone=15812344321&receiver_area=�Ϻ��Ϻ�������&detail_address=��ɳ��·1678��
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
								alert("������ַ�ɹ�");
								//window.location.href="javascript:history.go(-1);";
								//����ѡ���ջ���ַ��������ջ���ַ��Ϣ
								window.parent.document.getElementById("iframe_addOrEdit_address").style.display="none";
								//ҳ��֮��ͨѶ������ǰҳ��رյ�ʱ�򣬸�ҳ����һЩ���飩
								window.parent.$(window).trigger("setNewAddress");
							} else {
								alert("������ַʧ��");
							}
						}
					} else {
						alert("�������ջ���ϸ��ַ");
					}
				} else {
					alert("�������ջ�����");
				}
			} else {
				alert("��������ȷ���ֻ�����");
			}
		} else {
			alert("�������ջ��˵绰");
		}
	} else {
		alert("�������ջ�������");
	}

});