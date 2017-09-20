<%@ page contentType="text/html;charset=GBK" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<meta http-equiv="Content-Type" content="text/html;charset=GBK" />
		<meta content="yes" name="apple-mobile-web-app-capable" />
		<meta content="black" name="apple-mobile-web-app-status-bar-style" />
		<meta content="telephone=no" name="format-detection" />
		<meta http-equiv="Cache-Control" content="no-cache"/>
		<title>我的点赞(0)</title>
		<link rel="stylesheet" href="css/common_css/initialization_style.css" />
		<link rel="stylesheet" href="css/common_css/public_style.css" />
		<link rel="stylesheet" href="css/my_liked_user.css" />
		<script type="text/javascript" src="js/common_js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="js/common_js/set_fontsize.js"></script>
	</head>

	<body>
		<!--<div>
			<div class="title_content">我的点赞(<span id="liked_total">0</span>)</div>
			<img class="title_back" src="img/back_btn@2x.png" srcset="img/back_btn@2x.png 2x,img/back_btn@3x.png 3x" />
		</div>-->
		<div class="my_like_container margin_top_six have_zan">
			<div class="left_liked_container">
				<div class="left_liked note_container">
					<img class="liked_pic" src="img/product_pic@2x.png" />
					<div class="liked_container">
						<div class="two_line_font">大家多年的晕血症估计被这 iphone7红色特别...</div>
						<div class="two_line_font note_des">大家多年的晕血症估计被这的晕血症估计被这的晕血症估计被这的晕血症估计被这</div>
						<div class="zan_time_container">
							<img class="time_pic" src="img/liked_time_icon.png" />
							<div class="zan_time">2017-06-29</div>
						</div>
					</div>
				</div>
				<div class="left_liked note_container">
					<img class="liked_pic" src="img/product_pic@2x.png" />
					<div class="liked_container">
						<div class="two_line_font">大家多年的晕血症估计被这 iphone7红色特别...</div>
						<div class="two_line_font note_des">大家多年的晕血症估计被这的晕血症估计被这的晕血症估计被这的晕血症估计被这</div>
						<div class="zan_time_container">
							<img class="time_pic" src="img/liked_time_icon.png" />
							<div class="zan_time">2017-06-29</div>
						</div>
					</div>
				</div>
			</div>
			<div class="right_liked_container">
				<div class="right_liked note_container">
					<img class="liked_pic" src="img/product_pic@2x.png" />
					<div class="liked_container">
						<div class="two_line_font">大家多年的晕血症估计被这 iphone7红色特别...</div>
						<div class="two_line_font note_des">大家多年的晕血症估计被这的晕血症估计被这的晕血症估计被这的晕血症估计被这</div>
						<div class="zan_time_container">
							<img class="time_pic" src="img/liked_time_icon.png" />
							<div class="zan_time">2017-06-29</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="no_zan">
			<img class="no_zan_pic" src="img/no_zan_icon.png"/>
			<div class="no_zan_content">暂无点赞</div>
		</div>
	</body>
	<script type="text/javascript" src="js/common_js/change_fontsize.js"></script>
	<script type="text/javascript" src="js/common_js/my_tools.js"></script>
	<script>
		(function($, document) {
			//接口路径（我的点赞--初始化页面）
			//http://120.76.190.223:8988/mrsyg/kquser/MyLike.form?pag_no=1&pag_num=100
			var urlPath_one = "mrsyg/kquser/MyLike.form";
			var need_data = {
				"pag_no": "1",
				"pag_num": "100"
			};
			var data_one = myAjax(urlPath_one, need_data);
			if(data_one != undefined) {
				init(data_one);
			}

			function init(datas) {
				$(".left_liked_container").empty();
				$(".right_liked_container").empty();
				//点赞总数
				var like_total = datas.like_total;
				if (like_total>0) {
					$(".have_zan").show();
					$("title").text("我的点赞("+like_total+")");
				} else{
					$(".no_zan").show();
				}
				
				$.each(datas.data, function(index, getdata) {
					//笔记图片
					var picture_url = getdata.picture_url;
					var picture_url2x = getDifferencePic(picture_url,"2x_");
					var picture_url3x = getDifferencePic(picture_url,"3x_");
					//笔记id
					var note_id = getdata.note_id;
					//笔记名称
					var note_name = decodeURI(getdata.note_name);
					//笔记描述
					var note_desc = decodeURI(getdata.note_desc);
					//笔记创建时间
					var created_at = getdata.created_at;
					
					var left_or_right="";
					if(index%2==0){
						left_or_right="left_liked";
					} else if(index%2==1){
						left_or_right="right_liked";
					}
					
					var needString = '<div class="'+left_or_right+' note_container" id="'+note_id+'">' +
						'<img class="liked_pic" src="'+picture_url2x+'" srcset="'+picture_url2x+' 2x,'+picture_url3x+' 3x"/>' +
						'<div class="liked_container">' +
						'<div class="two_line_font">'+note_name+'</div>' +
						'<div class="two_line_font note_des">'+note_desc+'</div>' +
						'<div class="zan_time_container">' +
						'<img class="time_pic" src="img/liked_time_icon.png" />' +
						'<div class="zan_time">'+created_at+'</div>' +
						'</div>' +
						'</div>' +
						'</div>';
					if(index%2==0){
						$(needString).appendTo(".left_liked_container");
					} else if(index%2==1){
						$(needString).appendTo(".right_liked_container");
					}	
				});
			}

		})(jQuery, document);
	</script>

</html>