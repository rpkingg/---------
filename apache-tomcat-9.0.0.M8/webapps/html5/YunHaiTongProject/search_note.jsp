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
		<title>����ҳ���ʼ�</title>
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
			<div class="search-header-div1">ȡ��</div>
		</div>
		<div class="line_interval"></div>
		<div class="goods-container">
			<div class="goods-left-container">
				<div class="goods-detail-box">
					<img class="goods-img" src="img/product_pic@2x.png" srcset="img/product_pic@2x.png 2x, img/product_pic@3x.png 3x">
					<div class="goods-name1">��Ҷ������Ѫ֢���Ʊ��� iPhone 7��ɫ�ر�...</div>
					<div class="goods-name2">�ԴӺ�ɫ�ر���ֻ����к� ��Ҷ����й���ò�ƻ����ر�</div>
					<div class="customer-row">
						<img class="customer-icon" src="img/adviser_two@2x.png" srcset="img/adviser_two@2x.png 2x, img/adviser_two@3x.png 3x">
						<div class="customer-name">LI_MEI</div>
						<div class="like-icon">750</div>
					</div>
				</div>
				<div class="goods-detail-box">
					<img class="goods-img" src="img/product_pic@2x.png" srcset="img/product_pic@2x.png 2x, img/product_pic@3x.png 3x">
					<div class="goods-name1">��Ҷ������Ѫ֢���Ʊ��� iPhone 7��ɫ�ر�...</div>
					<div class="goods-name2">�ԴӺ�ɫ�ر���ֻ����к� ��Ҷ����й���ò�ƻ����ر�</div>
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
					<div class="goods-name1">��Ҷ������Ѫ֢���Ʊ��� iPhone 7��ɫ�ر�...</div>
					<div class="goods-name2">�ԴӺ�ɫ�ر���ֻ����к� ��Ҷ����й���ò�ƻ����ر�</div>
					<div class="customer-row">
						<img class="customer-icon" src="img/adviser_two@2x.png" srcset="img/adviser_two@2x.png 2x, img/adviser_two@3x.png 3x">
						<div class="customer-name">LI_MEI</div>
						<div class="like-icon like-select">750</div>
					</div>
				</div>
				<div class="goods-detail-box">
					<div class="search-video">��Ƶ</div>
					<img class="goods-img" src="img/video_mode.png">
					<div class="goods-name1">��ɽ��ֹ��Exynos 8�ǳ����ڵ�ʲô��</div>
					<div class="goods-name2">Ƶ�ʴ�2.6GHz�ġ�è������ �ģ���Ч��SCI���ǻ����ܹ�</div>
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
			//����
			$('.like-icon').bind('click', function() {
				if($(this).hasClass('like-select')) {
					$(this).removeClass('like-select');
				} else {
					$(this).addClass('like-select');
				}
			});

			//�ӿ�·�������������ʼǽ��ҳ��
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
					//�ʼǱ��
					var note_id = getdata.note_id;
					//�ʼ���Ƭ
					var picture_url = getdata.picture_url;
					picture_url2x = getDifferencePic(picture_url, "2x_");
					picture_url3x = getDifferencePic(picture_url, "3x_");
					//�ʼ�����
					var note_name = getdata.note_name;
					//�ʼ�����
					var note_desc = getdata.note_desc;
					//ӪҵԱͷ��
					var customer_picture = getdata.customer_picture;
					//ӪҵԱ����
					var customer_name = getdata.customer_name;
					//ӪҵԱid
					var customer_id = getdata.customer_id;
					//��������
					var note_like_total = getdata.note_like_total;
					//�Ƿ񱻵���(-1�ѵ���,1δ����)
					var note_like_flag = getdata.note_like_flag;
					//�Ƿ�����Ƶ
					//��Ƶ��֡
					//��ƵURL

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