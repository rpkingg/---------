$(function() {
	//��ǰҳ��ı���
	var product_id = ""; //��Ʒid
	var productName = ""; //��Ʒ����
	var productText = ""; //��ƷĬ�ϲ���
	var productFirstPic = ""; //��Ʒ��һ��ͼƬ��url

	var im_uuid = ""; //ӪҵԱ��im_uuid;
	var customer_type = ""; //��ǰ�û����ͣ�0 ��ͨ�ͻ� 1ӪҵԱ��
	var note_id = ""; //�ʼ�id

	var start_time = ""; //��ʱ����ʼʱ��
	var end_time = ""; //��ʱ������ʱ��
	var now_time = ""; //��ǰʱ��

	var product_price = ""; //��Ʒ�۸�

	//��ʼ����Ʒ����id
	var initProductDetailId = ""; //��ʼ����Ʒ��������id

	//��ʼ����Ʒ����
	var initColorName = ""; //��ʼ����Ʒ��ɫ
	var initColorId = ""; //��ʼ����ɫid
	var initMemoryNmae = ""; //��ʼ����Ʒ����
	var initMemoryId = ""; //��ʼ������id
	var initSupplierName = ""; //��ʼ����Ʒ��Ӫ��
	var initSupplierId = ""; //��ʼ����Ӫ��id
	var initContractNmae = ""; //��ʼ����Ʒ�ײ�
	var initContractId = ""; //��ʼ���ײ�id
	//ѡ�����Ʒ����
	var selectedColorName = ""; //ѡ�����Ʒ��ɫ
	var selectedColorId = ""; //ѡ�����ɫid
	var selectedMemoryNmae = ""; //ѡ�����Ʒ����
	var selectedMemoryId = ""; //ѡ�������id
	var selectedSupplierName = ""; //ѡ�����Ʒ��Ӫ��
	var selectedSupplierId = ""; //ѡ�����Ӫ��id
	var selectedContractNmae = ""; //ѡ�����Ʒ�ײ�
	var selectedContractId = ""; //ѡ����ײ�id

	var buyFlag = ""; //����buyNow�����߼����繺�ﳵ(jionCart)��������ѡ�����������
	var buyNum = 1; //Ĭ�Ϲ�������Ϊ1

	var request = new queryString();
	if(request["jump_product_id"]) {
		product_id = request["jump_product_id"];
		$(".goods-pics-container").attr("id", product_id);
		console.log("��Ʒ���飬url=" + location.href);
	}
	if(request["jump_product_id"]) {
		note_id = request["jump_note_id"];
		console.log("�ӱʼǽ��룬url=" + location.href);
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

	//�ӿ�·������Ʒ������Ϣ��
	//mrsyg/kqgoods/GoodsInfo.form?product_id=4
	var urlPath_one = "mrsyg/kqgoods/GoodsInfo.form";
	var need_data = {
		"product_id": product_id
	};
	var data_one = myAjax(urlPath_one, need_data);
	if(typeof(data_one) != "undefined") {
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
	if(typeof(data_two) != "undefined" && data_two.hasOwnProperty("commentinfo")) {
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
	if(typeof(data_three) != "undefined" && data_three.hasOwnProperty("noteinfo")) {
		initThree(data_three);
	}

	//�ӿ�·����ͼ�Ľ��ܣ�
	//mrsyg/kqgoods/GoodsDescribe.form?product_id=4
	var urlPath_four = "mrsyg/kqgoods/GoodsDescribe.form";
	var need_data_four = {
		"product_id": product_id
	};
	var data_four = myAjax(urlPath_four, need_data_four);
	if(typeof(data_four) != "undefined" && data_four.hasOwnProperty("describeinfo")) {
		initFour(data_four);
	}

	//�ӿ�·������Ʒ����������
	//mrsyg/kqgoods/GoodsParameter.form?product_id=4
	var urlPath_five = "mrsyg/kqgoods/GoodsParameter.form";
	var need_data_five = {
		"product_id": product_id
	};
	var data_five = myAjax(urlPath_five, need_data_five);
	if(typeof(data_five) != "undefined" && data_five.hasOwnProperty("parameterinfo")) {
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
	if(typeof(data_six) != "undefined") {
		initSix(data_six);
	}

	function init(data) {
		//��ǰʱ��
		now_time = data.current_time;
		//��ʼʱ��
		start_time = data.start_time;
		//����ʱ��
		end_time = data.end_time;
		var shijiancha = "";
		if(!end_time && end_time.length == 0) {
			$(".remain-time-tip").hide();
		} else {
			//ÿ�����һ��ʱ��
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
			var timeString = days + "��" + hours + "Сʱ " + minutes + "����" + seconds + "��";
			$(".remain-time").text("�������ʣ" + timeString);
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
			var timeString = upDates + "��" + upHourse + "Сʱ" + upMinutes + "��" + upSeconds + "��";
			$(".remain-time").text(timeString);
		}

		//�û����ͣ��ͻ����ͣ�0 ��ͨ�ͻ� 1ӪҵԱ��
		customer_type = data.customer_type;
		//�û�im_uuid(��������)
		im_uuid = data.im_uuid;
		console.log("��Ʒ����ҳim_uuid=" + im_uuid);
		//��Ʒ����id
		initProductDetailId = data.product_detail_id;
		//��Ʒ����
		var product_name = data.product_name;
		productName = product_name;
		$("#product_name_id").text(productName);
		$(".goods-name").text(productName);
		//��Ʒ�ּ�
		product_price = data.price_new;
		$("#product_new_price_id").text("��" + product_price);
		$("#pop_up_new_price").text(product_price);
		//��Ʒԭ��
		var price_old = data.price_old;
		$("#product_old_price_id").text("��" + price_old);
		$("#pop_up_old_price").text(price_old);

		//��ɫ
		initColorName = data.color;
		initColorId = data.color_id;
		//�ڴ�����
		initMemoryNmae = data.memory_capacity;
		initMemoryId = data.memory_id;
		//��Ӫ��
		initSupplierName = data.supplier_desc;
		initSupplierId = data.supplier_id;
		//�ײ�
		initContractNmae = data.contract_name;
		initContractId = data.contract_id;
		console.log("��Ʒ����idproduct_detail_id=" + initProductDetailId + "���ײ�id=" + initContractId);
		productText = initColorName + " " + initMemoryNmae + " " + initSupplierName + " " + initContractNmae;
		console.log("��ʼ������id=" + initColorId + "--" + initMemoryId + "--" + initSupplierId + "--" + initContractId);
		console.log("��ʼ����Ʒ����=" + productText);
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
		var picturesTotal = 0;//��ȡͼƬ����
		$.each(data.pictureinfo, function(index, getdata) {
			//��ȡͼƬ����
			picturesTotal = getdata.length;
			//��Ʒ��Ƭ
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
		//��ƷͼƬ�ֲ�
		new Swiper('.goods-pics-container .swiper-container', {
			noSwiping: false, //false�����ֶ��϶�
			direction: 'horizontal',
			loop: true,
			speed: 1000,
			autoplay: 3000,
			preventClicks: false,
			autoplayDisableOnInteraction: false, //false��ʹ�ֶ��϶�Ҳ���Զ��ֲ�

			// �����Ҫ��ҳ��
			pagination: '.swiper-pagination',
			//��ҳ����ʽ
			paginationBulletRender: function(swiper, index, className) {
				return '<span class="' + className + '"></span>';
			}
		});

		//��ƷͼƬ����
		var firstPicBig = "";
		var pic_total = 0; //��ȡͼƬ����
		$.each(data.pictureinfo, function(index, getdata) {
			//��ȡͼƬ����
			pic_total = getdata.length;
			//��Ʒ��Ƭ
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

		//��ƷͼƬ��Ƶ��ͼԤ��
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

		//�ر���ƷͼƬ��Ƶ��ͼԤ������
		$('.goods-big-preview').click(function(e) {
			$('.goods-big-preview-container').hide();
			$("body").off("touchmove");
		});

	}

	function initTwo(data) {
		//��ʾ�û�ɹ��
		$(".goods-comment-container").show();
		// ��Ʒ����
		$.each(data.commentinfo, function(index, getdata) {
			//ɹ����Ƭ1
			var picture_one = getdata.picture_one;
			var commentPic = "";
			if(picture_one) {
				commentPic = '<div class="comment-pic col-xs-4">' +
					'<img class="comment-pic-height" src="' + picture_one + '">' +
					'</div>';
			}
			//�û�ͷ��
			var customer_picture = getdata.customer_picture;
			//�û�����
			var customer_name = getdata.customer_name;
			//�û�id
			var customer_id = getdata.customer_id;
			//�û���������
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
		$(".goods-comment-tip-container").show();
		$.each(data.noteinfo, function(index, getdata) {
			//�ʼ�ͼƬ
			var picture_url = getdata.picture_url;
			//�ʼ�����
			var note_name = getdata.note_name;
			note_name = decodeURI(note_name);
			//�ʼ�����
			var note_desc = getdata.note_desc;
			note_desc = decodeURI(note_desc);
			//ӪҵԱͷ��
			var customer_picture = getdata.customer_picture;
			//ӪҵԱid
			var assistant_id = getdata.assistant_id;
			//ӪҵԱ����
			var customer_name = getdata.customer_name;
			//�ʼǱ��
			var note_id = getdata.note_id;
			//��������
			var note_like_total = getdata.note_like_total;
			//�Ƿ񱻵��ޣ�-1�ѵ���,1δ���ޣ�
			var note_like_flag = getdata.note_like_flag;
			var likeClass = "";
			if(note_like_flag == "-1") {
				likeClass = "icon-dianzan";
			} else if(note_like_flag == "1") {
				likeClass = "icon-dianzan1";
			}
			//�Ƿ�����Ƶ(0û��1��)
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
			color_name = color_name.trim();
			var needString = "";
			if(color_name == initColorName.trim()) {
				needString = '<span class="param-cate col-xs-3 selected initdata" id="' + color_id + '">' + color_name + '</span>';
			} else {
				needString = '<span class="param-cate col-xs-3" id="' + color_id + '">' + color_name + '</span>';
			}
			$(needString).appendTo("#color_list");
		});
		//�ڴ�
		$.each(data.memoryinfo, function(index, getdata) {
			//�ڴ�id
			var memory_id = getdata.memory_id;
			//�ڴ�����
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
		//��Ӫ��
		$.each(data.supplierinfo, function(index, getdata) {
			//��Ӫ��id
			var supplier_id = getdata.supplier_id;
			//��Ӫ������
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
		//�ײ�
		$.each(data.contractinfo, function(index, getdata) {
			//�ײ�id
			var contract_id = getdata.contract_id;
			//�ײ�����
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

	//�ղػ���ȡ���ղ���Ʒ
	function collectionGoodsOrNot(type) {
		var returnFlag = "";
		//�ӿ�·����type��ȡ���ղ�:-1,�ղ�:1��
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

	//�鿴��Ʒ��Ƶ�¼�����ת��Ʒ��Ƶ�б�
	$('.goods-video').click(function(e) {
		alert('�鿴��Ʒ��Ƶʱ�䣬��ת��Ʒ��Ƶ�б�');
	});

	//�û�ɹ����ȫ����
	$("#view-all-comment ,.goods-comment-item").click(function(e) {
		//��ת���û�ɹ����ȫ����ҳ��
		native.openWebView("all_evaluation_goods.jsp?jump_product_id=" + product_id);
	});

	//�û��ʼǣ�ȫ����
	$("#view-all-notes").click(function(e) {
		//alert('�鿴��Ʒ���еıʼ��б�');
		native.openWebView("note_list.jsp?jump_product_id=" + product_id);
	});

	//�ʼ��������
	$("#goods-notes-contents").on("click", ".goods-note-item .note-pic", function() {
		//��õ�ǰ�ʼǵ�id
		var noteId = $(this).parent().attr("id");
		native.openView(noteId);
	});
	//�ʼǵ���
	$("#goods-notes-contents").on("click", ".goods-note-like", function() {
		//��õ�ǰ�ʼǵ�id
		var noteId = $(this).parents(".goods-note-item").attr("id");
		console.log("�ʼ�id=" + noteId);
		if($(this).find(".iconfont").hasClass("icon-dianzan")) {
			//ȡ������
			$(this).find(".iconfont").removeClass("icon-dianzan");
			$(this).find(".iconfont").addClass("icon-dianzan1");
		} else {
			//ȡ������
			$(this).find(".iconfont").removeClass("icon-dianzan1");
			$(this).find(".iconfont").addClass("icon-dianzan");
		}

		var likeTotal = likeNoteOrNot(noteId);
		console.log("�ʼǵ�������likeTotal=" + likeTotal);
		$(this).find(".like-num").text(likeTotal);
	});
	//����ʼ���ӪҵԱͷ����ת��ӪҵԱҳ��
	$("#notes_left_container_id,#notes_right_container_id").on("click", ".comment-user-face", function() {
		//���ӪҵԱid
		var assistantId = $(this).attr("id");
		console.log("ӪҵԱid=" + assistantId);
		window.location.href = "adviser_personal_data.jsp?jump_assistant_id=" + assistantId;
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

	//���빺�ﳵ
	$('.join-cart').click(function(e) {
		console.log("���빺�ﳵ");
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
			popHtml("����ӪҵԱ�����ܹ�����Ʒ");
		}
	});

	//��������(���ߵ����ѡ������İ�ť)��ʾ��Ʒ���ֲ�������
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
			popHtml("����ӪҵԱ�����ܹ�����Ʒ");
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

		$(this).siblings('span').removeClass('selected');
		$(this).addClass('selected');

		//�ж�ѡ�е���ʲô���͵Ĳ�������ɫ����������Ӫ�̣��ײͣ�
		var selectedId = $(this).parent().attr("id");
		var selectedContentID = $(this).attr("id"); //����id
		var selectedName = $(this).text(); //ѡ�еĲ�������

		//����id
		selectedColorId = initColorId;
		selectedMemoryId = initMemoryId;
		selectedSupplierId = initSupplierId;
		selectedContractId = initContractId;

		//��������
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
		//����id
		initColorId = selectedColorId;
		initMemoryId = selectedMemoryId;
		initSupplierId = selectedSupplierId;
		initContractId = selectedContractId;

		//��������
		initColorName = selectedColorName;
		initMemoryNmae = selectedMemoryNmae;
		initSupplierName = selectedSupplierName;
		initContractNmae = selectedContractNmae;

		//�ӿ�·����ѡ����Ʒ����--��ɫ���������汾���ײͣ�
		var urlPath_selected = "mrsyg/kqgoods/SelectParameter.form";
		var need_data_selected = {
			"product_id": product_id,
			"color_id": selectedColorId,
			"memory_id": selectedMemoryId,
			"supplier_id": selectedSupplierId,
			"contract_id": selectedContractId
		};
		console.log("ѡ����Ʒ������selectedColorId=" + initColorId + ",selectedMemoryId=" + initMemoryId + ",initSupplierId=" + initSupplierId + ",initContractId=" + initContractId + "��product_id=" + product_id);
		var data_selected = myAjax(urlPath_selected, need_data_selected);
		if(data_selected != undefined) {
			//�����Ʒ�۸�
			product_price = data_selected.product_price;

			//$(this).siblings('span').removeClass('selected');
			//$(this).addClass('selected');

			initColorId = selectedColorId;
			initMemoryId = selectedMemoryId;
			initSupplierId = selectedSupplierId;
			initContractId = selectedContractId;

			var productParameter = initColorName + " " + initMemoryNmae + " " + initSupplierName + " " + initContractNmae;
			//������Ʒ�۸�
			$("#pop_up_new_price").text(product_price); //��������
			$("#product_new_price_id").text(product_price); //��Ʒ��ͼ����ļ۸�
			$("#selected_parameter_id").text(productParameter);
		} else {
			popHtml(initColorName + " " + initMemoryNmae + " " + initSupplierName + " " + initContractNmae + "  " + "û������ֻ�");
		}
	});

	//ѡ����Ʒ�����������еġ�ȷ��������ת��ȷ�϶�������
	$('.go-place-order').click(function(e) {
		//�ӿ�·������ȡ�ײ�ID����Ʒ����id��ѡ��Ĳ�������
		var urlPath_contractId = "mrsyg/kqgoods/ProductDetail.form";
		var need_data_contractId = ""; //����������Ҫ�Ĳ���
		var data_one_contractId = ""; //���������̨���صĲ���

		//�ӿ�·�������빺����
		var urlPath_addCar = "mrsyg/kqgoods/AddCart.form";
		var need_data_addCar = ""; //���빺�ﳵ��Ҫ�Ĳ���
		var data_addCar = ""; //���빺�ﳵ��̨���صĲ���

		//��������Ĭ�ϲ�����
		need_data_contractId = {
			"product_id": product_id,
			"color_id": initColorId,
			"memory_id": initMemoryId,
			"supplier_id": initSupplierId,
			"contract_id": initContractId
		};
		data_one_contractId = myAjax(urlPath_contractId, need_data_contractId);

		if(data_one_contractId != undefined) {
			//��Ʒ���飨ѡ�������id
			var returnProductDetailId = data_one_contractId.product_detail_id;
			//��Ʒ�ײ�id
			var returnSelectedContractId = data_one_contractId.contract_id;
			console.log("��Ʒ���飨ѡ�������id=" + returnProductDetailId + ",��Ʒ�ײ�id=" + returnSelectedContractId + "��buyFlag=" + buyFlag);
			if(buyFlag == "buyNow") {
				//�����µ�����ת��ȷ�϶�������;
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
					popHtml("���빺�ﳵ�ɹ�");
					//�رղ�������
					$('.place-order-container').hide();
					$('.backdrop').hide();
					$('.goods-detail-hearder-bar').css({
						'zIndex': '1030'
					});
					$("body").off("touchmove");
				}
			}
		} else {
			popHtml(initColorName + " " + initMemoryNmae + " " + initSupplierName + " " + initContractNmae + "  " + "û������ֻ�");
		}
	});

	//����
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

	//�ղ���Ʒ�¼�
	$('.goods-collect-icon').click(function(e) {
		if($(this).find('.iconfont').hasClass("collected")) {
			console.log("ȡ���ղ�");
			//ȡ���ղ�
			var flag = collectionGoodsOrNot("-1");
			if(flag == "N") {
				$(this).find('.iconfont').removeClass('collected');
				popHtml("ȡ���ղسɹ�");
			} else if(flag == "E") {
				popHtml("ȡ���ղ�ʧ��");
			}
		} else {
			console.log("�ղ�");
			//�ղ���Ʒ
			var flag = collectionGoodsOrNot("1");
			if(flag == "N") {
				$(this).find('.iconfont').addClass('collected');
				popHtml("�ղسɹ�");
			} else if(flag == "E") {
				popHtml("�ղ�ʧ��");
			}
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
