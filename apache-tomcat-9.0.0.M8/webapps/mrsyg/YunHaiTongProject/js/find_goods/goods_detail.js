$(function() {
	//当前页面的变量
	var product_id = ""; //商品id
	var productName = ""; //商品名称
	var productText = ""; //商品默认参数
	var productFirstPic = ""; //商品第一张图片的url

	var im_uuid = ""; //营业员的im_uuid;
	var customer_type = ""; //当前用户类型（0 普通客户 1营业员）
	var note_id = ""; //笔记id

	var start_time = ""; //限时购开始时间
	var end_time = ""; //限时购结束时间
	var now_time = ""; //当前时间

	var product_price = ""; //商品价格

	//初始化商品详情id
	var initProductDetailId = ""; //初始化商品参数详情id

	//初始化商品参数
	var initColorName = ""; //初始化商品颜色
	var initColorId = ""; //初始化颜色id
	var initMemoryNmae = ""; //初始化商品容量
	var initMemoryId = ""; //初始化容量id
	var initSupplierName = ""; //初始化商品运营商
	var initSupplierId = ""; //初始化运营商id
	var initContractNmae = ""; //初始化商品套餐
	var initContractId = ""; //初始化套餐id
	//选择的商品参数
	var selectedColorName = ""; //选择的商品颜色
	var selectedColorId = ""; //选择的颜色id
	var selectedMemoryNmae = ""; //选择的商品容量
	var selectedMemoryId = ""; //选择的容量id
	var selectedSupplierName = ""; //选择的商品运营商
	var selectedSupplierId = ""; //选择的运营商id
	var selectedContractNmae = ""; //选择的商品套餐
	var selectedContractId = ""; //选择的套餐id

	var buyFlag = ""; //购买（buyNow）或者加入如购物车(jionCart)（作用与选择参数弹窗）
	var buyNum = 1; //默认购买数量为1

	var request = new queryString();
	if(request["jump_product_id"]) {
		product_id = request["jump_product_id"];
		$(".goods-pics-container").attr("id", product_id);
		console.log("商品详情，url=" + location.href);
	}
	if(request["jump_product_id"]) {
		note_id = request["jump_note_id"];
		console.log("从笔记进入，url=" + location.href);
	}

	//页面滚动，显示页面导航条
	$(window).on('scroll', function(e) {
		if($(this).scrollTop() > 15 && $(this).scrollTop() < 1300) {
			$(".back-to-top").fadeOut(1000);
			if($('.goods-detail-hearder-bar').is(":hidden")) {
				$('.goods-detail-hearder-bar').fadeIn("slow", function() {
					var hearderBarHeight = $('.goods-detail-hearder-bar').height();
					$('.goods-detail-container').css({
						'marginTop': hearderBarHeight
					});
				});
			}
		} else if($(this).scrollTop() >= 1300) {
			$(".back-to-top").fadeIn(1000);
		} else {
			$(".back-to-top").fadeOut(1000);
			if(!$('.goods-detail-hearder-bar').is(":hidden")) {
				$('.goods-detail-hearder-bar').fadeOut("slow", function() {
					$('.goods-detail-container').css({
						'marginTop': 0
					});
					$(window).scrollTop(0);
				});
			}
		}
	});

	//页面导航定位事件
	$('.hearder-tab-bar span').click(function(e) {
		var height = 0;
		$(this).siblings('span').removeClass('active');
		$(this).addClass('active');
		if($(this).hasClass('goods-base-bar')) {

		} else if($(this).hasClass('goods-comments-bar')) {
			height = $('.goods-base-target').height();

		} else if($(this).hasClass('goods-detail-bar')) {
			height = $('.goods-base-target').height() +
				$('.goods-comment-target').height();
			var selfHeight = $('.goods-detail-target').height();
			if(height > selfHeight) {
				$('.goods-detail-target').css({
					'paddingBottom': (height - selfHeight)
				});
			}
		}
		$(window).scrollTop(height);
	});

	//接口路径（商品基本信息）
	//mrsyg/kqgoods/GoodsInfo.form?product_id=4
	var urlPath_one = "mrsyg/kqgoods/GoodsInfo.form";
	var need_data = {
		"product_id": product_id
	};
	var data_one = myAjax(urlPath_one, need_data);
	if(typeof(data_one) != "undefined") {
		init(data_one);
	}

	//接口路径（用户晒单）
	//http://120.76.190.223:8988/mrsyg/kqgoods/GoodsComment.form?product_id=4&pag_no=1&pag_num=3
	var urlPath_two = "mrsyg/kqgoods/GoodsComment.form";
	var need_data_two = {
		"product_id": product_id,
		"pag_no": "1",
		"pag_num": "3"
	};
	var data_two = myAjax(urlPath_two, need_data_two);
	if(typeof(data_two) != "undefined" && data_two.hasOwnProperty("commentinfo")) {
		initTwo(data_two);
	}

	//接口路径（笔记）
	//mrsyg/kqgoods/GoodsNote.form?product_id=4&pag_no=1&pag_num=4
	var urlPath_three = "mrsyg/kqgoods/GoodsNote.form";
	var need_data_three = {
		"product_id": product_id,
		"pag_no": "1",
		"pag_num": "4"
	};
	var data_three = myAjax(urlPath_three, need_data_three);
	if(typeof(data_three) != "undefined" && data_three.hasOwnProperty("noteinfo")) {
		initThree(data_three);
	}

	//接口路径（图文介绍）
	//mrsyg/kqgoods/GoodsDescribe.form?product_id=4
	var urlPath_four = "mrsyg/kqgoods/GoodsDescribe.form";
	var need_data_four = {
		"product_id": product_id
	};
	var data_four = myAjax(urlPath_four, need_data_four);
	if(typeof(data_four) != "undefined" && data_four.hasOwnProperty("describeinfo")) {
		initFour(data_four);
	}

	//接口路径（商品参数描述）
	//mrsyg/kqgoods/GoodsParameter.form?product_id=4
	var urlPath_five = "mrsyg/kqgoods/GoodsParameter.form";
	var need_data_five = {
		"product_id": product_id
	};
	var data_five = myAjax(urlPath_five, need_data_five);
	if(typeof(data_five) != "undefined" && data_five.hasOwnProperty("parameterinfo")) {
		initFive(data_five);
	}

	//接口路径（初始化商品参数--初始化数据--颜色，容量，版本，套餐）
	//mrsyg/kqgoods/SelectParameter.form?product_id=4
	var urlPath_six = "mrsyg/kqgoods/SelectParameter.form";
	var need_data_six = {
		"product_id": product_id,
		"color_id": "",
		"memory_id": "",
		"supplier_id": "",
		"contract_id": ""
	};
	var data_six = myAjax(urlPath_six, need_data_six);
	if(typeof(data_six) != "undefined") {
		initSix(data_six);
	}

	function init(data) {
		//当前时间
		now_time = data.current_time;
		//开始时间
		start_time = data.start_time;
		//结束时间
		end_time = data.end_time;
		var shijiancha = "";
		if(!end_time && end_time.length == 0) {
			$(".remain-time-tip").hide();
		} else {
			//每秒更新一次时间
			var InterValObj = window.setInterval(setChangeTime1, 1000);
		}

		function setChangeTime1() {
			var diffMSeconds = new Date(end_time.replace(/-/g, "/")).getTime() - new Date().getTime();
			var days = Math.floor(diffMSeconds / (24 * 3600 * 1000));
			var leave1 = diffMSeconds % (24 * 3600 * 1000);
			var hours = Math.floor(leave1 / (3600 * 1000));
			var leave2 = leave1 % (3600 * 1000);
			var minutes = Math.floor(leave2 / (60 * 1000));
			var leave3 = leave2 % (60 * 1000);
			var seconds = Math.round(leave3 / 1000);
			var timeString = days + "天" + hours + "小时 " + minutes + "分钟" + seconds + "秒";
			$(".remain-time").text("距结束还剩" + timeString);
		}

		function setChangeTime() {
			shijiancha = shijiancha - 1;
			//			if(shijiancha <= 0) {
			//				return false;
			//			}
			var upDates = parseInt(shijiancha / 86400);
			var upHourse = parseInt(shijiancha % 86400 / 3600);
			var upMinutes = parseInt(shijiancha % 86400 % 3600 / 60);
			var upSeconds = parseInt(shijiancha % 86400 % 3600 % 60);
			var timeString = upDates + "天" + upHourse + "小时" + upMinutes + "分" + upSeconds + "秒";
			$(".remain-time").text(timeString);
		}

		//用户类型（客户类型：0 普通客户 1营业员）
		customer_type = data.customer_type;
		//用户im_uuid(用于聊天)
		im_uuid = data.im_uuid;
		console.log("商品详情页im_uuid=" + im_uuid);
		//商品详情id
		initProductDetailId = data.product_detail_id;
		//商品名称
		var product_name = data.product_name;
		productName = product_name;
		$("#product_name_id").text(productName);
		$(".goods-name").text(productName);
		//商品现价
		product_price = data.price_new;
		$("#product_new_price_id").text("￥" + product_price);
		$("#pop_up_new_price").text(product_price);
		//商品原价
		var price_old = data.price_old;
		$("#product_old_price_id").text("￥" + price_old);
		$("#pop_up_old_price").text(price_old);

		//颜色
		initColorName = data.color;
		initColorId = data.color_id;
		//内存容量
		initMemoryNmae = data.memory_capacity;
		initMemoryId = data.memory_id;
		//运营商
		initSupplierName = data.supplier_desc;
		initSupplierId = data.supplier_id;
		//套餐
		initContractNmae = data.contract_name;
		initContractId = data.contract_id;
		console.log("商品详情idproduct_detail_id=" + initProductDetailId + "，套餐id=" + initContractId);
		productText = initColorName + " " + initMemoryNmae + " " + initSupplierName + " " + initContractNmae;
		console.log("初始化参数id=" + initColorId + "--" + initMemoryId + "--" + initSupplierId + "--" + initContractId);
		console.log("初始化商品参数=" + productText);
		$("#selected_parameter_id").text(productText);
		//地址id
		var address_id = data.address_id;
		//收货地区
		var receiver_area = data.receiver_area;
		//收货地址
		var detail_address = data.detail_address;
		$("#receiver_address_id").text(receiver_area + " " + detail_address);
		//是否有视频(0没有1有)
		var video_flag = data.video_flag;
		//视频首帧照片
		var product_video_picture = data.product_video_picture;
		//视频URL
		var product_video = data.product_video;
		//是否收藏过此商品(-1已经被收藏1没有被收藏)
		var product_collection_flag = data.product_collection_flag;
		if(product_collection_flag == "-1") {
			$(".goods-collect-icon").find(".iconfont").addClass("collected");
		}
		var firstPic = "";
		var picturesTotal = 0;//获取图片总数
		$.each(data.pictureinfo, function(index, getdata) {
			//获取图片总数
			picturesTotal = getdata.length;
			//商品照片
			var picture_url = getdata.picture_url;
			if(index == 0) {
				firstPic = picture_url;
				productFirstPic = picture_url;
			}
			var picture_url2x = getDifferencePic(picture_url, "2x_");
			var picture_url3x = getDifferencePic(picture_url, "3x_");
			var needString = '<div class="swiper-slide swiper-no-swiping img_height" item-index="' + index + '" total="' + picturesTotal + '" item-type="img">' +
				'<img src="' + picture_url2x + '" srcset="' + picture_url2x + ' 2x,' + picture_url3x + ' 3x">' +
				'</div>';
			$(needString).appendTo("#product_pic_container_id");
		});
		if(video_flag == "1") {
			var itemIdex = picturesTotal+1;
			var videoString = '<div class="swiper-slide swiper-no-swiping" item-index="'+itemIdex+'" total="3" item-type="img">' +
				'<video src="' + product_video + '" poster="' + product_video_picture + '" preload="auto"></video>' +
				'</div>';
			$(videoString).appendTo("#product_pic_container_id");
		}
		$("#pop_up_pic").attr("src", firstPic);
		//商品图片轮播
		new Swiper('.goods-pics-container .swiper-container', {
			noSwiping: false, //false开启手动拖动
			direction: 'horizontal',
			loop: true,
			speed: 1000,
			autoplay: 3000,
			preventClicks: false,
			autoplayDisableOnInteraction: false, //false即使手动拖动也会自动轮播

			// 如果需要分页器
			pagination: '.swiper-pagination',
			//分页器样式
			paginationBulletRender: function(swiper, index, className) {
				return '<span class="' + className + '"></span>';
			}
		});

		//商品图片塞入
		var firstPicBig = "";
		var pic_total = 0; //获取图片总数
		$.each(data.pictureinfo, function(index, getdata) {
			//获取图片总数
			pic_total = getdata.length;
			//商品照片
			var picture_url = getdata.picture_url;
			if(index == 0) {
				firstPicBig = picture_url;
				productFirstPic = picture_url;
			}
			var picture_url2x = getDifferencePic(picture_url, "2x_");
			var picture_url3x = getDifferencePic(picture_url, "3x_");
			var needString = '<div class="swiper-slide" item-index="' + index + '" total="' + pic_total + '" item-type="img">' +
				'<img src="' + picture_url2x + '" srcset="' + picture_url2x + ' 2x,' + picture_url3x + ' 3x">' +
				'</div>';
			$(needString).appendTo("#goods-big-preview-container-id");
		});
		if(video_flag == "1") {
			var itemIndex = pic_total + 1;
			var videoString = '<div class="swiper-slide swiper-no-swiping" item-index="' + itemIndex + '" total="3" item-type="img">' +
				'<video src="' + product_video + '" poster="' + product_video_picture + '" preload="auto"></video>' +
				'</div>';
			$(videoString).appendTo("#goods-big-preview-container-id");
		}

		//商品图片视频大图预览
		$('.goods-pics-container').find('img,video').click(function(e) {
			var total = $(this).parent().siblings('.swiper-slide').length - 1;
			var currentIndex = Number($(this).parent('.swiper-slide').attr('item-index'));
			var type = $(this).parent('.swiper-slide').attr('item-type');
			var previewCont = $('.goods-pics-container').html();
			$('.goods-big-preview-container').show();
			$('.preview-nav').html(currentIndex + 1 + "/" + total)

			var previewSwiper = new Swiper('.preview-content .swiper-container', {
				direction: 'horizontal',
				loop: false,
				preventClicks: false,
				autoplayDisableOnInteraction: false,
				initialSlide: currentIndex,
				paginationHide: true,
				onSlideChangeEnd: function(swiper) {
					$('.preview-nav').html(swiper.activeIndex + 1 + "/" + total);
				}
			});
			$("body").on("touchmove", function(event) {
				event.preventDefault;
			}, false);
		});

		//关闭商品图片视频大图预览窗口
		$('.goods-big-preview').click(function(e) {
			$('.goods-big-preview-container').hide();
			$("body").off("touchmove");
		});

	}

	function initTwo(data) {
		//显示用户晒单
		$(".goods-comment-container").show();
		// 商品评价
		$.each(data.commentinfo, function(index, getdata) {
			//晒单照片1
			var picture_one = getdata.picture_one;
			var commentPic = "";
			if(picture_one) {
				commentPic = '<div class="comment-pic col-xs-4">' +
					'<img class="comment-pic-height" src="' + picture_one + '">' +
					'</div>';
			}
			//用户头像
			var customer_picture = getdata.customer_picture;
			//用户名称
			var customer_name = getdata.customer_name;
			//用户id
			var customer_id = getdata.customer_id;
			//用户评论内容
			var comment_content = getdata.comment_content;
			var needString = '<div class="swiper-slide text-center goods-comment-item col-xs-11" id="goods-comment-item">' + commentPic +
				'<div class="comment-info col-xs-8">' +
				'<div class="comment-user-info col-xs-12">' +
				'<div class="comment-user-face col-xs-2" id="' + customer_id + '">' +
				'<img src="' + customer_picture + '">' +
				'</div>' +
				'<span class="comment-user-name col-xs-10 text-left">' + customer_name + '</span>' +
				'</div>' +
				'<span class="comment-user-cont col-xs-12 text-left">' + comment_content + '</span>' +
				'</div>' +
				'<span class="subject-jiaobiao iconfont icon-zuixin">' +
				'<span class="subject-jiaobiao-text">最新</span>' +
				'</span>' +
				'</div>';
			$(needString).appendTo("#user_shaidan_container_id");
		});

		//商品评价效果渲染
		new Swiper('.goods-comment-content-container .swiper-container', {
			direction: 'horizontal',
			speed: 300,
			slidesPerView: 1.3,
			spaceBetween: 5,
			autoplayDisableOnInteraction: false
		});
	}

	function initThree(data) {
		$(".goods-comment-tip-container").show();
		$.each(data.noteinfo, function(index, getdata) {
			//笔记图片
			var picture_url = getdata.picture_url;
			//笔记名称
			var note_name = getdata.note_name;
			note_name = decodeURI(note_name);
			//笔记描述
			var note_desc = getdata.note_desc;
			note_desc = decodeURI(note_desc);
			//营业员头像
			var customer_picture = getdata.customer_picture;
			//营业员id
			var assistant_id = getdata.assistant_id;
			//营业员名称
			var customer_name = getdata.customer_name;
			//笔记编号
			var note_id = getdata.note_id;
			//点赞数量
			var note_like_total = getdata.note_like_total;
			//是否被点赞（-1已点赞,1未点赞）
			var note_like_flag = getdata.note_like_flag;
			var likeClass = "";
			if(note_like_flag == "-1") {
				likeClass = "icon-dianzan";
			} else if(note_like_flag == "1") {
				likeClass = "icon-dianzan1";
			}
			//是否有视频(0没有1有)
			var video_flag = getdata.video_flag;
			var picture_url2x = getDifferencePic(picture_url, "2x_");
			var needString = '<div class="goods-note-item col-xs-12" id="' + note_id + '" noteFlag="' + video_flag + '">' +
				'<img class="note-pic col-xs-12" src="' + picture_url2x + '">' +
				'<span class="goods-note-title col-xs-12 text-left one_line_font">' + note_name + '</span>' +
				'<span class="goods-note-cont col-xs-12 text-left two_line_font">' + note_desc + '</span>' +
				'<div class="goods-note-publish col-xs-12">' +
				'<div class="comment-user-info text-left">' +
				'<div class="comment-user-face" id="' + assistant_id + '">' +
				'<img src="' + customer_picture + '">' +
				'</div>' +
				'<span class="comment-user-name col-xs-8 text-left assistant_name">' + customer_name + '</span>' +
				'</div>' +
				'<div class="goods-note-like col-xs-6 text-right">' +
				'<span class="iconfont ' + likeClass + '"></span>' +
				'<span class="like-num">' + note_like_total + '</span>' +
				'</div>' +
				'</div>' +
				'</div>';
			if(index % 2 == 0) {
				$(needString).appendTo("#notes_left_container_id");
			} else if(index % 2 == 1) {
				$(needString).appendTo("#notes_right_container_id");
			}
		});
	}

	function initFour(data) {
		$.each(data.describeinfo, function(index, getdata) {
			//图文介绍图片pic_word_des
			var picture_url = getdata.picture_url;
			var needString = '<img src="' + picture_url + '"/>'
			$(needString).appendTo("#pic_word_des");
		});
	}

	function initFive(data) {
		$.each(data.parameterinfo, function(index, getdata) {
			//图片URL
			var picture_url = getdata.picture_url;
			var needSring = '<img src="' + picture_url + '"/>';
			$(needSring).appendTo("#product_par_dse");
		});
	}

	function initSix(data) {
		//颜色
		$.each(data.colorinfo, function(index, getdata) {
			//颜色id
			var color_id = getdata.color_id;
			//颜色名称
			var color_name = getdata.color_name;
			color_name = color_name.trim();
			var needString = "";
			if(color_name == initColorName.trim()) {
				needString = '<span class="param-cate col-xs-3 selected initdata" id="' + color_id + '">' + color_name + '</span>';
			} else {
				needString = '<span class="param-cate col-xs-3" id="' + color_id + '">' + color_name + '</span>';
			}
			$(needString).appendTo("#color_list");
		});
		//内存
		$.each(data.memoryinfo, function(index, getdata) {
			//内存id
			var memory_id = getdata.memory_id;
			//内存名称
			var memory_name = getdata.memory_name;
			memory_name = memory_name.trim();
			var memoryString = "";
			if(memory_name == initMemoryNmae.trim()) {
				memoryString = '<span class="param-cate col-xs-3 selected initdata" id="' + memory_id + '">' + memory_name + '</span>';
			} else {
				memoryString = '<span class="param-cate col-xs-3" id="' + memory_id + '">' + memory_name + '</span>';
			}
			$(memoryString).appendTo("#memory_list");
		});
		//运营商
		$.each(data.supplierinfo, function(index, getdata) {
			//运营商id
			var supplier_id = getdata.supplier_id;
			//运营商名称
			var supplier_name = getdata.supplier_name;
			supplier_name = supplier_name.trim();
			var supplierString = "";
			if(supplier_name == initSupplierName.trim()) {
				supplierString = '<span class="param-cate col-xs-3 selected initdata" id="' + supplier_id + '">' + supplier_name + '</span>';
			} else {
				supplierString = '<span class="param-cate col-xs-3" id="' + supplier_id + '">' + supplier_name + '</span>';
			}
			$(supplierString).appendTo("#supplier_list");
		});
		//套餐
		$.each(data.contractinfo, function(index, getdata) {
			//套餐id
			var contract_id = getdata.contract_id;
			//套餐名称
			var contract_name_init = getdata.contract_name;
			contract_name_init = contract_name_init.trim();
			var contractString = "";
			if(contract_name_init == initContractNmae.trim()) {
				contractString = '<span class="param-cate col-xs-3 selected initdata" id="' + contract_id + '">' + contract_name_init + '</span>';
			} else {
				contractString = '<span class="param-cate col-xs-3" id="' + contract_id + '">' + contract_name_init + '</span>';
			}
			$(contractString).appendTo("#contract_list");
		});
	}

	//收藏或者取消收藏商品
	function collectionGoodsOrNot(type) {
		var returnFlag = "";
		//接口路径（type，取消收藏:-1,收藏:1）
		var urlPath_seven = "mrsyg/kquser/CollectionGoods.form";
		var need_data_seven = {
			"product_id": product_id,
			"type": type
		};
		var data_seven = myAjax(urlPath_seven, need_data_seven);
		if(data_seven != undefined) {
			returnFlag = "N";
		} else {
			returnFlag = "E";
		}
		return returnFlag;
	}

	//查看商品视频事件，跳转商品视频列表
	$('.goods-video').click(function(e) {
		alert('查看商品视频时间，跳转商品视频列表');
	});

	//用户晒单（全部）
	$("#view-all-comment ,.goods-comment-item").click(function(e) {
		//跳转到用户晒单（全部）页面
		native.openWebView("all_evaluation_goods.jsp?jump_product_id=" + product_id);
	});

	//用户笔记（全部）
	$("#view-all-notes").click(function(e) {
		//alert('查看商品所有的笔记列表');
		native.openWebView("note_list.jsp?jump_product_id=" + product_id);
	});

	//笔记详情界面
	$("#goods-notes-contents").on("click", ".goods-note-item .note-pic", function() {
		//获得当前笔记的id
		var noteId = $(this).parent().attr("id");
		native.openView(noteId);
	});
	//笔记点赞
	$("#goods-notes-contents").on("click", ".goods-note-like", function() {
		//获得当前笔记的id
		var noteId = $(this).parents(".goods-note-item").attr("id");
		console.log("笔记id=" + noteId);
		if($(this).find(".iconfont").hasClass("icon-dianzan")) {
			//取消点赞
			$(this).find(".iconfont").removeClass("icon-dianzan");
			$(this).find(".iconfont").addClass("icon-dianzan1");
		} else {
			//取消点赞
			$(this).find(".iconfont").removeClass("icon-dianzan1");
			$(this).find(".iconfont").addClass("icon-dianzan");
		}

		var likeTotal = likeNoteOrNot(noteId);
		console.log("笔记点赞总数likeTotal=" + likeTotal);
		$(this).find(".like-num").text(likeTotal);
	});
	//点击笔记中营业员头像，跳转到营业员页面
	$("#notes_left_container_id,#notes_right_container_id").on("click", ".comment-user-face", function() {
		//获得营业员id
		var assistantId = $(this).attr("id");
		console.log("营业员id=" + assistantId);
		window.location.href = "adviser_personal_data.jsp?jump_assistant_id=" + assistantId;
	});

	//图文介绍与商品参数tabBar切换事件
	$('.goods-tab-bar span').click(function() {
		if(!$(this).hasClass('active')) {
			$(this).siblings('span').removeClass('active');
			$(this).addClass('active');
			if($(this).hasClass('pic-word-attr')) {
				$('.goods-params-content').hide();
				$('.pic-word-attr-content').show();
			} else if($(this).hasClass('goods-params')) {
				$('.pic-word-attr-content').hide();
				$('.goods-params-content').show();
			}
		}
	});

	//回至页面顶部
	$('.back-to-top').click(function(e) {
		$('body,html').animate({
			scrollTop: 0
		}, 1000, function() {
			if(!$('.goods-base-bar').hasClass('active')) {
				$('.goods-base-bar').siblings('span').removeClass('active');
				$('.goods-base-bar').addClass('active');
			}
			$('.goods-detail-hearder-bar').fadeOut("slow");
			$('.goods-detail-container').css({
				'marginTop': 0
			});
		});
	});

	//加入购物车
	$('.join-cart').click(function(e) {
		console.log("加入购物车");
		if(customer_type == 0) {
			buyFlag = "jionCart";
			$('.backdrop').show();
			$('.place-order-container').show();
			$('.goods-detail-hearder-bar').css({
				'zIndex': '997'
			});
			$("body").on("touchmove", function(event) {
				event.preventDefault;
			}, false);
		} else {
			popHtml("您是营业员，不能购买商品");
		}
	});

	//立即购买(或者点击已选最左面的按钮)显示商品各种参数类型
	$('.buy-goods,.user-select-params').click(function(e) {
		if(customer_type == 0) {
			buyFlag = "buyNow";
			$('.backdrop').show();
			$('.place-order-container').show();
			$('.goods-detail-hearder-bar').css({
				'zIndex': '997'
			});
			$("body").on("touchmove", function(event) {
				event.preventDefault;
			}, false);
		} else {
			popHtml("您是营业员，不能购买商品");
		}
	});
	//点击空白处，隐藏商品各种参数类型
	$('.backdrop').click(function(e) {
		$('.place-order-container').hide();
		$('.backdrop').hide();
		$('.goods-detail-hearder-bar').css({
			'zIndex': '1030'
		});
		$("body").off("touchmove");
	});

	//购买数量增减
	$('.buy-goods-num .iconfont').click(function(e) {
		if($(this).hasClass('icon-jianshao')) {
			if(buyNum > 1) {
				buyNum -= 1;
				$('.buy-num').html(buyNum);
			}
		} else if($(this).hasClass('icon-jia2')) {
			buyNum += 1;
			$('.buy-num').html(buyNum);
		}
	});

	//选择商品各种参数类型（cannot_selected不能被选中，selected选中）
	$(".goods-other-params").on("click", ".param-cate", function() {

		$(this).siblings('span').removeClass('selected');
		$(this).addClass('selected');

		//判断选中的是什么类型的参数（颜色，容量，运营商，套餐）
		var selectedId = $(this).parent().attr("id");
		var selectedContentID = $(this).attr("id"); //参数id
		var selectedName = $(this).text(); //选中的参数名子

		//参数id
		selectedColorId = initColorId;
		selectedMemoryId = initMemoryId;
		selectedSupplierId = initSupplierId;
		selectedContractId = initContractId;

		//参数名称
		selectedColorName = initColorName;
		selectedMemoryNmae = initMemoryNmae;
		selectedSupplierName = initSupplierName;
		selectedContractNmae = initContractNmae;

		switch(selectedId) {
			case "color_list":
				selectedColorId = selectedContentID;
				selectedColorName = selectedName;
				break;
			case "memory_list":
				selectedMemoryId = selectedContentID;
				selectedMemoryNmae = selectedName;
				break;
			case "supplier_list":
				selectedSupplierId = selectedContentID;
				selectedSupplierName = selectedName;
				break;
			case "contract_list":
				selectedContractId = selectedContentID;
				selectedContractNmae = selectedName;
				break;
			default:
				break;
		}
		//参数id
		initColorId = selectedColorId;
		initMemoryId = selectedMemoryId;
		initSupplierId = selectedSupplierId;
		initContractId = selectedContractId;

		//参数名称
		initColorName = selectedColorName;
		initMemoryNmae = selectedMemoryNmae;
		initSupplierName = selectedSupplierName;
		initContractNmae = selectedContractNmae;

		//接口路径（选择商品参数--颜色，容量，版本，套餐）
		var urlPath_selected = "mrsyg/kqgoods/SelectParameter.form";
		var need_data_selected = {
			"product_id": product_id,
			"color_id": selectedColorId,
			"memory_id": selectedMemoryId,
			"supplier_id": selectedSupplierId,
			"contract_id": selectedContractId
		};
		console.log("选择商品参数，selectedColorId=" + initColorId + ",selectedMemoryId=" + initMemoryId + ",initSupplierId=" + initSupplierId + ",initContractId=" + initContractId + "，product_id=" + product_id);
		var data_selected = myAjax(urlPath_selected, need_data_selected);
		if(data_selected != undefined) {
			//获得商品价格
			product_price = data_selected.product_price;

			//$(this).siblings('span').removeClass('selected');
			//$(this).addClass('selected');

			initColorId = selectedColorId;
			initMemoryId = selectedMemoryId;
			initSupplierId = selectedSupplierId;
			initContractId = selectedContractId;

			var productParameter = initColorName + " " + initMemoryNmae + " " + initSupplierName + " " + initContractNmae;
			//设置商品价格
			$("#pop_up_new_price").text(product_price); //弹出框中
			$("#product_new_price_id").text(product_price); //商品主图下面的价格
			$("#selected_parameter_id").text(productParameter);
		} else {
			popHtml(initColorName + " " + initMemoryNmae + " " + initSupplierName + " " + initContractNmae + "  " + "没有这款手机");
		}
	});

	//选择商品参数弹出层中的“确定”，跳转至确认订单界面
	$('.go-place-order').click(function(e) {
		//接口路径（获取套餐ID和商品详情id（选择的参数））
		var urlPath_contractId = "mrsyg/kqgoods/ProductDetail.form";
		var need_data_contractId = ""; //立即购买需要的参数
		var data_one_contractId = ""; //立即购买后台返回的参数

		//接口路径（加入购车）
		var urlPath_addCar = "mrsyg/kqgoods/AddCart.form";
		var need_data_addCar = ""; //加入购物车需要的参数
		var data_addCar = ""; //加入购物车后台返回的参数

		//立即购买（默认参数）
		need_data_contractId = {
			"product_id": product_id,
			"color_id": initColorId,
			"memory_id": initMemoryId,
			"supplier_id": initSupplierId,
			"contract_id": initContractId
		};
		data_one_contractId = myAjax(urlPath_contractId, need_data_contractId);

		if(data_one_contractId != undefined) {
			//商品详情（选择参数）id
			var returnProductDetailId = data_one_contractId.product_detail_id;
			//商品套餐id
			var returnSelectedContractId = data_one_contractId.contract_id;
			console.log("商品详情（选择参数）id=" + returnProductDetailId + ",商品套餐id=" + returnSelectedContractId + "，buyFlag=" + buyFlag);
			if(buyFlag == "buyNow") {
				//立即下单，跳转至确认订单界面;
				var needData = "product_detail_id=" + returnProductDetailId + "&product_number=" + buyNum + "&contract_id=" + returnSelectedContractId;
				window.location.href = "sure_order.jsp?" + needData;
			} else if(buyFlag == "jionCart") {
				need_data_addCar = {
					"product_detail_id": returnProductDetailId,
					"product_number": buyNum,
					"product_price": product_price,
					"contract_id": returnSelectedContractId
				};
				data_addCar = myAjax(urlPath_addCar, need_data_addCar);
				if(data_addCar != undefined) {
					popHtml("加入购物车成功");
					//关闭参数弹窗
					$('.place-order-container').hide();
					$('.backdrop').hide();
					$('.goods-detail-hearder-bar').css({
						'zIndex': '1030'
					});
					$("body").off("touchmove");
				}
			}
		} else {
			popHtml(initColorName + " " + initMemoryNmae + " " + initSupplierName + " " + initContractNmae + "  " + "没有这款手机");
		}
	});

	//聊天
	$(".goods-comment-icon").click(function(e) {
		var Persion = {
			title: productName,
			text: productText,
			imageUrl: productFirstPic,
			url: "goods_detail.jsp?jump_product_id=" + product_id,
			uuid: im_uuid
		}
		native.startChat(JSON.stringify(Persion));
	});

	//收藏商品事件
	$('.goods-collect-icon').click(function(e) {
		if($(this).find('.iconfont').hasClass("collected")) {
			console.log("取消收藏");
			//取消收藏
			var flag = collectionGoodsOrNot("-1");
			if(flag == "N") {
				$(this).find('.iconfont').removeClass('collected');
				popHtml("取消收藏成功");
			} else if(flag == "E") {
				popHtml("取消收藏失败");
			}
		} else {
			console.log("收藏");
			//收藏商品
			var flag = collectionGoodsOrNot("1");
			if(flag == "N") {
				$(this).find('.iconfont').addClass('collected');
				popHtml("收藏成功");
			} else if(flag == "E") {
				popHtml("收藏失败");
			}
		}
	})

	//选择收货地址
	$('.get-goods-address').click(function(e) {
		//alert("显示收货地址页面");
		$("#iframe_select_address").show();
		//当选择收货地址的子页面关闭时，当前页面设置选择的收货地址的信息
		$($("#iframe_select_address_id")[0].contentWindow).on("setReceiverAddress", function() {
			//设置收货地址
			var selectedAddress = $("#iframe_select_address_id").contents().find("#receiver_address_content").val();
			$("#receiver_address_id").text(selectedAddress);
		});
	});

	function likeNoteOrNot(noteId) {
		var liketotal = 0;
		var urlPath_likeNoteOrNot = "mrsyg/kquser/GiveLike.form";
		var need_likeNoteOrNot = {
			"parameter_id": noteId,
			"operate": "2"
		};
		var data_likeNoteOrNot = myAjax(urlPath_likeNoteOrNot, need_likeNoteOrNot);
		if(typeof(data_likeNoteOrNot) != "undefined") {
			liketotal = data_likeNoteOrNot.like_total;
		}
		return liketotal;
	}

})
