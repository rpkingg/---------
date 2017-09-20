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
		<title>����ҳ����Ʒ</title>
		<link rel="stylesheet" href="css/common_css/initialization_style.css" />
		<link rel="stylesheet" href="css/common_css/public_style.css" />
		<link rel="stylesheet" href="css/search_goods.css">
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
					<div class="goods-name1">Apple iPhone 7</div>
					<div class="goods-name2">���ֻ��������ǿ ���۱ر�<span class="search-shop-span">��ɫ�ر�� ��...</span></div>
					<div class="price-volume-row">
						<div class="new-price">��5688</div>
						<div class="old-price">��6200</div>
					</div>
				</div>
				<div class="goods-detail-box">
					<img class="goods-img" src="img/product_pic@2x.png" srcset="img/product_pic@2x.png 2x, img/product_pic@3x.png 3x">
					<div class="goods-name1">Apple iPhone 7</div>
					<div class="goods-name2">���ֻ��������ǿ ���۱ر�<span class="search-shop-span">��ɫ�ر�� ��...</span></div>
					<div class="price-volume-row">
						<div class="new-price">��5688</div>
						<div class="old-price">��6200</div>
					</div>
				</div>
			</div>
			<div class="goods-right-container">
				<div class="goods-detail-box">
					<img class="goods-img" src="img/product_pic@2x.png" srcset="img/product_pic@2x.png 2x, img/product_pic@3x.png 3x">
					<div class="goods-name1">Apple iPhone 7</div>
					<div class="goods-name2">���ֻ��������ǿ ���۱ر�<span class="search-shop-span">��ɫ�ر�� ��...</span></div>
					<div class="price-volume-row">
						<div class="new-price">��5688</div>
						<div class="old-price">��6200</div>
					</div>
				</div>
				<div class="goods-detail-box">
					<div class="search-video">��Ƶ</div>
					<img class="goods-img" src="img/video_mode.png">
					<div class="goods-name1">Apple iPhone 7</div>
					<div class="goods-name2">���ֻ��������ǿ ���۱ر�<span class="search-shop-span">��ɫ�ر�� ��...</span></div>
					<div class="price-volume-row">
						<div class="new-price">��5688</div>
						<div class="old-price">��6200</div>
					</div>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript" src="js/common_js/change_fontsize.js"></script>
	<script type="text/javascript" src="js/common_js/my_tools.js"></script>
	<script>
		(function($,document){
			//�ӿ�·��������������Ʒ���ҳ��
			var urlPath_one = "mrsyg/kqgoods/SearchGoods.form";
			var need_data = {
				"search_content": "",
				"pag_no": "1",
				"pag_num": "100"
			};
			var data_one = myAjax(urlPath_one, need_data);
			if(data_one != undefined) {
				init(data_one);
			}
			
			function init(data){
				$.each(data.goodsinfo, function(index,getdata) {
					//��Ʒid
					var product_id=getdata.product_id;
					//��Ʒ��Ƭ
					var picture_url=getdata.picture_url;
					//��Ʒ����
					var product_name=getdata.product_name;
					//��Ʒ����
					//��Ʒ�ּ�
					//��Ʒԭ��
				});
			}
			
		})(jQuery,document)
	</script>
</html>