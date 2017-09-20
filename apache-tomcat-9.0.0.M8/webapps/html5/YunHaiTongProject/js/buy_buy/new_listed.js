$(function() {
	//买买导航事件，默认新上市active
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

	//新上市商品点击事件
	/*$('.new-listed-content').find('.new-listed-item').click(function(e) {*/
	$('.new-listed-content').on("click",".new-listed-item",function () {
			var product_id = $(this).attr("data-id");
			/*alert(JSON.stringify(product_id))*/
				native.openWebView("goods_detail.jsp?jump_product_id="+product_id);
	})
	//抢手货商品点击事件
	$("#hot_goods_container_first").on("click",'.hot-goods-top',function () {
			/*alert("抢手货新上市商品");*/
			var product_id = $(this).attr("data-id");
				native.openWebView("goods_detail.jsp?jump_product_id="+product_id);
	})

	//限时购商品点击事件
	$(".time-buy-content").on("click",'.time-buy-item',function () {
			var product_id = $(this).attr("data-id");
			var start_time = $(this).attr("data-start_time");
			var end_time = $(this).attr("data-end_time");
			var now_time = $(this).attr("data-now_time");
			native.openWebView("goods_detail.jsp?jump_product_id="+product_id+"&start_time="+start_time+"&end_time="+end_time+"&now_time="+now_time);
		});
	//接口路径(新上市)
	var urlPath_newList = "mrsyg/kqgoods/NewGoods.form";
	var need_newList = {};
	var data_newList = myAjax(urlPath_newList, need_newList);
	if(data_newList != undefined) {
		initNewList(data_newList);
	}
	
	//接口路径(抢手货)
	var urlPath_hotGoods = "mrsyg/kqgoods/GoodsSales.form";
	var need_hotGoods = {};
	var data_hotGoods = myAjax(urlPath_hotGoods, need_hotGoods);
	if(data_hotGoods != undefined) {
		initHotGoods(data_hotGoods);
	}
	
	//接口路径(限时购)
	var urlPath_timeBuy = "mrsyg/kqgoods/DeadlineGoods.form";
	var need_timeBuy = {};
	var data_timeBuy = myAjax(urlPath_timeBuy, need_timeBuy);
	if(data_timeBuy != undefined) {
		initTimeBuy(data_timeBuy);
	}


	//抢手货接口
	var urlPath_hotpursuit = "mrsyg/kqgoods/PregoodsSales.form";
	var need_hotpursuit = {};
	var data_hotpursuit = myAjax(urlPath_hotpursuit, need_hotpursuit);
	if(data_hotpursuit != undefined) {
		initHotPursuit(data_hotpursuit);
	}

	function initNewList(datas) {
		$.each(datas.data, function(index, getdata) {
			//新品照片
			var new_picture = getdata.new_picture;
			var new_picture2x=getDifferencePic(new_picture,"2x_");
			var new_picture3x=getDifferencePic(new_picture,"3x_");
			//新品id
			var product_id = getdata.product_id;
			//新品名称
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
			//商品图片
			var sell_picture = getdata.sell_picture;
			var sell_picture2x = getDifferencePic(sell_picture, "2x_");
			var sell_picture3x = getDifferencePic(sell_picture, "3x_");
			//商品名称
			var sell_name = getdata.sell_name;
			//商品id
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
		//当前时间
		var now_time = datas.current_time;
		//当前时间换算
		var get_nowtime = Date.parse(now_time.replace("-", "/")) / 1000;
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
			function setChangeTime() {
				//活动开始时间
				var start_time = getdata.start_time;
				//活动结束时间
				var end_time = getdata.end_time;
				//开始时间换算
				var get_startime = Date.parse(start_time.replace("-", "/")) / 1000;
				//结束时间换算
				var get_endtime = Date.parse(end_time.replace("-", "/")) / 1000;
				//剩余时间
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
				var remaining_change = "还剩余" + upDates + "天" + upHourse + "小时" + upMinutes + "分" + upseconds + "秒";
				$("#time_change").text(remaining_change);
			}
			//每隔1秒更新一次时间
			var InterValObj = window.setInterval(setChangeTime, 1000);
			var needString = '<div class="time-buy-item col-xs-12" data-id="'+product_id+'" data-start_time="start_time" data-end_time="end_time" data-now_time="now_time">' +
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
				'<span id="time_change"></span>' +
				'</span>' +
				'<span class="buy-now col-xs-3 text-center">马上抢</span>' +
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
				'<span class="yen">￥</span>'+product_price+'</span>' +
				'</span>' +
				'</div>' +
				'</div>'
			$(needString).appendTo(".hot-goods-list");
		})
	}
})