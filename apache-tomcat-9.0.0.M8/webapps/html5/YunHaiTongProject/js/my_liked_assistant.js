(function($, document) {
	//点赞
	$('.liked_item_box_img').bind('click', function() {
		if($(this).hasClass("liked")) {
			$(this).removeClass("liked");
		} else {
			$(this).addClass("liked");
		}
	});

	//接口路径（我的点赞--初始化页面）
	var urlPath_one = "mrsyg/kqgoods/AssistantLike.form";
	var need_data = {
		"pag_no": "1",
		"pag_num": "100"
	};
	var data_one = myAjax(urlPath_one, need_data);
	if(data_one != undefined) {
		init(data_one);
	}

	function init(datas) {
		//清空数据
		$("#my_liked_container").empty();
		$.each(datas.data, function(index, getdata) {
			//笔记名称
			var note_name = getdata.note_name;
			//笔记id
			var note_id = getdata.note_id;
			//点赞数量
			var note_like_total = getdata.note_like_total;
			var needString = '<div class="liked_item_box" id="' + note_id + '">' +
				'<p class="liked_item_box_p">' + note_name + '</p>' +
				'<div class="liked_item_box_img"></div>' +
				'<span class="liked_item_box_span">' + note_like_total + '</span>' +
				'</div>';
			$(needString).appendTo("#my_liked_container");	
		});
	}

})(jQuery, document);