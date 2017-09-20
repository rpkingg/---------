$(function() {
	//���򵼺��¼���Ĭ��������active
	$('.buy-buy-nav-bar span').click(function(e) {
		$(this).siblings('span').removeClass('active');
		$(this).addClass('active');
		var clickedId=$(this).attr("id");
		switch (clickedId){
			case "01":
				$("#new_listed_container").show();
				$("#hot_goods_container").hide();
				$("#time_buy_container").hide();
				break;
			case "02":
				$("#new_listed_container").hide();
				$("#hot_goods_container").show();
				$("#time_buy_container").hide();
				break;
			case "03":
				$("#new_listed_container").hide();
				$("#hot_goods_container").hide();
				$("#time_buy_container").show();
				break;	
			default:
				break;
		}
	});

	//��������Ʒ����¼�
	/*$('.new-listed-content').find('.new-listed-item').click(function(e) {*/
	$('.new-listed-content').on("click",".new-listed-item",function () {
			var product_id = $(this).attr("data-id");
			/*alert(JSON.stringify(product_id))*/
				native.openWebView("goods_detail.jsp?jump_product_id="+product_id);
	})
	//���ֻ���Ʒ����¼�
	$("#hot_goods_container_first").on("click",'.hot-goods-top',function () {
			/*alert("���ֻ���������Ʒ");*/
			var product_id = $(this).attr("data-id");
				native.openWebView("goods_detail.jsp?jump_product_id="+product_id);
	})

	//��ʱ����Ʒ����¼�
	$(".time-buy-content").on("click",'.time-buy-item',function () {
			var product_id = $(this).attr("data-id");
			var start_time = $(this).attr("data-start_time");
			var end_time = $(this).attr("data-end_time");
			var now_time = $(this).attr("data-now_time");
			native.openWebView("goods_detail.jsp?jump_product_id="+product_id+"&start_time="+start_time+"&end_time="+end_time+"&now_time="+now_time);
		});
	//�ӿ�·��(������)
	var urlPath_newList = "mrsyg/kqgoods/NewGoods.form";
	var need_newList = {};
	var data_newList = myAjax(urlPath_newList, need_newList);
	if(data_newList != undefined) {
		initNewList(data_newList);
	}
	
	//�ӿ�·��(���ֻ�)
	var urlPath_hotGoods = "mrsyg/kqgoods/GoodsSales.form";
	var need_hotGoods = {};
	var data_hotGoods = myAjax(urlPath_hotGoods, need_hotGoods);
	if(data_hotGoods != undefined) {
		initHotGoods(data_hotGoods);
	}
	
	//�ӿ�·��(��ʱ��)
	var urlPath_timeBuy = "mrsyg/kqgoods/DeadlineGoods.form";
	var need_timeBuy = {};
	var data_timeBuy = myAjax(urlPath_timeBuy, need_timeBuy);
	if(data_timeBuy != undefined) {
		initTimeBuy(data_timeBuy);
	}


	//���ֻ��ӿ�
	var urlPath_hotpursuit = "mrsyg/kqgoods/PregoodsSales.form";
	var need_hotpursuit = {};
	var data_hotpursuit = myAjax(urlPath_hotpursuit, need_hotpursuit);
	if(data_hotpursuit != undefined) {
		initHotPursuit(data_hotpursuit);
	}

	function initNewList(datas) {
		$.each(datas.data, function(index, getdata) {
			//��Ʒ��Ƭ
			var new_picture = getdata.new_picture;
			var new_picture2x=getDifferencePic(new_picture,"2x_");
			var new_picture3x=getDifferencePic(new_picture,"3x_");
			//��Ʒid
			var product_id = getdata.product_id;
			//��Ʒ����
			/*alert(JSON.stringify(product_id))*/
			var new_name = getdata.new_name;
			var needString = '<div class="new-listed-item col-xs-12" data-id="'+product_id+'">' +
				'<div class="new-listed-goods-pic col-xs-12">' +
				'<img src="'+new_picture2x+'" srcset="'+new_picture2x+' 2x,'+new_picture3x+' 3x"/>'+
				'</div>' +
				'<div class="new-listed-goods-info col-xs-12">' +
				'<span>'+new_name+'</span>' +
				'</div>' +
				'</div>';
			$(needString).appendTo(".new-listed-content");
		});
	}

	function initHotGoods(datas) {
		$.each(datas.data, function(index, getdata) {
			//��ƷͼƬ
			var sell_picture = getdata.sell_picture;
			var sell_picture2x = getDifferencePic(sell_picture, "2x_");
			var sell_picture3x = getDifferencePic(sell_picture, "3x_");
			//��Ʒ����
			var sell_name = getdata.sell_name;
			//��Ʒid
			var product_id = getdata.product_id;
			var needString = '<div class="hot-goods-top hot-goods-top1 col-xs-12" data-id="'+product_id+'">' +
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
			$(needString).appendTo("#hot_goods_container_first");
		});
	}
	
	
	function initTimeBuy(datas) {
		//��ǰʱ��
		var now_time = datas.current_time;
		//��ǰʱ�任��
		var get_nowtime = Date.parse(now_time.replace("-", "/")) / 1000;
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
			function setChangeTime() {
				//���ʼʱ��
				var start_time = getdata.start_time;
				//�����ʱ��
				var end_time = getdata.end_time;
				//��ʼʱ�任��
				var get_startime = Date.parse(start_time.replace("-", "/")) / 1000;
				//����ʱ�任��
				var get_endtime = Date.parse(end_time.replace("-", "/")) / 1000;
				//ʣ��ʱ��
				if(remainning_time !=0){
					get_nowtime = get_nowtime + 1;
				}
				else{
					return false;
				}
				var remainning_time =get_endtime - get_nowtime;
				
				var upDates = parseInt(remainning_time / 86400);
				var upHourse = parseInt(remainning_time % 86400 / 3600);
				var upMinutes = parseInt(remainning_time % 86400 % 3600 / 60);
				var upseconds = parseInt(remainning_time % 86400 % 3600%60);
				var remaining_change = "��ʣ��" + upDates + "��" + upHourse + "Сʱ" + upMinutes + "��" + upseconds + "��";
				$("#time_change").text(remaining_change);
			}
			//ÿ��1�����һ��ʱ��
			var InterValObj = window.setInterval(setChangeTime, 1000);
			var needString = '<div class="time-buy-item col-xs-12" data-id="'+product_id+'" data-start_time="start_time" data-end_time="end_time" data-now_time="now_time">' +
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
				'<span id="time_change"></span>' +
				'</span>' +
				'<span class="buy-now col-xs-3 text-center">������</span>' +
				'</div>' +
				'</div>' +
				'</div>';
			$(needString).appendTo(".time-buy-content");
		});
	}

	function initHotPursuit(datas) {
		$.each(datas.data, function (index, getData) {
			var product_name = getdata.product_name;
			var product_id = getdata.product_id;
			var picture_url = getdate.picture_url;
			var product_price = getdata.product_price;
			var needString = '<div class="goods-left-item col-xs-6">' +
				'<div class="hot-goods-item col-xs-12">' +
				'<div class="goods-cover col-xs-8 col-xs-offset-2">' +
				'<img src="image/buy_buy/0D23D0AA-5CF8-4213-A7E8-659DFCB48DD5.png" />' +
				'</div>' +
				'<span class="goods-title col-xs-12">'+product_name+'</span>' +
				'<span class="goods-price-container col-xs-12">' +
				'<span class="goods-price-new col-xs-5 col-xs-offset-1">' +
				'<span class="yen">��</span>'+product_price+'</span>' +
				'</span>' +
				'</div>' +
				'</div>'
			$(needString).appendTo(".hot-goods-list");
		})
	}
})