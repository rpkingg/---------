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
		<title>��ѯ����</title>
		<link rel="stylesheet" href="css/common_css/initialization_style.css" />
		<link rel="stylesheet" href="css/common_css/public_style.css" />
		<link rel="stylesheet" href="css/order_inquiry.css">
		<script type="text/javascript" src="js/common_js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="js/common_js/set_fontsize.js"></script>
	</head>

	<body>
		<div class="fixed_head">
			<div>
				<div class="title_content">��ѯ����</div>
				<img class="title_back" src="img/back_btn@2x.png"  />
			</div>

			<div class="search_container">
				<div class="search_box">
					<div class="search_margin_box">
						<div class="input_info">
							<img class="ic_search" src="img/selected_gray@2x.png"  alt="">
							<div class="search_info">������</div>
						</div>
						<input class="search_input" type="text">
					</div>
				</div>
			</div>
		</div>

		<div class="product_container">
			<div class="car_container">
				<div class="goods_item">
					<div class="bottom_box">
						<div class="inquiry_header_div">
							������ 12457842121
						</div>
						<div class="inquiry_header_div1">
							�˿� ��С��
						</div>
						<div class="line_vertical"></div>
						<div class="inquiry_header_div2">
							<img class="edit_img" src="img/edit_btn@2x.png"  alt="">
						</div>
						<div class="line_all line_top"></div>
						<div class="good">
							<div class="good_photo">
								<img class="goods_img" src="img/product_pic@2x.png" alt="">
							</div>
							<div class="good_info">
								<div class="row1">
									<div class="good_name">Apple iPhone 7</div>
									<div class="row2_text">��5688</div>
								</div>
								<div class="row2">
									<div class="good_classify">��ɫ 32G �ƶ��� �ײ�һ</div>
								</div>
								<div class="product_num">��1</div>
							</div>
						</div>
						<div class="line"></div>
						<div class="good">
							<div class="good_photo">
								<img class="goods_img" src="img/product_pic@2x.png" alt="">
							</div>
							<div class="good_info">
								<div class="row1">
									<div class="good_name">Apple iPhone 7</div>
									<div class="row2_text">��5688</div>
								</div>
								<div class="row2">
									<div class="good_classify">��ɫ 32G �ƶ��� �ײ�һ</div>
								</div>
								<div class="product_num">��1</div>
							</div>
						</div>
					</div>
				</div>
				<div class="goods_item">
					<div class="bottom_box">
						<div class="inquiry_header_div">
							������ 12457842121
						</div>
						<div class="inquiry_header_div1">
							�˿� ��С��
						</div>
						<div class="line_vertical"></div>
						<div class="inquiry_header_div2">
							<img class="edit_img" src="img/edit_btn@2x.png" alt="">
						</div>
						<div class="line_all line_top"></div>
						<div class="good">
							<div class="good_photo">
								<img class="goods_img" src="img/product_pic@2x.png" alt="">
							</div>
							<div class="good_info">
								<div class="row1">
									<div class="good_name">Apple iPhone 7</div>
									<div class="row2_text">��5688</div>
								</div>
								<div class="row2">
									<div class="good_classify">��ɫ 32G �ƶ��� �ײ�һ</div>
								</div>
								<div class="product_num">��1</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--��ע������-->
		<div id="remarks_back" class="remark_back_div">
			<div class="remark_div">
				<div class="remark_font">��ע</div>
				<div style="text-align: center;">
					<input class="remark_serial_num" placeholder="��Ʒ���к�"/>
					<input class="remark_des" placeholder="˵��"/>
				</div>
				<div class="remark_opt_container">
					<div class="remark_cencle_span">ȡ��</div>
					<div class="remark_sure_span">ȷ��</div>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript" src="js/common_js/change_fontsize.js"></script>
	<script type="text/javascript" src="js/common_js/my_tools.js"></script>
	<script type="text/javascript">
		(function($, document) {
			var current_order = 0;
			//�����򣨻�ý��㣩
			$('.search_input').bind('focus', function() {
				$('.input_info').hide();
			});
			//������ʧȥ���㣩
			$('.search_input').bind('focusout', function() {
				if($('.search_input').val() == "") {
					$('.input_info').show();
				}
				var order_number = $(".search_input").val();
				//�ӿ�·����ӪҵԱ--��������
				//http://120.76.190.223:8988/mrsyg/kquser/OrderManage.form
				
				var urlPath_one = "mrsyg/kquser/OrderManage.form";
				var need_data= {
					"order_no":order_number
				};
				
				var data_one = myAjax(urlPath_one, need_data);
				if(data_one != undefined) {
					init(data_one);
				}
			});
			//���С�ʣ������༭��
			$(".car_container").on('click','.edit_img',function(){
				var status=$(this).attr("status");
				var ser_no=$(this).attr("serno");
				var msg=$(this).attr("message");
				current_order = $(this).attr("order_no");
				if('1'==status||'2'==status){
					$(".remark_serial_num").val(ser_no);
					$(".remark_des").val(msg);
					$('#remarks_back').show();
				}else{
					alert("��״̬�Ķ����޷��޸ı�ע��");
				}
			});
			//����������е�ȷ��
			$(".remark_sure_span").on('click', function() {
				var serial_num = $(".remark_serial_num").val();
				var des = $(".remark_des").val();
				if(""==des){
					alert("��ע��Ϣ����Ϊ�գ�");
				}else{
					//�ӿ�·����ӪҵԱ--��������--��ӱ�ע��
					//http://120.76.190.223:8988/mrsyg/kquser/OrderRemarks.form?order_no=0000016701&customer_message=123asd���ԣ�&mobile_code=123
					var urlPath_one = "mrsyg/kquser/OrderRemarks.form";
					var need_data= {
						"order_no":current_order,
						"customer_message":des,
						"mobile_code":serial_num
					};
					
					var data_one = myAjax(urlPath_one, need_data);
					if(data_one != undefined) {
						
						//�ӿ�·����ӪҵԱ--��������
						//http://120.76.190.223:8988/mrsyg/kquser/OrderManage.form
						
						var urlPath_one = "mrsyg/kquser/OrderManage.form";
						var need_data= {
						};
						
						var data_one = myAjax(urlPath_one, need_data);
						if(data_one != undefined) {
							alert("���ñ�ע�ɹ���");
							$('#remarks_back').hide();
							init(data_one);
						}
						
					}
				}
			});
			//����������е�ȡ��
			$(".remark_cencle_span").bind("click",function(){
				$('#remarks_back').hide();
			})
			
			//�����б��ʼ��
			//�ӿ�·����ӪҵԱ--��������
			//http://120.76.190.223:8988/mrsyg/kquser/OrderManage.form?order_no=1
			
			var urlPath_one = "mrsyg/kquser/OrderManage.form";
			var need_data= {
				"order_no":""
			};
			
			var data_one = myAjax(urlPath_one, need_data);
			if(data_one != undefined) {
				init(data_one);
			}
			
			function init(data){	
				$(".car_container").empty();
				$.each(data.orderinfo,function(index,datas){
					//�������
					var order_no = datas.order_no;
					//�ͻ�����
					var customer_name = datas.customer_name;
					//�ͻ�����
					var customer_message = datas.customer_message;
					//����״̬
					var order_status = datas.order_status;
					//�ֻ����
					var mobile_code = datas.mobile_code;
					
					var orderString = '<div class="goods_item">' +
										'<div class="bottom_box">' +
											'<div class="inquiry_header_div">' +
												'������' + order_no +
											'</div>'+
											'<div class="inquiry_header_div1">'+
												'�˿� ' + customer_name +
											'</div>' +
											'<div class="line_vertical"></div>' +
											'<div class="inquiry_header_div2">' +
												'<img class="edit_img" src="img/edit_btn@2x.png" serno="'+mobile_code+'" message="'+customer_message+'" status="'+order_status+
												'" order_no="'+order_no+'">' +
											'</div>' +
											'<div class="line_all line_top"></div>';
					
					//$(".remark_serial_num").val(order_no);
					//$(".remark_des").val(customer_message);
					
					$.each(datas.goodsinfo, function(index,getdata) {
						//��Ʒ����
						var product_name = getdata.product_name;
						//��Ʒid
						var product_id = getdata.product_id;
						//��Ʒ����
						var product_number = getdata.product_number;
						//��Ʒ�۸�
						var product_price = getdata.product_price;
						//��ɫ
						var color = getdata.color;
						//�ڴ�����
						var memory_capacity = getdata.memory_capacity;
						//��Ӧ������
						var supplier_name = getdata.supplier_name;
						//�ײ�����
						var contract_name = getdata.contract_name;
						//��Ʒ��Ƭ
						var picture_url = getdata.picture_url;
						
						//��Ʒ���ˮƽ��
						var lineString ='<div class="line"></div>';
						//��Ʒ��Ϣ
						var goodString = '<div class="good">' +
											'<div class="good_photo">' +
												/*'<img class="goods_img" src="' + picture_url srcset="img/product_pic@2x.png 2x, img/product_pic@3x.png 3x" alt="">*/
												'<img class="goods_img" src="' + picture_url + '">'+
											'</div>' +
											'<div class="good_info">' +
												'<div class="row1">' +
													'<div class="good_name">' + product_name +'</div>' +
													'<div class="row2_text">��' + product_price +'</div>' +
												'</div>' +
												'<div class="row2">' +
													'<div class="good_classify">' +color + ' ' + memory_capacity +' '+supplier_name+' '+ contract_name + '</div>' +
												'</div>' +
												'<div class="product_num">��' + product_number + '</div>' +
											'</div>' +
										'</div>';
						
						
						if(0==index){
							orderString+=goodString;
						}else{
							orderString+=lineString+goodString;
						}
					});
					orderString += '</div></div>';
					$(orderString).appendTo(".car_container");
				})					
			}
		})(jQuery, document);
	</script>
</html>