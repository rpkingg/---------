$(function() {
	//买买导航事件，默认新上市active
	$('.buy-buy-nav-bar span').click(function(e) {
		$(this).siblings('span').removeClass('active');
		$(this).addClass('active');
		if($(this).hasClass('time-buy')) {
			$('.time-buy-content').show();
		}
	});

	//新上市商品点击事件
	$('.time-buy-content').find('.time-buy-item').click(function(e) {
		alert('跳转查看商品详情界面！');

	});

	//接口路径(限时购)
	var urlPath_one = "mrsyg/kqgoods/DeadlineGoods.form";
	var need_data = {};
	var data_one = myAjax(urlPath_one, need_data);
	if(data_one != undefined) {
		init(data_one);
	}

	function init(datas) {
		$.each(datas.data, function(index, getdata) {
			//商品图片
			var deadline_picture = getdata.deadline_picture;
			var deadline_picture2x = getDifferencePic(deadline_picture, "2x_");
			var deadline_picture3x = getDifferencePic(deadline_picture, "3x_");
			//商品id
			var product_id = getdata.product_id;
			//商品名称
			var deadline_name = getdata.deadline_name;
			//商品价格
			var deadline_price = getdata.deadline_price;
			//活动开始时间
			var start_time = getdata.start_time;
			//活动结束时间
			var end_time = getdata.end_time;
			var needString = '<div class="time-buy-item col-xs-12">' +
				'<div class="time-buy-goods-pic col-xs-12">' +
				'<img src="' + deadline_picture2x + '" srcset="' + deadline_picture2x + ' 2x,' + deadline_picture3x + ' 3x">' +
				'</div>' +
				'<div class="time-buy-goods-info col-xs-12">' +
				'<div class="goods-base-info col-xs-12">' +
				'<span class="goods-name col-xs-9 text-left">' + deadline_name + '</span>' +
				'<span class="goods-price col-xs-3 text-center">' +
				'<span class="yuan">￥</span>' + deadline_price + '</span>' +
				'</div>' +
				'<div class="time-endline-opt col-xs-12">' +
				'<span class="count-down col-xs-9 text-left">' +
				'<span class="iconfont icon-shijian"></span>' +
				'<span>剩余2天21小时32分12秒</span>' +
				'</span>' +
				'<span class="buy-now col-xs-3 text-center">马上抢</span>' +
				'</div>' +
				'</div>' +
				'</div>';
			$(needString).appendTo("#time_buy_container");
		});
	}
})