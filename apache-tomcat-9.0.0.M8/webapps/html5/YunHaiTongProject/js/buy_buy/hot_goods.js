$(function() {
	//���򵼺��¼���Ĭ��������active
	$('.buy-buy-nav-bar span').click(function(e) {
		$(this).siblings('span').removeClass('active');
		$(this).addClass('active');
		if($(this).hasClass('hot-goods')) {
			$('.hot-goods-content').show();
		}
	});

	//�鿴��Ʒ�����¼�
	$('.hot-goods-top,.hot-goods-item').click(function(e) {
		alert('��ת�鿴��Ʒ������棡');
	})

	//�ӿ�·��(���ֻ�)
	var urlPath_one = "mrsyg/kqgoods/GoodsSales.form";
	var need_data = {};
	var data_one = myAjax(urlPath_one, need_data);
	if(data_one != undefined) {
		init(data_one);
	}

	function init(datas) {
		$.each(datas.data, function(index, getdata) {
			//��ƷͼƬ
			var sell_picture = getdata.sell_picture;
			var sell_picture2x = getDifferencePic(sell_picture, "2x_");
			var sell_picture3x = getDifferencePic(sell_picture, "3x_");
			//��Ʒ����
			var sell_name = getdata.sell_name;
			//��Ʒid
			var product_id = getdata.product_id;
			var needString = '<div class="hot-goods-top hot-goods-top1 col-xs-12">' +
				'<div class="hot-goods-pic col-xs-12">' +
				'<img src="' + sell_picture2x + '" srcset="' + sell_picture2x + ' 2x,' + sell_picture3x + ' 3x"/>' +
				'<svg class="top-icon" aria-hidden="true">' +
				'<use xlink:href="#icon-top3"></use>' +
				'</svg>' +
				'</div>' +
				'<div class="hot-goods-info col-xs-12">' +
				'<span>' + sell_name + '</span>' +
				'</div>' +
				'</div>';
			$(needString).appendTo("#hot_goods_container");
		});
	}

})