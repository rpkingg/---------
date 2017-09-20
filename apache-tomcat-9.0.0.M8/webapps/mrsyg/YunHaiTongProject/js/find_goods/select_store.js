$(function() {
	//��ñ��ش洢�Ķ���
	var localStorageObj = window.localStorage;
	
	//���������Ϣ����ת��ȷ�϶�������
	$("body").on("click",".store-list-item",function(){
		//��õ���id
		var shop_id=$(this).attr("id");
		localStorageObj.setItem("shop_id",shop_id);
		//��õ�������
		var shop_name=$(this).find(".store-name").text();
		localStorageObj.setItem("shop_name",shop_name);
		//��õ�������
		var shop_grade=$(this).find(".store-score-text").text();
		localStorageObj.setItem("shop_grade",shop_grade);
		//��ȡ���̵�ַ
		var shop_addess=$(this).find(".shop_address").text();
		localStorageObj.setItem("shop_address",shop_addess);
		//����ȷ�϶���������µ�����Ϣ
		window.parent.document.getElementById("iframe_select_store").style.display="none";
		//ҳ��֮��ͨѶ������ǰҳ��رյ�ʱ�򣬸�ҳ����һЩ���飩
		window.parent.$(window).trigger("setShopInfo");
	});

	//�ӿ�·������ʼ��ҳ��--���̣�
	//mrsyg/kqgoods/SelectShop.form?pag_no=1&pag_num=100
	var urlPath_one = "mrsyg/kqgoods/SelectShop.form";
	var need_data = {
		"pag_no": "1",
		"pag_num": "100"
	};
	var data_one = myAjax(urlPath_one, need_data);
	if(data_one != undefined) {
		init(data_one);
	}

	function init(datas) {
		$.each(datas.data, function(index, getdata) {
			//����id
			var shop_id = getdata.shop_id;
			//��������
			var shop_name = getdata.shop_name;
			//���̵�ַ
			var shop_address = getdata.shop_address;
			//���̵ȼ�
			var shop_grade = getdata.shop_grade;
			var redStards = "";
			var grayStards = "";
			for(var i = 0; i < shop_grade; i++) {
				redStards = redStards + '<span class="iconfont icon-g score"></span>';
			}
			for(var i = 0; i < 5 - shop_grade; i++) {
				grayStards = grayStards + '<span class="iconfont icon-g"></span>';
			}
			//������Ʒ����
			var shop_goods = getdata.shop_goods;
			//������������
			var shop_delivery = getdata.shop_delivery;
			//���̷�������
			var shop_service = getdata.shop_service;
			//�������������
			var shop_satisfaction = getdata.shop_satisfaction;
			//����
			var distance = getdata.distance;
			var needString = '<div class="store-list-item col-xs-12" id="'+shop_id+'">' +
				'<div class="store-info-item col-xs-12">' +
				' <div class="store-name-view col-xs-12">' +
				'<span class="store-name-score col-xs-9">' +
				'<span class="store-name">'+shop_name+'</span>' +
				'<span class="store-score">' + redStards + grayStards +
				'<span class="store-score-text">'+shop_grade+'</span>' +
				'</span>' +
				'</span>' +
				'<span class="store-distance col-xs-3 text-right">'+distance+'</span>' +
				'</div>' +
				'<div class="store-other-info col-xs-12 text-center">' +
				'<span class="col-xs-2">��Ʒ'+shop_goods+'</span>' +
				'<span class="col-xs-2">����'+shop_delivery+'</span>' +
				'<span class="col-xs-2">����'+shop_service+'</span>' +
				'<span class="col-xs-2">�����'+shop_satisfaction+'</span>' +
				'</div>' +
				'<div class="store-address col-xs-12">' +
				'<div class="store-detail-address col-xs-10">' +
				'<span class="iconfont icon-location text-center"></span>' +
				'<span class="col-xs-11 shop_address">'+shop_address+'</span>' +
				'</div>' +
				'</div>' +
				'</div>' +
				'</div>';
			$(needString).appendTo(".select-store-content");
		});
	}

})