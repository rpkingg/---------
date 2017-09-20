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
		<title>搜索页：笔记</title>
		<link rel="stylesheet" href="css/common_css/initialization_style.css" />
		<link rel="stylesheet" href="css/common_css/public_style.css" />
		<link rel="stylesheet" href="css/search_note.css">
		<script type="text/javascript" src="js/common_js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="js/common_js/set_fontsize.js"></script>
	</head>

	<body>
		<div class="search-header">
			<div class="search-header-div">
				<img src="img/search_input.png" class="search-header-img" />
			</div>
			<div class="search-header-div1">取消</div>
		</div>
		<div class="line_interval"></div>
		<div class="goods-container">
			<div class="goods-left-container">
				<div class="goods-detail-box">
					<img class="goods-img" src="img/product_pic@2x.png" srcset="img/product_pic@2x.png 2x, img/product_pic@3x.png 3x">
					<div class="goods-name1">大家多年的晕血症估计被这 iPhone 7红色特别...</div>
					<div class="goods-name2">自从红色特别版手机上市后 大家对这中国红貌似还是特别</div>
					<div class="customer-row">
						<img class="customer-icon" src="img/adviser_two@2x.png" srcset="img/adviser_two@2x.png 2x, img/adviser_two@3x.png 3x">
						<div class="customer-name">LI_MEI</div>
						<div class="like-icon">750</div>
					</div>
				</div>
				<div class="goods-detail-box">
					<img class="goods-img" src="img/product_pic@2x.png" srcset="img/product_pic@2x.png 2x, img/product_pic@3x.png 3x">
					<div class="goods-name1">大家多年的晕血症估计被这 iPhone 7红色特别...</div>
					<div class="goods-name2">自从红色特别版手机上市后 大家对这中国红貌似还是特别</div>
					<div class="customer-row">
						<img class="customer-icon" src="img/adviser_two@2x.png" srcset="img/adviser_two@2x.png 2x, img/adviser_two@3x.png 3x">
						<div class="customer-name">LI_MEI</div>
						<div class="like-icon like-select">750</div>
					</div>
				</div>
			</div>
			<div class="goods-right-container">
				<div class="goods-detail-box">
					<img class="goods-img" src="img/product_pic@2x.png" srcset="img/product_pic@2x.png 2x, img/product_pic@3x.png 3x">
					<div class="goods-name1">大家多年的晕血症估计被这 iPhone 7红色特别...</div>
					<div class="goods-name2">自从红色特别版手机上市后 大家对这中国红貌似还是特别</div>
					<div class="customer-row">
						<img class="customer-icon" src="img/adviser_two@2x.png" srcset="img/adviser_two@2x.png 2x, img/adviser_two@3x.png 3x">
						<div class="customer-name">LI_MEI</div>
						<div class="like-icon like-select">750</div>
					</div>
				</div>
				<div class="goods-detail-box">
					<div class="search-video">视频</div>
					<img class="goods-img" src="img/video_mode.png">
					<div class="goods-name1">高山仰止，Exynos 8登场你在等什么？</div>
					<div class="goods-name2">频率达2.6GHz的【猫鼬】核 心，高效的SCI三星互联架构</div>
					<div class="customer-row">
						<img class="customer-icon" src="img/adviser_two@2x.png" srcset="img/adviser_two@2x.png 2x, img/adviser_two@3x.png 3x">
						<div class="customer-name">LI_MEI</div>
						<div class="like-icon">750</div>
					</div>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript" src="js/common_js/change_fontsize.js"></script>
	<script type="text/javascript" src="js/common_js/my_tools.js"></script>
	<script type="text/javascript">
		(function($, document) {
			//点赞
			$('.like-icon').bind('click', function() {
				if($(this).hasClass('like-select')) {
					$(this).removeClass('like-select');
				} else {
					$(this).addClass('like-select');
				}
			});

			//接口路径（搜索——笔记结果页）
			var urlPath_one = "mrsyg/kqgoods/SearchNote.form";
			var need_data = {
				"search_content": "",
				"pag_no": "1",
				"pag_num": "100"
			};
			var data_one = myAjax(urlPath_one, need_data);
			if(data_one != undefined) {
				init(data_one);
			}

			function init(data) {
				$.each(data.noteinfo, function(index, getdata) {
					//笔记编号
					var note_id = getdata.note_id;
					//笔记照片
					var picture_url = getdata.picture_url;
					picture_url2x = getDifferencePic(picture_url, "2x_");
					picture_url3x = getDifferencePic(picture_url, "3x_");
					//笔记名称
					var note_name = getdata.note_name;
					//笔记描述
					var note_desc = getdata.note_desc;
					//营业员头像
					var customer_picture = getdata.customer_picture;
					//营业员名称
					var customer_name = getdata.customer_name;
					//营业员id
					var customer_id = getdata.customer_id;
					//点赞数量
					var note_like_total = getdata.note_like_total;
					//是否被点赞(-1已点赞,1未点赞)
					var note_like_flag = getdata.note_like_flag;
					//是否是视频
					//视频首帧
					//视频URL

					var needString = '<div class="goods-detail-box">' +
						'<img class="goods-img" src="' + picture_url2x + '" srcset="' + picture_url2x + ' 2x, ' + picture_url3x + ' 3x">' +
						'<div class="goods-name1">' + note_name + '</div>' +
						'<div class="goods-name2">' + note_desc + '</div>' +
						'<div class="customer-row">' +
						'<img class="customer-icon" src="' + customer_picture + '">' +
						'<div class="customer-name">' + customer_name + '</div>' +
						'<div class="like-icon like-select">' + note_like_total + '</div>' +
						'</div>' +
						'</div>';
					if (index%2==0) {
						$(needString).appendTo(".goods-left-container");
					} else if (index%2==1) {
						$(needString).appendTo(".goods-right-container");
					}
				});
			}

		})(jQuery, document);
	</script>
</html>