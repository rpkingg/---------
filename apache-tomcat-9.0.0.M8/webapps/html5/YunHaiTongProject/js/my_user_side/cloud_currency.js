$(function() {
	//����ǩ������
	$('.sign-in-remind').click(function(e) {
		if($(this).find('span').hasClass('disabled')) {
			$(this).find('span').removeClass('disabled');
			$(this).find('span').addClass('enabled');
		} else {
			$(this).find('span').removeClass('enabled');
			$(this).find('span').addClass('disabled');
		}
	});
	//����ǩ��
	//�ӿ�·����ǩ����
	//http://120.76.190.223:8988/mrsyg/kquser/AddRecord.form?cloud_num=5
	$('.today-sign-btn').bind("click",function() {
		var urlPath_two = "mrsyg/kquser/AddRecord.form";
		var cloud_num = $(".cloud-currency-text").text();
		var quan_data = {
		};
		var data_two = myAjax(urlPath_two, quan_data);
		if(data_two == undefined) {
			alert("ǩ��ʧ�ܣ�");
		}else{
			alert("ǩ���ɹ�!");
			var urlPath_one = "mrsyg/kquser/CustomerCloud.form";
			var need_data = {};
			var data_one = myAjax(urlPath_one, need_data);
			if(data_one != undefined) {
				init(data_one);
			}
		}
	});

	//�鿴�����Ż�ȯ
	$('.exchange-coupons-tip').click(function() {
		alert('��ת���һ��Ż�ȯ�б���棡');
	});

	//�һ��Ż�ȯ�¼�
	$('.exchange-coupons-item').click(function(e) {
		alert('��ת���һ��Ż�ȯ���棡');
	});

	//�ӿ�·�����ҵ��Ʊ�--��ʼ��ҳ�棩
	//http://120.76.190.223:8988/mrsyg/kquser/CustomerCloud.form
	var urlPath_one = "mrsyg/kquser/CustomerCloud.form";
	var need_data = {};
	var data_one = myAjax(urlPath_one, need_data);
	if(data_one != undefined) {
		init(data_one);
	}
	
	//�ӿ�·������ȯ���ģ�
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

	//��ʼ��������ʽ
	function init_day(flag,day_num){
		var day = parseInt(day_num);
		if(day_num<7){
			//����ʹ��
			//flag="1";
			//�����ǩ������ǰ��=��ǩ���죬Ԫ�ض�λΪ��ǰ��-1
			if("0"==flag){
				day -= 1;
			}
			var current = $(".sign-in-count").find(".day-container").eq(day);
			//��ǰǩ����
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
			//��ǩ����
			current.prevAll().removeClass("current-sign-in-container");
			current.prevAll().find("span").removeClass("current-sign-in");
			current.prevAll().find("span").addClass("already-sign-in");
			//δǩ����
			current.nextAll().find("span").addClass("no-sign-in");
		}else if(flag=="0"){
			$(".sign-in-count").find(".day-container").find("span").removeClass("current-sign-in");
			$(".sign-in-count").find(".day-container").removeClass("current-sign-in-container");
			$(".sign-in-count").find(".day-container").find("span").removeClass("no-sign-in");
			$(".sign-in-count").find(".day-container").find("span").addClass("already-sign-in");
			$(".today-sign-btn").css("background","#DDDDDD");
		}else if(flag=="1"){
			var current = $(".sign-in-count").find(".day-container").eq(day%8);
			//��ǰǩ����
			current.find("span").removeClass("no-sign-in");
			current.addClass("current-sign-in-container");
			current.find("span").addClass("current-sign-in");
			//��ǩ����
			current.prev().removeClass("current-sign-in-container");
			current.prev().find("span").removeClass("current-sign-in");
			current.prevAll().find("span").addClass("already-sign-in");
			//δǩ����
			current.nextAll().find("span").addClass("no-sign-in");
		}
	}
			
	function init(datas) {
		//��ǰ���
		var cur_bal = datas.cur_bal;
		//����
		var day_num = datas.day_num;
		//�Ƿ��Ѿ�ǩ��
		var add_record_flag = datas.add_record_flag;

		$(".sign-in-day").text(day_num);
		$(".cloud-currency-text").text(cur_bal);
		$(".cloud-currency-detail-content").empty();
		
		init_day(add_record_flag,day_num);
		$.each(datas.cloudinfo, function(index, getdata) {
			//ʱ��
			var tm_smp = getdata.tm_smp;
			//ҵ������
			var bus_typ = getdata.bus_typ;
			var typ_txt = "00" == bus_typ ? "ǩ��" : "����";
			//���׽��
			var txn_amt = getdata.txn_amt;

			var newString = '<div class="cloud-currency-detail-item col-xs-12">' +
				'<span class="col-xs-4 text-left">' + tm_smp + '</span>' +
				'<span class="col-xs-4">' + typ_txt + '</span>' +
				'<span class="cloud-currency-use-detail col-xs-4">' +
				'<svg class="cloud-currency-icon" aria-hidden="true">' +
				'<use xlink:href="#icon-yunbi"></use>' +
				'</svg>' +
				'<span class="cloud-currency-value">' + txn_amt + '</span>' +
				'</span>' +
				'</div>';

			$(newString).appendTo(".cloud-currency-detail-content");
		});
	}

	function init_quan(datas){
		$(".exchange-coupons-content").empty();
		$.each(datas.data,function(index,getdata){			
			//�Ż�ȯ���
			var coupon_standard_id = getdata.coupon_standard_id;
			//��Чʱ��
			var effective_date = getdata.effective_date;
			//ʧЧʱ��
			var expire_date = getdata.expire_date;
			//���ѽ��
			var coupon_amount = getdata.coupon_amount;
			//�䵱���
			var serve_amount = getdata.serve_amount;
			//�һ��Ʊ���
			var cloud_number = getdata.cloud_number;
			//��ע
			var remarks = getdata.remarks;
			
			var needString = '<div class="exchange-coupons-item col-xs-12">'+
								'<div class="voucher-amount col-xs-5">'+
									'<span class="voucher-amount-attr col-xs-12">'+
				                			'<span class="yuan">��</span>' +
									'<span class="amount-text">'+ serve_amount +'</span>'+
									'<span class="voucher-type-text">����ȯ</span>'+
									'</span>' +
									'<span class="full-amount-tip col-xs-12">����'+ coupon_amount +'��ʹ��</span>' +
									'<span class="amount-right-top-icon"></span>'+
									'<span class="amount-right-bottom-icon"></span>'+
									'<span class="amount-right-top-shadow"></span>'+
									'<span class="amount-right-bottom-shadow"></span>'+
								'</div>'+
								'<div class="voucher-use-condition col-xs-7 text-left">'+
									'<span class="used-store-name col-xs-12">'+remarks+'</span>'+
									'<span class="use-endline col-xs-12">'+effective_date+'��'+expire_date+'</span>'+
									'<span class="exchange-count-container col-xs-12">'+
				                    		'<span class="exchange-count-text">'+cloud_number+'�ƱҶһ�</span>'+
									'</span>'+
								'</div>'+
							'</div>';
			
			$(needString).appendTo(".exchange-coupons-content");
		});
	}
	$("#look_more").on("click",function(){
		//exchange_coupons_detail.html
		native.openWebView("exchange_coupons_detail.jsp")
	})
})