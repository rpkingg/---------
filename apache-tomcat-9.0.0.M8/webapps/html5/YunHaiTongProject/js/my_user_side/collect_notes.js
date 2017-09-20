$(function() {
	//点击编辑按钮
	$(".edit-btn").on("click",function () {
		$(".edit-btn").hide();
		$(".delete_btn").show();
		editCollectedNote();
	})

	//点击删除按钮
	$(".delete_btn").on("click",function () {
		$(".edit-btn").show();
		$(".delete_btn").hide();
		cancleCollectedNote();
		//笔记
		var note_id = "";
		$(".note-item").each(function (i,obj) {
			if($(obj).find(".edit-icon").hasClass("selected")){
				note_id = note_id + $(obj).attr("id")+";";
			}
		})
		var urlPath_one = "mrsyg/kquser/DeleteCollection.form";
		var need_data = {
			"parameter_ids":note_id ,
			"type":4
		};
		var data_one = myAjax(urlPath_one, need_data);
		if(data_one != undefined) {
			init(data_one);
		}
		function init(datas) {
			return false;
		}

		//商品
		var product_id = "";
		$(".collect-goods-item").each(function (i,obj) {
			if ($(obj).find(".edit-icon").hasClass("selected")){
				product_id = product_id + $(obj).attr("id")+ ";";
			}
		})
				var urlPath_two = "mrsyg/kquser/DeleteCollection.form";
				var need_data_goods = {
					"parameter_ids":product_id,
					"type":7
				};
				var data_two = myAjax(urlPath_two, need_data_goods);
				if(data_two != undefined) {
					init(data_two);
				}
				function init(datas) {
					return false;
				}
		//店铺
		var shop_id = "";
		$(".collect-stores-item").each(function (i,obj) {
			if ($(obj).find(".edit-icon").hasClass("selected")) {
				shop_id =shop_id+ $(obj).attr("id")+ ";";
			}
		})
			var urlPath_thr = "mrsyg/kquser/DeleteCollection.form";
			var need_data_shop = {
				"parameter_ids":shop_id,
				"type":3
			};
			var data_thr = myAjax(urlPath_thr, need_data_shop);
			if(data_thr != undefined) {
				init(data_thr);
			}
			function init(datas) {
				return false;
			}
		window.location.reload();
	})
	//我的-收藏单导航事件，默认笔记active
	$('.collect-nav-bar span').click(function(e) {
		//获取选中的类型（笔记-note，商品-goods，店铺-shop）
		var selectedType = $(this).attr("id");
		$(this).siblings('span').removeClass('active');
		$(this).addClass('active');
		if($(this).hasClass('collect-notes')) {
			$('.collect-notes-content').show();
		}
		switch(selectedType) {
			case "note":
				$("#collection_note_container").show();
				$("#collection_goods_container").hide();
				$("#collection_shop_container").hide();
				break;
			case "goods":
				$("#collection_note_container").hide();
				$("#collection_goods_container").show();
				$("#collection_shop_container").hide();
				break;
			case "shop":
				$("#collection_note_container").hide();
				$("#collection_goods_container").hide();
				$("#collection_shop_container").show();
				break;
			default:
				break;
		}
	});

	//查看笔记详情事件
	$('.note-item').click(function(e) {
		alert('跳转查看笔记详情界面！');
	});
	//查看商品详情事件
	$('.collect-goods-item').click(function(e) {
		alert('跳转查看商品详情界面！');
	});
	//查看店铺详情事件
	$('.collect-stores-item').click(function(e) {
		alert('跳转查看店铺详情界面！');
	});

	//点击编辑按钮(笔记)
	var editCollectedNote = function() {
		$('.collect-notes-content .note-item').find('.edit-icon').show();
		$('.notes-edit-opt-nar').show();
		$('.collect-notes-content').css({
			marginBottom: '3.5rem'
		});
		//编辑模式下，单个笔记点击事件
		if($('.collect-notes-content .note-item').find('.edit-icon').length > 0) {
			$('.note-item').unbind("click");
			$('.note-item').click(function(e) {
				if ($(this).find('.edit-icon').hasClass("selected")){
					$(this).find('.edit-icon').removeClass('selected');
				}
				else {
					$(this).find('.edit-icon').addClass('selected');
				}
			})
		}
	}
	//取消编辑事件(笔记)
	var cancleCollectedNote = function() {
		$('.collect-notes-content .note-item').find('.edit-icon').hide();
		$('.notes-edit-opt-nar').hide();
		$('.collect-notes-content').css({
			marginBottom: '0'
		})
		$('.note-item').unbind("click");
		//查看笔记详情事件
		$('.note-item').click(function(e) {
			alert('跳转查看笔记详情界面！');
		});
	}

	//点击编辑按钮（商品）
	var editCollectedGoods = function() {
		$('.collect-goods-content .collect-goods-item').find('.edit-icon').show();
		$('.goods-edit-opt-nar').show();
		$('.collect-goods-content').css({
			marginBottom: '3.5rem'
		});
		//编辑模式下，单个商品点击事件
		if($('.collect-goods-content .collect-goods-item').find('.edit-icon').length > 0) {
			$('.collect-goods-item').unbind("click");
			$('.collect-goods-item').click(function(e) {
				$(this).find('.iconfont').removeClass('icon-quan');
				$(this).find('.iconfont').addClass('icon-xuanzedui');
			})
		}
	}
	//取消编辑事件（商品）
	var cancleCollectedGoods = function() {
		$('.collect-goods-content .collect-goods-item').find('.edit-icon').hide();
		$('.goods-edit-opt-nar').hide();
		$('.collect-goods-content').css({
			marginBottom: '0'
		})
		$('.collect-goods-item').unbind("click");
		//查看商品详情事件
		$('.collect-goods-item').click(function(e) {
			alert('跳转查看商品详情界面！');
		});
	}

	//点击编辑按钮（店铺）
	var editCollectedStores = function() {
		$('.collect-stores-content .collect-stores-item').find('.edit-icon').show();
		$('.stores-edit-opt-nar').show();
		$('.collect-stores-content').css({
			marginBottom: '3.5rem'
		});
		//编辑模式下，单个店铺点击事件
		if($('.collect-stores-content .collect-stores-item').find('.edit-icon').length > 0) {
			$('.collect-stores-item').unbind("click");
			$('.collect-stores-item').click(function(e) {
				$(this).find('.iconfont').removeClass('icon-quan');
				$(this).find('.iconfont').addClass('icon-xuanzedui');
			})
		}
	}
	//取消编辑事件（店铺）
	var cancleCollectedStores = function() {
		$('.collect-stores-content .collect-stores-item').find('.edit-icon').hide();
		$('.stores-edit-opt-nar').hide();
		$('.collect-stores-content').css({
			marginBottom: '0'
		})
		$('.collect-stores-item').unbind("click");
		//查看店铺详情事件
		$('.collect-stores-item').click(function(e) {
			alert('跳转查看店铺详情界面！');
		});
	}

	//模拟编辑和取消编辑事件，实际开发需删除
	/*setTimeout(function() {
		editCollectedNote();
	}, 3000)

	setTimeout(function() {
		cancleCollectedNote();
	}, 8000)*/

	//批量删除收藏的笔记
	$('.notes-edit-opt-nar').click(function(e) {
		alert('批量删除收藏的笔记!')
	});
	//批量删除收藏的商品
	$('.goods-edit-opt-nar').click(function(e) {
		alert('批量删除收藏的商品!')
	});
	//批量删除收藏的店铺
	$('.stores-edit-opt-nar').click(function(e) {
		alert('批量删除收藏的店铺!')
	});

	//接口路径（收藏单-笔记）
	//mrsyg/kquser/NoteCollection.form?pag_no=1&pag_num=100
	var urlPath_note = "mrsyg/kquser/NoteCollection.form";
	var need_note = {
		"pag_no": "1",
		"pag_num": "100"
	};
	var data_note = myAjax(urlPath_note, need_note);
	if(data_note != undefined) {
		initNote(data_note);
	}

	//接口路径（收藏单-商品）
	//mrsyg/kquser/GoodsCollection.form?pag_no=1&pag_num=100
	var urlPath_goods = "mrsyg/kquser/GoodsCollection.form";
	var need_goods = {
		"pag_no": "1",
		"pag_num": "100"
	};
	var data_goods = myAjax(urlPath_goods, need_goods);
	if(data_goods != undefined) {
		initGoods(data_goods);
	}

	//接口路径（收藏单-店铺）
	//mrsyg/kquser/ShopCollection.form?pag_no=1&pag_num=100
	var urlPath_shop = "mrsyg/kquser/ShopCollection.form";
	var need_shop = {
		"pag_no": "1",
		"pag_num": "100"
	};
	var data_shop = myAjax(urlPath_shop, need_shop);
	if(data_shop != undefined) {
		initShop(data_shop);
	}

	function initNote(datas) {
		//收藏笔记数量
		var col_note_total = datas.col_note_total;
		//收藏商品数量
		var col_goods_total = datas.col_goods_total;
		//收藏店铺数量
		var col_shop_total = datas.col_shop_total;
		$("#node_num").text(col_note_total);
		$("#goods_num").text(col_goods_total);
		$("#shop_num").text(col_shop_total);
		$.each(datas.data, function(index, getdata) {
			//笔记id
			var note_id = getdata.note_id;
			//笔记照片
			var picture_url = getdata.picture_url;
			//笔记名称
			var note_name = getdata.note_name;
			//笔记描述
			//笔记发表时间
			var created_at = getdata.created_at;
			var needString = '<div class="note-item col-xs-12" id="' + note_id + '">' +
				'<div class="note-cover col-xs-12">' +
				'<img src="' + picture_url + '"/>' +
				'</div>' +
				'<span class="note-title col-xs-12 text-left">' + note_name + '</span>' +
				'<span class="note-intro-text col-xs-12 text-left">自从红色特别版手机上市后大家对这中国红貌似还是情</span>' +
				'<span class="collect-time col-xs-12 text-left">' +
				'<span class="iconfont icon-shijian"></span>' +
				'<span class="collect-time-text">' + created_at + '</span>' +
				'</span>' +
				'<span class="edit-icon hide">' +
				'<span class="iconfont icon-gou"></span>' +
				'</span>' +
				'</div>';
			if(index % 2 == 0) {
				$(needString).appendTo(".notes-left-item");
			} else if(index % 2 == 1) {
				$(needString).appendTo(".notes-right-item");
			}
		});
	}

	function initGoods(datas) {
		$.each(datas.data, function(index, getdata) {
			//商品id
			var product_id = getdata.product_id;
			//商品图片
			var picture_url = getdata.picture_url;
			//商品名称
			var product_name = getdata.product_name;
			var needString = '<div class="collect-goods-item col-xs-12" id="' + product_id + '">' +
				'<span class="edit-icon hide">' +
				'<span class="iconfont icon-quan"></span>' +
				'</span>' +
				'<div class="goods-pic col-xs-2">' +
				'<img src="' + picture_url + '"/>' +
				'</div>' +
				'<span class="goods-name col-xs-9 text-left">' + product_name + '</span>' +
				'</div>';
			$(needString).appendTo(".collect-goods-content");
		});
	}

	function initShop(datas) {
		$.each(datas.data, function(index, getdata) {
			//店铺id
			var shop_id = getdata.shop_id;
			//店铺名称
			var shop_name = getdata.shop_name;
			var needString = '<div class="collect-stores-item col-xs-12" id="' + shop_id + '">' +
				'<span class="edit-icon hide">' +
				'<span class="iconfont icon-quan"></span>' +
				'</span>' +
				'<span class="stores-name col-xs-12 text-left">' + shop_name + '</span>' +
				'</div>';
			$(needString).appendTo(".collect-stores-content");
		});
	}
})