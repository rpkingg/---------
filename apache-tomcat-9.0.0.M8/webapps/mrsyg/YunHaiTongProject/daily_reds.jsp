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
		<title>每日红人</title>
		<!-- 图标库css -->
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
					<div class="fans_text">粉丝</div>
				</div>
				<div class="fabulous_column">
					<div class="fabulous_num"></div>
					<div class="fabulous_wri">被点赞数</div>
				</div>
				<div class="reward_column">
					<div class="reward_num"></div>
					<div class="reward_wri">赏</div>
				</div>
				<div class="collection_column">
					<div class="collection_num"></div>
					<div class="collection_wri">被收藏数</div>
				</div>
				<div class="float_left">
					<div class="your_name"></div>
					<div class="trade_name"></div>
				</div>
				<div class="chat_first">
					<p class="chat_first_p chat-with-reds current-reds">+&nbsp;聊聊</p>
				</div>
			</div>
			<div class="line_interval"></div>

			<div class="second_part">
				<div class="short_line_left"></div>
				<div class="reds_recommend">往期红人推荐</div>
				<div class="short_line_right"></div>
				<div id="past_reds">
					<!--<div class="reds_message">
						<div class="reds_headpor">
							<img class="customer-icon" src="img/adviser_two@2x.png">
						</div>
						<div class="reds_name"></div>
						<div class="reds_fans_num">已有125位粉丝</div>
						<div class="reds_chat">
							<img class="reds_chat_img" src="img/white_new.png" />
							<p class="reds_chat_p chat-with-reds">聊聊</p>
						</div>
					</div>
					<div class="reds_message_two">
						<div class="reds_headpor_two">
							<img class="customer-icon" src="img/adviser_two@2x.png">
						</div>
						<div class="reds_name_two">丁雯雯</div>
						<div class="reds_fans_num_two">已有125位粉丝</div>
						<div class="reds_chat_two">
							<p class="reds_chat_p_two chat-with-reds">+&nbsp;聊聊</p>
						</div>
					</div>
					<div class="reds_message_three">
						<div class="reds_headpor_three">
							<img class="customer-icon" src="img/adviser_two@2x.png">
						</div>
						<div class="reds_name_three">丁雯雯</div>
						<div class="reds_fans_num_three">已有125位粉丝</div>
						<div class="reds_chat_three">
							<p class="reds_chat_p_three chat-with-reds">+&nbsp;聊聊</p>
						</div>
					</div>-->
				</div>
			</div>
			<div class="line_interval"></div>
			<div class="third_part">
				<div class="discuss_message">
					<img src="img/white_new.png" class="discuss_message_img" />
				</div>
				<div class="discuss_part">讨论区</div>
				<div class="discuss_headpro">
					<!--<img class="customer-icon discuss_headpro_img" src="img/adviser_two@2x.png">-->
				</div>
				<div class="daily_own_view">
					<div id="show" name="show" contenteditable="true" class="p_input"></div>
					<div class="your_view">说说你的看法...</div>
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
						<span class="evaluation_container_reviewer_name">JOJO-溪溪</span>
					</div>
					<div class="evaluation_content_box">
						<div class="evaluation_content">
							大家买手机比较来比较去其实吧都差不多，反正我感 觉用的习惯不就好了么！
							<img class="emoji_style" src="img/表情/表情包/emoji_0.png">
							<img class="emoji_style" src="img/表情/表情包/emoji_10.png"> 就好了么就好了么就好了么
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
						<span class="evaluation_container_reviewer_name">JOJO-溪溪</span>
					</div>
					<div class="evaluation_content_box">
						<div class="evaluation_content">
							大家买手机比较来比较去其实吧都差不多，反正我感 觉用的习惯不就好了么！就好了么就好了么就好了么
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
								<span class="font_color_black">羊肉烤串：</span>大家买手机比较来比较去其实吧都差不多，反正我感 觉用的习惯不就好了么！就好了么就好了么就好了么
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
							<div class="rest_reply">查看剩下<span>3</span>条回复</div>
						</div>
					</div>
				</div>
				<div class="evaluation_container">
					<div class="evaluation_container_reviewer">
						<img class="evaluation_container_reviewer_pic" src="img/adviser_two@2x.png" />
						<span class="evaluation_container_reviewer_name">JOJO-溪溪</span>
					</div>
					<div class="evaluation_content_box">
						<div class="evaluation_content">
							大家买手机比较来比较去其实吧都差不多，反正我感 觉用的习惯不就好了么！
							<img class="emoji_style" src="img/表情/表情包/emoji_0.png">
							<img class="emoji_style" src="img/表情/表情包/emoji_10.png"> 就好了么就好了么就好了么
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
			<div class="view-all">查看全部 &gt;</div>
		</div>
		<div class="shang-icon">
			<div id="shang">
				<img class="yunbi-img" src="img/cloud_money@2x.png" />
				<span class="shang-text">赏</span>
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
				<span>聊聊</span>
			</div>
		</div>
		<div class="mask"></div>
		<div class="shang-dialog">
			<div class="dialog-title">
				打赏
				<span class="close-btn">X</span>
			</div>
			<div class="seclted_style">
				<span class="option-content">请选择评语</span>
				<div><img class="down-img" src="img/down.png"></img>
				</div>
			</div>
			<ul class="seclted_options_ul">
				<li class="seclted_options_li">文章写的太好了</li>
				<li class="seclted_options_li">内容非常有意义</li>
				<li class="seclted_options_li">十分感谢</li>
			</ul>
			<div class="count-container">
				<span class="shang-minus">-</span>
				<form id="shang_form" class="input-form">
					<input type="text" name="shang_count" class="shang-count" oninput="isDig()" value="5">
				</form>
				<span class="shang-add">+</span>
			</div>
			<input type="submit" class="shang-btn" value="打赏"></input>
			<p class="yunbi-remained">你剩余云币数量: <span class="total-yunbi"></span></p>
		</div>
		<div class="chat-dialog">
			<div class="chat-title">
				加聊聊
				<span class="close-btn">X</span>
			</div>
			<div class="reds-container">
				<img class="reds-picture" src="">
				<p id="chat_name"></p>
			</div>
			<!--			<div class="tip">
				<span>只要花费20</span>
				<img class="yunbi-img" src="img/cloud_money@2x.png">
				<span>云币即可加聊聊， 现在就加TA聊聊吗？</span>
			</div>-->
			<div class="btn-container">
				<div class="cancel-btn">
					取消
				</div>
				<div class="confirm-btn">
					确定
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