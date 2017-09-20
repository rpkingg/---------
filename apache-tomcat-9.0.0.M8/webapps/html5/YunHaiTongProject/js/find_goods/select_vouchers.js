$(function() {
	//��ñ��ش洢�Ķ���
	var localStorageObj = window.localStorage;

	//ѡ����õĵ���ȯ�¼��������������ֿ��úͲ����ã�
	$(".select-vouchers-container").on("click",".select-voucher-item.can-use",function(){
		$(this).siblings('div').find('.voucher-use-condition .voucher-selected').hide();
		$(this).find('.voucher-use-condition .voucher-selected').show();
		//��ȡ�Ż�ȯid
		var coupon_id=$(this).attr("id");
		localStorageObj.setItem("coupon_id",coupon_id);
		//��ȡ�Ż�ȯ���
		var serve_amount=$(this).find(".amount-text").text();
		localStorageObj.setItem("coupon_amount",serve_amount);
		//����ȷ�϶���������µ���ȯ����Ϣ
		window.parent.document.getElementById("iframe_select_vouchers").style.display="none";
		//ҳ��֮��ͨѶ������ǰҳ��رյ�ʱ�򣬸�ҳ����һЩ���飩
		window.parent.$(window).trigger("setServeAmount");
	});

	//�ӿ�·����ѡ���Ż�ȯ��
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
			//�Ż�ȯid
			var coupon_id = getdata.coupon_id;
			//�Żݽ��
			var serve_amount = getdata.serve_amount;
			//����ʹ�ý�������
			var coupon_amount = getdata.coupon_amount;
			//���õ���
			var remarks = getdata.remarks;
			//��ʼʱ��
			var effective_date = getdata.effective_date;
			//����ʱ��
			var expire_time = getdata.expire_date;
			//�Ƿ���ã�0��ʾ�ǣ�1��ʾ���ǣ�
			var use_flag = getdata.use_flag;
			var needString = "";
			if(use_flag == 0) {
				needString = '<div class="select-voucher-item can-use col-xs-12" id="' + coupon_id + '">' +
					'<div class="voucher-amount col-xs-5">' +
					'<span class="yuan">��</span>' +
					'<span class="amount-text">' + serve_amount + '</span>' +
					'<span>����ȯ</span>' +
					'<span class="amount-right-top-icon"></span>' +
					'<span class="amount-right-bottom-icon"></span>' +
					'</div>' +
					'<div class="voucher-use-condition col-xs-7">' +
					'<span class="full-amount-tip col-xs-12">����' + coupon_amount + '��ʹ��</span>' +
					'<span class="used-store-name col-xs-12">'+remarks+'</span>' +
					'<span class="use-endline col-xs-12">' + effective_date + '��' + expire_time + '</span>' +
					'<span class="iconfont voucher-selected icon-xuanzhong hide">' +
					'<span class="iconfont icon-gou"></span>' +
					'</span>' +
					'</div>' +
					'</div>';
				$(needString).appendTo("#can_use_container");	
			} else if(use_flag == 1) {
				needString = '<div class="select-voucher-item cannot-use col-xs-12" id="' + coupon_id + '">' +
					'<div class="voucher-amount col-xs-5">' +
					'<span class="yuan">��</span>' +
					'<span class="amount-text">' + serve_amount + '</span>' +
					'<span>����ȯ</span>' +
					'<span class="amount-right-top-icon"></span>' +
					'<span class="amount-right-bottom-icon"></span>' +
					'</div>' +
					'<div class="voucher-use-condition col-xs-7">' +
					'<span class="full-amount-tip col-xs-12">����' + coupon_amount + '��ʹ��</span>' +
					'<span class="used-store-name col-xs-12">'+remarks+'</span>' +
					'<span class="use-endline col-xs-12">' + effective_date + '��' + expire_time + '</span>' +
					'</div>' +
					'</div>';
				$(needString).appendTo("#cannot_use_container");	
			}
		});
	}

})