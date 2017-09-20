<%@ page contentType="text/html;charset=GBK" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0, user-scalable=no" />
		<meta http-equiv="Content-Type" content="text/html;charset=GBK" />
		<meta content="yes" name="apple-mobile-web-app-capable" />
		<meta content="black" name="apple-mobile-web-app-status-bar-style" />
		<meta content="telephone=no" name="format-detection" />
		<meta http-equiv="Cache-Control" content="no-cache" />
		<title>ÿ�պ���</title>
		<!-- ͼ���css -->
		<link rel="stylesheet" href="css/common/iconfont/iconfont.css">
		<link rel="stylesheet" href="css/common_css/initialization_style.css" />
		<link rel="stylesheet" href="css/common_css/public_style.css" />
		<link rel="stylesheet" href="css/common_css/swiper.min.css" />
		<link rel="stylesheet" href="css/daily_reds.css">
		<script type="text/javascript" src="js/common_js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="js/common_js/vconsole.min.js"></script>
		<script type="text/javascript" src="js/common_js/set_fontsize.js"></script>
	</head>

	<body>
		<div class="daily_head" id="head">
			<div>
				<video id="video_id" controls="controls" src=""></video>
			</div>
			<div class="first_part">
				<div class="first_part_head">
					<img src="" class="head_img" />
				</div>
				<div class="fans_column">
					<div class="fans_num"></div>
					<div class="fans_text">��˿</div>
				</div>
				<div class="fabulous_column">
					<div class="fabulous_num"></div>
					<div class="fabulous_wri">��������</div>
				</div>
				<div class="reward_column">
					<div class="reward_num"></div>
					<div class="reward_wri">��</div>
				</div>
				<div class="collection_column">
					<div class="collection_num"></div>
					<div class="collection_wri">���ղ���</div>
				</div>
				<div class="float_left">
					<div class="your_name"></div>
					<div class="trade_name"></div>
				</div>
				<div class="chat_first">
					<p class="chat_first_p chat-with-reds current-reds">+&nbsp;����</p>
				</div>
			</div>
			<div class="line_interval"></div>

			<div class="second_part">
				<div class="short_line_left"></div>
				<div class="reds_recommend">���ں����Ƽ�</div>
				<div class="short_line_right"></div>
				<div id="past_reds">
					<!--<div class="reds_message">
						<div class="reds_headpor">
							<img class="customer-icon" src="img/adviser_two@2x.png">
						</div>
						<div class="reds_name"></div>
						<div class="reds_fans_num">����125λ��˿</div>
						<div class="reds_chat">
							<img class="reds_chat_img" src="img/white_new.png" />
							<p class="reds_chat_p chat-with-reds">����</p>
						</div>
					</div>
					<div class="reds_message_two">
						<div class="reds_headpor_two">
							<img class="customer-icon" src="img/adviser_two@2x.png">
						</div>
						<div class="reds_name_two">������</div>
						<div class="reds_fans_num_two">����125λ��˿</div>
						<div class="reds_chat_two">
							<p class="reds_chat_p_two chat-with-reds">+&nbsp;����</p>
						</div>
					</div>
					<div class="reds_message_three">
						<div class="reds_headpor_three">
							<img class="customer-icon" src="img/adviser_two@2x.png">
						</div>
						<div class="reds_name_three">������</div>
						<div class="reds_fans_num_three">����125λ��˿</div>
						<div class="reds_chat_three">
							<p class="reds_chat_p_three chat-with-reds">+&nbsp;����</p>
						</div>
					</div>-->
				</div>
			</div>
			<div class="line_interval"></div>
			<div class="third_part">
				<div class="discuss_message">
					<img src="img/white_new.png" class="discuss_message_img" />
				</div>
				<div class="discuss_part">������</div>
				<div class="discuss_headpro">
					<!--<img class="customer-icon discuss_headpro_img" src="img/adviser_two@2x.png">-->
				</div>
				<div class="daily_own_view">
					<div id="show" name="show" contenteditable="true" class="p_input"></div>
					<div class="your_view">˵˵��Ŀ���...</div>
					<div class="emotionnice">
						<!--<img src="img/smile_face.png" class="emotionnice_img" />-->
					</div>
				</div>
				<div class="com_form">
					<textarea class="input" id="saytext" name="saytext"></textarea>
				</div>
			</div>
			<div class="comment_container">
				<!--<div class="evaluation_container">
					<div class="evaluation_container_reviewer">
						<img class="evaluation_container_reviewer_pic" src="img/adviser_two@2x.png" />
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
								<img class="coloud_money_img" src="img/cloud_money@2x.png" />
								<span class="text_vertical_align">5</span>
							</div>
							<div class="comments_num_box">
								<img class="comment_and_zan_img" src="img/zan_btn@2x.png" />
								<span class="text_vertical_align">5</span>
							</div>
							<div class="zan_num_box">
								<img class="comment_and_zan_img" src="img/comment_icon@2x.png" />
								<span class="text_vertical_align">5</span>
							</div>
						</div>
					</div>
				</div>
				<div class="evaluation_container">
					<div class="evaluation_container_reviewer">
						<img class="evaluation_container_reviewer_pic" src="img/adviser_two@2x.png" />
						<span class="evaluation_container_reviewer_name">JOJO-ϪϪ</span>
					</div>
					<div class="evaluation_content_box">
						<div class="evaluation_content">
							������ֻ��Ƚ����Ƚ�ȥ��ʵ�ɶ���࣬�����Ҹ� ���õ�ϰ�߲��ͺ���ô���ͺ���ô�ͺ���ô�ͺ���ô
						</div>
						<div class="evaluation_other_content_box">
							<div class="evaluation_time">06-15 08:52</div>
							<div class="evaluation_coloud_money_box">
								<img class="coloud_money_img" src="img/cloud_money@2x.png" />
								<span class="text_vertical_align">5</span>
							</div>
							<div class="comments_num_box">
								<img class="comment_and_zan_img" src="img/zan_btn@2x.png" />
								<span class="text_vertical_align">5</span>
							</div>
							<div class="zan_num_box">
								<img class="comment_and_zan_img" src="img/comment_icon@2x.png" />
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
									<img class="coloud_money_img" src="img/cloud_money@2x.png" />
									<span class="text_vertical_align">5</span>
								</div>
								<div class="comments_num_box">
									<img class="comment_and_zan_img" src="img/zan_btn@2x.png" />
									<span class="text_vertical_align">5</span>
								</div>
								<div class="zan_num_box">
									<img class="comment_and_zan_img" src="img/comment_icon@2x.png" />
									<span class="text_vertical_align">5</span>
								</div>
							</div>
							<div class="rest_reply">�鿴ʣ��<span>3</span>���ظ�</div>
						</div>
					</div>
				</div>
				<div class="evaluation_container">
					<div class="evaluation_container_reviewer">
						<img class="evaluation_container_reviewer_pic" src="img/adviser_two@2x.png" />
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
								<img class="coloud_money_img" src="img/cloud_money@2x.png" />
								<span class="text_vertical_align">5</span>
							</div>
							<div class="comments_num_box">
								<img class="comment_and_zan_img" src="img/comment_icon@2x.png" />
								<span class="text_vertical_align">5</span>
							</div>
							<div class="zan_num_box">
								<img class="comment_and_zan_img" src="img/zan_btn@2x.png" />
								<span class="text_vertical_align">5</span>
							</div>
						</div>
					</div>
				</div>-->
			</div>
			<div class="view-all">�鿴ȫ�� &gt;</div>
		</div>
		<div class="shang-icon">
			<div id="shang">
				<img class="yunbi-img" src="img/cloud_money@2x.png" />
				<span class="shang-text">��</span>
			</div>
			<div class="dot dot-left"></div>
			<div class="star-container">
				<span class="iconfont icon-g"></span>
				<span id="star_amt" class="zan-text"></span>
			</div>
			<div class="dot dot-right"></div>
			<div class="zan-container">
				<span class="iconfont icon-dianzan"></span>
				<span id="zan_amt" class="star-text"></span>
			</div>
			<div class="chat-with-reds bottom-chat current-reds">
				<img class="chat-img" src="img/comment_blue_bg@2x.png" />
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
				<div><img class="down-img" src="img/down.png"></img>
				</div>
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
			<p class="yunbi-remained">��ʣ���Ʊ�����: <span class="total-yunbi"></span></p>
		</div>
		<div class="chat-dialog">
			<div class="chat-title">
				������
				<span class="close-btn">X</span>
			</div>
			<div class="reds-container">
				<img class="reds-picture" src="">
				<p id="chat_name"></p>
			</div>
			<!--			<div class="tip">
				<span>ֻҪ����20</span>
				<img class="yunbi-img" src="img/cloud_money@2x.png">
				<span>�ƱҼ��ɼ����ģ� ���ھͼ�TA������</span>
			</div>-->
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
	<script type="text/javascript" src="js/daily_reds.js"></script>

</html>