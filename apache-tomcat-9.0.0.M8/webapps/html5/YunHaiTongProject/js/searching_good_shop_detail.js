(function($, document) {
	var shopId = "1"; //����id

	//�ӿ�·�������࣬ɸѡ--��ʼ����Ʒ��Ĭ��--���£�type�գ�parameter_id�գ�
	var search_type = "1"; //search_type-->1.����,2.����,3.�۸���С����,4.�۸��ɴ�С,5.������С����,6.�����ɴ�С
	var type = ""; //type-->a.����,b.Ʒ��,c.��Ӫ��
	var parameter_id = ""; //parameter_id-->ѡ��Ĳ���id

	//������ͼ�ֲ�
	loadSwiper("swiper-container", "swiper-pagination");

	//�����ϸ�ҳ�洫�����Ĳ���
	var get = new queryString();

	//���-����-�������൯����
	$("#classification_btn").bind('click', function() {
		$("#classification_pop_up").show();
		$(this).css("background-color", "#FFFFFF");
		type = "a";
	});
	//���-����-�����������--ȷ��
	$("#classification_sure").bind('click', function() {
		$("#classification_pop_up").hide();
		$("#classification_btn").css("background-color", "#F0F1F4");
		filterProduct();
	});

	//���-Ʒ��-����Ʒ�Ƶ�����
	$("#brand_btn").bind('click', function() {
		$("#brand_pop_up").show();
		$(this).css("background-color", "#FFFFFF");
		type = "b";
	});
	//���-Ʒ��-�����������--ȷ��
	$("#brand_sure").bind('click', function() {
		$("#brand_pop_up").hide();
		$("#brand_btn").css("background-color", "#F0F1F4");
		filterProduct();
	});

	//���-��Ӫ��-������Ӫ�̵�����
	$("#operator_btn").bind('click', function() {
		$("#operator_pop_up").show();
		$(this).css("background-color", "#FFFFFF");
		type = "c";
	});
	//���-��Ӫ��-�����������--ȷ��
	$("#operator_sure").bind('click', function() {
		$("#operator_pop_up").hide();
		$("#operator_btn").css("background-color", "#F0F1F4");
		filterProduct();
	});

	//ѡ�������id�����£����ȣ��۸�������
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
	//ѡ����࣬Ʒ�ƣ���Ӫ���еķ���
	$("body").on("click", ".selected_item", function() {
		//���ѡ�е�parameter_id
		parameter_id = $(this).attr("id");
	});

	//������࣬Ʒ�ƣ���Ӫ�̵�����֮��ĵط����رյ���
	$(document).mouseup(function(e) {
		//����Ŀ������
		var _con = $(".brand_pop_up");
		if(!_con.is(e.target) && _con.has(e.target).length === 0) {
			$(".brand_pop_up").hide();
			$("#classification_btn ,#brand_btn ,#operator_btn").css("background-color", "#F0F1F4");
		}
	});

	//���ɸѡ����ɸѡ������
	$("#shaixun_btn").bind('click', function() {
		$("#shaixuan").show();
	});
	var priceStart = ""; //��ͼ۸�
	var priceEnd = ""; //��߼۸�
	var clickBrandId = ""; //ѡ�е�Ʒ��id
	//ѡ��Ʒ��
	$("body").on("click", ".brand_container", function() {
		clickBrandId = $(this).attr("id");
	});
	//���ɸѡ�������--����
	$("#reset_btn_shaixuan").bind("click", function() {
		clickBrandId = "";
		priceStart = "";
		priceEnd = "";
		$(".filter_price_low").val("");
		$(".filter_price_height").val("");
	});
	//���ɸѡ�������--ȷ��
	$("#sure_btn_shaixuan").bind('click', function() {
		priceStart = $(".filter_price_low").val();
		priceStart = parseFloat(priceStart);
		priceEnd = $(".filter_price_height").val();
		priceEnd = parseFloat(priceEnd);
		if(priceStart >= priceEnd || isNaN(priceEnd) || isNaN(priceStart)) {
			alert("����������۸�");
		} else {
			if(clickBrandId.length > 0) {
				$("#shaixuan").hide();
				//�ӿ�·����ɸѡ��
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
				alert("��ѡ��Ʒ��");
			}
		}

	});
	//���ɸѡ������֮��ĵط����رյ���
	$(document).mouseup(function(e) {
		//����Ŀ������
		var _con = $("#shaixuan_second");
		if(!_con.is(e.target) && _con.has(e.target).length === 0) {
			$("#shaixuan").hide();
		}
	});
	
	

	//�ӿ�·����������Ϣ��
	var urlPath_one = "mrsyg/kqgoods/ShopInfo.form";
	var need_data_one = {
		"shop_id": shopId
	};
	var data_one = myAjax(urlPath_one, need_data_one);
	if(data_one != undefined) {
		init(data_one);
	}
	//�ӿ�·�������̴��ˣ�
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
	//�ӿ�·�����ʼǶ�̬��
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
	//�ӿ�·����������Ʒ��
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

	//�ӿ�·��������--��ʼ����
	var urlPath_classification = "mrsyg/kqgoods/ShopCategory.form";
	var need_data_classification = {};
	var data_classification = myAjax(urlPath_classification, need_data_classification);
	if(data_classification != undefined) {
		initClassification(data_classification);
	}

	//�ӿ�·����Ʒ��--��ʼ����
	var urlPath_brand = "mrsyg/kqgoods/ShopBrand.form";
	var need_data_brand = {};
	var data_brand = myAjax(urlPath_brand, need_data_brand);
	if(data_brand != undefined) {
		initBrand(data_brand);
	}

	//�ӿ�·������Ӫ��--��ʼ����
	var urlPath_operator = "mrsyg/kqgoods/ShopSupplier.form";
	var need_data_operator = {};
	var data_operator = myAjax(urlPath_operator, need_data_operator);
	if(data_operator != undefined) {
		initOperator(data_operator);
	}

	//�ӿ�·�������࣬ɸѡ--��ʼ����Ʒ��Ĭ��--���£�type�գ�parameter_id�գ�
	//search_type-->1.����,2.����,3.�۸���С����,4.�۸��ɴ�С,5.������С����,6.�����ɴ�С
	//type-->a.����,b.Ʒ��,c.��Ӫ��
	//parameter_id-->ѡ��Ĳ���id
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
		//��������
		var shop_name = data.shop_name;
		$("#shop_name").text(shop_name);
		//���̵ȼ�
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
		//��Ʒ����
		var shop_goods = data.shop_goods;
		$("#product_score").text(shop_goods);
		//��������
		var shop_delivery = data.shop_delivery;
		$("#distribution_score").text(shop_delivery);
		//��������
		var shop_service = data.shop_service;
		$("#server_score").text(shop_service);
		//���������
		var shop_satisfaction = data.shop_satisfaction;
		$("#satisfaction_degree_score").text(shop_satisfaction);
		//�Ƿ��ղ�(-1 ���ղ�1δ�ղ�)
		var shop_collection_flag = data.shop_collection_flag;
		//����
		var distance = data.distance;
		$("#location_area_id").text(distance);
		//���̵�ַ
		var shop_address = data.shop_address;
		$("#specific_locations_container_p").text(shop_address);
		//���̵绰
		var shop_mobile = data.shop_mobile;
		$(".specific_locations_container_tel").attr("id", shop_mobile);
		//������Ƭѭ��
		$.each(data.shoppicture, function(index, getdata) {
			//������Ƭ
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
			//ӪҵԱ��Ƭ
			var customer_picture = getdata.customer_picture;
			//ӪҵԱid
			var assistant_id = getdata.assistant_id;
			//ӪҵԱ����
			var customer_name = getdata.customer_name;
			//ӪҵԱ��˿����
			var fans_total = getdata.fans_total;
			//��������
			var note_like_total = getdata.note_like_total;
			//�Ƿ񱻵���
			//�ղ�����
			var note_collection_total = getdata.note_collection_total;
			//�Ƿ��ղ�

			var needString = '<div class="swiper-slide">' +
				'<div class="shop_master_container">' +
				'<img class="shop_master_pic" src="' + customer_picture + '"/>' +
				'<div class="shop_master_msg">' +
				'<div class="master_name_fans">' +
				'<div class="master_name">' + customer_name + '</div>' +
				'<div class="blue_dot"></div>' +
				'<div class="master_fans">' + fans_total + '��˿</div>' +
				'</div>' +
				'<div class="zan_collection">' +
				'<img class="master_zan_pic" src="img/zan_btn@2x.png"/>' +
				'<div class="master_zan_nums">' + note_like_total + '</div>' +
				'<img class="master_collection_pic" src="img/star_comment_no.png"/>' +
				'<div class="master_collection_nums">' + note_collection_total + '</div>' +
				'</div>' +
				'</div>' +
				'<div class="master_check_check">+&nbsp;����</div>' +
				'</div>' +
				'</div>';
			$(needString).appendTo("#assistant_swiper_container");
		});
		//���̴����ֲ�
		loadSwiper("swiper-container1", "swiper-pagination2");
	}

	function initThree(data) {
		var notesNUm = 0;
		$.each(data.noteinfo, function(index, getdata) {
			notesNUm = index+1;
			//�ʼ���Ƭ
			var picture_url = getdata.picture_url;
			var picture_url2x = getDifferencePic(picture_url, "2x_");
			var picture_url3x = getDifferencePic(picture_url, "3x_");
			//�ʼ�����
			var note_name = getdata.note_name;
			//�ʼ�id
			var note_id = getdata.note_id;
			//ӪҵԱid
			var assistant_id = getdata.assistant_id;
			//ӪҵԱ��Ƭ
			var customer_picture = getdata.customer_picture;
			//ӪҵԱ����
			var customer_name = getdata.customer_name;
			//��������
			var note_like_total = getdata.note_like_total;
			//�Ƿ����(-1�ѵ��ޣ�1δ����)
			var note_like_flag = getdata.note_like_flag;
			//�Ƿ�����Ƶ��0û��1�У�
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
			//��Ʒid
			var product_id = getdata.product_id;
			//��ƷͼƬ
			var picture_url = getdata.picture_url;
			var picture_url2x = getDifferencePic(picture_url, "2x_");
			var picture_url3x = getDifferencePic(picture_url, "3x_");
			//��Ʒ����
			var product_name = getdata.product_name;
			//��Ʒ�۸�
			var product_price = getdata.product_price;
			var needString = '<div class="hot_sale_exhibition">' +
				'<img class="hot_sale_img" src="' + picture_url2x + '" srcset="' + picture_url2x + ' 2x,' + picture_url2x + ' 3x"/>' +
				'<div class="hot_product_des">' + product_name + '</div>' +
				'<div class="hot_red_price">��' + product_price + '</div>' +
				'</div>';
			$(needString).appendTo("#hot_sale_product_container");
		});
		var setHotProWidth=2.8 * hotProductNum;
		$("#hot_sale_product_container").css("width",setHotProWidth+"rem");
	}

	function initClassification(data) {
		var needString = "";
		$.each(data.categoryinfo, function(index, getdata) {
			//����id
			var category_id = getdata.category_id;
			//��������
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
			//Ʒ��id
			var brand_id = getdata.brand_id;
			//Ʒ������
			var brand_name = getdata.brand_name;
			//Ʒ����Ƭ
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
			//��Ӫ��id
			var supplier_id = getdata.supplier_id;
			//��Ӫ������
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
		//�������
		$(".searching_product_left_container").empty();
		$(".searching_product_right_container").empty();
		
		$.each(data.goodsinfo, function(index, getdata) {
			//��Ʒid
			var product_id = getdata.product_id;
			//��Ʒ��Ƭ
			var picture_url = getdata.picture_url;
			var picture_url2x = getDifferencePic(picture_url, "2x_");
			var picture_url3x = getDifferencePic(picture_url, "3x_");
			//��Ʒ����
			var product_name = getdata.product_name;
			//��Ʒ�۸�
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
				'<div class="searching_container_product_price_new">��' + product_price + '</div>' +
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