$(function() {
	//开启签到提醒
	//http://120.76.190.223:8988/mrsyg/kqgoods/RemindRecord.form
	$('.sign-in-remind').click(function(e) {
		var urlPath_one = "mrsyg/kqgoods/RemindRecord.form";
		var need_data = {};
		var data_one = myAjax(urlPath_one, need_data);
		if(data_one == undefined) {
			console.log("请求失败！");
		}else{
			console.log("请求成功!");
		}
		if($(this).find('span').hasClass('disabled')) {
			$(this).find('span').removeClass('disabled');
			$(this).find('span').addClass('enabled');
		} else {
			$(this).find('span').removeClass('enabled');
			$(this).find('span').addClass('disabled');
		}
	});
	//今日签到
	//接口路径（签到）
	//http://120.76.190.223:8988/mrsyg/kquser/AddRecord.form?cloud_num=5
	$('.today-sign-btn').bind("click",function() {
		var urlPath_two = "mrsyg/kquser/AddRecord.form";
		var cloud_num = $(".cloud-currency-text").text();
		var quan_data = {
		};
		var data_two = myAjax(urlPath_two, quan_data);
		if(data_two == undefined) {
			console.log("签到失败！");
		}else{
			console.log("签到成功!");
			var urlPath_one = "mrsyg/kquser/CustomerCloud.form";
			var need_data = {};
			var data_one = myAjax(urlPath_one, need_data);
			if(data_one != undefined) {
				init(data_one);
			}
		}
	});
	//接口路径（我的云币--初始化页面）
	//http://120.76.190.223:8988/mrsyg/kquser/CustomerCloud.form
	var urlPath_one = "mrsyg/kquser/CustomerCloud.form";
	var need_data = {};
	var data_one = myAjax(urlPath_one, need_data);
	if(data_one != undefined) {
		init(data_one);
	}
	
	//接口路径（领券中心）
	//http://120.76.190.223:8988/mrsyg/kquser/CouponCenter.form?pag_no=1&pag_num=3
	var urlPath_two = "mrsyg/kquser/CouponCenter.form";
	var quan_data = {
		"pag_no":"1",
		"pag_num":"3"
	};
	var data_two = myAjax(urlPath_two, quan_data);
	if(data_two != undefined) {
		init_quan(data_two);
	}

	//初始化天数样式
	function init_day(flag,day_num){
		var day = parseInt(day_num);
		$('.day-container').find('.sign-day').removeClass("no-sign-in");
		$('.day-container').find('.sign-day').removeClass("already-sign-inn");
		$('.day-container').find('.sign-day').removeClass("current-sign-in");
		$('.day-container').removeClass("current-sign-in-container");
		if(day_num<7){
			//测试使用
			//flag="1";
			//如果已签到，当前天=已签到天，元素定位为当前天-1
			if("0"==flag){
				day -= 1;
			}
			var current = $(".sign-in-count").find(".day-container").eq(day);
			//当前签到天
			//current.find("span").removeClass("no-sign-in");
			if("1"==flag){
				current.addClass("current-sign-in-container");
				current.find("span").addClass("current-sign-in");
				current.find("span").removeClass("no-sign-in");
			}else{
				$(".today-sign-btn").css("background","#DDDDDD");
				$(".today-sign-btn").unbind("click");
				current.find("span").removeClass("no-sign-in");
				current.removeClass("current-sign-in-container");
				current.find("span").removeClass("current-sign-in");
				current.find("span").addClass("already-sign-in");
			}
			//已签到天
			current.prevAll().removeClass("current-sign-in-container");
			current.prevAll().find("span").removeClass("current-sign-in");
			current.prevAll().find("span").addClass("already-sign-in");
			//未签到天
			current.nextAll().find("span").addClass("no-sign-in");
		}else if(flag=="0"){
			$(".sign-in-count").find(".day-container").find("span").removeClass("current-sign-in");
			$(".sign-in-count").find(".day-container").removeClass("current-sign-in-container");
			$(".sign-in-count").find(".day-container").find("span").removeClass("no-sign-in");
			$(".sign-in-count").find(".day-container").find("span").addClass("already-sign-in");
			$(".today-sign-btn").css("background","#DDDDDD");
		}else if(flag=="1"){
			var current = $(".sign-in-count").find(".day-container").eq(day%8);
			//当前签到天
			current.find("span").removeClass("no-sign-in");
			current.addClass("current-sign-in-container");
			current.find("span").addClass("current-sign-in");
			//已签到天
			current.prev().removeClass("current-sign-in-container");
			current.prev().find("span").removeClass("current-sign-in");
			current.prevAll().find("span").addClass("already-sign-in");
			//未签到天
			current.nextAll().find("span").addClass("no-sign-in");
		}
	}
			
	function init(datas) {
		//当前余额
		var cur_bal = datas.cur_bal;
		//天数
		var day_num = datas.day_num;
		//是否已经签到
		var add_record_flag = datas.add_record_flag;

		$(".sign-in-day").text(day_num);
		$(".cloud-currency-text").text(cur_bal);
		$(".cloud-currency-detail-content").empty();
		
		init_day(add_record_flag,day_num);
		$.each(datas.cloudinfo, function(index, getdata) {
			//时间
			var tm_smp = getdata.tm_smp;
			//业务类型
			var bus_typ = getdata.bus_typ;
			var typ_txt;
			//交易金额
			var txn_amt = getdata.txn_amt;
			
			switch(bus_typ){
				case "00": typ_txt="签到"; break;
				case "01": typ_txt="打赏"; break;
				case "02": typ_txt="加客户聊聊"; break;
				case "03": typ_txt="兑换优惠券"; break;
			}

			var newString = '<div class="cloud-currency-detail-item col-xs-12">' +
					'<span class="col-xs-4 text-left">' + tm_smp + '</span>' +
					'<span class="col-xs-4">' + typ_txt + '</span>' +
					'<span class="cloud-currency-use-detail col-xs-4">' +
					'<span class="cloud-currency-value">' + txn_amt + '</span>' +
					'<svg class="cloud-currency-icon" aria-hidden="true">' +
						'<use xlink:href="#icon-yunbi"></use>' +
					'</svg>' +
					'</span>' +
				'</div>';

			$(newString).appendTo(".cloud-currency-detail-content");
		});
	}

	function init_quan(datas){
		$(".exchange-coupons-content").empty();
		$.each(datas.data,function(index,getdata){			
			//优惠券编号
			var coupon_standard_id = getdata.coupon_standard_id;
			//有效时间
			var effective_date = getdata.effective_date;
			//失效时间
			var expire_date = getdata.expire_date;
			//消费金额
			var coupon_amount = getdata.coupon_amount;
			//充当金额
			var serve_amount = getdata.serve_amount;
			//兑换云币数
			var cloud_number = getdata.cloud_number;
			//备注
			var remarks = getdata.remarks;
			
			var needString = '<div class="exchange-coupons-item col-xs-12"  cloud_number="'+ cloud_number +'" remarks="'+ remarks +'" serve_amount= "'+serve_amount+'" '+
									'coupon_amount = "'+ coupon_amount +'" expire_date="'+ expire_date +'"' +
									'effective_date = "'+ effective_date +'"  coupon_id="'+ coupon_standard_id +'">'+
								'<div class="voucher-amount col-xs-5">'+
									'<span class="voucher-amount-attr col-xs-12">'+
				                			'<span class="yuan">￥</span>' +
									'<span class="amount-text">'+ serve_amount +'</span>'+
									'<span class="voucher-type-text">满减券</span>'+
									'</span>' +
									'<span class="full-amount-tip col-xs-12">满￥'+ coupon_amount +'可使用</span>' +
									'<span class="amount-right-top-icon"></span>'+
									'<span class="amount-right-bottom-icon"></span>'+
									'<span class="amount-right-top-shadow"></span>'+
									'<span class="amount-right-bottom-shadow"></span>'+
								'</div>'+
								'<div class="voucher-use-condition col-xs-7 text-left">'+
									'<span class="used-store-name col-xs-12">'+remarks+'</span>'+
									'<span class="use-endline col-xs-12"><span>'+effective_date+'至'+expire_date+'</span>'+
									'<span class="exchange-count-container col-xs-12">'+
				                    		'<span class="exchange-count-text">'+cloud_number+'云币兑换</span>'+
									'</span>'+
								'</div>'+
							'</div>';
			
			$(needString).appendTo(".exchange-coupons-content");
		});
		
		//点击券页面跳转领券中心
		$('.exchange-coupons-item').on('click',function(){
			//jump_coupon_id
			var jump_coupon_id = $(this).attr("coupon_id");
			//jump_effective_date
			var jump_effective_date = $(this).attr("effective_date");
			//jump_expire_date
			var jump_expire_date = $(this).attr("expire_date");
			//jump_coupon_amount
			var jump_coupon_amount = $(this).attr("coupon_amount");
			//jump_serve_amount
			var jump_serve_amount = $(this).attr("serve_amount");
			//jump_remarks
			var jump_remarks = $(this).attr("remarks");
			jump_remarks = encodeURI(jump_remarks);
			console.log("中文转换后的备注："+jump_remarks);
			//jump_cloud_number
			var jump_cloud_number = $(this).attr("cloud_number");
			
			var href="jump_coupon_id="+jump_coupon_id+"&jump_effective_date="+jump_effective_date+"&jump_expire_date="+jump_expire_date+
					"&jump_coupon_amount="+jump_coupon_amount+"&jump_serve_amount="+jump_serve_amount+"&jump_remarks="+jump_remarks+"&jump_cloud_number="+jump_cloud_number;
			
			native.openWebView("exchange_coupons_detail.jsp?"+href);
			//var href="";
			//window.location.href="exchange_coupons_detail.jsp?"+href;
		}); 
	}
	//查看更多
	$("#look_more").on("click",function(){
		//exchange_coupons_detail.html
		window.location.href="coupon_center.jsp";
	});
})