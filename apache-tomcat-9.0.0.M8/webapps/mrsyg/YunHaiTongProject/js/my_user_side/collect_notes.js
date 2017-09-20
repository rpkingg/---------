$(function() {
	//笔记点击编辑按钮
	$(".edit-btn").on("click",function () {
		$(".edit-btn").hide();
		$(".delete_btn").show();
		$('.collect-notes-content .note-item').find('.edit-icon').show();
		$(".note-item").addClass("add_sign")
		//$('.notes-edit-opt-nar').show();
		$('.collect-notes-content').css({
			marginBottom: '3.5rem'
		});
		//编辑模式下，单个笔记点击事件
		if($('.note-item').hasClass('add_sign')) {
			$(".find_me").removeClass("note-cover");
			$('.note-item').click(function(e) {
				if ($(this).find('.edit-icon').hasClass("selected")){
					$(this).find('.edit-icon').removeClass('selected');
				}
				else {
					$(this).find('.edit-icon').addClass('selected');
				}
			})
		}
	})

	//笔记点击删除按钮
	$(".delete_btn").on("click",function () {
		$(".edit-btn").show();
		$(".delete_btn").hide();
		cancleCollectedNote();
		//笔记
		var note_id = "";
		$(".note-item").each(function (i, obj) {
			if ($(obj).find(".edit-icon").hasClass("selected")) {
				note_id = note_id + $(obj).attr("id") + ";";
			}
		})
		var urlPath_one = "mrsyg/kquser/DeleteCollection.form";
		var need_data = {
			"parameter_ids": note_id,
			"type": 4
		};
		var data_one = myAjax(urlPath_one, need_data);
		if (data_one != undefined) {
			init(data_one);
		}
		function init(datas) {
			return false;
		}
		window.location.reload();
	})

	//商品点击编辑按钮
	$(".edit-btn-goods").on("click",function () {
		$(".edit-btn-goods").hide();
		$(".delete_btn_goods").show();
		$(".collect-goods-item").addClass("add_sign")
		$('.collect-goods-content .collect-goods-item').find('.edit-icon').show();
		//$('.goods-edit-opt-nar').show();
		$('.collect-goods-content').css({
			marginBottom: '3.5rem'
		});
		//编辑模式下，单个商品点击事件
		if($('.collect-goods-item').hasClass("add_sign")) {
			$('.find_shop').removeClass("collect_shop");
			$('.collect-goods-item').click(function(e) {
				if($(this).find('.iconfont').hasClass("icon-xuanzedui")){
					$(this).find('.iconfont').removeClass('icon-xuanzedui');
				}
				else{
					$(this).find('.iconfont').addClass('icon-xuanzedui');
				}
			})
		}
	})

	//商品点击删除按钮
	$(".delete_btn_goods").on("click",function () {
		$(".edit-btn-goods").show();
		$(".delete_btn_goods").hide();
		cancleCollectedGoods();
		//商品
		var product_id = "";
		$(".collect-goods-item").each(function (i, obj) {
			if ($(obj).find(".iconfont").hasClass("icon-xuanzedui")) {
				product_id = product_id + $(obj).attr("id") + ";";
			}
		})

		var urlPath_two = "mrsyg/kquser/DeleteCollection.form";
		var need_data_goods = {
			"parameter_ids": product_id,
			"type": 7
		};
		var data_two = myAjax(urlPath_two, need_data_goods);
		if (data_two != undefined) {
			init(data_two);
		}
		function init(datas) {
			return false;
		}
		window.location.reload();
	})

	//店铺点击编辑按钮
	$(".edit-btn-shop").on("click",function () {
		$(".edit-btn-shop").hide();
		$(".delete_btn_shop").show();
		$(".collect-stores-item").addClass("add_sign")
		$('.find_goods').removeClass("collect_goods");
		$('.collect-stores-content .collect-stores-item').find('.edit-icon').show();
		//	$('.stores-edit-opt-nar').show();
		$('.collect-stores-content').css({
			marginBottom: '3.5rem'
		});
		//编辑模式下，单个店铺点击事件
		if($('.collect-stores-item').hasClass("add_sign")) {
			$("#collection_note_container").unbind("click");
			$('.collect-stores-item').click(function(e) {
				if($(this).find('.iconfont').hasClass("icon-xuanzedui")){
					$(this).find('.iconfont').removeClass('icon-xuanzedui');
				}
				else{
					$(this).find('.iconfont').addClass('icon-xuanzedui');
				}
			})
		}
	})

	//店铺点击删除按钮
	$(".delete_btn_shop").on("click",function () {
		$(".edit-btn-shop").show();
		$(".delete_btn_shop").hide();
		cancleCollectedStores();
		//店铺
		var shop_id = "";
		$(".collect-stores-item").each(function (i,obj) {
			if ($(obj).find(".iconfont").hasClass("icon-xuanzedui")) {
				shop_id =shop_id+ $(obj).attr("id")+ ";";
			}
		})
			/*alert("shop_id="+shop_id)*/
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
		$(this).addClass('active');
		$(this).siblings('span').removeClass('active');
		if($(this).hasClass('collect-notes')) {
			$('#collection_note_container').show();
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
	$('#collection_note_container').on("click",".note-cover",function(e) {
		var noteId = $(this).parent().attr("id");
		native.openView(noteId);
	});
	//查看商品详情事件
	$('#collection_goods_container').on("click",".collect_shop",function(e) {
		var product_id = $(this).attr("id");
		window.location.href="goods_detail.jsp?jump_product_id="+product_id;
	});
	//查看店铺详情事件
	$('#collection_shop_container').on("click",".collect_goods",function(e) {
		var shop_id = $(this).attr("id");
		window.location.href="searching_good_shop_detail.jsp?jump_shop_id="+shop_id;
	});

	//取消编辑事件(笔记)
	var cancleCollectedNote = function() {
		$(".note-item").removeClass("add_sign")
		$('.collect-notes-content .note-item').find('.edit-icon').hide();
		//$('.notes-edit-opt-nar').hide();
		$('.collect-notes-content').css({
			marginBottom: '0'
		})
		$('.note-item').unbind("click");
		//查看笔记详情事件
	}

	//取消编辑事件（商品）
	var cancleCollectedGoods = function() {
		$(".collect-goods-item").removeClass("add_sign")
		$('.collect-goods-content .collect-goods-item').find('.edit-icon').hide();
		//$('.goods-edit-opt-nar').hide();
		$('.collect-goods-content').css({
			marginBottom: '0'
		})
		$('.collect-goods-item').unbind("click");
		//查看商品详情事件
	}

	//取消编辑事件（店铺）
	var cancleCollectedStores = function() {
		$(".collect-stores-item").removeClass("add_sign")
		$('.collect-stores-content .collect-stores-item').find('.edit-icon').hide();
		//$('.stores-edit-opt-nar').hide();
		$('.collect-stores-content').css({
			marginBottom: '0'
		})
		$('.collect-stores-item').unbind("click");
	}

	//接口路径（收藏单-笔记）
	//mrsyg/kquser/NoteCollection.form?pag_no=1&pag_num=100
	var urlPath_note = "mrsyg/kquser/NoteCollection.form";
	var need_note = {
		"pag_no": "1",
		"pag_num": "100"
	};
	var data_note = myAjax(urlPath_note, need_note);
	if(data_note != undefined && data_note.hasOwnProperty("data")) {
		initNote(data_note);
	}

	else{
		$(".collection1").show();
	}

	//接口路径（收藏单-商品）
	//mrsyg/kquser/GoodsCollection.form?pag_no=1&pag_num=100
	var urlPath_goods = "mrsyg/kquser/GoodsCollection.form";
	var need_goods = {
		"pag_no": "1",
		"pag_num": "100"
	};
	var data_goods = myAjax(urlPath_goods, need_goods);
	if(data_goods != undefined && data_goods.hasOwnProperty("data")) {
		initGoods(data_goods);
	}

	else{
		$(".collection2").show();
	}

	//接口路径（收藏单-店铺）
	//mrsyg/kquser/ShopCollection.form?pag_no=1&pag_num=100
	var urlPath_shop = "mrsyg/kquser/ShopCollection.form";
	var need_shop = {
		"pag_no": "1",
		"pag_num": "100"
	};
	var data_shop = myAjax(urlPath_shop, need_shop);
	if(data_shop != undefined && data_shop.hasOwnProperty("data")) {
		initShop(data_shop);
	}

	else{
		$(".collection3").show();
	}

	function initNote(datas) {
		//$(".notes-left-item").show();
		$(".collect-notes-content").show();
		console.log("t678678");
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
			var note_name = decodeURI(getdata.note_name);
			//笔记描述
			//笔记发表时间
			var created_at = getdata.created_at;
			var needString = '<div class="note-item col-xs-12" id="' + note_id + '">' +
				'<div class="note-cover col-xs-12 find_me">' +
				'<img src="' + picture_url + '"/>' +
				'</div>' +
				'<span class="note-title col-xs-12 text-left">' + note_name + '</span>' +
				'<span class="note-intro-text col-xs-12 text-left">自从红色特别版手机上市后大家对这中国红貌似还是情</span>' +
				'<span class="collect-time col-xs-12 text-left">' +
				'<span class="iconfont icon-shijian"></span>' +
				'<span class="collect-time-text one_line_font">' + created_at + '</span>' +
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
		$(".collect-goods-content").show();
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
			//商品id
			var product_id = getdata.product_id;
			//商品图片
			var picture_url = getdata.picture_url;
			//商品名称
			var product_name = getdata.product_name;
			var needString = '<div class="collect-goods-item col-xs-12 collect_shop find_shop" id="' + product_id + '">' +
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
		$(".collect-stores-content").show();
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
			//店铺id
			var shop_id = getdata.shop_id;
			//店铺名称
			var shop_name = getdata.shop_name;
			var needString = '<div class="collect-stores-item col-xs-12 collect_goods find_goods" id="' + shop_id + '">' +
				'<span class="edit-icon hide">' +
				'<span class="iconfont icon-quan"></span>' +
				'</span>' +
				'<span class="stores-name col-xs-12 text-left">' + shop_name + '</span>' +
				'</div>';
			$(needString).appendTo(".collect-stores-content");
		});
	}
})