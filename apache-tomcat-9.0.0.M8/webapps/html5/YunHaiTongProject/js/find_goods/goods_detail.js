$(function() {
	//��ǰҳ��ı���
	var product_id = ""; //��Ʒid
	var productName = ""; //��Ʒ����
	var productText = ""; //��ƷĬ�ϲ���
	var productFirstPic = ""; //��Ʒ��һ��ͼƬ��url

	var im_uuid = ""; //ӪҵԱ��im_uuid;
	var customer_type = ""; //��ǰ�û����ͣ�0 ��ͨ�ͻ� 1ӪҵԱ��

	var start_time = ""; //��ʱ����ʼʱ��
	var end_time = ""; //��ʱ������ʱ��
	var now_time = ""; //��ǰʱ��

	var product_detail_id = ""; //��Ʒ����id
	var product_price = ""; //��Ʒ�۸�

	var selectedColor = ""; //��ѡ�е���ɫid 
	var selectedMemory = ""; //��ѡ�е��ڴ�����id
	var selectedVersion = ""; //��ѡ�е���Ӫ��id
	var selectedContract = ""; //��ѡ�е��ײ�id
	var buyNum = 1; //Ĭ�Ϲ�������Ϊ1

	var request = new queryString();
	if(request["jump_product_id"]) {
		product_id = request["jump_product_id"];
		console.log("��Ʒ���飬url=" + location.href);
		console.log("��Ʒ���飬product_id=" + product_id);
	} else {
		product_id = "4";
	}
	if(request["start_time"]) {
		start_time = request["start_time"];
		console.log("��Ʒ���飬start_time=" + start_time);
	}
	if(request["end_time"]) {
		end_time = request["end_time"];
		console.log("��Ʒ���飬end_time=" + end_time);
	}

	//ҳ���������ʾҳ�浼����
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

	//ҳ�浼����λ�¼�
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

	//�鿴��Ʒ��Ƶ�¼�����ת��Ʒ��Ƶ�б�
	$('.goods-video').click(function(e) {
		alert('�鿴��Ʒ��Ƶʱ�䣬��ת��Ʒ��Ƶ�б�');
	});

	//�鿴��Ʒ���е������б�
	$(".view-all-comment").click(function(e) {
		alert('�鿴��Ʒ���е������б�');
	});

	//�鿴��Ʒ���еıʼ��б�
	$(".view-all-notes").click(function(e) {
		alert('�鿴��Ʒ���еıʼ��б�');
	});

	//�鿴ĳ����Ʒ�ʼ��������
	$(".goods-notes-contents").on("click", ".goods-note-item", function() {
		//��õ�ǰ�ʼǵ�id
		var noteId = $(this).attr("id");
		//�����Ƶ���
		var noteFlag = $(this).attr("noteFlag");
		alert("��Ʒ����ҳnoteId=" + noteId + ",noteFlag=" + noteFlag);
		native.openView("kechuang.mr.com.kcjh.activity.details.AiDaRenDetailActivity");
	});

	//ͼ�Ľ�������Ʒ����tabBar�л��¼�
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

	//����ҳ�涥��
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

	//���빺�ﳵ1/1/4.00/1
	//mrsyg/kqgoods/AddCart.form?product_detail_id=1&product_number=1&product_price=4.00&contract_id=1
	$('.join-cart').click(function(e) {
		if(customer_type == 0) {
			//�ӿ�·�������빺����
			var urlPath_addCar = "mrsyg/kqgoods/AddCart.form";
			var need_data_addCar = {
				"product_detail_id": product_detail_id,
				"product_number": "1",
				"product_price": product_price,
				"contract_id": selectedContract
			};
			var data_addCar = myAjax(urlPath_addCar, need_data_addCar);
			if(data_addCar != undefined) {
				alert("���빺�ﳵ�ɹ�");
			}
		} else {
			alert("����ӪҵԱ�����ܹ�����Ʒ");
		}
	});

	//��������(���ߵ����ѡ������İ�ť)��ʾ��Ʒ���ֲ�������
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
			alert("����ӪҵԱ�����ܹ�����Ʒ");
		}
	});
	//����հ״���������Ʒ���ֲ�������
	$('.backdrop').click(function(e) {
		$('.place-order-container').hide();
		$('.backdrop').hide();
		$('.goods-detail-hearder-bar').css({
			'zIndex': '1030'
		});
		$("body").off("touchmove");
	});

	//������������
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

	//ѡ����Ʒ���ֲ������ͣ�cannot_selected���ܱ�ѡ�У�selectedѡ�У�
	$(".goods-other-params").on("click", ".param-cate", function() {
		//���β���û��cannot_selected��ʱ���ſ��Ա�ѡ��
		if(!$(this).hasClass("cannot_selected")) {
			//�ж�ѡ�е���ʲô���͵Ĳ�������ɫ����������Ӫ�̣��ײͣ�
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
			//�ӿ�·����ѡ����Ʒ����--��ɫ���������汾���ײͣ�
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
			alert("�˲�������ѡ");
		}

	});

	//ѡ����Ʒ�����������еġ�ȷ��������ת��ȷ�϶�������
	$('.go-place-order').click(function(e) {
		//�ӿ�·������ȡ�ײ�ID����Ʒ����id��ѡ��Ĳ�������
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
			//��Ʒ���飨ѡ�������id
			product_detail_id = data_one_contractId.product_detail_id;
			//��Ʒ�ײ�id
			selectedContract = data_one_contractId.contract_id;
		}
		//alert('�����µ�����ת��ȷ�϶�������');
		var needData = "product_detail_id=" + product_detail_id + "&product_number=" + buyNum + "&contract_id=" + selectedContract;
		window.location.href = "sure_order.jsp?" + needData;
	});

	//����
	$(".goods-comment-icon").click(function(e) {
		alert("��Ʒ���飬����uuid=" + uuid);
		var needString = {
			title: productName,
			text: productText,
			imageUrl: productFirstPic,
			url: "goods_detail.jsp?jump_product_id=" + product_id,
			uuid: im_uuid
		};
		var Persion ={
			title : "ƻ��",
			text : "text",
			imageUrl : "http://tva4.sinaimg.cn/crop.1.0.638.638.1024/a026df41jw8ea72uxthh7j20hs0hqaat.jpg",
			url : "http://www.baidu.com",
			uuid :im_uuid
		}
		native.startChat(JSON.stringify(Persion));
		alert("����˧�簡")
		if(window.native != null && typeof(window.native) != "undefined") {
			//native.startChat(JSON.stringify(needString);
		}
	});

	//�ղ���Ʒ�¼�
	$('.goods-collect-icon').click(function(e) {
		if($(this).find('.iconfont').hasClass("collected")) {
			$(this).find('.iconfont').removeClass('collected');
			//ȡ���ղ�
			collectionGoodsOrNot("-1");
		} else {
			$(this).find('.iconfont').addClass('collected');
			//�ղ���Ʒ
			collectionGoodsOrNot("1");
		}
	})

	//ѡ���ջ���ַ
	$('.get-goods-address').click(function(e) {
		//alert("��ʾ�ջ���ַҳ��");
		$("#iframe_select_address").show();

		//��ѡ���ջ���ַ����ҳ��ر�ʱ����ǰҳ������ѡ����ջ���ַ����Ϣ
		$($("#iframe_select_address_id")[0].contentWindow).on("setReceiverAddress", function() {
			//�����ջ���ַ
			var selectedAddress = $("#iframe_select_address_id").contents().find("#receiver_address_content").val();
			$("#receiver_address_id").text(selectedAddress);
		});
	});

	//�ӿ�·������Ʒ������Ϣ��
	//mrsyg/kqgoods/GoodsInfo.form?product_id=4
	var urlPath_one = "mrsyg/kqgoods/GoodsInfo.form";
	var need_data = {
		"product_id": product_id
	};
	var data_one = myAjax(urlPath_one, need_data);
	if(data_one != undefined) {
		init(data_one);
	}

	//�ӿ�·�����û�ɹ����
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

	//�ӿ�·�����ʼǣ�
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

	//�ӿ�·����ͼ�Ľ��ܣ�
	//mrsyg/kqgoods/GoodsDescribe.form?product_id=4
	var urlPath_four = "mrsyg/kqgoods/GoodsDescribe.form";
	var need_data_four = {
		"product_id": product_id
	};
	var data_four = myAjax(urlPath_four, need_data_four);
	if(data_four != undefined) {
		initFour(data_four);
	}

	//�ӿ�·������Ʒ����������
	//mrsyg/kqgoods/GoodsParameter.form?product_id=4
	var urlPath_five = "mrsyg/kqgoods/GoodsParameter.form";
	var need_data_five = {
		"product_id": product_id
	};
	var data_five = myAjax(urlPath_five, need_data_five);
	if(data_five != undefined) {
		initFive(data_five);
	}

	//�ӿ�·������ʼ����Ʒ����--��ʼ������--��ɫ���������汾���ײͣ�
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
		//��ǰʱ��
		now_time = data.current_time;
		if(!end_time) {
			$(".remain-time-tip").hide();
		} else {
			//ÿ�����һ��ʱ��
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
			var timeString = upDates + "��" + upHourse + "Сʱ" + upMinutes + "��" + upSeconds +"��";
			$(".remain-time").text(timeString);
		};
		

		//�û����ͣ��ͻ����ͣ�0 ��ͨ�ͻ� 1ӪҵԱ��
		customer_type = data.customer_type;
		//�û�im_uuid(��������)
		im_uuid = data.im_uuid;
		console.log("��Ʒ����ҳim_uuid="+im_uuid);
		//��Ʒ����id
		product_detail_id = data.product_detail_id;
		//��Ʒ����
		var product_name = data.product_name;
		productName = product_name;
		$("#product_name_id").text(product_name);
		$(".goods-name").text(product_name);
		//��Ʒ�ּ�
		product_price = data.price_new;
		$("#product_new_price_id").text("��" + product_price);
		$("#pop_up_new_price").text(product_price);
		//��Ʒԭ��
		var price_old = data.price_old;
		$("#product_old_price_id").text("��" + price_old);
		$("#pop_up_old_price").text(price_old);
		//��ɫ
		var color = data.color;
		selectedColor = data.color_id;
		//�ڴ�����
		var memory_capacity = data.memory_capacity;
		selectedMemory = data.memory_id;
		//��Ӫ��
		var supplier_desc = data.supplier_desc;
		selectedVersion = data.supplier_id;
		//�ײ�
		var contract_name = data.contract_name;
		//�ײ�id
		selectedContract = data.contract_id;
		productText = color + " " + memory_capacity + " " + supplier_desc + " " + contract_name;
		$("#selected_parameter_id").text(productText);
		//��ַid
		var address_id = data.address_id;
		//�ջ�����
		var receiver_area = data.receiver_area;
		//�ջ���ַ
		var detail_address = data.detail_address;
		$("#receiver_address_id").text(receiver_area + " " + detail_address);
		//�Ƿ�����Ƶ(0û��1��)
		var video_flag = data.video_flag;
		//��Ƶ��֡��Ƭ
		var product_video_picture = data.product_video_picture;
		//��ƵURL
		var product_video = data.product_video;
		//�Ƿ��ղع�����Ʒ(-1�Ѿ����ղ�1û�б��ղ�)
		var product_collection_flag = data.product_collection_flag;
		if(product_collection_flag == "-1") {
			$(".goods-collect-icon").find(".iconfont").addClass("collected");
		}
		var firstPic = "";
		$.each(data.pictureinfo, function(index, getdata) {
			//��ȡͼƬ����
			var pic_total = getdata.length;
			//��Ʒ��Ƭ
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
		//��ƷͼƬ�ֲ�
		new Swiper('.goods-pics-container .swiper-container', {
			noSwiping: true,
			direction: 'horizontal',
			loop: true,
			speed: 300,
			autoplay: 3000,
			preventClicks: false,
			autoplayDisableOnInteraction: false,
			// �����Ҫ��ҳ��
			pagination: '.swiper-pagination',
			//��ҳ����ʽ
			paginationBulletRender: function(swiper, index, className) {
				return '<span class="' + className + '"></span>';
			}
		});

		//��ƷͼƬ��Ƶ��ͼԤ��
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

		//�ر���ƷͼƬ��Ƶ��ͼԤ������
		$('.goods-big-preview').click(function(e) {
			$('.goods-big-preview-container').hide();
			$("body").off("touchmove");
		});

	}

	function initTwo(data) {
		$.each(data.commentinfo, function(index, getdata) {
			//ɹ����Ƭ1
			var picture_one = getdata.picture_one;
			//�û�ͷ��
			var customer_picture = getdata.customer_picture;
			//�û�����
			var customer_name = getdata.customer_name;
			//�û�id
			var customer_id = getdata.customer_id;
			//�û���������
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
				'<span class="subject-jiaobiao-text">����</span>' +
				'</span>' +
				'</div>';
			$(needString).appendTo("#user_shaidan_container_id");
		});

		//��Ʒ����Ч����Ⱦ
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
			//�ʼ�ͼƬ
			var picture_url = getdata.picture_url;
			//�ʼ�����
			var note_name = getdata.note_name;
			//�ʼ�����
			var note_desc = getdata.note_desc;
			//ӪҵԱͷ��
			var customer_picture = getdata.customer_picture;
			//ӪҵԱid
			var customer_id = getdata.customer_id;
			//ӪҵԱ����
			var customer_name = getdata.customer_name;
			//�ʼǱ��
			var note_id = getdata.note_id;
			//��������
			var note_like_total = getdata.note_like_total;
			//�Ƿ񱻵��ޣ�-1�ѵ���,1δ���ޣ�
			var note_like_flag = getdata.note_like_flag;
			//�Ƿ�����Ƶ(0û��1��)
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
			//ͼ�Ľ���ͼƬpic_word_des
			var picture_url = getdata.picture_url;
			var needString = '<img src="' + picture_url + '"/>'
			$(needString).appendTo("#pic_word_des");
		});
	}

	function initFive(data) {
		$.each(data.parameterinfo, function(index, getdata) {
			//ͼƬURL
			var picture_url = getdata.picture_url;
			var needSring = '<img src="' + picture_url + '"/>';
			$(needSring).appendTo("#product_par_dse");
		});
	}

	function initSix(data) {
		//��ɫ
		$.each(data.colorinfo, function(index, getdata) {
			//��ɫid
			var color_id = getdata.color_id;
			//��ɫ����
			var color_name = getdata.color_name;
			var needString = '<span class="param-cate col-xs-3" id="' + color_id + '">' + color_name + '</span>';
			$(needString).appendTo("#color_list");
		});
		//�ڴ�
		$.each(data.memoryinfo, function(index, getdata) {
			//�ڴ�id
			var memory_id = getdata.memory_id;
			//�ڴ�����
			var memory_name = getdata.memory_name;
			var memoryString = '<span class="param-cate col-xs-3" id="' + memory_id + '">' + memory_name + '</span>';
			$(memoryString).appendTo("#memory_list");
		});
		//��Ӫ��
		$.each(data.supplierinfo, function(index, getdata) {
			//��Ӫ��id
			var supplier_id = getdata.supplier_id;
			//��Ӫ������
			var supplier_name = getdata.supplier_name;
			var supplierString = '<span class="param-cate col-xs-3" id="' + supplier_id + '">' + supplier_name + '</span>';
			$(supplierString).appendTo("#supplier_list");
		});
		//�ײ�
		$.each(data.contractinfo, function(index, getdata) {
			//�ײ�id
			var contract_id = getdata.contract_id;
			//�ײ�����
			var contract_name = getdata.contract_name;
			var contractString = '<span class="param-cate col-xs-3" id="' + contract_id + '">' + contract_name + '</span>';
			$(contractString).appendTo("#contract_list");
		});
	}

	//�ղػ���ȡ���ղ���Ʒ
	function collectionGoodsOrNot(type) {
		//�ӿ�·����type��ȡ���ղ�:-1,�ղ�:1��
		var urlPath_seven = "mrsyg/kquser/CollectionGoods.form";
		var need_data_seven = {
			"product_id": product_id,
			"type": type
		};
		var data_seven = myAjax(urlPath_seven, need_data_seven);
		if(data_seven != undefined) {
			if(type == 1) {
				alert("�ղسɹ�");
			} else if(type == -1) {
				alert("ȡ���ղسɹ�");
			}
		}
	}

	function initSelected(data) {
		//��ɫ
		$.each(data.colorinfo, function(index, getdata) {
			//��ɫid
			var color_id = getdata.color_id;
			resetSelected(color_id, "color_list");
		});
		//�ڴ�
		$.each(data.memoryinfo, function(index, getdata) {
			//�ڴ�id
			var memory_id = getdata.memory_id;
			resetSelected(memory_id, "memory_list");
		});
		//��Ӫ��
		$.each(data.supplierinfo, function(index, getdata) {
			//��Ӫ��id
			var supplier_id = getdata.supplier_id;
			resetSelected(supplier_id, "supplier_list");
		});
		//�ײ�
		$.each(data.contractinfo, function(index, getdata) {
			//�ײ�id
			var contract_id = getdata.contract_id;
			resetSelected(contract_id, "contract_list");
		});
	}
	//sonId���ؿ�ѡ��Ĳ�����id��parentId��Ӧ�����ĸ�Ԫ�ص�id
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