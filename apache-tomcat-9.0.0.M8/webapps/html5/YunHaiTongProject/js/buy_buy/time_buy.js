$(function() {
	//���򵼺��¼���Ĭ��������active
	$('.buy-buy-nav-bar span').click(function(e) {
		$(this).siblings('span').removeClass('active');
		$(this).addClass('active');
		if($(this).hasClass('time-buy')) {
			$('.time-buy-content').show();
		}
	});

	//��������Ʒ����¼�
	$('.time-buy-content').find('.time-buy-item').click(function(e) {
		alert('��ת�鿴��Ʒ������棡');

	});

	//�ӿ�·��(��ʱ��)
	var urlPath_one = "mrsyg/kqgoods/DeadlineGoods.form";
	var need_data = {};
	var data_one = myAjax(urlPath_one, need_data);
	if(data_one != undefined) {
		init(data_one);
	}

	function init(datas) {
		$.each(datas.data, function(index, getdata) {
			//��ƷͼƬ
			var deadline_picture = getdata.deadline_picture;
			var deadline_picture2x = getDifferencePic(deadline_picture, "2x_");
			var deadline_picture3x = getDifferencePic(deadline_picture, "3x_");
			//��Ʒid
			var product_id = getdata.product_id;
			//��Ʒ����
			var deadline_name = getdata.deadline_name;
			//��Ʒ�۸�
			var deadline_price = getdata.deadline_price;
			//���ʼʱ��
			var start_time = getdata.start_time;
			//�����ʱ��
			var end_time = getdata.end_time;
			var needString = '<div class="time-buy-item col-xs-12">' +
				'<div class="time-buy-goods-pic col-xs-12">' +
				'<img src="' + deadline_picture2x + '" srcset="' + deadline_picture2x + ' 2x,' + deadline_picture3x + ' 3x">' +
				'</div>' +
				'<div class="time-buy-goods-info col-xs-12">' +
				'<div class="goods-base-info col-xs-12">' +
				'<span class="goods-name col-xs-9 text-left">' + deadline_name + '</span>' +
				'<span class="goods-price col-xs-3 text-center">' +
				'<span class="yuan">��</span>' + deadline_price + '</span>' +
				'</div>' +
				'<div class="time-endline-opt col-xs-12">' +
				'<span class="count-down col-xs-9 text-left">' +
				'<span class="iconfont icon-shijian"></span>' +
				'<span>ʣ��2��21Сʱ32��12��</span>' +
				'</span>' +
				'<span class="buy-now col-xs-3 text-center">������</span>' +
				'</div>' +
				'</div>' +
				'</div>';
			$(needString).appendTo("#time_buy_container");
		});
	}
})