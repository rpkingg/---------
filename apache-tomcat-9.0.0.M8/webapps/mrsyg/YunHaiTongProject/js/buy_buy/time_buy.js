(function($, document) {
	var pag_no = 0;
	// ��ҳ��
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
		//�ӿ�·��(��ʱ��)
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
			//���ʼʱ��
			var start_time = getdata.start_time;
			//�����ʱ��
			var end_time = getdata.end_time;
			function setChangeTime() {
				//���ʼʱ��
				var start_time = getdata.start_time;
				//�����ʱ��
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
				var remaining_change = "��ʣ��" + days + "��" + hours + "Сʱ" + minutes + "��" + seconds + "��";
				$("#time_change" + index).text(remaining_change);
			}
			//ÿ��1�����һ��ʱ��
			var InterValObj = window.setInterval(setChangeTime, 1000);

			var needString = '<div class="time-buy-item col-xs-12" data-id="' + product_id + '" data-end_time="' + end_time + '" data-start_time="' + start_time + '">' +
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
				'<span id="time_change' + index + '"></span>' +
				'</span>' +
				'<span class="buy-now col-xs-3 text-center">������</span>' +
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
		//��ʱ����Ʒ����¼�
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
			domRefresh : '<div class="dropload-refresh">������ˢ��</div>',
			domUpdate  : '<div class="dropload-update">���ͷŸ���</div>',
			domLoad    : '<div class="dropload-load"><span class="loading"></span>������...</div>'
		},
		domDown : {
			domClass   : 'dropload-down',
			domRefresh : '<div class="dropload-refresh">���������ظ���</div>',
			domLoad    : '<div class="dropload-load"><span class="loading"></span>������...</div>',
			domNoData  : '<div class="dropload-noData">��������</div>'
		},
		loadUpFn : function(me){                    // Ϊ�˲��ԣ��ӳ�1�����
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
