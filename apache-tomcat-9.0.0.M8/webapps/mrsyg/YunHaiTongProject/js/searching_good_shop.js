(function($, document) {

    window.scrollTo(0,0);
    var pag_no = 0;
    // 总页数
    var total_rec_num2 = 0;
    var total_rec_num1 = 100;

    // refreshData();

    function refreshData(callback) {
        pag_no = 1;
        total_rec_num2 = 0;
        loadData(true,callback);
    }

    function loadMoreData(callback) {
        loadData(false,callback);
    }

    function loadData(firstFlag, callback) {
        //接口路径
        //mrsyg/kqgoods/GoodShop.form?pag_no=1&pag_num=100
        var urlPath_one = "/mrsyg/kqgoods/GoodShop.form";
        var need_data = {
            "pag_no": pag_no,
            "pag_num": "2"
        };

        $.ajax({
            type: "post",
            url: urlPath_one,
            dataType: "json",
            contentType: "application/x-www-form-urlencoded; charset=GBK",
            data: need_data,
            cache: false,
            success: function(res) {
                console.log("mytools.js, aysncAjax:[" + urlPath_one + "], success:[" + JSON.stringify(res) + "]");
                if(res.gda.msg_typ === "N") {
                    var flag = init(res,firstFlag);
                    if( callback ) {
                        callback(flag);
                    }
                } else {
                    if( callback) {
                        callback();
                    }
                    console.log("mytools.js, aysncAjax:[" + urlPath_one + "], success:[" + JSON.stringify(res) + "]");
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                if( callback) {
                    callback();
                }
                console.error("mytools.js, aysncAjax:[" + urlPath_one + "], error:[" + jqXHR.status + ":" + textStatus + ":" + errorThrown + "]");
            }
        });
    }

    // var data_one = myAjax(urlPath_one, need_data);
	// if(data_one != undefined && data_one.hasOwnProperty("shopinfo")) {
	// 	init(data_one);
	// }

	function init(data, firstFlag) {
        if( !data.hasOwnProperty("shopinfo") ) {
            if( firstFlag ) {
                $("#search_shop_container_id").html("");
            }
            return false;
        }
        var result = "";
        if(firstFlag && data.hasOwnProperty("sum")) {
            total_rec_num1 = data.sum;
        }

		$.each(data.shopinfo, function(index, getData) {
			//店铺图片2x
			var shop_picture = getData.shop_picture;
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
			var distance = parseInt(getData.distance);
			var distance_judge = "";
            var distance_unit = "";
			console.log("distance=" + distance)
			if(distance >= 1000) {
				distance_judge = (distance / 1000).toFixed(1);
                distance_unit = "公里";
			} else {
				distance_judge = distance.toFixed(0);
                distance_unit = "米";
			}
			//店铺编号
			var shop_id = getData.shop_id;
			var firstString = '<li class="one_shop_container swiper-slide">' +
				'<div class="searching_shop_container" id="' + shop_id + '">' +
				'<img class="searching_shop_container_img" src="'+shop_picture+'" srcset=""/>' +
				'</div>' +
				'<div class="searching_shop_name_container">' +
				'<div class="searching_shop_name one_line_font">' + shop_name + '</div>' +
				'<div class="comment_start_box">' + red_starts + gray_starts + '</div>' +
				'<div class="score"><span>' + shop_grade + '</span></div>' +
				'</div>' +
				'<div class="serching_shop_adviser clear">' +
				'<img class="location_img" src="img/receiver_address@2x.png" srcset="img/receiver_address@2x.png 2x, img/receiver_address@3x.png 3x"/>' +
				'<div class="location_text">' +
				'<span class="one_line_font location_width">' + shop_address + '</span>' +
				'</div>' +
				'<div class="location_area">' +
				'<span>距你&lt;' + distance_judge + '<span class="distance_unit">'+distance_unit+'</span></span>' +
				'</div>' +
				'</div>' +
				'<div class="line_bend">' +
				'</div>';
			var assistantSting = "";
			var count = 1;
			if(getData.assistantinfo) {
				$.each(getData.assistantinfo, function(index, getData) {
					//营业员头像
					var customer_picture = getData.customer_picture;
					//营业员id
					var assistant_id = getData.assistant_id;
					//营业员名称
					var customer_name = getData.customer_name;
					//营业员粉丝数量
					var fans_total = getData.fans_total;
					//云信accid
					var assistant_focus = getData.assistant_focus_flag;
					var  assistant_Focus = "";
					if  (assistant_focus == -1){
						assistant_Focus = "已关注" ;
						var colorString = '<div class="reds_color" id="'+im_uuid+'">' +
							'<p class="reds_chat_p">'+assistant_Focus+'</p>'+
							'</div>';
					} else if(assistant_focus == 1) {
						assistant_Focus = "+ 聊聊";
						var colorString = '<div class="reds_chat" id="' + im_uuid + '">' +
							'<p class="reds_chat_p">' + assistant_Focus + '</p>' +
							'</div>';
					}
					var im_uuid = getData.im_uuid;
					count = count + 1;
					assistantSting = assistantSting + '<div class="reds_message" data-index="'+count+'" data-focus="'+assistant_focus+'" data-id="'+assistant_id+'">' +
						'<div class="reds_headpor">' +
						'<img class="customer-icon radius" src="' + customer_picture + '" id="' + assistant_id + '">' +
						'</div>' +
						'<div class="reds_name one_line_font">' + customer_name + '</div>' +
						'<div class="reds_fans_num">已有' + fans_total + '位粉丝</div>' +

						colorString +

						'</div>';
				});

			}

			var secondString = '<div class="advister_container">' +
				'<div class="second_part">' + assistantSting +
				'</div>' +
				'</div>' +
				'</li>';
			var needString = firstString + secondString;
			// $(needString).appendTo("#search_shop_container_id");
            result = result + needString;
            total_rec_num2++;
		});

        if(firstFlag) {
            $("#search_shop_container_id").html(result);
        } else {
            $("#search_shop_container_id").append(result);
        }


        //点击聊聊
        $("#search_shop_container_id").off("click").on('click', ".reds_chat", function() {

        });

		$("#search_shop_container_id").on('click', ".reds_chat", function() {
			var assistant_id = $(this).parent().attr("data-id");
			//接口路径
			//mrsyg/kquser/FocusAssistant
			var urlPath_two = "mrsyg/kquser/FocusEmployer.form";
			var need_data_focus = {
				"assistant_id": assistant_id,
				"type": 1
			};
			var data_one = myAjax(urlPath_two, need_data_focus);
			if(data_one != undefined) {
				$(this).find(".reds_chat_p").text("已关注");
				$(this).addClass("reds_color");
				$(this).removeClass("reds_chat");
				popHtml("关注成功");
			} else {
				popHtml("关注失败");
			}
		});

		//点击营业员头像，进入营业员页面
        $(".customer-icon").off("click").on('click',function () {

        });

		$(".customer-icon").on('click',function () {
			//获取营业员id，
			var assistant_id=$(this).attr("id");
			console.log("assistant_id="+assistant_id);
			native.openWebView("adviser_personal_data.jsp?jump_assistant_id="+assistant_id);
		});

        //店家店铺照片跳转到店铺详情页
        $("#search_shop_container_id").off("click").on('click', ".searching_shop_container", function() {

        });

		$("#search_shop_container_id").on('click', ".searching_shop_container", function() {
            //获取店铺id
            var shop_id = $(this).attr("id");
            native.openWebView("searching_good_shop_detail.jsp?jump_shop_id=" + shop_id);
        });

		var count_num = $(".reds_message").attr("data-index");
		if (count_num <= 3){
             $(".advister_container").addClass("advister_container_overflow");
        }

        return total_rec_num2 < total_rec_num1;
    }



    // dropload
    $('#content').dropload({
        scrollArea : window,
        autoLoad : true,
        loadUpFn : function(me){
            refreshData(function (flag) {
                console.log("refreshData, flag:" + flag);
                if(!flag) {
                    me.resetload();
                    me.noData(true);
                    me.unlock();
                    me.resetload();
                } else {
                    me.resetload();
                    me.noData(false);
                    me.unlock();
                    me.resetload();
                }

            });
        },
        loadDownFn : function(me){
            console.log("loadDownFn01");
            // if(!me.isData) {
            //     me.resetload();
            //     return;
            // }
            pag_no++;
            loadMoreData(function (flag) {
                if( !flag ) {
                    me.lock();
                    me.noData(true);
                    me.resetload();
                } else {
                    me.resetload();
                    me.noData(false);
                    // me.unlock();
                }
            });
        }
    });
})(jQuery, document);
