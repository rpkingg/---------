$(function() {
	//获得本地存储的对象
	var localStorageObj = window.localStorage;
	
	//点击店铺信息，跳转至确认订单界面
	$("body").on("click",".store-list-item",function(){
		//获得店铺id
		var shop_id=$(this).attr("id");
		localStorageObj.setItem("shop_id",shop_id);
		//获得店铺名称
		var shop_name=$(this).find(".store-name").text();
		localStorageObj.setItem("shop_name",shop_name);
		//获得店铺评分
		var shop_grade=$(this).find(".store-score-text").text();
		localStorageObj.setItem("shop_grade",shop_grade);
		//获取店铺地址
		var shop_addess=$(this).find(".shop_address").text();
		localStorageObj.setItem("shop_address",shop_addess);
		//返回确认订单界面更新店铺信息
		window.parent.document.getElementById("iframe_select_store").style.display="none";
		//页面之间通讯（当当前页面关闭的时候，父页面做一些事情）
		window.parent.$(window).trigger("setShopInfo");
	});

	//接口路径（初始化页面--店铺）
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
			//店铺id
			var shop_id = getdata.shop_id;
			//店铺名称
			var shop_name = getdata.shop_name;
			//店铺地址
			var shop_address = getdata.shop_address;
			//店铺等级
			var shop_grade = getdata.shop_grade;
			var redStards = "";
			var grayStards = "";
			for(var i = 0; i < shop_grade; i++) {
				redStards = redStards + '<span class="iconfont icon-g score"></span>';
			}
			for(var i = 0; i < 5 - shop_grade; i++) {
				grayStards = grayStards + '<span class="iconfont icon-g"></span>';
			}
			//店铺商品评分
			var shop_goods = getdata.shop_goods;
			//店铺配送评分
			var shop_delivery = getdata.shop_delivery;
			//店铺服务评分
			var shop_service = getdata.shop_service;
			//店铺满意度评分
			var shop_satisfaction = getdata.shop_satisfaction;
			//距离
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
				'<span class="col-xs-2">商品'+shop_goods+'</span>' +
				'<span class="col-xs-2">配送'+shop_delivery+'</span>' +
				'<span class="col-xs-2">服务'+shop_service+'</span>' +
				'<span class="col-xs-2">满意度'+shop_satisfaction+'</span>' +
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