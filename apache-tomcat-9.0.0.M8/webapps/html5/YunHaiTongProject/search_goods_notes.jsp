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
		<title>����ҳ���ۺ�ҳ</title>
		<link rel="stylesheet" href="css/common_css/initialization_style.css" />
		<link rel="stylesheet" href="css/common_css/public_style.css" />
		<link rel="stylesheet" href="css/search_goods_notes.css"/>
		<script type="text/javascript" src="js/common_js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="js/common_js/set_fontsize.js"></script>
	</head>
	<body>
		<div class="search_title_container">
			<span class="serach_type_name">�ʼ�</span>
			<span class="check_more">�鿴����</span>
			<img class="check_more_btn" src="img/play_btn.png" />
		</div>
		<div class="background_color_FF">
			<div id="notes_container_id">
				<div class="notes_container">
					<div class="note_name">��Ҷ������Ѫ֢���Ʊ���iphone7��ɫ�ر��Ҷ������Ѫ֢���Ʊ���iphone7��ɫ�ر�</div>
					<div class="note_author_container">
						<img class="note_author_pic" src=""/>
						<span class="note_author_name">������</span>
						<span class="note_publish_date">2017-07-07</span>
					</div>
				</div>
				<div class="line_all"></div>
				<div class="notes_container">
					<div class="note_name">��Ҷ������Ѫ֢���Ʊ���iphone7��ɫ�ر��Ҷ������Ѫ֢���Ʊ���iphone7��ɫ�ر�</div>
					<div class="note_author_container">
						<img class="note_author_pic" src=""/>
						<span class="note_author_name">������</span>
						<span class="note_publish_date">2017-07-07</span>
					</div>
				</div>
			</div>
		</div>
		<div class="search_title_container">
			<span class="serach_type_name">��Ʒ</span>
			<span class="check_more">�鿴����</span>
			<img class="check_more_btn" src="img/play_btn.png" />
		</div>
		<div class="background_color_FF">
			<div id="goods_container_id">
				<div class="goods_container">
					<img class="good_img" src=""/>
					<div class="good_information_container">
						<div class="good_name">���� note5��ɫ32g</div>
						<div class="good_price">��6288</div>
					</div>
				</div>
				<div class="line_all"></div>
				<div class="goods_container">
					<img class="good_img" src=""/>
					<div class="good_information_container">
						<div class="good_name">���� note5��ɫ32g</div>
						<div class="good_price">��6288</div>
					</div>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript" src="js/common_js/change_fontsize.js"></script>
	<script type="text/javascript" src="js/common_js/my_tools.js"></script>
	<script>
/*		(function($,ddocument){
			
		})(jQuery,document)*/
		
		(function($, document) {
			//�ӿ�·������ҳ����--û��ѡ��ʼǻ�����Ʒ����չʾ��
			//http://120.76.190.223:8988/mrsyg/kqgoods/DefaultSearch.form?search_content=����
			var urlPath_one = "mrsyg/kqgoods/DefaultSearch.form";
			var need_data = {
				"search_content":"����"
			};
			var data_one = myAjax(urlPath_one, need_data);
			if(data_one != undefined) {
				init(data_one);
			}

			function init(datas) {
				$("#notes_container_id").empty();
				$("#goods_container_id").empty();
				$.each(datas.noteinfo, function(index, getdata) {
					//ӪҵԱͼƬ
					var customer_picture = getdata.customer_picture;
					//ӪҵԱid
					var assistant_id = getdata.assistant_id;
					//ӪҵԱ����
					var customer_name = getdata.customer_name;
					//�ʼ�id
					var note_id = getdata.note_id;
					//�ʼ�����
					var note_name = getdata.note_name;
					//�ʼǴ���ʱ��
					var created_at = getdata.created_at;
					
					if(index>0){
							var lineString = '<div class="line_all"></div>';						
							$(lineString).appendTo("#note_container_id");
					}
					
					var needString = '<div class="notes_container">' +
						'<div class="note_name">'+note_name+'</div>' +
							'<div class="note_author_container">' +
								'<img class="note_author_pic" src="'+customer_picture+'"/>'+
								'<span class="note_author_name">'+customer_name+'</span>' +
								'<span class="note_publish_date">'+created_at+'</span>' +
							'</div>'+
						'</div>' ;
						
						
					$(needString).appendTo("#notes_container_id");
				});
				
				
				$.each(datas.goodsinfo, function(index, getdata) {
			
						//��Ʒid
						var product_id = getdata.product_id;
						//��Ʒ����
						var product_name = getdata.product_name;
						//��Ʒ��Ƭ
						var picture_url = getdata.picture_url;
						//��Ʒ�۸�
						var product_price = getdata.product_price;
						
						if(index>0){
							var lineString = '<div class="line_all"></div>';						
							$(lineString).appendTo("#goods_container_id");
						}
						
						var needString = '<div class="goods_container">' +
								'<img class="good_img" src="'+picture_url+'"/>'+
								'<div class="good_information_container">'+
									'<div class="good_name">'+product_name+'</div>'+
									'<div class="good_price">'+product_price+'</div>'+
								'</div>'+
							'</div>';
						$(needString).appendTo("#goods_container_id");
					
				});
			}
		})(jQuery, document);
		
	</script>
</html>