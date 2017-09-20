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
		//接口路径
		//mrsyg/kqgoods/GoodShop.form?pag_no=1&pag_num=100
		var urlPath_hotGoods ="/mrsyg/kqgoods/GoodsSales.form";
		var need_hotGoods = {
			"pag_no": pag_no,
			"pag_num": "2"
		};
		//asyncAjax(urlPath_newList, need_newList, initNewList);

		//抢手货接口
		var urlPath_hotpursuit = "/mrsyg/kqgoods/PregoodsSales.form";
		var need_hotpursuit = {
			"pag_no": pag_no,
			"pag_num": "2"
		};
		//var data_hotpursuit = asyncAjax(urlPath_hotpursuit, need_hotpursuit, initHotPursuit);
		$.ajax({
			type: "post",
			url: urlPath_hotGoods,
			dataType: "json",
			contentType: "application/x-www-form-urlencoded; charset=GBK",
			data: need_hotpursuit,
			cache: false,
			success: function(res) {
				console.log("mytools.js, aysncAjax:[" + urlPath_hotGoods + "], success:[" + JSON.stringify(res) + "]");
				if(res.gda.msg_typ === "N") {
					var flag = initHotGoods(res,firstFlag);
					if( callback ) {
						callback(flag);
					}
				} else {
					if( callback) {
						callback();
					}
					console.log("mytools.js, aysncAjax:[" + urlPath_hotGoods + "], success:[" + JSON.stringify(res) + "]");
				}
			},
			error: function(jqXHR, textStatus, errorThrown) {
				if( callback) {
					callback();
				}
				console.error("mytools.js, aysncAjax:[" + urlPath_hotGoods + "], error:[" + jqXHR.status + ":" + textStatus + ":" + errorThrown + "]");
			}
		});

		$.ajax({
			type: "post",
			url: urlPath_hotpursuit,
			dataType: "json",
			contentType: "application/x-www-form-urlencoded; charset=GBK",
			data: need_hotGoods,
			cache: false,
			success: function(res) {
				console.log("mytools.js, aysncAjax:[" + urlPath_hotpursuit + "], success:[" + JSON.stringify(res) + "]");
				if(res.gda.msg_typ === "N") {
					var flag = initHotPursuit(res,firstFlag);
					if( callback ) {
						callback(flag);
					}
				} else {
					if( callback) {
						callback();
					}
					console.log("mytools.js, aysncAjax:[" + urlPath_hotpursuit + "], success:[" + JSON.stringify(res) + "]");
				}
			},
			error: function(jqXHR, textStatus, errorThrown) {
				if( callback) {
					callback();
				}
				console.error("mytools.js, aysncAjax:[" + urlPath_hotpursuit + "], error:[" + jqXHR.status + ":" + textStatus + ":" + errorThrown + "]");
			}
		});
	}


	function initHotGoods(datas,firstFlag) {
		if( !datas.hasOwnProperty("data") ) {
			if( firstFlag) {
				$("#hot_goods_container_first").html("");
			}
			return false;
		}
		var result = "";
		if(firstFlag && datas.hasOwnProperty("sum")) {
			total_rec_num1 = datas.sum;
		}
		$.each(datas.data, function (index, getdata) {
			//商品图片
			var sell_picture = getdata.sell_picture;
			var sell_picture2x = getDifferencePic(sell_picture, "2x_");
			var sell_picture3x = getDifferencePic(sell_picture, "3x_");
			//商品名称
			var sell_name = getdata.sell_name;
			//商品id
			var product_id = getdata.product_id;
			var needString = '<div class="hot-goods-top hot-goods-top1 col-xs-12" data-id="' + product_id + '">' +
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
			// $(needString).appendTo("#hot_goods_container_first");
			result = result + needString;
		});
		if(firstFlag) {
			$("#hot_goods_container_first").html(result);
		} else {
			$("#hot_goods_container_first").append(result);
		}
		$("#hot_goods_container_first").off("click").on('click',".hot-goods-top",function () {
		});
		//抢手货商品点击事件
		$("#hot_goods_container_first").on('click',".hot-goods-top",function () {
			/*alert("抢手货新上市商品");*/
			var product_id = $(this).attr("data-id");
			native.openWebView("goods_detail.jsp?jump_product_id=" + product_id);
		});
	}

	function initHotPursuit(datas,firstFlag) {
		if( !datas.hasOwnProperty("data") ) {
			if( firstFlag) {
				$(".hot-goods-list").html("");
			}
			return false;
		}
		var result = "";
		if(firstFlag && datas.hasOwnProperty("sum")) {
			total_rec_num1 = datas.sum;
		}
		$.each(datas.data, function (index, getData) {
			var product_name = getData.product_name;
			var product_id = getData.product_id;
			var picture_url = getData.picture_url;
			var product_price = getData.product_price;
			if(index % 2 == 0) {
				var needString = '<div class="goods-left-item col-xs-6" data-id="' + product_id + '">' +
					'<div class="hot-goods-item col-xs-12">' +
					'<div class="goods-cover col-xs-8 col-xs-offset-2">' +
					'<img src="' + picture_url + '" />' +
					'</div>' +
					'<span class="goods-title col-xs-12">' + product_name + '</span>' +
					'<span class="goods-price-container col-xs-12">' +
					'<span class="goods-price-new col-xs-5 col-xs-offset-1 col-xs-width">' +
					'<span class="yen">￥</span>' + product_price + '</span>' +
					'</span>' +
					'</div>' +
					'</div>'
				result = result + needString;
			} else if(index % 2 == 1) {
				var needString = '<div class="goods-right-item col-xs-6" data-id="' + product_id + '">' +
					'<div class="hot-goods-item col-xs-12">' +
					'<div class="goods-cover col-xs-8 col-xs-offset-2">' +
					'<img src="' + picture_url + '" />' +
					'</div>' +
					'<span class="goods-title col-xs-12">' + product_name + '</span>' +
					'<span class="goods-price-container col-xs-12">' +
					'<span class="goods-price-new col-xs-5 col-xs-offset-1 col-xs-width">' +
					'<span class="yen">￥</span>' + product_price + '</span>' +
					'</span>' +
					'</div>' +
					'</div>'
				result = result + needString;
			}
		});

		if(firstFlag) {
			$(".hot-goods-list").html(result);
		} else {
			$(".hot-goods-list").append(result);
		}
		//$(".hot-goods-list").html(result);

		$(".hot-goods-list").off("click").on('click',".goods-right-item",function () {

		});

		$(".hot-goods-list").on('click',".goods-right-item",function () {
			var product_id = $(this).attr("data-id");
			native.openWebView("goods_detail.jsp?jump_product_id=" + product_id);
		});

		$(".hot-goods-list").off('click').on('click',".goods-left-item",function () {

		});

		//扫货时刻点击事件
		$(".hot-goods-list").on('click',".goods-left-item",function () {
			var product_id = $(this).attr("data-id");
			native.openWebView("goods_detail.jsp?jump_product_id=" + product_id);
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
