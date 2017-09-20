(function($, document) {
	//��ñ��ش洢�Ķ���
	var localStorageObj = window.localStorage;
	var order_no="";//�������
	var order_name="goods";//��������
	var order_price="0.1";//�����۸�
	var order_show_page="http://120.76.190.223:8988/html5/YunHaiTongProject/pay_success.html";//չʾҳ�������
	
	//�������--����֧������
	$(".btn-commit").bind("click",function(){
		//$("#pay-order").show();
		//��ȡѡ����Ʒ�Ĺ��ﳵid
		var cartIds="";
		$(".good_selected").each(function(index,obj){
			if($(obj).attr("id")==2){
				cartIds=cartIds+$(obj).parents(".goods_out_contaniner").attr("id")+",";
			}
		});
		if (cartIds.length>0) {
			localStorageObj.setItem("shopping_cart_ids",cartIds);
			window.location.href="sure_order_from_shopping_cart.html";
		} else{
			alert("��ѡ��Ҫ�������Ʒ");
		}
		
	});
	//���֧��������ţ��ر�֧������
	$(".chose-pay-div").bind("click",function(){
		$("#pay-order").hide();
	});
	//ѡ��֧�����ͣ�΢��--֧������
	$(".pay-way-chose").bind("click",function(){
		var selectedId=$(this).attr("id");
		if ($(this).find(".chose").hasClass(". chose-pay-yes")) {
			$(this).find(".chose").removeClass(". chose-pay-yes");
			$(this).siblings(".pay-way-chose").find(".chose").addClass(". chose-pay-yes");
		} else{
			$(this).find(".chose").addClass(". chose-pay-yes");
			$(this).siblings(".pay-way-chose").find(".chose").removeClass(". chose-pay-yes");
		}
		if (selectedId==1) {
			alert("weixin");
		} else{
			alert("zhifubao");
			$("#WIDout_trade_no").val(order_no);
			$("#WIDsubject").val(order_name);
			$("#WIDtotal_fee").val(order_price);
			$("#WIDshow_url").val(order_show_page);
			$("#WIDbody").val(order_no);
			$("#payFrom").submit();
		}
	});
	
	
	//�������
	$(".shopping_car_order_conner").on("click",".less",function(){
		//��ȡ��Ʒ����
		var num = parseInt($(this).siblings(".count").text());
		//��ȡ��Ʒ�Ĺ��ﳵid
		var shoopingCarId=$(this).parents(".goods_out_contaniner").attr("id");
		if(num > 1) {
			num = num - 1;
			$(this).siblings(".count").text(num);
		}
		addOrReduceProductNum(shoopingCarId,"-1");
	});
	//�������
	$(".shopping_car_order_conner").on("click",".plus",function(){
		//��ȡ��Ʒ����
		var num = parseInt($(this).siblings(".count").text());
		//��ȡ��Ʒ�Ĺ��ﳵid
		var shoopingCarId=$(this).parents(".goods_out_contaniner").attr("id");
		if(num < 99) {
			num = num + 1;
			$(this).siblings(".count").text(num);
		}
		addOrReduceProductNum(shoopingCarId,"1");
	});
	//���ɾ������
	$(".shopping_car_order_conner").on("click",".order_trash",function(){
		$(this).parents(".goods_out_contaniner").addClass("delete");

		var deleteAll = false;
		$(this).parents(".order_box").find(".goods_out_contaniner").each(function(i, obj) {
			if(!$(obj).hasClass("delete")) {
				deleteAll = true;
			}
		});
		if(deleteAll == false) {
			//ɾ�������ڵ�������Ʒ
			$(this).parents(".order_box").empty();
		} else {
			//ɾ��������Ʒ
			$(this).parents(".goods_out_contaniner").empty();
		}
	});

	//��ѡ��1--δѡ�У�2--ѡ�У�
	$(".shopping_car_order_conner").on("click",".good_selected",function(){
		var selected_id = $(this).attr("id");
		if(selected_id == 1) { //ѡ��
			$(this).attr("id", "2");
			$(this).attr("src", "img/selected@2x.png");

			//�ж��Ƿ�ѡ�е���
			var selectedShopFlag = "2";
			$(this).parents(".goods_out_contaniner").siblings(".goods_out_contaniner").each(function(i, obj) {
				var id = $(obj).find(".good_selected").attr("id");
				if(id == 1) {
					selectedShopFlag = "1";
					return false;
				}
			});
			if(selectedShopFlag == "2") {
				//����ѡ��
				$(this).parents(".goods_out_contaniner").siblings(".shop_name_conter").find(".shop_selected").attr("id", "2");
				$(this).parents(".goods_out_contaniner").siblings(".shop_name_conter").find(".shop_selected").attr("src", "img/selected@2x.png");
			}
			//�ж��Ƿ�ȫѡ
			selectedAllOrnot();
		} else if(selected_id == 2) { //ȡ��ѡ��
			$(this).attr("id", "1");
			$(this).attr("src", "img/un_selected@2x.png");

			//ȡ������ȫѡ
			$(this).parents(".goods_out_contaniner").siblings(".shop_name_conter").find(".shop_selected").attr("id", "1");
			$(this).parents(".goods_out_contaniner").siblings(".shop_name_conter").find(".shop_selected").attr("src", "img/un_selected@2x.png");
			//ȡ��ȫѡ
			$(this).parents(".shopping_car_order_conner").siblings(".shopping_car_footer").find(".selected_all").attr("id", "1");
			$(this).parents(".shopping_car_order_conner").siblings(".shopping_car_footer").find(".selected_all").attr("src", "img/un_selected@2x.png");
		}
	});

	//����ȫѡ��1--δѡ�У�2--ѡ�У�
	$(".shopping_car_order_conner").on("click",".shop_selected",function(){
		var selected_id = $(this).attr("id");
		if(selected_id == 1) {
			$(this).attr("id", "2");
			$(this).attr("src", "img/selected@2x.png");
			$(this).parent().siblings(".goods_out_contaniner").each(function(i, obj) {
				$(obj).find('.good_selected').attr("id", "2");
				$(obj).find('.good_selected').attr("src", "img/selected@2x.png");
			});
		} else if(selected_id == 2) {
			//ȡ��ȫѡ
			$('.selected_all').attr("id", "1");
			$('.selected_all').attr("src", "img/un_selected@2x.png");

			$(this).attr("id", "1");
			$(this).attr("src", "img/un_selected@2x.png");
			$(this).parent().siblings(".goods_out_contaniner").each(function(i, obj) {
				$(obj).find('.good_selected').attr("id", "1");
				$(obj).find('.good_selected').attr("src", "img/un_selected@2x.png");
			});
		}
		//�ж��Ƿ�ȫѡ
		selectedAllOrnot();
	});

	//���ȫѡ��1--δѡ�У�2--ѡ�У�
	$(".selected_all").bind("click", function() {
		var selected_id = $(this).attr("id");
		if(selected_id == 1) {
			$(this).attr("id", "2");
			$(this).attr("src", "img/selected@2x.png");
			$(this).parents(".shopping_car_footer").siblings(".shopping_car_order_conner").find(".shop_selected").each(function(i, obj) {
				$(obj).attr("id", "2");
				$(obj).attr("src", "img/selected@2x.png");
				$(obj).parent().siblings(".goods_out_contaniner").each(function(i, obj) {
					$(obj).find(".good_selected").attr("id", "2");
					$(obj).find(".good_selected").attr("src", "img/selected@2x.png");
				});
			});
		} else if(selected_id == 2) {
			$(this).attr("id", "1");
			$(this).attr("src", "img/un_selected@2x.png");
			$(this).parents('.shopping_car_footer').siblings('.shopping_car_order_conner').find('.shop_selected').each(function(i, obj) {
				$(obj).attr("id", "1");
				$(obj).attr("src", "img/un_selected@2x.png");
				$(obj).parent().siblings(".goods_out_contaniner").each(function(i, obj) {
					$(obj).find(".good_selected").attr("id", "1");
					$(obj).find(".good_selected").attr("src", "img/un_selected@2x.png");
				});
			});
		}
	});

	function selectedAllOrnot() {
		//�ж����еĵ����Ƿ񶼱�ѡ��
		var selectedAllFlag = "2";
		$(".shop_selected").each(function(i, obj) {
			var id = $(obj).attr("id");
			if(id == 1) {
				selectedAllFlag = "1";
				return false;
			}
		});
		if(selectedAllFlag == "1") {
			//ȡ��ȫѡ��
			$(".selected_all").attr("id", "1");
			$(".selected_all").attr("src", "img/un_selected@2x.png");
		} else {
			//����ȫѡѡ��
			$(".selected_all").attr("id", "2");
			$(".selected_all").attr("src", "img/selected@2x.png");
		}
	}

	//�ӿ�·�����ҵĹ��ﳵ��
	//mrsyg/kqgoods/ShowCart.form?pag_no=1&pag_num=100
	var urlPath_myShopingCar = "mrsyg/kqgoods/ShowCart.form";
	var need_data_myShopingCar = {
		"pag_no": "1",
		"pag_num": "100"
	};
	var data_myShopingCar = myAjax(urlPath_myShopingCar, need_data_myShopingCar);
	if(data_myShopingCar != undefined) {
		initMyShopingCar(data_myShopingCar);
	}

	function initMyShopingCar(data) {
		$.each(data.cartinfo, function(index, getdata) {
			//����id
			var shop_id = getdata.shop_id;
			//��������
			var shop_name = getdata.shop_name;
			//������Ʒ
			var productString = "";
			$.each(getdata.goodsinfo, function(index, getProductData) {
				//���ﳵid
				var cart_id = getProductData.cart_id;
				//��Ʒid
				var product_id = getProductData.product_id;
				//��Ʒ����
				var product_name = getProductData.product_name;
				//��ƷͼƬ
				var picture_url = getdata.picture_url;
				//��Ʒ����
				var product_number = getProductData.product_number;
				//��Ʒ�۸�
				var product_price = getProductData.product_price;
				productString = productString + '<div class="goods_out_contaniner" id="'+cart_id+'">' +
					'<div class="line"></div>' +
					'<div class="good_box">' +
					'<img class="good_selected" id="1" src="img/un_selected@2x.png"/>' +
					'<img class="product_piture" src="img/product_pic@2x.png" id="' + product_id + '"/>' +
					'<div class="row_one">' +
					'<span>' + product_name + '</span>' +
					'</div>' +
					'<div class="good_price">��' + product_price + '</div>' +
					'<div class="edit-count">' +
					'<span class="less">-</span>' +
					'<span class="count">' + product_number + '</span>' +
					'<span class="plus">+</span>' +
					'</div>' +
					'<img class="order_trash" src="img/trash@2x.png"/>' +
					'</div>' +
					'</div>';
			});
			var needString = '<div class="order_box margin_top_six">' +
				'<div class="order_info background_color_FF">' +
				'<div class="shop_name_conter">' +
				'<img class="shop_selected" id="1" src="img/un_selected@2x.png"/>' +
				'<span class="shop_name" id="' + shop_id + '">' + shop_name + '</span>' +
				'</div>' + productString + '</div>' +
				'</div>';
			$(needString).appendTo(".shopping_car_order_conner");
		});
	}
	
	//���ӻ���ٹ�����Ʒ������
	function addOrReduceProductNum(cart_id,type){
		var urlPath_addOrReduce = "mrsyg/kqgoods/ModifyNumber.form";
		var need_data_addOrReduce = {
			"cart_id": cart_id,
			"type": type
		};
		var data_addOrReduce = myAjax(urlPath_addOrReduce, need_data_addOrReduce);
		if(data_addOrReduce != undefined) {
			return data_addOrReduce.product_number;
		}
	}
	
	
	
})(jQuery, document);