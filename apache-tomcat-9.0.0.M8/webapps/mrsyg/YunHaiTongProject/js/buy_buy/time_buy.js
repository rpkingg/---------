(function($, document) {
	var pag_no = 0;
	// 总页数
	var total_rec_num2 = 0;
	var total_rec_num1 = 100;

	function refreshData(callback) {
		pag_no = 1;
		total_rec_num2 = 0;
		loadData(true,callback);
	}

	function loadMoreData(callback) {
		loadData(false,callback);
	}

	function loadData(firstFlag, callback) {
		//接口路径(限时购)
		var urlPath_timeBuy = "/mrsyg/kqgoods/DeadlineGoods.form";
		var need_timeBuy = {
			"pag_no": pag_no,
			"pag_num": "2"
		};
		//var data_timeBuy = asyncAjax(urlPath_timeBuy, need_timeBuy, initTimeBuy);
		$.ajax({
			type: "post",
			url: urlPath_timeBuy,
			dataType: "json",
			contentType: "application/x-www-form-urlencoded; charset=GBK",
			data: need_timeBuy,
			cache: false,
			success: function(res) {
				console.log("mytools.js, aysncAjax:[" + urlPath_timeBuy + "], success:[" + JSON.stringify(res) + "]");
				if(res.gda.msg_typ === "N") {
					var flag = initTimeBuy(res,firstFlag);
					if( callback ) {
						callback(flag);
					}
				} else {
					if( callback) {
						callback();
					}
					console.log("mytools.js, aysncAjax:[" + urlPath_timeBuy + "], success:[" + JSON.stringify(res) + "]");
				}
			},
			error: function(jqXHR, textStatus, errorThrown) {
				if( callback) {
					callback();
				}
				console.error("mytools.js, aysncAjax:[" + urlPath_timeBuy + "], error:[" + jqXHR.status + ":" + textStatus + ":" + errorThrown + "]");
			}
		});
	}

	function initTimeBuy(datas,firstFlag) {
		if( !datas.hasOwnProperty("data") ) {
			if( firstFlag) {
				$("#time_buy_container>.time-buy-content").html("");
			}
			return false;
		}
		var result = "";
		if(firstFlag && datas.hasOwnProperty("sum")) {
			total_rec_num1 = datas.sum;
		}
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
			//活动开始时间
			var start_time = getdata.start_time;
			//活动结束时间
			var end_time = getdata.end_time;
			function setChangeTime() {
				//活动开始时间
				var start_time = getdata.start_time;
				//活动结束时间
				var end_time = getdata.end_time;
				// console.log("end_time:" + end_time + ",start_time:" + start_time);
				var diffMSeconds = new Date(end_time.replace(/-/g, "/")).getTime() - new Date().getTime();
				//console.log("goods_detail.js,diffMSeconds:" + diffMSeconds);
				var days = Math.floor(diffMSeconds / (24 * 3600 * 1000));
				var leave1 = diffMSeconds % (24 * 3600 * 1000);
				var hours = Math.floor(leave1 / (3600 * 1000));
				var leave2 = leave1 % (3600 * 1000);
				var minutes = Math.floor(leave2 / (60 * 1000));
				var leave3 = leave2 % (60 * 1000);
				var seconds = Math.round(leave3 / 1000);
				var remaining_change = "还剩余" + days + "天" + hours + "小时" + minutes + "分" + seconds + "秒";
				$("#time_change" + index).text(remaining_change);
			}
			//每隔1秒更新一次时间
			var InterValObj = window.setInterval(setChangeTime, 1000);

			var needString = '<div class="time-buy-item col-xs-12" data-id="' + product_id + '" data-end_time="' + end_time + '" data-start_time="' + start_time + '">' +
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
				'<span id="time_change' + index + '"></span>' +
				'</span>' +
				'<span class="buy-now col-xs-3 text-center">马上抢</span>' +
				'</div>' +
				'</div>' +
				'</div>';
			result = result + needString;
		});
		// $(needString).appendTo("#time_buy_container>.time-buy-content");
		if(firstFlag) {
			$("#time_buy_container>.time-buy-content").html(result);
		} else {
			$("#time_buy_container>.time-buy-content").append(result);
		}
		//$("#time_buy_container>.time-buy-content").html(result);
		$(".time-buy-content").off("click").on('click',".time-buy-item",function () {

		});
		//限时购商品点击事件
		$(".time-buy-content").on('click',".time-buy-item",function () {
			var product_id = $(this).attr("data-id");
			var start_time = $(this).attr("data-start_time");
			var end_time = $(this).attr("data-end_time");
			var now_time = $(this).attr("data-now_time");
			native.openWebView("goods_detail.jsp?jump_product_id=" + product_id + "&start_time=" + start_time + "&end_time=" + end_time + "&now_time=" + now_time);
		});
	}
	
	// dropload
	var dropload = $('#content2').dropload({
		scrollArea : window,
		distance:100,
		threshold:100,
		domUp : {
			domClass   : 'dropload-up',
			domRefresh : '<div class="dropload-refresh">↓下拉刷新</div>',
			domUpdate  : '<div class="dropload-update">↑释放更新</div>',
			domLoad    : '<div class="dropload-load"><span class="loading"></span>加载中...</div>'
		},
		domDown : {
			domClass   : 'dropload-down',
			domRefresh : '<div class="dropload-refresh">↑上拉加载更多</div>',
			domLoad    : '<div class="dropload-load"><span class="loading"></span>加载中...</div>',
			domNoData  : '<div class="dropload-noData">暂无数据</div>'
		},
		loadUpFn : function(me){                    // 为了测试，延迟1秒加载
			refreshData(function (flag) {
				console.log("refreshData, flag:" + flag);
				if(!flag) {
					me.resetload();
					me.noData(true);
					me.unlock();
					me.resetload();
				} else {
					me.resetload();
					me.noData(false);
					me.unlock();
					me.resetload();
				}
			});
		},
		loadDownFn : function(me){
			console.log("loadDownFn");
			pag_no++;
			loadMoreData(function (flag) {
				if( !flag ) {
					me.lock();
					me.noData(true);
					me.resetload();
				} else {
					me.resetload();
					me.noData(false);
					// me.unlock();
				}
			});
		}
	});
})(jQuery, document);
