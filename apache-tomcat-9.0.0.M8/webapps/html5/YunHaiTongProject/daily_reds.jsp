<%@ page contentType="text/html;charset=GBK" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0, user-scalable=no" />
		<meta http-equiv="Content-Type" content="text/html;charset=GBK" />
		<meta content="yes" name="apple-mobile-web-app-capable" />
		<meta content="black" name="apple-mobile-web-app-status-bar-style" />
		<meta content="telephone=no" name="format-detection" />
		<meta http-equiv="Cache-Control" content="no-cache"/>
		<title>ÿ�պ���</title>
		<link rel="stylesheet" href="css/common_css/initialization_style.css" />
		<link rel="stylesheet" href="css/common_css/public_style.css" />
		<link rel="stylesheet" href="css/common_css/swiper.min.css" />
		<link rel="stylesheet" href="css/daily_reds.css">
		<script type="text/javascript" src="js/common_js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="js/common_js/set_fontsize.js"></script>
	</head>
	<body>
		<div class="daily_head">
			<div>
				<div class="title_content reds_text">ÿ�պ���</div>
				<img class="title_back" src="img/back_btn@2x.png" srcset="img/back_btn@2x.png 2x,img/back_btn@3x.png 3x" />
				<img src="img/share.png" class="share_img" />
			</div>
			<div>
				<img src="img/young_goods.png" class="young_img" />
			</div>
			<div class="first_part">
				<div class="first_part_head">
					<img src="img/head_por.png" class="head_img" />
				</div>
				<div class="fans_column">
					<div class="fans_num">5</div>
					<div class="fans_text">��˿</div>
				</div>
				<div class="fabulous_column">
					<div class="fabulous_num">8</div>
					<div class="fabulous_wri">��</div>
				</div>
				<div class="reward_column">
					<div class="reward_num">16</div>
					<div class="reward_wri">��</div>
				</div>
				<div class="collection_column">
					<div class="collection_num">2</div>
					<div class="collection_wri">�ղ�</div>
				</div>
				<div class="float_left">
					<div class="your_name">������</div>
					<div class="trade_name">�л�������</div>
				</div>
				<div class="chat_first">
					<p class="chat_first_p chat-with-reds">+&nbsp;����</p>
				</div>
			</div>
			<div class="line_interval"></div>

			<div class="second_part">
				<div class="short_line_left"></div>
				<div class="reds_recommend">���ں����Ƽ�</div>
				<div class="short_line_right"></div>
				<div class="reds_message">
					<div class="reds_headpor">
						<img class="customer-icon" src="img/adviser_two@2x.png" srcset="img/adviser_two@2x.png 2x, img/adviser_two@3x.png 3x">
					</div>
					<div class="reds_name">������</div>
					<div class="reds_fans_num">����125λ��˿</div>
					<div class="reds_chat">
						<img class="reds_chat_img" src="img/white_new.png" />
						<p class="reds_chat_p chat-with-reds">����</p>
					</div>
				</div>
				<div class="reds_message_two">
					<div class="reds_headpor_two">
						<img class="customer-icon" src="img/adviser_two@2x.png" srcset="img/adviser_two@2x.png 2x, img/adviser_two@3x.png 3x">
					</div>
					<div class="reds_name_two">������</div>
					<div class="reds_fans_num_two">����125λ��˿</div>
					<div class="reds_chat_two">
						<p class="reds_chat_p_two chat-with-reds">+&nbsp;����</p>
					</div>
				</div>
				<div class="reds_message_three">
					<div class="reds_headpor_three">
						<img class="customer-icon" src="img/adviser_two@2x.png" srcset="img/adviser_two@2x.png 2x, img/adviser_two@3x.png 3x">
					</div>
					<div class="reds_name_three">������</div>
					<div class="reds_fans_num_three">����125λ��˿</div>
					<div class="reds_chat_three">
						<p class="reds_chat_p_three chat-with-reds">+&nbsp;����</p>
					</div>
				</div>
			</div>
			<div class="line_interval"></div>
			<div class="third_part">
				<div class="discuss_message">
					<img src="img/white_new.png" class="discuss_message_img" />
				</div>
				<div class="discuss_part">������</div>
				<div class="discuss_headpro">
					<img class="customer-icon discuss_headpro_img" src="img/adviser_two@2x.png" srcset="img/adviser_two@2x.png 2x, img/adviser_two@3x.png 3x">
				</div>
				<div class="daily_own_view">
					<div id="show" name="show" contenteditable="true" class="p_input"></div>
					<div class="your_view">˵˵��Ŀ���...</div>
					<div class="emotionnice">
						<img src="img/smile_face.png" class="emotionnice_img" />
					</div>
				</div>
				<div class="com_form">
					<textarea class="input" id="saytext" name="saytext"></textarea>
				</div>
			</div>
			<div class="evaluation_container">
				<div class="evaluation_container_reviewer">
					<img class="evaluation_container_reviewer_pic" src="img/adviser_two@2x.png" srcset="img/adviser_two@2x.png 2x,img/adviser_two@3x.png 3x" />
					<span class="evaluation_container_reviewer_name">JOJO-ϪϪ</span>
				</div>
				<div class="evaluation_content_box">
					<div class="evaluation_content">
						������ֻ��Ƚ����Ƚ�ȥ��ʵ�ɶ���࣬�����Ҹ� ���õ�ϰ�߲��ͺ���ô��
						<img class="emoji_style" src="img/����/�����/emoji_0.png">
						<img class="emoji_style" src="img/����/�����/emoji_10.png"> �ͺ���ô�ͺ���ô�ͺ���ô
					</div>
					<div class="evaluation_other_content_box">
						<div class="evaluation_time">06-15 08:52</div>
						<div class="evaluation_coloud_money_box">
							<img class="coloud_money_img" src="img/cloud_money@2x.png" srcset="img/cloud_money@2x.png 2x,img/cloud_money@3x.png 3x" />
							<span class="text_vertical_align">5</span>
						</div>
						<div class="comments_num_box">
							<img class="comment_and_zan_img" src="img/zan_btn@2x.png" srcset="img/zan_btn@2x.png 2x,img/zan_btn@3x.png 3x" />
							<span class="text_vertical_align">5</span>
						</div>
						<div class="zan_num_box">
							<img class="comment_and_zan_img" src="img/comment_icon@2x.png" srcset="img/comment_icon@2x.png 2x,img/comment_icon@3x.png 3x" />
							<span class="text_vertical_align">5</span>
						</div>
					</div>
				</div>
			</div>
			<div class="evaluation_container">
				<div class="evaluation_container_reviewer">
					<img class="evaluation_container_reviewer_pic" src="img/adviser_two@2x.png" srcset="img/adviser_two@2x.png 2x,img/adviser_two@3x.png 3x" />
					<span class="evaluation_container_reviewer_name">JOJO-ϪϪ</span>
				</div>
				<div class="evaluation_content_box">
					<div class="evaluation_content">
						������ֻ��Ƚ����Ƚ�ȥ��ʵ�ɶ���࣬�����Ҹ� ���õ�ϰ�߲��ͺ���ô���ͺ���ô�ͺ���ô�ͺ���ô
					</div>
					<div class="evaluation_other_content_box">
						<div class="evaluation_time">06-15 08:52</div>
						<div class="evaluation_coloud_money_box">
							<img class="coloud_money_img" src="img/cloud_money@2x.png" srcset="img/cloud_money@2x.png 2x,img/cloud_money@3x.png 3x" />
							<span class="text_vertical_align">5</span>
						</div>
						<div class="comments_num_box">
							<img class="comment_and_zan_img" src="img/zan_btn@2x.png" srcset="img/zan_btn@2x.png 2x,img/zan_btn@3x.png 3x" />
							<span class="text_vertical_align">5</span>
						</div>
						<div class="zan_num_box">
							<img class="comment_and_zan_img" src="img/comment_icon@2x.png" srcset="img/comment_icon@2x.png 2x,img/comment_icon@3x.png 3x" />
							<span class="text_vertical_align">5</span>
						</div>
					</div>
					<div class="reply_content_box">
						<div class="evaluation_content">
							<span class="font_color_black">���⿾����</span>������ֻ��Ƚ����Ƚ�ȥ��ʵ�ɶ���࣬�����Ҹ� ���õ�ϰ�߲��ͺ���ô���ͺ���ô�ͺ���ô�ͺ���ô
						</div>
						<div class="evaluation_other_content_box">
							<div class="evaluation_time">06-15 08:52</div>
							<div class="evaluation_coloud_money_box">
								<img class="coloud_money_img" src="img/cloud_money@2x.png" srcset="img/cloud_money@2x.png 2x,img/cloud_money@3x.png 3x" />
								<span class="text_vertical_align">5</span>
							</div>
							<div class="comments_num_box">
								<img class="comment_and_zan_img" src="img/zan_btn@2x.png" srcset="img/zan_btn@2x.png 2x,img/zan_btn@3x.png 3x" />
								<span class="text_vertical_align">5</span>
							</div>
							<div class="zan_num_box">
								<img class="comment_and_zan_img" src="img/comment_icon@2x.png" srcset="img/comment_icon@2x.png 2x,img/comment_icon@3x.png 3x" />
								<span class="text_vertical_align">5</span>
							</div>
						</div>
						<div class="rest_reply">�鿴ʣ��<span>3</span>���ظ�</div>
					</div>
				</div>
			</div>
			<div class="evaluation_container">
				<div class="evaluation_container_reviewer">
					<img class="evaluation_container_reviewer_pic" src="img/adviser_two@2x.png" srcset="img/adviser_two@2x.png 2x,img/adviser_two@3x.png 3x" />
					<span class="evaluation_container_reviewer_name">JOJO-ϪϪ</span>
				</div>
				<div class="evaluation_content_box">
					<div class="evaluation_content">
						������ֻ��Ƚ����Ƚ�ȥ��ʵ�ɶ���࣬�����Ҹ� ���õ�ϰ�߲��ͺ���ô��
						<img class="emoji_style" src="img/����/�����/emoji_0.png">
						<img class="emoji_style" src="img/����/�����/emoji_10.png"> �ͺ���ô�ͺ���ô�ͺ���ô
					</div>
					<div class="evaluation_other_content_box">
						<div class="evaluation_time">06-15 08:52</div>
						<div class="evaluation_coloud_money_box">
							<img class="coloud_money_img" src="img/cloud_money@2x.png" srcset="img/cloud_money@2x.png 2x,img/cloud_money@3x.png 3x" />
							<span class="text_vertical_align">5</span>
						</div>
						<div class="comments_num_box">
							<img class="comment_and_zan_img" src="img/zan_btn@2x.png" srcset="img/zan_btn@2x.png 2x,img/zan_btn@3x.png 3x" />
							<span class="text_vertical_align">5</span>
						</div>
						<div class="zan_num_box">
							<img class="comment_and_zan_img" src="img/comment_icon@2x.png" srcset="img/comment_icon@2x.png 2x,img/comment_icon@3x.png 3x" />
							<span class="text_vertical_align">5</span>
						</div>
					</div>
				</div>
			</div>
			<div class="view-all">�鿴ȫ�� &gt;</div>
		</div>
		<div class="shang-icon">
			<div id="shang">
				<img class="yunbi-img" src="img/cloud_money@2x.png"/>
				<span class="shang-text">��</span>
			</div>
			<div class="dot"></div>
			<div class="zan-container" >
				<img class="zan-star-img" src="img/star_comment_no.png" />
				<span class="star-text">120</span>
			</div>
			<div class="dot"></div>
			<div class="star-container">
				<img class="zan-star-img" src="img/zan_btn@2x.png"/>
				<span class="zan-text">120</span>
			</div>
			<div class="chat-with-reds bottom-chat">
				<img class="chat-img" src="img/comment_blue_bg@2x.png"/>
				<span>����</span>
			</div>
		</div>
		<div class="mask"></div>			
		<div class="shang-dialog">
			<div class="dialog-title">
				����
				<span class="close-btn">X</span>
			</div>
			<div class="seclted_style">
				<span class="option-content">��ѡ������</span>
				<div><img class="down-img" src="img/down.png"></img></div>
			</div>	
			<ul class="seclted_options_ul">
				<li class="seclted_options_li">����д��̫����</li>
				<li class="seclted_options_li">���ݷǳ�������</li>
				<li class="seclted_options_li">ʮ�ָ�л</li>
			</ul>
			<div class="count-container">
				<span class="shang-minus">-</span>
				<form id="shang_form" class="input-form">
					<input type="text" name="shang_count" class="shang-count" oninput="isDig()" value="5">
				</form>
				<span class="shang-add">+</span>
			</div>
			<input type="submit" class="shang-btn" value="����"></input>
			<p class="yunbi-remained">��ʣ���Ʊ�����: <span class="total-yunbi">15</span></p>
		</div>
		<div class="chat-dialog">
			<div class="chat-title">
				������
				<span class="close-btn">X</span>
			</div>
			<div class="reds-container">
				<img class="reds-picture" src="img/adviser_two@2x.png" srcset="img/adviser_two@2x.png 2x, img/adviser_two@3x.png 3x">
				<p>������</p>
			</div>
			<div class="tip">
				<span>ֻҪ����20</span>
				<img class="yunbi-img" src="img/cloud_money@2x.png" >
				<span>�ƱҼ��ɼ����ģ� ���ھͼ�TA������</span>
			</div>
			<div class="btn-container">
				<div class="cancel-btn">
					ȡ��
				</div>
				<div class="confirm-btn">
					ȷ��
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript" src="js/common_js/change_fontsize.js"></script>
	<script type="text/javascript" src="js/common_js/my_tools.js"></script>
	<script type="text/javascript" src="js/common_js/swiper.min.js"></script>
	<script type="text/javascript" src="js/common_js/jquery.qqFace.js"></script>
	<script type="text/javascript" src="js/common_js/jquery.min.js"></script>
	<script type="text/javascript">
		//�����
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

				path: 'img/arclist/' //�����ŵ�·��
			});

		});

		//�鿴���
		function replace_em(str) {

			str = str.replace(/\</g, '&lt;');

			str = str.replace(/\>/g, '&gt;');

			str = str.replace(/\n/g, '<br/>');

			str = str.replace(/\[em_([0-9]*)\]/g, '<img src="img/arclist/$1.png" border="0" class="dis_img"/>');

			return str;
		}

		// QQ������
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
					alert('ȱ�ٱ��鸳ֵ����');
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
	</script>
		
	<script>
		(function($, document) {
			//�ӿ�·����ÿ�պ�������ҳ����������Ϣ�����ں��ˡ�����
			//http://120.76.190.223:8988/mrsyg/kqgoods/HotAssistant.form?recommend_id=
			//http://120.76.190.223:8988/mrsyg/kqgoods/PastAssistant.form?
			//http://120.76.190.223:8988/mrsyg/kqgoods/HotComment.form?
		});
	</script>
	
	<script>
		//���������Ĵ���
		$(".chat-with-reds").click(function(){
			$(".mask").css("display","block");
			$(".chat-dialog").css("display","block");
		});
		$(".confirm-btn").bind("click",function(){
			var urlPath_one = "mrsyg/kquser/ChatCustomer.form";
			var need_data = {
			};
			var data_one = myAjax(urlPath_one, need_data);
			if(data_one != undefined) {
				alert("�����ѷ��ͣ�");
				$('.dialog-footer .cancel').trigger('click');
			}else{
				alert("������ʧ�ܣ�");
			}
		})
		//�������ʹ���
		$("#shang").click(function(){
			$(".mask").css("display","block");
			$(".shang-dialog").css("display","block");
		});
		//�رմ���
		$(".close-btn,.confirm-btn,.cancel-btn").click(function(){
			$(".mask").css("display","none");
			$(".shang-dialog").css("display","none");
			$(".chat-dialog").css("display","none");
		});
		//ȫ�ֱ���,�Ƿ�ѡ������
		var count_change_flag = 0;
		//����������ʽ
		var re = /^[0-9]+$/;
		//���Ͱ�ť����
		$(".shang-btn").bind("click",function(){
			//���ͽ��
			var count_str = $(".shang-count").val();
			var count = parseInt(count_str);
			//�Ʊ�����
			var total = $(".total-yunbi").text();
			total = parseInt(total);	
			
			//ʣ���Ʊ�
			var remain = total-count;
			if(!count_change_flag){
				alert("��ѡ�����ۣ�");
				return false;
			}
			if(count>total){
				alert("�ƱҲ��㣡");
			}else{
				var urlPath_one = "mrsyg/kquser/kquser/SureReward.form";
				var need_data = {
					"cloud_num":count_str,
					"note_id":"",
					"comment_content":$(".option-content").text(),
					"operate":"",
					"type":"3"
				};
				var data_one = myAjax(urlPath_one, need_data);
				if(data_one != undefined) {
					alert("���ͳɹ���");
					$(".total-yunbi").text(remain);
					$(".mask").css("display","none");
					$(".shang-dialog").css("display","none");
				}
			}
			//�ӿ�·����ȷ������
			//http://120.76.190.223:8988/mrsyg/kquser/SureReward.form?cloud_num=5&note_id=1&comment_content=123&operate=11&type=3
			
		});
		//����������
		$(".seclted_style").click(function(){
			var selectOption = $(".seclted_options_ul")
			if(selectOption.is(":hidden")){
				selectOption.css("display","block");
			}else{
				selectOption.css("display","none");
			}
		});
		//ѡ��ѡ���������������
		$(".seclted_options_li").bind("click",function(){
			var option = $(this).text();
			$(this).css("background-color","#4395F7");
			$(".option-content").text(option);
			$(".seclted_options_ul").css("display","none");
			$(this).css("background-color","#FFFFFF");
			count_change_flag = 1;
		});
		//�Ӽ����ͽ��
		$(".shang-add").bind("click",function(){
			//���ͽ��
			var count = $(".shang-count").val();
			if(re.test(count)){
				count = parseInt(count);
				count += 1;
				$(".shang-count").val(count);
			}else{
				$(".shang-count").val(1);
			}
		});
		$(".shang-minus").bind("click",function(){
			var count = $(".shang-count").val();
			if(re.test(count)){
				count = parseInt(count);
				if(count>1){
					count -= 1;
					$(".shang-count").val(count);
				}
			}else{
				$(".shang-count").val(1);
			}
		});
		//���ͽ��У��
		function isDig(){
			var count = $(".shang-count").val();
			if(!re.test(count)){
				$(".shang-count").val(1);
			}
		}
	</script>
</html>