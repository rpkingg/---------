(function($, document) {

	//接口路径(广告位)
	var urlPath_one = "mrsyg/kqgoods/FashionAdvertise.form";
	var need_data_one = {};
	var data_one = myAjax(urlPath_one, need_data_one);
	if(data_one != undefined) {
		init(data_one);
	}
	//接口路径(商品)
	//http://120.76.190.223:8988/mrsyg/kqgoods/FashionGoods.form?pag_no=1&pag_num=100
	var urlPath_two = "mrsyg/kqgoods/FashionGoods.form";
	var need_data_two = {
		"pag_no": "1",
		"pag_num": "100"
	};
	var data_two = myAjax(urlPath_two, need_data_two);
	if(data_two != undefined) {
		init2(data_two);
	}

	function init(data) {
		$.each(data.advertiseinfo, function(index, getData) {
			var banner_pic = getData.advertise_picture;
			var banner_pic_id = getData.advertise_id;
			var needString = '<div class="swiper-slide stroll_banner">' +
				'<img class="stroll_banner_img" id="' + banner_pic_id + '" src="' + banner_pic + '" srcset="" />' +
				'</div>';
			$(needString).appendTo(".swiper-wrapper");
		});
		loadSwiper("swiper-container", "swiper-pagination");
	}

	function init2(data) {
		$.each(data.goodsinfo, function(index, getData) {
			var fashion_picture = getData.fashion_picture;
			var product_id = getData.product_id;
			var fashion_name = getData.fashion_name;
			var note_sum = getData.note_sum;
			var needString = '<div class="stroll_product_list background_color_FF" id="' + product_id + '">' +
				'<img class="stroll_product_pic" src="' + fashion_picture + '"/>' +
				'<div class="stroll_product_introduce">' +
				'<div class="stroll_product_name">' + fashion_name + '</div>' +
				'<div class="stroll_customer_note">' +
				'<img class="stroll_product_note_pic" src="img/note_icon@2x.png"/>' +
				'<p class="stroll_product_note_num">用户笔记' + note_sum + '篇</p>' +
				'</div>' +
				'<a class="stroll_product_buy_btn">选购</a>' +
				'</div>' +
				'</div>';
			$(needString).appendTo("#stroll_product_lists");
		});
	}

	//刷新页面回调
	function refreshData() {
		console.log('refreshData');

		setTimeout(function () {
			//获取完数据后还原loading状态
			resetLoadingElements();
		}, 1000);
	}

	window.onload = function () {
		var pullDownOffset = $('.pull-down-box').outerHeight();

		var myScroll = new IScroll('.my-follow-container', {
			click: true,
			scrollX: false,
			scrollY: true,
			mouseWheel: true,
			probeType: 2
		});

		myScroll.on('scroll', function () {
			if (isLoading) {
				return;
			}

			if (this.y < this.maxScrollY) {
				$('.pull-up').addClass('animate');
			} else if (this.y < this.maxScrollY) {
				$('.pull-up').removeClass('animate');
			}
		});

		myScroll.on('scrollEnd', function () {
			if (isLoading) {
				return;
			}

			if ($('.pull-up').hasClass('animate') && this.maxScrollY + 1 > this.y) {
				isLoading = true;
				loadMoreData();
				$('.pull-up-box').show();
				setTimeout("myscroll.refresh()", 0);
			}
		});
	};

	var pag_no=1;



	//加载更多数据回调
	function loadMoreData() {
		console.log('loadMoreData');
		setTimeout(function () {
			//获取完数据后还原loading状态
			resetLoadingElements();
			$('.pull-up-box').hide();
		}, 1000);
		pag_no++;
//接口路径(广告位)
		var urlPath_one = "mrsyg/kqgoods/FashionAdvertise.form";
		var need_data_one = {};
		var data_one = myAjax(urlPath_one, need_data_one);
		if(data_one != undefined) {
			init(data_one);
		}
		//接口路径(商品)
		//http://120.76.190.223:8988/mrsyg/kqgoods/FashionGoods.form?pag_no=1&pag_num=100
		var urlPath_two = "mrsyg/kqgoods/FashionGoods.form";
		var need_data_two = {
			"pag_no": "1",
			"pag_num": "100"
		};
		var data_two = myAjax(urlPath_two, need_data_two);
		if(data_two != undefined) {
			init2(data_two);
		}

		function init(data) {
			$.each(data.advertiseinfo, function(index, getData) {
				var banner_pic = getData.advertise_picture;
				var banner_pic_id = getData.advertise_id;
				var needString = '<div class="swiper-slide stroll_banner">' +
					'<img class="stroll_banner_img" id="' + banner_pic_id + '" src="' + banner_pic + '" srcset="" />' +
					'</div>';
				$(needString).appendTo(".swiper-wrapper");
			});
			loadSwiper("swiper-container", "swiper-pagination");
		}

		function init2(data) {
			$.each(data.goodsinfo, function(index, getData) {
				var fashion_picture = getData.fashion_picture;
				var product_id = getData.product_id;
				var fashion_name = getData.fashion_name;
				var note_sum = getData.note_sum;
				var needString = '<div class="stroll_product_list background_color_FF" id="' + product_id + '">' +
					'<img class="stroll_product_pic" src="' + fashion_picture + '"/>' +
					'<div class="stroll_product_introduce">' +
					'<div class="stroll_product_name">' + fashion_name + '</div>' +
					'<div class="stroll_customer_note">' +
					'<img class="stroll_product_note_pic" src="img/note_icon@2x.png"/>' +
					'<p class="stroll_product_note_num">用户笔记' + note_sum + '篇</p>' +
					'</div>' +
					'<a class="stroll_product_buy_btn">选购</a>' +
					'</div>' +
					'</div>';
				$(needString).appendTo("#stroll_product_lists");
			});
		}
	}
		var isLoading = false;
		function resetLoadingElements() {
			isLoading = false;
			$('.pull-down').removeClass('animate');
			$('.pull-down-box').removeClass('loading');
			$('.pull-up').removeClass('animate');
		}


	//点击购买到商品详情页
	$("#stroll_product_lists").on("click", ".stroll_product_buy_btn", function() {
		//获取商品id
		var product_id = $(this).parents(".stroll_product_list").attr("id");
		window.native.openWebView("goods_detail.jsp?jump_product_id=" + product_id);
	});
	
	//点击广告位跳转到商品详情
	$(".swiper-wrapper").on("click",".stroll_banner",function(){
		//获得广告位商品的id
		var product_id=$(this).find(".stroll_banner_img").attr("id");
		alert("stroll_find_goods.js获得广告位商品的id="+product_id);
		window.native.openWebView("goods_detail.jsp?jump_product_id=" + product_id);
	});

})(jQuery, document);