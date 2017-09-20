$(function() {
	//当前页面的变量
	var product_id = ""; //商品id
	var productName = ""; //商品名称
	var productText = ""; //商品默认参数
	var productFirstPic = ""; //商品第一张图片的url

	var im_uuid = ""; //营业员的im_uuid;
	var customer_type = ""; //当前用户类型（0 普通客户 1营业员）

	var start_time = ""; //限时购开始时间
	var end_time = ""; //限时购结束时间
	var now_time = ""; //当前时间

	var product_detail_id = ""; //商品参数id
	var product_price = ""; //商品价格

	var selectedColor = ""; //被选中的颜色id 
	var selectedMemory = ""; //被选中的内存容量id
	var selectedVersion = ""; //被选中的运营商id
	var selectedContract = ""; //被选中的套餐id
	var buyNum = 1; //默认购买数量为1

	var request = new queryString();
	if(request["jump_product_id"]) {
		product_id = request["jump_product_id"];
		console.log("商品详情，url=" + location.href);
		console.log("商品详情，product_id=" + product_id);
	} else {
		product_id = "4";
	}
	if(request["start_time"]) {
		start_time = request["start_time"];
		console.log("商品详情，start_time=" + start_time);
	}
	if(request["end_time"]) {
		end_time = request["end_time"];
		console.log("商品详情，end_time=" + end_time);
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

	//查看商品视频事件，跳转商品视频列表
	$('.goods-video').click(function(e) {
		alert('查看商品视频时间，跳转商品视频列表');
	});

	//查看商品所有的评价列表
	$(".view-all-comment").click(function(e) {
		alert('查看商品所有的评价列表');
	});

	//查看商品所有的笔记列表
	$(".view-all-notes").click(function(e) {
		alert('查看商品所有的笔记列表');
	});

	//查看某个商品笔记详情界面
	$(".goods-notes-contents").on("click", ".goods-note-item", function() {
		//获得当前笔记的id
		var noteId = $(this).attr("id");
		//获得视频标记
		var noteFlag = $(this).attr("noteFlag");
		alert("商品详情页noteId=" + noteId + ",noteFlag=" + noteFlag);
		native.openView("kechuang.mr.com.kcjh.activity.details.AiDaRenDetailActivity");
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

	//加入购物车1/1/4.00/1
	//mrsyg/kqgoods/AddCart.form?product_detail_id=1&product_number=1&product_price=4.00&contract_id=1
	$('.join-cart').click(function(e) {
		if(customer_type == 0) {
			//接口路径（加入购车）
			var urlPath_addCar = "mrsyg/kqgoods/AddCart.form";
			var need_data_addCar = {
				"product_detail_id": product_detail_id,
				"product_number": "1",
				"product_price": product_price,
				"contract_id": selectedContract
			};
			var data_addCar = myAjax(urlPath_addCar, need_data_addCar);
			if(data_addCar != undefined) {
				alert("加入购物车成功");
			}
		} else {
			alert("您是营业员，不能购买商品");
		}
	});

	//立即购买(或者点击已选最左面的按钮)显示商品各种参数类型
	$('.buy-goods,.user-select-params').click(function(e) {
		if(customer_type == 0) {
			$('.backdrop').show();
			$('.place-order-container').show();
			$('.goods-detail-hearder-bar').css({
				'zIndex': '997'
			});
			$("body").on("touchmove", function(event) {
				event.preventDefault;
			}, false);
		} else {
			alert("您是营业员，不能购买商品");
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
		//当次参数没有cannot_selected类时，才可以被选择
		if(!$(this).hasClass("cannot_selected")) {
			//判断选中的是什么类型的参数（颜色，容量，运营商，套餐）
			var selectedId = $(this).parent().attr("id");
			var selectedContentID = $(this).attr("id");
			switch(selectedId) {
				case "color_list":
					selectedColor = selectedContentID;
					break;
				case "memory_list":
					selectedMemory = selectedContentID;
					break;
				case "supplier_list":
					selectedVersion = selectedContentID;
					break;
				case "contract_list":
					selectedContract = selectedContentID;
					break;
				default:
					break;
			}
			$(this).siblings('span').removeClass('selected');
			$(this).addClass('selected');
			//接口路径（选择商品参数--颜色，容量，版本，套餐）
			var urlPath_selected = "mrsyg/kqgoods/SelectParameter.form";
			var need_data_selected = {
				"product_id": product_id,
				"color_id": selectedColor,
				"memory_id": selectedMemory,
				"supplier_id": selectedVersion,
				"contract_id": selectedContract
			};
			var data_selected = myAjax(urlPath_selected, need_data_selected);
			if(data_selected != undefined) {
				initSelected(data_selected);
			}
		} else {
			alert("此参数不可选");
		}

	});

	//选择商品参数弹出层中的“确定”，跳转至确认订单界面
	$('.go-place-order').click(function(e) {
		//接口路径（获取套餐ID和商品详情id（选择的参数））
		var urlPath_contractId = "mrsyg/kqgoods/ProductDetail.form";
		var need_data_contractId = {
			"product_id": product_id,
			"color_id": selectedColor,
			"memory_id": selectedMemory,
			"supplier_id": selectedVersion,
			"contract_id": selectedContract
		};
		var data_one_contractId = myAjax(urlPath_contractId, need_data_contractId);
		if(data_one_contractId != undefined) {
			//商品详情（选择参数）id
			product_detail_id = data_one_contractId.product_detail_id;
			//商品套餐id
			selectedContract = data_one_contractId.contract_id;
		}
		//alert('立即下单，跳转至确认订单界面');
		var needData = "product_detail_id=" + product_detail_id + "&product_number=" + buyNum + "&contract_id=" + selectedContract;
		window.location.href = "sure_order.jsp?" + needData;
	});

	//聊天
	$(".goods-comment-icon").click(function(e) {
		alert("商品详情，聊天uuid=" + uuid);
		var needString = {
			title: productName,
			text: productText,
			imageUrl: productFirstPic,
			url: "goods_detail.jsp?jump_product_id=" + product_id,
			uuid: im_uuid
		};
		var Persion ={
			title : "苹果",
			text : "text",
			imageUrl : "http://tva4.sinaimg.cn/crop.1.0.638.638.1024/a026df41jw8ea72uxthh7j20hs0hqaat.jpg",
			url : "http://www.baidu.com",
			uuid :im_uuid
		}
		native.startChat(JSON.stringify(Persion));
		alert("我是帅哥啊")
		if(window.native != null && typeof(window.native) != "undefined") {
			//native.startChat(JSON.stringify(needString);
		}
	});

	//收藏商品事件
	$('.goods-collect-icon').click(function(e) {
		if($(this).find('.iconfont').hasClass("collected")) {
			$(this).find('.iconfont').removeClass('collected');
			//取消收藏
			collectionGoodsOrNot("-1");
		} else {
			$(this).find('.iconfont').addClass('collected');
			//收藏商品
			collectionGoodsOrNot("1");
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

	//接口路径（商品基本信息）
	//mrsyg/kqgoods/GoodsInfo.form?product_id=4
	var urlPath_one = "mrsyg/kqgoods/GoodsInfo.form";
	var need_data = {
		"product_id": product_id
	};
	var data_one = myAjax(urlPath_one, need_data);
	if(data_one != undefined) {
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
	if(data_two != undefined) {
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
	if(data_three != undefined) {
		initThree(data_three);
	}

	//接口路径（图文介绍）
	//mrsyg/kqgoods/GoodsDescribe.form?product_id=4
	var urlPath_four = "mrsyg/kqgoods/GoodsDescribe.form";
	var need_data_four = {
		"product_id": product_id
	};
	var data_four = myAjax(urlPath_four, need_data_four);
	if(data_four != undefined) {
		initFour(data_four);
	}

	//接口路径（商品参数描述）
	//mrsyg/kqgoods/GoodsParameter.form?product_id=4
	var urlPath_five = "mrsyg/kqgoods/GoodsParameter.form";
	var need_data_five = {
		"product_id": product_id
	};
	var data_five = myAjax(urlPath_five, need_data_five);
	if(data_five != undefined) {
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
	if(data_six != undefined) {
		initSix(data_six);
	}

	function init(data) {
		//当前时间
		now_time = data.current_time;
		if(!end_time) {
			$(".remain-time-tip").hide();
		} else {
			//每秒更新一次时间
			nowTime = Date.parse(now_time.replace("-", "/")) / 1000;
			end_time = Date.parse(end_time.replace("-", "/")) / 1000;
			var InterValObj = window.setInterval(setChangeTime, 1000);
		}

		function setChangeTime() {
			var shijiancha = end_time - nowTime;
			var upDates = parseInt(shijiancha / 86400);
			var upHourse = parseInt(shijiancha % 86400 / 3600);
			var upMinutes = parseInt(shijiancha % 86400 % 3600 / 60);
			var upSeconds = parseInt(shijiancha % 86400 % 3600 % 60);
			var timeString = upDates + "天" + upHourse + "小时" + upMinutes + "分" + upSeconds +"秒";
			$(".remain-time").text(timeString);
		};
		

		//用户类型（客户类型：0 普通客户 1营业员）
		customer_type = data.customer_type;
		//用户im_uuid(用于聊天)
		im_uuid = data.im_uuid;
		console.log("商品详情页im_uuid="+im_uuid);
		//商品详情id
		product_detail_id = data.product_detail_id;
		//商品名称
		var product_name = data.product_name;
		productName = product_name;
		$("#product_name_id").text(product_name);
		$(".goods-name").text(product_name);
		//商品现价
		product_price = data.price_new;
		$("#product_new_price_id").text("￥" + product_price);
		$("#pop_up_new_price").text(product_price);
		//商品原价
		var price_old = data.price_old;
		$("#product_old_price_id").text("￥" + price_old);
		$("#pop_up_old_price").text(price_old);
		//颜色
		var color = data.color;
		selectedColor = data.color_id;
		//内存容量
		var memory_capacity = data.memory_capacity;
		selectedMemory = data.memory_id;
		//运营商
		var supplier_desc = data.supplier_desc;
		selectedVersion = data.supplier_id;
		//套餐
		var contract_name = data.contract_name;
		//套餐id
		selectedContract = data.contract_id;
		productText = color + " " + memory_capacity + " " + supplier_desc + " " + contract_name;
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
		$.each(data.pictureinfo, function(index, getdata) {
			//获取图片总数
			var pic_total = getdata.length;
			//商品照片
			var picture_url = getdata.picture_url;
			if(index == 0) {
				firstPic = picture_url;
				productFirstPic = picture_url;
			}
			var picture_url2x = getDifferencePic(picture_url, "2x_");
			var picture_url3x = getDifferencePic(picture_url, "3x_");
			var needString = '<div class="swiper-slide swiper-no-swiping" item-index="' + index + '" total="' + pic_total + '" item-type="img">' +
				'<img src="' + picture_url2x + '" srcset="' + picture_url2x + ' 2x,' + picture_url3x + ' 3x">' +
				'</div>';
			$(needString).appendTo("#product_pic_container_id");
		});
		
		$("#pop_up_pic").attr("src",firstPic);
		//商品图片轮播
		new Swiper('.goods-pics-container .swiper-container', {
			noSwiping: true,
			direction: 'horizontal',
			loop: true,
			speed: 300,
			autoplay: 3000,
			preventClicks: false,
			autoplayDisableOnInteraction: false,
			// 如果需要分页器
			pagination: '.swiper-pagination',
			//分页器样式
			paginationBulletRender: function(swiper, index, className) {
				return '<span class="' + className + '"></span>';
			}
		});

		//商品图片视频大图预览
		$('.goods-pics-container').find('img,video').click(function(e) {
			var total = $(this).parent('.swiper-slide').attr('total');
			var currentIndex = Number($(this).parent('.swiper-slide').attr('item-index'));
			var type = $(this).parent('.swiper-slide').attr('item-type');
			var previewCont = $('.goods-pics-container').html();
			$('.goods-big-preview-container').show();
			$('.preview-nav').html(currentIndex + 1 + "/" + total);
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
		$.each(data.commentinfo, function(index, getdata) {
			//晒单照片1
			var picture_one = getdata.picture_one;
			//用户头像
			var customer_picture = getdata.customer_picture;
			//用户名称
			var customer_name = getdata.customer_name;
			//用户id
			var customer_id = getdata.customer_id;
			//用户评论内容
			var comment_content = getdata.comment_content;
			var needString = '<div class="swiper-slide text-center goods-comment-item col-xs-11">' +
				'<div class="comment-pic col-xs-4">' +
				'<img class="comment-pic-height" src="' + picture_one + '">' +
				'</div>' +
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
		$("#notes_left_container_id").empty();
		$("#notes_right_container_id").empty();
		$.each(data.noteinfo, function(index, getdata) {
			//笔记图片
			var picture_url = getdata.picture_url;
			//笔记名称
			var note_name = getdata.note_name;
			//笔记描述
			var note_desc = getdata.note_desc;
			//营业员头像
			var customer_picture = getdata.customer_picture;
			//营业员id
			var customer_id = getdata.customer_id;
			//营业员名称
			var customer_name = getdata.customer_name;
			//笔记编号
			var note_id = getdata.note_id;
			//点赞数量
			var note_like_total = getdata.note_like_total;
			//是否被点赞（-1已点赞,1未点赞）
			var note_like_flag = getdata.note_like_flag;
			//是否有视频(0没有1有)
			var video_flag = getdata.video_flag;
			var needString = '<div class="goods-note-item col-xs-12" id="' + note_id + '" noteFlag="' + video_flag + '">' +
				'<img class="note-pic col-xs-12" src="' + picture_url + '">' +
				'<span class="goods-note-title col-xs-12 text-left">' + note_name + '</span>' +
				'<span class="goods-note-cont col-xs-12 text-left">' + note_desc + '</span>' +
				'<div class="goods-note-publish col-xs-12">' +
				'<div class="comment-user-info col-xs-6 text-left">' +
				'<div class="comment-user-face col-xs-4" id="' + customer_id + '">' +
				'<img src="' + customer_picture + '">' +
				'</div>' +
				'<span class="comment-user-name col-xs-8 text-left">' + customer_name + '</span>' +
				'</div>' +
				'<div class="goods-note-like col-xs-6 text-right">' +
				'<span class="iconfont icon-dianzan1"></span>' +
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
			var needString = '<span class="param-cate col-xs-3" id="' + color_id + '">' + color_name + '</span>';
			$(needString).appendTo("#color_list");
		});
		//内存
		$.each(data.memoryinfo, function(index, getdata) {
			//内存id
			var memory_id = getdata.memory_id;
			//内存名称
			var memory_name = getdata.memory_name;
			var memoryString = '<span class="param-cate col-xs-3" id="' + memory_id + '">' + memory_name + '</span>';
			$(memoryString).appendTo("#memory_list");
		});
		//运营商
		$.each(data.supplierinfo, function(index, getdata) {
			//运营商id
			var supplier_id = getdata.supplier_id;
			//运营商名称
			var supplier_name = getdata.supplier_name;
			var supplierString = '<span class="param-cate col-xs-3" id="' + supplier_id + '">' + supplier_name + '</span>';
			$(supplierString).appendTo("#supplier_list");
		});
		//套餐
		$.each(data.contractinfo, function(index, getdata) {
			//套餐id
			var contract_id = getdata.contract_id;
			//套餐名称
			var contract_name = getdata.contract_name;
			var contractString = '<span class="param-cate col-xs-3" id="' + contract_id + '">' + contract_name + '</span>';
			$(contractString).appendTo("#contract_list");
		});
	}

	//收藏或者取消收藏商品
	function collectionGoodsOrNot(type) {
		//接口路径（type，取消收藏:-1,收藏:1）
		var urlPath_seven = "mrsyg/kquser/CollectionGoods.form";
		var need_data_seven = {
			"product_id": product_id,
			"type": type
		};
		var data_seven = myAjax(urlPath_seven, need_data_seven);
		if(data_seven != undefined) {
			if(type == 1) {
				alert("收藏成功");
			} else if(type == -1) {
				alert("取消收藏成功");
			}
		}
	}

	function initSelected(data) {
		//颜色
		$.each(data.colorinfo, function(index, getdata) {
			//颜色id
			var color_id = getdata.color_id;
			resetSelected(color_id, "color_list");
		});
		//内存
		$.each(data.memoryinfo, function(index, getdata) {
			//内存id
			var memory_id = getdata.memory_id;
			resetSelected(memory_id, "memory_list");
		});
		//运营商
		$.each(data.supplierinfo, function(index, getdata) {
			//运营商id
			var supplier_id = getdata.supplier_id;
			resetSelected(supplier_id, "supplier_list");
		});
		//套餐
		$.each(data.contractinfo, function(index, getdata) {
			//套餐id
			var contract_id = getdata.contract_id;
			resetSelected(contract_id, "contract_list");
		});
	}
	//sonId返回可选择的参数的id，parentId对应参数的父元素的id
	function resetSelected(sonId, parentId) {
		$("#" + parentId).find(".param-cate").each(function() {
			var content = $(this).attr("id");
			if(content != sonId && !$(this).hasClass("cannot_selected")) {
				$(this).addClass("cannot_selected");
			} else {
				$(this).removeClass("cannot_selected");
			}
		});
	}

})