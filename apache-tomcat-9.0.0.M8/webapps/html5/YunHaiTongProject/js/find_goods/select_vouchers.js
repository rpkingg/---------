$(function() {
	//获得本地存储的对象
	var localStorageObj = window.localStorage;

	//选择可用的抵用券事件（根据数据区分可用和不可用）
	$(".select-vouchers-container").on("click",".select-voucher-item.can-use",function(){
		$(this).siblings('div').find('.voucher-use-condition .voucher-selected').hide();
		$(this).find('.voucher-use-condition .voucher-selected').show();
		//获取优惠券id
		var coupon_id=$(this).attr("id");
		localStorageObj.setItem("coupon_id",coupon_id);
		//获取优惠券金额
		var serve_amount=$(this).find(".amount-text").text();
		localStorageObj.setItem("coupon_amount",serve_amount);
		//返回确认订单界面更新抵用券的信息
		window.parent.document.getElementById("iframe_select_vouchers").style.display="none";
		//页面之间通讯（当当前页面关闭的时候，父页面做一些事情）
		window.parent.$(window).trigger("setServeAmount");
	});

	//接口路径（选择优惠券）
	//mrsyg/kquser/SelectCoupon.form?pag_no=1&pag_num=100
	var urlPath_one = "mrsyg/kquser/SelectCoupon.form";
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
			//优惠券id
			var coupon_id = getdata.coupon_id;
			//优惠金额
			var serve_amount = getdata.serve_amount;
			//满足使用金额的条件
			var coupon_amount = getdata.coupon_amount;
			//适用店铺
			var remarks = getdata.remarks;
			//开始时间
			var effective_date = getdata.effective_date;
			//结束时间
			var expire_time = getdata.expire_date;
			//是否可用（0表示是，1表示不是）
			var use_flag = getdata.use_flag;
			var needString = "";
			if(use_flag == 0) {
				needString = '<div class="select-voucher-item can-use col-xs-12" id="' + coupon_id + '">' +
					'<div class="voucher-amount col-xs-5">' +
					'<span class="yuan">￥</span>' +
					'<span class="amount-text">' + serve_amount + '</span>' +
					'<span>满减券</span>' +
					'<span class="amount-right-top-icon"></span>' +
					'<span class="amount-right-bottom-icon"></span>' +
					'</div>' +
					'<div class="voucher-use-condition col-xs-7">' +
					'<span class="full-amount-tip col-xs-12">满￥' + coupon_amount + '可使用</span>' +
					'<span class="used-store-name col-xs-12">'+remarks+'</span>' +
					'<span class="use-endline col-xs-12">' + effective_date + '至' + expire_time + '</span>' +
					'<span class="iconfont voucher-selected icon-xuanzhong hide">' +
					'<span class="iconfont icon-gou"></span>' +
					'</span>' +
					'</div>' +
					'</div>';
				$(needString).appendTo("#can_use_container");	
			} else if(use_flag == 1) {
				needString = '<div class="select-voucher-item cannot-use col-xs-12" id="' + coupon_id + '">' +
					'<div class="voucher-amount col-xs-5">' +
					'<span class="yuan">￥</span>' +
					'<span class="amount-text">' + serve_amount + '</span>' +
					'<span>满减券</span>' +
					'<span class="amount-right-top-icon"></span>' +
					'<span class="amount-right-bottom-icon"></span>' +
					'</div>' +
					'<div class="voucher-use-condition col-xs-7">' +
					'<span class="full-amount-tip col-xs-12">满￥' + coupon_amount + '可使用</span>' +
					'<span class="used-store-name col-xs-12">'+remarks+'</span>' +
					'<span class="use-endline col-xs-12">' + effective_date + '至' + expire_time + '</span>' +
					'</div>' +
					'</div>';
				$(needString).appendTo("#cannot_use_container");	
			}
		});
	}

})