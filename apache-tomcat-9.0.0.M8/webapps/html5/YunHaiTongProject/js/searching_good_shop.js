(function($, document) {
	//接口路径
	var urlPath_one = "mrsyg/kqgoods/GoodShop.form";
	var need_data = {
		"longitude": "",
		"latitude": "",
		"city_code": "",
		"pag_no": "",
		"pag_num": ""
	};
	var data_one = myAjax(urlPath_one, need_data);
	if(data_one != undefined) {
		init(data_one);
	}

	function init(data) {
		$.each(data.shopinfo, function(index, getData) {
			//店铺图片2x
			var shop_picture = getData.shop_picture;
			//店铺图片3x
			//店铺名称
			var shop_name = getData.shop_name;
			//店铺评分
			var shop_grade = getData.shop_grade;
			var red_starts = "";
			var gray_starts = "";
			for(var i = 0; i < shop_grade; i++) {
				red_starts = red_starts + '<div class="start_nor start_sel"></div>';
			}
			for(var i = 0; i < 5 - shop_grade; i++) {
				gray_starts = gray_starts + '<div class="start_nor"></div>';
			}
			//店铺地址
			var shop_address = getData.shop_address;
			//距离店铺多远
			var distance = getData.distance;
			//店铺编号
			var shop_id = getData.shop_id;
			var firstString = '<div class="one_shop_container">' +
				'<div class="searching_shop_container">' +
				'<img class="searching_shop_container_img" src="img/searching_good_shop/shop_pic@2x.png" srcset="img/searching_good_shop/shop_pic@2x.png 2x,img/searching_good_shop/shop_pic@3x.png 3x"/>' +
				'</div>' +
				'<div class="searching_shop_name_container">' +
				'<div class="searching_shop_name">' + shop_name + '</div>' +
				'<div class="comment_start_box">' + red_starts + gray_starts '</div>' +
				'<div class="score"><span>' + shop_grade + '</span></div>' +
				'</div>' +
				'<div class="serching_shop_adviser clear">' +
				'<img class="location_img" src="img/receiver_address@2x.png" srcset="img/receiver_address@2x.png 2x, img/receiver_address@3x.png 3x"/>' +
				'<div class="location_text">' +
				'<span>' + shop_address + '</span>' +
				'</div>' +
				'<div class="location_area">' +
				'<span>' + distance + '</span>' +
				'</div>' +
				'</div>' +
				'<div class="line_bend">' +
				'<img class="line_bend_img" src="img/line_one.png"/>' +
				'</div>';
			var assistantSting = "";
			$.each(getData.assistantinfo, function(index, getData) {
				//营业员头像
				var customer_picture = getData.customer_picture;
				//营业员id
				var asisstant_id = getData.asisstant_id;
				//营业员名称
				var customer_name = getData.customer_name;
				//营业员粉丝数量
				var fans_total = getData.fans_total;
				//云信accid
				var im_uuid = getData.im_uuid;
				assistantSting = assistantSting + '<div class="reds_message">' +
					'<div class="reds_headpor">' +
					'<img class="customer-icon" src="'++customer_picture '">' +
					'</div>' +
					'<div class="reds_name">' + customer_name + '</div>' +
					'<div class="reds_fans_num">已有' + fans_total + '位粉丝</div>' +
					'<div class="reds_chat" id="' + asisstant_id + '">' +
					'<p class="reds_chat_p">+&nbsp;聊聊</p>' +
					'</div>' +
					'</div>';
			});
			var secondString = '<div class="advister_container">' +
				'<div class="second_part">' + assistantSting +
				'</div>' +
				'</div>' +
				'</div>';
			var needString = firstString + secondString;
			$(needString).appendTo("#search_shop_container_id");
		});
	}
})(jQuery, document);