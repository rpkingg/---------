<%@ page contentType="text/html;charset=GBK" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
        <%@ include file = "/YunHaiTongProject/common/header.jsp" %>
		<meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<meta http-equiv="Content-Type" content="text/html;charset=GBK" />
		<meta content="yes" name="apple-mobile-web-app-capable" />
		<meta content="black" name="apple-mobile-web-app-status-bar-style" />
		<meta content="telephone=no" name="format-detection" />
		<meta http-equiv="Cache-Control" content="no-cache"/>
		<title>ȫ������</title>
		<link rel="stylesheet" href="css/common_css/initialization_style.css" />
		<link rel="stylesheet" href="css/common_css/public_style.css" />
		<!-- ͼ���css -->
		<link rel="stylesheet" href="css/common/iconfont/iconfont.css">
		<link rel="stylesheet" href="css/all_evaluation_note.css" />
		<script type="text/javascript" src="js/common_js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="js/common_js/set_fontsize.js"></script>
	</head>

	<body>
        <%@ include file = "/YunHaiTongProject/common/page_header.jsp" %>

		<div class="margin_top_six">
			<div class="background_color_FF">
				<div class="comment_container">
				<!--<div class="evaluation_container">
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
				</div>-->
				</div>
			</div>
		</div>
		<!--���۵���-->
		<div class="buttom-div">
			<input id="comment_input" type="text" placeholder="����������..."/>
			<button class="send-button" id="send_button">����</button>
		</div>
        <%@ include file = "/YunHaiTongProject/common/page_footer.jsp" %>

	</body>
        <%@ include file = "/YunHaiTongProject/common/footer.jsp" %>
	<script type="text/javascript" src="js/common_js/change_fontsize.js"></script>
	<script type="text/javascript" src="js/common_js/my_tools.js"></script>
	<script type="text/javascript" src="js/common/iconfont.js"></script>
	<script type="text/javascript" src="js/common_js/vconsole.min.js"></script>
	<script>
		(function($, document) {
			var request = new queryString();
			var id = request["id"];
			var type = request["type"];
				console.log("��ת�����Ǻ��˻��ǿ�����" + type);
			//�Ժ��˻��ǿ������ж�
			function getDatas(){
				if(type=="action"){
					var urlPath_comment = "mrsyg/kqgoods/ActionComment.form";
					var need_data_comment = {
						"action_id": id,
						"pag_no": "1",
						"pag_num": "100"
					};
				}else if("reds"==type){
					var urlPath_comment = "mrsyg/kqgoods/HotComment.form";
					var need_data_comment = {
						"recommend_id": id,
						"pag_no": "1",
						"pag_num": "100"
					};
				}
				//��ʾ����
				var data_comment = myAjax(urlPath_comment, need_data_comment);
				if(data_comment != undefined&&data_comment.hasOwnProperty("commentinfo")) {
					init_comment(data_comment);
					zanClick();
				}else{
					console.log("��������ʧ��");
				}
			}

			getDatas();
			
			//��ʾ�ظ�
			function init_comment(datas) {
				$(".comment_container").empty();
				$.each(datas.commentinfo, function(index, getdata) {
					//��������Ƭ
					var customer_picture = getdata.customer_picture;
					//������id
					var customer_id = getdata.customer_id;
					//����������
					var customer_name = getdata.customer_name;
					//����ʱ��
					var created_at = getdata.created_at;
					//����id
					var comment_id = getdata.comment_id;
					//��������
					var comment_content = getdata.comment_content;
					//�ظ�����
					var reply_total = getdata.reply_total;
					//���۵�������
					var comment_like_total = getdata.comment_like_total;
					//�Ƿ����
					var comment_like_flag = getdata.comment_like_flag;
					//�Ƿ����
					var is_reward = getdata.is_reward;
					//���ͽ��
					var reward_amount = getdata.reward_amount;
					//�����ı�
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
						'<div class="evaluation_content more-line-div">' + comment_content +
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
					startString += '<span class="zan_amt">' + comment_like_total + '</span>' +
						'</div>';
		
					startString += '<div class="comments_num_box" c_name="'+ customer_name +'" reply="'+ comment_id +'">' +
						'<img class="comment_and_zan_img" src="img/comment_icon@2x.png" />' +
						'<span class="text_vertical_align">' + reply_total + '</span>' +
						'</div>' +
						'</div>';
					if(reply_total != 0) {
						startString += '<div class="reply_content_box">';
						$.each(getdata.reply_info, function(index, replydatas) {
							//����id
							var reply_id = replydatas.reply_id;
							//��������
							var reply_content = replydatas.reply_content;
							//��������
							var reply_like_total = replydatas.reply_like_total;
							//�Ƿ����
							var reply_like_flag = replydatas.reply_like_flag;
							//����ʱ��
							var created_at = replydatas.created_at;
							//�ظ�������
							var customer_name = replydatas.customer_name;
							
							if(0==index){
								startString+='<div class="reply-item">';
							}else{
								startString+='<div class="reply-item hide">';
							}
							
							startString += '<div class="evaluation_content more-line-div">' +
								'<span class="font_color_black">' + customer_name + '��</span>' + reply_content +
								'</div>' +
								'<div class="evaluation_other_content_box">' +
								'<div class="evaluation_time">' + created_at + '</div>' +
								'<div class="zan_num_box" reply="' + reply_id + '" rep_type="reply">';
							if(reply_like_flag == "-1") {
								startString += '<span class="iconfont icon-dianzan1 already-zan"></span>';
							} else {
								startString += '<span class="iconfont icon-dianzan1"></span>';
							}
							startString += '<span class="zan_amt">' + reply_like_total + '</span>' +
								'</div>' +
								'</div>';
							startString += '</div>';
							if(reply_total > 1&&0==index) {
								startString += '<div class="rest_reply">�鿴ʣ��<span>' + (reply_total - 1) + '</span>���ظ�</div>';
							}
						}); 
					}
					startString += '<div class="pack_up hide">����ظ�</div></div></div>';
					//������۵�DOM
					$(startString).appendTo(".comment_container");
				});
			}
			//�Իظ�����
			//���ۼ��ظ��ĵ����¼�
			//�ӿڣ��ͻ��������ۡ��ظ�
			//�������ۣ�http://120.76.190.223:8988/mrsyg/kquser/CommentLike.form?comment_id=399&&focus_type=15&type=1
			function zanClick(){
				$('.zan_num_box').bind('click',function() {
					var type = $(this).attr('rep_type');
					var id = $(this).attr('reply');
					var icon = $(this).find('.iconfont');
					var urlPath_one;
					var need_data;
					//ͨ��ͼ����ʽ�ж��Ƿ��ѵ���
					if(icon.hasClass('already-zan')) {
						if("comment" == type) {
							urlPath_one = "mrsyg/kquser/CommentLike.form";
							need_data = {
								"comment_id": id,
								"focus_type": "15",
								"type": "-1"
							};
						} else {
							urlPath_one = "mrsyg/kquser/ReplyLike.form";
							need_data = {
								"reply_id": id,
								"focus_type": "16",
								"type": "-1"
							};
						}
						var data_one = myAjax(urlPath_one, need_data);
						if(data_one != undefined) {
							$(this).find('.iconfont').removeClass('already-zan');
							$(this).find('.zan_amt').html(Number($(this).find('.zan_amt').html()) - 1);
						} else {
							console.log("ȡ������ʧ�ܣ�");
						}
				
					} else {
						if("comment" == type) {
							urlPath_one = "mrsyg/kquser/CommentLike.form";
							need_data = {
								"comment_id": id,
								"focus_type": "15",
								"type": "1"
							};
						} else {
							urlPath_one = "mrsyg/kquser/ReplyLike.form";
							need_data = {
								"reply_id": id,
								"focus_type": "16",
								"type": "1"
							};
						}
						var data_one = myAjax(urlPath_one, need_data);
						if(data_one != undefined) {
							$(this).find('.iconfont').addClass('already-zan');
							$(this).find('.zan_amt').html(Number($(this).find('.zan_amt').html()) + 1);
						} else {
							var errorString = '���ͣ� ' + type + ';id: ' + id + ';';
							console.log("����ʧ�ܣ�" + errorString);
						}
					}
				});
				
				//��ʾʣ������
				$(".rest_reply").bind("click",function(){
					$(this).nextAll('.reply-item').show();
					$(this).hide();
					$(this).siblings(".pack_up").show();
				});
				//����ظ�
				$(".pack_up").bind("click",function(){
					$(this).hide();
					$(this).siblings('.reply-item').hide();
					$(this).siblings(".rest_reply").show();
					$(this).siblings(".rest_reply").prev(".reply-item").show();
				});
				//ѡ���������
				$(".comments_num_box").bind("click",function(){
					var commentId = $(this).attr("reply");
					var userName = $(this).attr("c_name");
					commentFlag = 1;
					$('#comment_input').attr("placeholder","�ظ� "+userName);
					replyID = commentId;
					$("#comment_input").focus();
				});
		        $(".evaluation_content,.evaluation_container_reviewer,.evaluation_content").bind("click",function (e) {
			            commentFlag = 0;
			            $('#comment_input').attr("placeholder","����������...");
		        });
			}
			//���۽ӿ�
			//http://120.76.190.223:8988/mrsyg/kqgoods/PublishComment.form?parameter_id=1&comment_content=�������ۿ����&type=4
			//�ظ��ӿ�
			//http://120.76.190.223:8988/mrsyg/kqgoods/ReplyComment.form?comment_id=399&reply_content=���Իظ�����һ
			//0������һ�����ۣ�1��������������
			var commentFlag = 0;
			var replyID = 0;
		 	$("#send_button").on("click",function (e) {
		 		var comment_content = $("#comment_input").val();
		 		var urlPath_one,need_data;
	            if(commentFlag){
	            	urlPath_one = "mrsyg/kqgoods/ReplyComment.form";
					need_data = {
						"comment_id": replyID,
						"reply_content": comment_content
					};
	            }else if(type=="action"){
	            	urlPath_one = "mrsyg/kqgoods/PublishComment.form";
					need_data = {
						"parameter_id": id,
						"comment_content": comment_content,
						"type": "4"
					};
	            }else if(type=="reds"){
	            	urlPath_one = "mrsyg/kqgoods/PublishComment.form";
					need_data = {
						"parameter_id": id,
						"comment_content": comment_content,
						"type": "3"
					};
	            }
	            
				var data_one = myAjax(urlPath_one, need_data);
				if(data_one != undefined) {
					getDatas();
					$("#comment_input").val("");
					console.log("�������۳ɹ�:"+comment_content);
				}else{
					console.log("�������۳ɹ�:"+comment_content);
				}
	        });
		})(jQuery, document);
	</script>

</html>