$(function() {        
	var request = new queryString();
	var im_uuid = 0;
	var recommend_id;
	var assistant_id = 1;
	var chat_reds_id = 0;
	var reply_total = 0;
	if(request["jump_recommend_id"]) {
		recommend_id = request["jump_recommend_id"];
		console.log("接收到的推荐红人id=" + recommend_id);
	}
	//输入框
	$('.p_input').bind('focus', function() {
		$('.your_view').hide();
	});
	$('.emotionnice').on('click', function(e) {
		$('.your_view').hide();
	});
	$(function() {
		$('.emotionnice').qqFace({

			id: 'facebox',

			assign: 'saytext',

			path: 'img/arclist/' //表情存放的路径
		});

	});

	//查看结果
	function replace_em(str) {

		str = str.replace(/\</g, '&lt;');

		str = str.replace(/\>/g, '&gt;');

		str = str.replace(/\n/g, '<br/>');

		str = str.replace(/\[em_([0-9]*)\]/g, '<img src="img/arclist/$1.png" border="0" class="dis_img"/>');

		return str;
	}

	// QQ表情插件
	(function($) {
		$.fn.qqFace = function(options) {
			var defaults = {
				id: 'facebox',
				path: 'face/',
				assign: 'content',
				tip: 'em_'
			};
			var option = $.extend(defaults, options);
			var assign = $('#' + option.assign);
			var id = option.id;
			var path = option.path;
			var tip = option.tip;
			if(assign.length <= 0) {
				console.log('缺少表情赋值对象。');
				return false;
			}

			$(this).click(function(e) {
				var strFace, labFace;
				if($('#' + id).length <= 0) {
					strFace = '<div id="' + id + '" style="position:absolute;display:none;z-index:1000;" class="qqFace">' +
						'<table border="0" cellspacing="0" cellpadding="0"><tr>';
					for(var i = 1; i <= 90; i++) {
						labFace = '[' + tip + i + ']';
						strFace += '<td><img src="' + path + i + '.png" onclick="$(\'#' + option.assign + '\').setCaret();$(\'#' + option.assign + '\').insertAtCaret(\'' + labFace + '\');" /></td>';
						if(i % 10 == 0) strFace += '</tr><tr>';
					}

					strFace += '</tr></table></div>';
				}
				$(this).parent().append(strFace);
				var offset = $(this).position();
				var top = offset.top + $(this).outerHeight();
				$('#' + id).css('top', top);
				$('#' + id).css('left', offset.left);
				$('#' + id).show();
				e.stopPropagation();

			});

			$(document).on("click", "#facebox", function() {
				$('#' + id).hide();
				$('#' + id).remove();
				var str = $("#saytext").val();
				$("#show").append(replace_em(str));
				clean();
			});
		};

		function clean() {
			$("#saytext").val("");
		}
	})(jQuery);

	jQuery.extend({
		unselectContents: function() {
			if(window.getSelection)
				window.getSelection().removeAllRanges();
			else if(document.selection)
				document.selection.empty();
		}
	});
	jQuery.fn.extend({
		selectContents: function() {
			$(this).each(function(i) {
				var node = this;
				var selection, range, doc, win;
				if((doc = node.ownerDocument) && (win = doc.defaultView) && typeof win.getSelection != 'undefined' && typeof doc.createRange != 'undefined' && (selection = window.getSelection()) && typeof selection.removeAllRanges != 'undefined') {
					range = doc.createRange();
					range.selectNode(node);
					if(i == 0) {
						selection.removeAllRanges();
					}
					selection.addRange(range);
				} else if(document.body && typeof document.body.createTextRange != 'undefined' && (range = document.body.createTextRange())) {
					range.moveToElementText(node);
					range.select();
				}
			});
		},

		setCaret: function() {
			if(!$.browser.msie) return;
			var initSetCaret = function() {
				var textObj = $(this).get(0);
				textObj.caretPos = document.selection.createRange().duplicate();
			};
			$(this).click(initSetCaret).select(initSetCaret).keyup(initSetCaret);
		},

		insertAtCaret: function(textFeildValue) {
			var textObj = $(this).get(0);
			if(document.all && textObj.createTextRange && textObj.caretPos) {
				var caretPos = textObj.caretPos;
				caretPos.text = caretPos.text.charAt(caretPos.text.length - 1) == '' ?
					textFeildValue + '' : textFeildValue;
			} else if(textObj.setSelectionRange) {
				var rangeStart = textObj.selectionStart;
				var rangeEnd = textObj.selectionEnd;
				var tempStr1 = textObj.value.substring(0, rangeStart);
				var tempStr2 = textObj.value.substring(rangeEnd);
				textObj.value = tempStr1 + textFeildValue + tempStr2;
				textObj.focus();
				var len = textFeildValue.length;
				textObj.setSelectionRange(rangeStart + len, rangeStart + len);
				textObj.blur();
			} else {
				textObj.value += textFeildValue;
			}
		}
	});

	//我的云币数量
	var urlPath_yunbi = "mrsyg/kquser/CustomerCloud.form";
	var need_data_yunbi = {};
	var data_yunbi = myAjax(urlPath_yunbi, need_data_yunbi);
	if(data_yunbi != undefined) {
		$(".total-yunbi").text(data_yunbi.cur_bal);
	}

	//接口路径：每日红人详情页——基本信息、往期红人、评论
	//http://120.76.190.223:8988/mrsyg/kqgoods/HotAssistant.form?recommend_id=1
	//http://120.76.190.223:8988/mrsyg/kqgoods/PastAssistant.form?
	//http://120.76.190.223:8988/mrsyg/kqgoods/HotComment.form?
	var urlPath_reds = "mrsyg/kqgoods/HotAssistant.form";
	var need_data_reds = {
		"recommend_id": recommend_id
	};
	var data_reds = myAjax(urlPath_reds, need_data_reds);
	if(data_reds != undefined) {
		init_reds(data_reds);
	}

	var urlPath_past = "mrsyg/kqgoods/PastAssistant.form";
	var need_data_past = {
		"recommend_id": recommend_id
	};
	var data_past = myAjax(urlPath_past, need_data_past);
	if(data_past != undefined&&data_past.hasOwnProperty("data")) {
		init_past(data_past);
	}

	var urlPath_comment = "mrsyg/kqgoods/HotComment.form";
	var need_data_comment = {
		"recommend_id": recommend_id
	};
	var data_comment = myAjax(urlPath_comment, need_data_comment);
	if(data_comment != undefined&&data_comment.hasOwnProperty("commentinfo")) {
		init_comment(data_comment);
		zanClick();
	}

	function init_reds(datas) {
		//营业员名称
		var customer_name = datas.customer_name;
		//营业员id
		assistant_id = datas.assistant_id;
		//营业员描述
		var assistant_desc = datas.assistant_desc;
		//店铺名称
		var shop_name = datas.shop_name;
		//粉丝总数
		var fans_total = datas.fans_total;
		//收藏总数
		var collection_total = datas.collection_total;
		//点赞总数
		var like_total = datas.like_total;
		//打赏总数
		var reward_total = datas.reward_total;
		//营业员照片
		var customer_picture = datas.customer_picture;
		//视频地址
		var video_url = datas.video_url;
		//视频首帧照片地址
		var picture_url = datas.picture_url;
		//营业员云信id
		var im_uuid = datas.im_uuid;
		
		$('.your_name').text(customer_name);
		$('.trade_name').text(shop_name);
		$('.fans_num').text(fans_total);
		$('.fabulous_num,#zan_amt').text(like_total);
		$('.reward_num').text(reward_total);
		$('.collection_num,#star_amt').text(collection_total);
		$('.head_img').attr('src', customer_picture);
		$('#video_id').attr('src', video_url);
		$('#video_id').attr('poster', picture_url);
		$(".reds-picture").attr('src', customer_picture);
		$('#chat_name').text(customer_name);
		$(".current-reds").attr("r_id", assistant_id);
		$(".current-reds").attr("r_pic", customer_picture);
		$(".current-reds").attr("r_name", customer_name);
	}

	function init_past(datas) {
		var headString = "";
		$.each(datas.data, function(index, getdata) {
			//营业员id
			var past_assistant_id = getdata.assistant_id;
			//营业员照片
			var customer_picture = getdata.customer_picture;
			//营业员名称
			var customer_name = getdata.customer_name;
			//云信id
			var im_uuid = getdata.im_uuid;
			//红人粉丝数量
			$('#past_reds').empty();
			if(index == 0) {
				headString += '<div class="reds_message">' +
					'<div class="reds_headpor">' +
					'<img class="customer-icon" src="' + customer_picture + '"/>' +
					'</div>' +
					'<div class="reds_name">' + customer_name + '</div>' +
					'<div class="reds_fans_num">已有125位粉丝</div>' +
					'<div class="reds_chat" a_id="' + past_assistant_id + '">' +
					'<p class="reds_chat_p chat-with-reds past-reds" r_name = "' + customer_name + '" r_pic="' + customer_picture + '" r_id="' + past_assistant_id + '">+&nbsp;聊聊</p>' +
					'</div>' +
					'</div>';
			} else if(index == 1) {
				headString += '<div class="reds_message_two">' +
					'<div class="reds_headpor_two">' +
					'<img class="customer-icon" src="' + customer_picture + '">' +
					'</div>' +
					'<div class="reds_name_two">' + customer_name + '</div>' +
					'<div class="reds_fans_num_two">已有125位粉丝</div>' +
					'<div class="reds_chat_two" a_id="' + past_assistant_id + '">' +
					'<p class="reds_chat_p chat-with-reds past-reds" r_name = "' + customer_name + '" r_pic="' + customer_picture + '" r_id="' + past_assistant_id + '">+&nbsp;聊聊</p>' +
					'</div>' +
					'</div>';
			} else if(index == 2) {
				headString += '<div class="reds_message_three">' +
					'<div class="reds_headpor_three">' +
					'<img class="customer-icon" src="' + customer_picture + '">' +
					'</div>' +
					'<div class="reds_name_three">' + customer_name + '</div>' +
					'<div class="reds_fans_num_three">已有125位粉丝</div>' +
					'<div class="reds_chat_three" a_id="' + past_assistant_id + '">' +
					'<p class="reds_chat_p chat-with-reds past-reds" r_name = "' + customer_name + '" r_pic="' + customer_picture + '" r_id="' + past_assistant_id + '">+&nbsp;聊聊</p>' +
					'</div>' +
					'</div>';
			}
		});
		$(headString).appendTo("#past_reds");
	}

	function init_comment(datas) {
		$(".comment_container").empty();
		$.each(datas.commentinfo, function(index, getdata) {
			//评论者照片
			var customer_picture = getdata.customer_picture;
			//评论者id
			var customer_id = getdata.customer_id;
			//评论者名称
			var customer_name = getdata.customer_name;
			//评论时间
			var created_at = getdata.created_at;
			//评论id
			var comment_id = getdata.comment_id;
			//评论内容
			var comment_content = getdata.comment_content;
			//回复总数
			reply_total = getdata.reply_total;
			//评论点赞总数
			var comment_like_total = getdata.comment_like_total;
			//是否点赞
			var comment_like_flag = getdata.comment_like_flag;
			//是否打赏
			var is_reward = getdata.is_reward;
			//打赏金额
			var reward_amount = getdata.reward_amount;
			//评论文本
			var startString = '';

			if(index < 10) {
				startString += '<div class="evaluation_container">';
			} else {
				startString += '<div class="evaluation_container hide">';
			}

			startString += '<div class="evaluation_container_reviewer">' +
				'<img class="evaluation_container_reviewer_pic" src="' + customer_picture + '" />' +
				'<span class="evaluation_container_reviewer_name">' + customer_name + '</span>' +
				'</div>' +
				'<div class="evaluation_content_box">' +
				'<div class="evaluation_content">' + comment_content +
				'</div>' +
				'<div class="evaluation_other_content_box">' +
				'<div class="evaluation_time">' + created_at + '</div>';

			var yunbiString = '<div class="evaluation_coloud_money_box">' +
				'<img class="coloud_money_img" src="img/cloud_money@2x.png" />' +
				'<span class="text_vertical_align">' + reward_amount + '</span>' +
				'</div>';

			if("1" == is_reward) {
				startString += yunbiString;
			}
			if(comment_like_flag == '-1') {
				startString += '<div class="zan_num_box" reply="' + comment_id + '" rep_type="comment">' +
					'<span class="iconfont icon-dianzan1 already-zan"></span>';
				//'<img class="comment_and_zan_img already-zan" src="img/zan_btn@2x.png" />';
			} else {
				startString += '<div class="zan_num_box" reply="' + comment_id + '" rep_type="comment">' +
					'<span class="iconfont icon-dianzan1"></span>';
				//'<img class="comment_and_zan_img" src="img/zan_btn@2x.png" />';
			}
			startString += '<span class="text_vertical_align zan_amt">' + comment_like_total + '</span>' +
				'</div>';

			startString += '<div class="comments_num_box">' +
				'<img class="comment_and_zan_img" src="img/comment_icon@2x.png" />' +
				'<span class="text_vertical_align">' + reply_total + '</span>' +
				'</div>' +
				'</div>';
			if(reply_total != 0) {
				startString += '<div class="reply_content_box">';
				$.each(getdata.reply_info, function(index, replydatas) {
					if(0 == index) {
						//评论id
						var reply_id = replydatas.reply_id;
						//评论内容
						var reply_content = replydatas.reply_content;
						//点赞总数
						var reply_like_total = replydatas.reply_like_total;
						//是否点赞
						var reply_like_flag = replydatas.reply_like_flag;
						//创建时间
						var created_at = replydatas.created_at;
						//回复人姓名
						var customer_name = replydatas.customer_name;

						startString += '<div class="evaluation_content">' +
							'<span class="font_color_black">' + customer_name + '：</span>' + reply_content +
							'</div>' +
							'<div class="evaluation_other_content_box">' +
							'<div class="evaluation_time">' + created_at + '</div>' +
							'<div class="zan_num_box" reply="' + reply_id + '" rep_type="reply">';
						if(reply_like_flag == "-1") {
							startString += '<span class="iconfont icon-dianzan1 already-zan"></span>';
						} else {
							startString += '<span class="iconfont icon-dianzan1"></span>';
						}
						startString += '<span class="text_vertical_align zan_amt">' + reply_like_total + '</span>' +
							'</div>' +
							'</div>';
						if(reply_total > 1) {
							startString += '<div class="rest_reply">查看剩下<span>' + (reply_total - 1) + '</span>条回复</div>';
						}
						startString += '</div>';
					}
				}); 
			}
			startString += '</div></div>';
			//添加评论到DOM
			$(startString).appendTo(".comment_container");
		});
	}

	//弹出加聊聊窗口
	$(".chat-with-reds").click(function() {
		r_pic = $(this).attr("r_pic");
		r_name = $(this).attr("r_name");
		$(".reds-picture").attr('src', r_pic);
		$('#chat_name').text(r_name);
		chat_reds_id = $(this).attr("r_id");
		$(".mask").css("display", "block");
		$(".chat-dialog").css("display", "block");
	});
	$(".confirm-btn").bind("click", function() {
		var urlPath_one = "mrsyg/kquser/FocusEmployer.form";
		var need_data = {
			"assistant_id": chat_reds_id,
			"type": "1"
		};
		var data_one = myAjax(urlPath_one, need_data);
		if(data_one != undefined) {
			console.log("请求已发送！");
		} else {
			console.log("请求发送失败！");
		}
	})
	//弹出打赏窗口
	$("#shang").click(function() {
		$(".mask").css("display", "block");
		$(".shang-dialog").css("display", "block");
	});
	//关闭窗口
	$(".close-btn,.confirm-btn,.cancel-btn").click(function() {
		$(".mask").css("display", "none");
		$(".shang-dialog").css("display", "none");
		$(".chat-dialog").css("display", "none");
	});
	//全局变量,是否选择评价
	var count_change_flag = 0;
	//整数正则表达式
	var re = /^[0-9]+$/;
	//打赏按钮触发
	$(".shang-btn").bind("click", function() {
		//打赏金额
		var count_str = $(".shang-count").val();
		var count = parseInt(count_str);
		//云币总数
		var total = $(".total-yunbi").text();
		total = parseInt(total);

		//剩余云币
		var remain = total - count;
		if(!count_change_flag) {
			console.log("请选择评价！");
			return;
		}
		if(count > total) {
			console.log("云币不足！");
		} else {
			var urlPath_one = "mrsyg/kquser/SureReward.form";
			var need_data = {
				"cloud_num": count_str,
				"parameter_id": recommend_id,
				"comment_content": $(".option-content").text(),
				"operate": "17",
				"type": "3"
			};
			var data_one = myAjax(urlPath_one, need_data);
			if(data_one != undefined) {
				var urlPath_comment = "mrsyg/kqgoods/HotComment.form";
				var need_data_comment = {
					"recommend_id": recommend_id
				};
				var data_comment = myAjax(urlPath_comment, need_data_comment);
				if(data_comment != undefined) {
					init_comment(data_comment);
					zanClick();
				}
				console.log("打赏成功！");
				$(".total-yunbi").text(remain);
				$(".mask").css("display", "none");
				$(".shang-dialog").css("display", "none");
			} else {
				console.log("打赏失败！");
			}
		}
		//接口路径：确定打赏
		//http://120.76.190.223:8988/mrsyg/kquser/SureReward.form?cloud_num=5&note_id=1&comment_content=123&operate=11&type=3

	});
	//弹出下拉框
	$(".seclted_style").click(function() {
		var selectOption = $(".seclted_options_ul")
		if(selectOption.is(":hidden")) {
			selectOption.css("display", "block");
		} else {
			selectOption.css("display", "none");
		}
	});
	//选择选项收起下拉框并填充
	$(".seclted_options_li").bind("click", function() {
		var option = $(this).text();
		$(this).css("background-color", "#4395F7");
		$(".option-content").text(option);
		$(".seclted_options_ul").css("display", "none");
		$(this).css("background-color", "#FFFFFF");
		count_change_flag = 1;
	});
	//加减打赏金额
	$(".shang-add").bind("click", function() {
		//打赏金额
		var count = $(".shang-count").val();
		if(re.test(count)) {
			count = parseInt(count);
			count += 1;
			$(".shang-count").val(count);
		} else {
			$(".shang-count").val(1);
		}
	});
	$(".shang-minus").bind("click", function() {
		var count = $(".shang-count").val();
		if(re.test(count)) {
			count = parseInt(count);
			if(count > 1) {
				count -= 1;
				$(".shang-count").val(count);
			}
		} else {
			$(".shang-count").val(1);
		}
	});
	//打赏金额校验
	function isDig() {
		var count = $(".shang-count").val();
		if(!re.test(count)) {
			$(".shang-count").val(1);
		}
	};
	//底部点赞
	//接口：http://120.76.190.223:8988/mrsyg/kquser/GiveLike.form?parameter_id=1&operate=19
	$('.zan-container').bind('click',function(){
		var icon = $(this).find('.iconfont');
		if(icon.hasClass('already-zan')) {
			var urlPath_one = "mrsyg/kquser/GiveLike.form";
			var need_data = {
				"parameter_id": recommend_id,
				"operate": "19"
			};
			var data_one = myAjax(urlPath_one, need_data);
			if(data_one != undefined) {
				console.log('取消点赞成功');
				icon.removeClass('already-zan');
				$('.fabulous_num,#zan_amt').text(Number($("#zan_amt").text()) - 1);
			}else{
				console.log('取消点赞失败');
			}
		}else{
			var urlPath_one = "mrsyg/kquser/GiveLike.form";
			var need_data = {
				"parameter_id": recommend_id,
				"operate": "19"
			};
			var data_one = myAjax(urlPath_one, need_data);
			if(data_one != undefined) {
				console.log('点赞成功');
				icon.addClass('already-zan');
				$('.fabulous_num,#zan_amt').text(Number($("#zan_amt").text()) + 1);
			}else{
				console.log('点赞失败');
			}
		}
	})
	//底部收藏
	//接口：http://120.76.190.223:8988/mrsyg/kquser/CollectionNote.form?parameter_id=1&operate=18&type=1
	$('.star-container').click(function(e) {
		e.preventDefault();
		var icon =$(this).find('.iconfont');
		var urlPath_one = "mrsyg/kquser/CollectionNote.form";
		if(icon.hasClass("already-zan")) {
			var need_data = {
				"parameter_id": recommend_id,
				"operate": "18",
				"type":"-1"
			};
			var data_one = myAjax(urlPath_one, need_data);
			if(data_one != undefined) {
				console.log("取消收藏");
				icon.removeClass('already-zan');
				$('.collection_num,#star_amt').text(Number($("#star_amt").text()) - 1);
			} else {
				console.log("取消收藏失败！");
			}
		} else {
			var need_data = {
				"parameter_id": recommend_id,
				"operate": "18",
				"type":"1"
			};
			var data_one = myAjax(urlPath_one, need_data);
			if(data_one != undefined) {
				console.log("收藏成功");
				icon.addClass('already-zan');
				$('.collection_num,#star_amt').text(Number($("#star_amt").text()) + 1);
			} else {
				console.log("收藏失败！");
			}
		}
	});
	//评论及回复的点赞事件
	//接口：客户点赞评论、回复
	//点赞评论：http://120.76.190.223:8988/mrsyg/kquser/CommentLike.form?comment_id=399&&focus_type=15&type=1
	function zanClick() {
		$('.zan_num_box').bind('click', function() {
			var type = $(this).attr('rep_type');
			var id = $(this).attr('reply');
			var icon = $(this).find('.iconfont');
			var urlPath_one;
			var need_data;
			//通过图标样式判断是否已点赞
			if(icon.hasClass('already-zan')) {
				if("comment" == type) {
					urlPath_one = "mrsyg/kquser/CommentLike.form";
					need_data = {
						"comment_id": id,
						"focus_type": "9",
						"type": "-1"
					};
				} else {
					urlPath_one = "mrsyg/kquser/ReplyLike.form";
					need_data = {
						"reply_id": id,
						"focus_type": "10",
						"type": "-1"
					};
				}
				var data_one = myAjax(urlPath_one, need_data);
				if(data_one != undefined) {
					$(this).find('.iconfont').removeClass('already-zan');
					$(this).find('.zan_amt').text(Number($(this).find('.zan_amt').text()) - 1);
				} else {
					console.log("取消点赞失败！");
				}

			} else {
				if("comment" == type) {
					urlPath_one = "mrsyg/kquser/CommentLike.form";
					need_data = {
						"comment_id": id,
						"focus_type": "9",
						"type": "1"
					};
				} else {
					urlPath_one = "mrsyg/kquser/ReplyLike.form";
					need_data = {
						"reply_id": id,
						"focus_type": "10",
						"type": "1"
					};
				}
				var data_one = myAjax(urlPath_one, need_data);
				if(data_one != undefined) {
					$(this).find('.iconfont').addClass('already-zan');
					$(this).find('.zan_amt').text(Number($(this).find('.zan_amt').text()) + 1);
				} else {
					var errorString = '类型： ' + type + ';id: ' + id + ';';
					console.log("点赞失败！" + errorString);
				}
			}
		});
	}
	$(".view-all,.evaluation_content,.rest_reply").bind('click', function() {
		var hrefString = '?type="reds"&id="' + recommend_id + '"';
		native.openWebView("all_evaluation_note.jsp" + hrefString);
	})
});