(function($, document) {
	var shopId = "1"; //店铺id

	//接口路径（分类，筛选--初始化商品，默认--最新，type空，parameter_id空）
	var search_type = "1"; //search_type-->1.最新,2.最热,3.价格由小到大,4.价格由大到小,5.销量由小到大,6.销量由大到小
	var type = ""; //type-->a.分类,b.品牌,c.运营商
	var parameter_id = ""; //parameter_id-->选择的参数id

	//店铺主图轮播
	loadSwiper("swiper-container", "swiper-pagination");

	//接收上个页面传过来的参数
	var get = new queryString();

	//点击-分类-弹出分类弹出框
	$("#classification_btn").bind('click', function() {
		$("#classification_pop_up").show();
		$(this).css("background-color", "#FFFFFF");
		type = "a";
	});
	//点击-分类-弹出弹出框的--确定
	$("#classification_sure").bind('click', function() {
		$("#classification_pop_up").hide();
		$("#classification_btn").css("background-color", "#F0F1F4");
		filterProduct();
	});

	//点击-品牌-弹出品牌弹出框
	$("#brand_btn").bind('click', function() {
		$("#brand_pop_up").show();
		$(this).css("background-color", "#FFFFFF");
		type = "b";
	});
	//点击-品牌-弹出弹出框的--确定
	$("#brand_sure").bind('click', function() {
		$("#brand_pop_up").hide();
		$("#brand_btn").css("background-color", "#F0F1F4");
		filterProduct();
	});

	//点击-运营商-弹出运营商弹出框
	$("#operator_btn").bind('click', function() {
		$("#operator_pop_up").show();
		$(this).css("background-color", "#FFFFFF");
		type = "c";
	});
	//点击-运营商-弹出弹出框的--确定
	$("#operator_sure").bind('click', function() {
		$("#operator_pop_up").hide();
		$("#operator_btn").css("background-color", "#F0F1F4");
		filterProduct();
	});

	//选择大分类的id（最新，最热，价格，销量）
	$(".big_item").bind("click", function() {
		search_type = $(this).attr("id");
		if(search_type == 3) {
			$(this).attr("id", "4");
		} else if(search_type == 4) {
			$(this).attr("id", "3");
		}
		if(search_type == 5) {
			$(this).attr("id", "6");
		} else if(search_type == 6) {
			$(this).attr("id", "5");
		}
	});
	//选择分类，品牌，运营商中的分类
	$("body").on("click", ".selected_item", function() {
		//获得选中的parameter_id
		parameter_id = $(this).attr("id");
	});

	//点击分类，品牌，运营商弹出框之外的地方，关闭弹窗
	$(document).mouseup(function(e) {
		//设置目标区域
		var _con = $(".brand_pop_up");
		if(!_con.is(e.target) && _con.has(e.target).length === 0) {
			$(".brand_pop_up").hide();
			$("#classification_btn ,#brand_btn ,#operator_btn").css("background-color", "#F0F1F4");
		}
	});

	//点击筛选弹出筛选弹出框
	$("#shaixun_btn").bind('click', function() {
		$("#shaixuan").show();
	});
	var priceStart = ""; //最低价格
	var priceEnd = ""; //最高价格
	var clickBrandId = ""; //选中的品牌id
	//选择品牌
	$("body").on("click", ".brand_container", function() {
		clickBrandId = $(this).attr("id");
	});
	//点击筛选弹出框的--重置
	$("#reset_btn_shaixuan").bind("click", function() {
		clickBrandId = "";
		priceStart = "";
		priceEnd = "";
		$(".filter_price_low").val("");
		$(".filter_price_height").val("");
	});
	//点击筛选弹出框的--确定
	$("#sure_btn_shaixuan").bind('click', function() {
		priceStart = $(".filter_price_low").val();
		priceStart = parseFloat(priceStart);
		priceEnd = $(".filter_price_height").val();
		priceEnd = parseFloat(priceEnd);
		if(priceStart >= priceEnd || isNaN(priceEnd) || isNaN(priceStart)) {
			alert("请重新输入价格");
		} else {
			if(clickBrandId.length > 0) {
				$("#shaixuan").hide();
				//接口路径（筛选）
				//mrsyg/kqgoods/ShopScreen.form?start_price=1&end_price=70&brand_id=1
				var urlPath_shaixuan = "mrsyg/kqgoods/ShopScreen.form";
				var need_data_shaixuan = {
					"start_price": priceStart,
					"end_price": priceEnd,
					"brand_id": clickBrandId
				};
				var data_shaixuan = myAjax(urlPath_shaixuan, need_data_shaixuan);
				if(data_shaixuan != undefined) {
					initShaiXuan(data_shaixuan);
				}
			} else {
				alert("请选择品牌");
			}
		}

	});
	//点击筛选弹出框之外的地方，关闭弹窗
	$(document).mouseup(function(e) {
		//设置目标区域
		var _con = $("#shaixuan_second");
		if(!_con.is(e.target) && _con.has(e.target).length === 0) {
			$("#shaixuan").hide();
		}
	});
	
	

	//接口路径（店铺信息）
	var urlPath_one = "mrsyg/kqgoods/ShopInfo.form";
	var need_data_one = {
		"shop_id": shopId
	};
	var data_one = myAjax(urlPath_one, need_data_one);
	if(data_one != undefined) {
		init(data_one);
	}
	//接口路径（店铺达人）
	//mrsyg/kqgoods/ShopAssistant.form?shop_id=1&pag_no=1&pag_num=100
	var urlPath_two = "mrsyg/kqgoods/ShopAssistant.form";
	var need_data_two = {
		"shop_id": shopId,
		"pag_no": "1",
		"pag_num": "100"
	};
	var data_two = myAjax(urlPath_two, need_data_two);
	if(data_two != undefined) {
		initTwo(data_two);
	}
	//接口路径（笔记动态）
	var urlPath_three = "mrsyg/kqgoods/ShopNote.form";
	var need_data_three = {
		"shop_id": shopId,
		"pag_no": "1",
		"pag_num": "100"
	};
	var data_three = myAjax(urlPath_three, need_data_three);
	if(data_three != undefined) {
		initThree(data_three);
	}
	//接口路径（热销产品）
	//mrsyg/kqgoods/ShopGoods.form?shop_id=1&pag_no=1&pag_num=100
	var urlPath_four = "mrsyg/kqgoods/ShopGoods.form";
	var need_data_four = {
		"shop_id": shopId,
		"pag_no": "1",
		"pag_num": "100"
	};
	var data_four = myAjax(urlPath_four, need_data_four);
	if(data_four != undefined) {
		initFour(data_four);
	}

	//接口路径（分类--初始化）
	var urlPath_classification = "mrsyg/kqgoods/ShopCategory.form";
	var need_data_classification = {};
	var data_classification = myAjax(urlPath_classification, need_data_classification);
	if(data_classification != undefined) {
		initClassification(data_classification);
	}

	//接口路径（品牌--初始化）
	var urlPath_brand = "mrsyg/kqgoods/ShopBrand.form";
	var need_data_brand = {};
	var data_brand = myAjax(urlPath_brand, need_data_brand);
	if(data_brand != undefined) {
		initBrand(data_brand);
	}

	//接口路径（运营商--初始化）
	var urlPath_operator = "mrsyg/kqgoods/ShopSupplier.form";
	var need_data_operator = {};
	var data_operator = myAjax(urlPath_operator, need_data_operator);
	if(data_operator != undefined) {
		initOperator(data_operator);
	}

	//接口路径（分类，筛选--初始化商品，默认--最新，type空，parameter_id空）
	//search_type-->1.最新,2.最热,3.价格由小到大,4.价格由大到小,5.销量由小到大,6.销量由大到小
	//type-->a.分类,b.品牌,c.运营商
	//parameter_id-->选择的参数id
	var urlPath_product = "mrsyg/kqgoods/ShopSelect.form";
	var need_data_product = {
		"search_type": search_type,
		"type": type,
		"parameter_id": parameter_id
	};
	var data_product = myAjax(urlPath_product, need_data_product);
	if(data_product != undefined) {
		//initProduct(data_product);
		initShaiXuan(data_product);
	}

	function init(data) {
		//店铺名称
		var shop_name = data.shop_name;
		$("#shop_name").text(shop_name);
		//店铺等级
		var shop_grade = data.shop_grade;
		var starsString = "";
		var red_stars = "";
		var gray_stars = "";
		for(var i = 0; i < shop_grade; i++) {
			red_stars = red_stars + '<div class="start_nor start_sel"></div>';
		}
		for(var i = 0; i < 5 - shop_grade; i++) {
			gray_stars = gray_stars + '<div class="start_nor"></div>';
		}
		starsString = red_stars + gray_stars;
		$(starsString).appendTo("#comment_start_box_id");
		$("#shop_grade_score").text(shop_grade);
		//商品评分
		var shop_goods = data.shop_goods;
		$("#product_score").text(shop_goods);
		//配送评分
		var shop_delivery = data.shop_delivery;
		$("#distribution_score").text(shop_delivery);
		//服务评分
		var shop_service = data.shop_service;
		$("#server_score").text(shop_service);
		//满意度评分
		var shop_satisfaction = data.shop_satisfaction;
		$("#satisfaction_degree_score").text(shop_satisfaction);
		//是否收藏(-1 已收藏1未收藏)
		var shop_collection_flag = data.shop_collection_flag;
		//距离
		var distance = data.distance;
		$("#location_area_id").text(distance);
		//店铺地址
		var shop_address = data.shop_address;
		$("#specific_locations_container_p").text(shop_address);
		//店铺电话
		var shop_mobile = data.shop_mobile;
		$(".specific_locations_container_tel").attr("id", shop_mobile);
		//店铺照片循环
		$.each(data.shoppicture, function(index, getdata) {
			//店铺照片
			var picture_url = getdata.picture_url;
			var picture_url2x = getDifferencePic(picture_url, "2x_");
			var picture_url3x = getDifferencePic(picture_url, "3x_");
			var needString = '<div class="swiper-slide">' +
				'<img class="searching_detail_top_shop_pic" src="' + picture_url2x + '" srcset="' + picture_url2x + ' 2x,' + picture_url3x + ' 3x"/>' +
				'</div>';
			$(needString).appendTo("#shop_product_container");
		});
	}

	function initTwo(data) {
		$.each(data.assistantinfo, function(index, getdata) {
			//营业员照片
			var customer_picture = getdata.customer_picture;
			//营业员id
			var assistant_id = getdata.assistant_id;
			//营业员名称
			var customer_name = getdata.customer_name;
			//营业员粉丝数量
			var fans_total = getdata.fans_total;
			//点赞数量
			var note_like_total = getdata.note_like_total;
			//是否被点赞
			//收藏数量
			var note_collection_total = getdata.note_collection_total;
			//是否被收藏

			var needString = '<div class="swiper-slide">' +
				'<div class="shop_master_container">' +
				'<img class="shop_master_pic" src="' + customer_picture + '"/>' +
				'<div class="shop_master_msg">' +
				'<div class="master_name_fans">' +
				'<div class="master_name">' + customer_name + '</div>' +
				'<div class="blue_dot"></div>' +
				'<div class="master_fans">' + fans_total + '粉丝</div>' +
				'</div>' +
				'<div class="zan_collection">' +
				'<img class="master_zan_pic" src="img/zan_btn@2x.png"/>' +
				'<div class="master_zan_nums">' + note_like_total + '</div>' +
				'<img class="master_collection_pic" src="img/star_comment_no.png"/>' +
				'<div class="master_collection_nums">' + note_collection_total + '</div>' +
				'</div>' +
				'</div>' +
				'<div class="master_check_check">+&nbsp;聊聊</div>' +
				'</div>' +
				'</div>';
			$(needString).appendTo("#assistant_swiper_container");
		});
		//店铺达人轮播
		loadSwiper("swiper-container1", "swiper-pagination2");
	}

	function initThree(data) {
		var notesNUm = 0;
		$.each(data.noteinfo, function(index, getdata) {
			notesNUm = index+1;
			//笔记照片
			var picture_url = getdata.picture_url;
			var picture_url2x = getDifferencePic(picture_url, "2x_");
			var picture_url3x = getDifferencePic(picture_url, "3x_");
			//笔记描述
			var note_name = getdata.note_name;
			//笔记id
			var note_id = getdata.note_id;
			//营业员id
			var assistant_id = getdata.assistant_id;
			//营业员照片
			var customer_picture = getdata.customer_picture;
			//营业员名称
			var customer_name = getdata.customer_name;
			//点赞数量
			var note_like_total = getdata.note_like_total;
			//是否点赞(-1已点赞，1未点赞)
			var note_like_flag = getdata.note_like_flag;
			//是否有视频（0没有1有）
			var video_flag = getdata.video_flag;
			var needString = '<div class="note_dynamics_img">' +
				'<img class="the_pictures_in_shop_container_img" src="' + picture_url2x + '" srcset="' + picture_url2x + ' 2x,' + picture_url3x + ' 3x"/>' +
				'<div class="note_des">' + note_name + '</div>' +
				'<div class="note_des_container">' +
				'<img class="note_dynamics_headpro" src="' + customer_picture + '"/>' +
				'<div class="note_dynamics_headname">' + customer_name + '</div>' +
				'<img class="note_zan_pic" src="img/zan_btn@2x.png" srcset="" />' +
				'<div class="note_zan_num">' + note_like_total + '</div>' +
				'</div>' +
				'</div>';
			$(needString).appendTo("#notes_dynamic_container");
		});
		var setWidth = 4.5 * notesNUm;
		$("#notes_dynamic_container").css("width", setWidth + "rem");
	}

	function initFour(datas) {
		$("#hot_sale_product_container").empty();
		var hotProductNum=0;
		$.each(datas.data, function(index, getdata) {
			hotProductNum=index+1;
			//商品id
			var product_id = getdata.product_id;
			//商品图片
			var picture_url = getdata.picture_url;
			var picture_url2x = getDifferencePic(picture_url, "2x_");
			var picture_url3x = getDifferencePic(picture_url, "3x_");
			//商品描述
			var product_name = getdata.product_name;
			//商品价格
			var product_price = getdata.product_price;
			var needString = '<div class="hot_sale_exhibition">' +
				'<img class="hot_sale_img" src="' + picture_url2x + '" srcset="' + picture_url2x + ' 2x,' + picture_url2x + ' 3x"/>' +
				'<div class="hot_product_des">' + product_name + '</div>' +
				'<div class="hot_red_price">￥' + product_price + '</div>' +
				'</div>';
			$(needString).appendTo("#hot_sale_product_container");
		});
		var setHotProWidth=2.8 * hotProductNum;
		$("#hot_sale_product_container").css("width",setHotProWidth+"rem");
	}

	function initClassification(data) {
		var needString = "";
		$.each(data.categoryinfo, function(index, getdata) {
			//分类id
			var category_id = getdata.category_id;
			//分类名称
			var category_name = getdata.category_name;
			if(index == 0) {
				needString = needString + '<div class="brand_list_fist selected_item" id="' + category_id + '">' + category_name + '</div>';
			} else if(index == 1) {
				needString = needString + '<div class="brand_list_fist_right selected_item" id="' + category_id + '">' + category_name + '</div>';
			} else if(index != 0 && index % 2 == 0) {
				needString = needString + '<div class="brand_list_other_left selected_item" id="' + category_id + '">' + category_name + '</div>';
			} else if(index != 1 && index % 2 == 0) {
				needString = needString + '<div class="brand_list_other_right selected_item" id="' + category_id + '">' + category_name + '</div>';
			}
		});
		$("#classification_container").empty();
		$(needString).appendTo("#classification_container");
	}

	function initBrand(data) {
		var needString = "";
		var shaixuan = "";
		$.each(data.brandinfo, function(index, getdata) {
			//品牌id
			var brand_id = getdata.brand_id;
			//品牌名称
			var brand_name = getdata.brand_name;
			//品牌照片
			var brand_picture = getdata.brand_picture;
			if(index == 0) {
				needString = needString + '<div class="brand_list_fist selected_item" id="' + brand_id + '">' + brand_name + '</div>';
			} else if(index == 1) {
				needString = needString + '<div class="brand_list_fist_right selected_item" id="' + brand_id + '">' + brand_name + '</div>';
			} else if(index != 0 && index % 2 == 0) {
				needString = needString + '<div class="brand_list_other_left selected_item" id="' + brand_id + '">' + brand_name + '</div>';
			} else if(index != 1 && index % 2 == 0) {
				needString = needString + '<div class="brand_list_other_right selected_item" id="' + brand_id + '">' + brand_name + '</div>';
			}

			if(index % 4 == 0) {
				shaixuan = shaixuan + '<div class="brand_container" id="' + brand_id + '">' +
					'<img class="brand_logo" src="' + brand_picture + '"/>' +
					'<div class="brand_name">' + brand_name + '</div>' +
					'</div>';
			} else {
				shaixuan = shaixuan + '<div class="brand_container brand_container_margin_left" id="' + brand_id + '">' +
					'<img class="brand_logo" src="' + brand_picture + '"/>' +
					'<div class="brand_name">' + brand_name + '</div>' +
					'</div>';
			}

		});
		$("#brand_container").empty();
		$(needString).appendTo("#brand_container");
		$(".filter_brand_second_container").empty();
		$(shaixuan).appendTo(".filter_brand_second_container");
	}

	function initOperator(data) {
		var needString = "";
		$.each(data.supplierinfo, function(index, getdata) {
			//运营商id
			var supplier_id = getdata.supplier_id;
			//运营商名称
			var supplier_desc = getdata.supplier_desc;
			if(index == 0) {
				needString = needString + '<div class="brand_list_fist selected_item" id="' + supplier_id + '">' + supplier_desc + '</div>';
			} else if(index == 1) {
				needString = needString + '<div class="brand_list_fist_right selected_item" id="' + supplier_id + '">' + supplier_desc + '</div>';
			} else if(index != 0 && index % 2 == 0) {
				needString = needString + '<div class="brand_list_other_left selected_item" id="' + supplier_id + '">' + supplier_desc + '</div>';
			} else if(index != 1 && index % 2 == 0) {
				needString = needString + '<div class="brand_list_other_right selected_item" id="' + supplier_id + '">' + supplier_desc + '</div>';
			}
		});
		$("#operator_container").empty();
		$(needString).appendTo("#operator_container");
	}

	function initShaiXuan(data) {
		//清空数据
		$(".searching_product_left_container").empty();
		$(".searching_product_right_container").empty();
		
		$.each(data.goodsinfo, function(index, getdata) {
			//商品id
			var product_id = getdata.product_id;
			//商品照片
			var picture_url = getdata.picture_url;
			var picture_url2x = getDifferencePic(picture_url, "2x_");
			var picture_url3x = getDifferencePic(picture_url, "3x_");
			//商品名称
			var product_name = getdata.product_name;
			//商品价格
			var product_price = getdata.product_price;

			var needClass = "";
			if(index % 2 == 0) {
				needClass = "searching_product_left";
			} else {
				needClass = "searching_product_right";
			}
			var needString = '<div class="' + needClass + '" id="' + product_id + '">' +
				'<div class="text_align_center">' +
				'<img src="' + picture_url2x + '" srcset="' + picture_url2x + ' 2x,' + picture_url3x + ' 3x"/>' +
				'</div>' +
				'<div class="searching_container_product_name">' + product_name + '</div>' +
				'<div class="searching_container_product_price">' +
				'<div class="searching_container_product_price_new">￥' + product_price + '</div>' +
				'</div>' +
				'</div>';
			if(index % 2 == 0) {
				$(needString).appendTo(".searching_product_left_container");
			} else {
				$(needString).appendTo(".searching_product_right_container");
			}
		});
	}

	function filterProduct() {
		var urlPath_product = "mrsyg/kqgoods/ShopSelect.form";
		var need_data_product = {
			"search_type": search_type,
			"type": type,
			"parameter_id": parameter_id
		};
		var data_product = myAjax(urlPath_product, need_data_product);
		if(data_product != undefined) {
			initShaiXuan(data_product);
		}
	}

})(jQuery, document);