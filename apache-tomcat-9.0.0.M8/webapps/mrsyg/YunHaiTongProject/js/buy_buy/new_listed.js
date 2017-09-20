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
		var urlPath_newList ="/mrsyg/kqgoods/NewGoods.form";
		var need_newList = {
			"pag_no": pag_no,
			"pag_num": "2"
		};
		//asyncAjax(urlPath_newList, need_newList, initNewList);

		$.ajax({
			type: "post",
			url: urlPath_newList,
			dataType: "json",
			contentType: "application/x-www-form-urlencoded; charset=GBK",
			data: need_newList,
			cache: false,
			success: function(res) {
				console.log("mytools.js, aysncAjax:[" + urlPath_newList + "], success:[" + JSON.stringify(res) + "]");
				if(res.gda.msg_typ === "N") {
					var flag = initNewList(res,firstFlag);
					if( callback ) {
						callback(flag);
					}
				} else {
					if( callback) {
						callback();
					}
					console.log("mytools.js, aysncAjax:[" + urlPath_newList + "], success:[" + JSON.stringify(res) + "]");
				}
			},
			error: function(jqXHR, textStatus, errorThrown) {
				if( callback) {
					callback();
				}
				console.error("mytools.js, aysncAjax:[" + urlPath_newList + "], error:[" + jqXHR.status + ":" + textStatus + ":" + errorThrown + "]");
			}
		});
	}

	//接口路径(新上市)


	function initNewList(datas,firstFlag) {
		if( !datas.hasOwnProperty("data") ) {
			if( firstFlag) {
				$("#new_listed_container>.new-listed-content").html("");
			}
			return false;
		}
		var result = "";
		if(firstFlag && datas.hasOwnProperty("sum")) {
			total_rec_num1 = datas.sum;
		}
		$.each(datas.data, function (index, getdata) {
			//新品照片
			var new_picture = getdata.new_picture;
			var new_picture2x = getDifferencePic(new_picture, "2x_");
			var new_picture3x = getDifferencePic(new_picture, "3x_");
			//新品id
			var product_id = getdata.product_id;
			//新品名称
			var new_name = getdata.new_name;
			var needString = '<div class="new-listed-item col-xs-12" data-id="' + product_id + '">' +
				'<div class="new-listed-goods-pic col-xs-12">' +
				'<img src="' + new_picture2x + '" srcset="' + new_picture2x + ' 2x,' + new_picture3x + ' 3x"/>' +
				'</div>' +
				'<div class="new-listed-goods-info col-xs-12">' +
				'<span>' + new_name + '</span>' +
				'</div>' +
				'</div>';
			// $(needString).appendTo("#new_listed_container>.new-listed-content");
			result = result + needString;
			total_rec_num2++;
		});
		if(firstFlag) {
			$("#new_listed_container>.new-listed-content").html(result);
		} else {
			$("#new_listed_container>.new-listed-content").append(result);
		}

		//$("#new_listed_container>.new-listed-content").html(result);
        $(".new-listed-content").off("click").on('click',".new-listed-item",function () {
        });

        $(".new-listed-content").on('click',".new-listed-item",function () {
            var product_id = $(this).attr("data-id");
            /*alert(JSON.stringify(product_id))*/
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
