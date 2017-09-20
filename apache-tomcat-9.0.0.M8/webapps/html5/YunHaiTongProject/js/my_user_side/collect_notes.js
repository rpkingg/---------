$(function() {
	//����༭��ť
	$(".edit-btn").on("click",function () {
		$(".edit-btn").hide();
		$(".delete_btn").show();
		editCollectedNote();
	})

	//���ɾ����ť
	$(".delete_btn").on("click",function () {
		$(".edit-btn").show();
		$(".delete_btn").hide();
		cancleCollectedNote();
		//�ʼ�
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

		//��Ʒ
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
		//����
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
	//�ҵ�-�ղص������¼���Ĭ�ϱʼ�active
	$('.collect-nav-bar span').click(function(e) {
		//��ȡѡ�е����ͣ��ʼ�-note����Ʒ-goods������-shop��
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

	//�鿴�ʼ������¼�
	$('.note-item').click(function(e) {
		alert('��ת�鿴�ʼ�������棡');
	});
	//�鿴��Ʒ�����¼�
	$('.collect-goods-item').click(function(e) {
		alert('��ת�鿴��Ʒ������棡');
	});
	//�鿴���������¼�
	$('.collect-stores-item').click(function(e) {
		alert('��ת�鿴����������棡');
	});

	//����༭��ť(�ʼ�)
	var editCollectedNote = function() {
		$('.collect-notes-content .note-item').find('.edit-icon').show();
		$('.notes-edit-opt-nar').show();
		$('.collect-notes-content').css({
			marginBottom: '3.5rem'
		});
		//�༭ģʽ�£������ʼǵ���¼�
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
	//ȡ���༭�¼�(�ʼ�)
	var cancleCollectedNote = function() {
		$('.collect-notes-content .note-item').find('.edit-icon').hide();
		$('.notes-edit-opt-nar').hide();
		$('.collect-notes-content').css({
			marginBottom: '0'
		})
		$('.note-item').unbind("click");
		//�鿴�ʼ������¼�
		$('.note-item').click(function(e) {
			alert('��ת�鿴�ʼ�������棡');
		});
	}

	//����༭��ť����Ʒ��
	var editCollectedGoods = function() {
		$('.collect-goods-content .collect-goods-item').find('.edit-icon').show();
		$('.goods-edit-opt-nar').show();
		$('.collect-goods-content').css({
			marginBottom: '3.5rem'
		});
		//�༭ģʽ�£�������Ʒ����¼�
		if($('.collect-goods-content .collect-goods-item').find('.edit-icon').length > 0) {
			$('.collect-goods-item').unbind("click");
			$('.collect-goods-item').click(function(e) {
				$(this).find('.iconfont').removeClass('icon-quan');
				$(this).find('.iconfont').addClass('icon-xuanzedui');
			})
		}
	}
	//ȡ���༭�¼�����Ʒ��
	var cancleCollectedGoods = function() {
		$('.collect-goods-content .collect-goods-item').find('.edit-icon').hide();
		$('.goods-edit-opt-nar').hide();
		$('.collect-goods-content').css({
			marginBottom: '0'
		})
		$('.collect-goods-item').unbind("click");
		//�鿴��Ʒ�����¼�
		$('.collect-goods-item').click(function(e) {
			alert('��ת�鿴��Ʒ������棡');
		});
	}

	//����༭��ť�����̣�
	var editCollectedStores = function() {
		$('.collect-stores-content .collect-stores-item').find('.edit-icon').show();
		$('.stores-edit-opt-nar').show();
		$('.collect-stores-content').css({
			marginBottom: '3.5rem'
		});
		//�༭ģʽ�£��������̵���¼�
		if($('.collect-stores-content .collect-stores-item').find('.edit-icon').length > 0) {
			$('.collect-stores-item').unbind("click");
			$('.collect-stores-item').click(function(e) {
				$(this).find('.iconfont').removeClass('icon-quan');
				$(this).find('.iconfont').addClass('icon-xuanzedui');
			})
		}
	}
	//ȡ���༭�¼������̣�
	var cancleCollectedStores = function() {
		$('.collect-stores-content .collect-stores-item').find('.edit-icon').hide();
		$('.stores-edit-opt-nar').hide();
		$('.collect-stores-content').css({
			marginBottom: '0'
		})
		$('.collect-stores-item').unbind("click");
		//�鿴���������¼�
		$('.collect-stores-item').click(function(e) {
			alert('��ת�鿴����������棡');
		});
	}

	//ģ��༭��ȡ���༭�¼���ʵ�ʿ�����ɾ��
	/*setTimeout(function() {
		editCollectedNote();
	}, 3000)

	setTimeout(function() {
		cancleCollectedNote();
	}, 8000)*/

	//����ɾ���ղصıʼ�
	$('.notes-edit-opt-nar').click(function(e) {
		alert('����ɾ���ղصıʼ�!')
	});
	//����ɾ���ղص���Ʒ
	$('.goods-edit-opt-nar').click(function(e) {
		alert('����ɾ���ղص���Ʒ!')
	});
	//����ɾ���ղصĵ���
	$('.stores-edit-opt-nar').click(function(e) {
		alert('����ɾ���ղصĵ���!')
	});

	//�ӿ�·�����ղص�-�ʼǣ�
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

	//�ӿ�·�����ղص�-��Ʒ��
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

	//�ӿ�·�����ղص�-���̣�
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
		//�ղرʼ�����
		var col_note_total = datas.col_note_total;
		//�ղ���Ʒ����
		var col_goods_total = datas.col_goods_total;
		//�ղص�������
		var col_shop_total = datas.col_shop_total;
		$("#node_num").text(col_note_total);
		$("#goods_num").text(col_goods_total);
		$("#shop_num").text(col_shop_total);
		$.each(datas.data, function(index, getdata) {
			//�ʼ�id
			var note_id = getdata.note_id;
			//�ʼ���Ƭ
			var picture_url = getdata.picture_url;
			//�ʼ�����
			var note_name = getdata.note_name;
			//�ʼ�����
			//�ʼǷ���ʱ��
			var created_at = getdata.created_at;
			var needString = '<div class="note-item col-xs-12" id="' + note_id + '">' +
				'<div class="note-cover col-xs-12">' +
				'<img src="' + picture_url + '"/>' +
				'</div>' +
				'<span class="note-title col-xs-12 text-left">' + note_name + '</span>' +
				'<span class="note-intro-text col-xs-12 text-left">�ԴӺ�ɫ�ر���ֻ����к��Ҷ����й���ò�ƻ�����</span>' +
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
			//��Ʒid
			var product_id = getdata.product_id;
			//��ƷͼƬ
			var picture_url = getdata.picture_url;
			//��Ʒ����
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
			//����id
			var shop_id = getdata.shop_id;
			//��������
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