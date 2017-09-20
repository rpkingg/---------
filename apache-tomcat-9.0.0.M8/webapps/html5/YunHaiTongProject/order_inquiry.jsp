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
		<title>查询订单</title>
		<link rel="stylesheet" href="css/common_css/initialization_style.css" />
		<link rel="stylesheet" href="css/common_css/public_style.css" />
		<link rel="stylesheet" href="css/order_inquiry.css">
		<script type="text/javascript" src="js/common_js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="js/common_js/set_fontsize.js"></script>
	</head>

	<body>
		<div class="fixed_head">
			<div>
				<div class="title_content">查询订单</div>
				<img class="title_back" src="img/back_btn@2x.png"  />
			</div>

			<div class="search_container">
				<div class="search_box">
					<div class="search_margin_box">
						<div class="input_info">
							<img class="ic_search" src="img/selected_gray@2x.png"  alt="">
							<div class="search_info">订单号</div>
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
							订单号 12457842121
						</div>
						<div class="inquiry_header_div1">
							顾客 王小虎
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
									<div class="row2_text">￥5688</div>
								</div>
								<div class="row2">
									<div class="good_classify">红色 32G 移动版 套餐一</div>
								</div>
								<div class="product_num">×1</div>
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
									<div class="row2_text">￥5688</div>
								</div>
								<div class="row2">
									<div class="good_classify">红色 32G 移动版 套餐一</div>
								</div>
								<div class="product_num">×1</div>
							</div>
						</div>
					</div>
				</div>
				<div class="goods_item">
					<div class="bottom_box">
						<div class="inquiry_header_div">
							订单号 12457842121
						</div>
						<div class="inquiry_header_div1">
							顾客 王小虎
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
									<div class="row2_text">￥5688</div>
								</div>
								<div class="row2">
									<div class="good_classify">红色 32G 移动版 套餐一</div>
								</div>
								<div class="product_num">×1</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--备注弹出框-->
		<div id="remarks_back" class="remark_back_div">
			<div class="remark_div">
				<div class="remark_font">备注</div>
				<div style="text-align: center;">
					<input class="remark_serial_num" placeholder="产品序列号"/>
					<input class="remark_des" placeholder="说明"/>
				</div>
				<div class="remark_opt_container">
					<div class="remark_cencle_span">取消</div>
					<div class="remark_sure_span">确定</div>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript" src="js/common_js/change_fontsize.js"></script>
	<script type="text/javascript" src="js/common_js/my_tools.js"></script>
	<script type="text/javascript">
		(function($, document) {
			var current_order = 0;
			//搜索框（获得焦点）
			$('.search_input').bind('focus', function() {
				$('.input_info').hide();
			});
			//搜索框（失去焦点）
			$('.search_input').bind('focusout', function() {
				if($('.search_input').val() == "") {
					$('.input_info').show();
				}
				var order_number = $(".search_input").val();
				//接口路径（营业员--订单管理）
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
			//点击小笔，弹出编辑框
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
					alert("该状态的订单无法修改备注！");
				}
			});
			//点击弹出框中的确定
			$(".remark_sure_span").on('click', function() {
				var serial_num = $(".remark_serial_num").val();
				var des = $(".remark_des").val();
				if(""==des){
					alert("备注信息不能为空！");
				}else{
					//接口路径（营业员--订单管理--添加备注）
					//http://120.76.190.223:8988/mrsyg/kquser/OrderRemarks.form?order_no=0000016701&customer_message=123asd测试￥&mobile_code=123
					var urlPath_one = "mrsyg/kquser/OrderRemarks.form";
					var need_data= {
						"order_no":current_order,
						"customer_message":des,
						"mobile_code":serial_num
					};
					
					var data_one = myAjax(urlPath_one, need_data);
					if(data_one != undefined) {
						
						//接口路径（营业员--订单管理）
						//http://120.76.190.223:8988/mrsyg/kquser/OrderManage.form
						
						var urlPath_one = "mrsyg/kquser/OrderManage.form";
						var need_data= {
						};
						
						var data_one = myAjax(urlPath_one, need_data);
						if(data_one != undefined) {
							alert("设置备注成功！");
							$('#remarks_back').hide();
							init(data_one);
						}
						
					}
				}
			});
			//点击弹出框中的取消
			$(".remark_cencle_span").bind("click",function(){
				$('#remarks_back').hide();
			})
			
			//订单列表初始化
			//接口路径（营业员--订单管理）
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
					//订单编号
					var order_no = datas.order_no;
					//客户名称
					var customer_name = datas.customer_name;
					//客户留言
					var customer_message = datas.customer_message;
					//订单状态
					var order_status = datas.order_status;
					//手机编号
					var mobile_code = datas.mobile_code;
					
					var orderString = '<div class="goods_item">' +
										'<div class="bottom_box">' +
											'<div class="inquiry_header_div">' +
												'订单号' + order_no +
											'</div>'+
											'<div class="inquiry_header_div1">'+
												'顾客 ' + customer_name +
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
						//商品名称
						var product_name = getdata.product_name;
						//商品id
						var product_id = getdata.product_id;
						//商品数量
						var product_number = getdata.product_number;
						//商品价格
						var product_price = getdata.product_price;
						//颜色
						var color = getdata.color;
						//内存容量
						var memory_capacity = getdata.memory_capacity;
						//供应商名称
						var supplier_name = getdata.supplier_name;
						//套餐名称
						var contract_name = getdata.contract_name;
						//商品照片
						var picture_url = getdata.picture_url;
						
						//商品间的水平线
						var lineString ='<div class="line"></div>';
						//商品信息
						var goodString = '<div class="good">' +
											'<div class="good_photo">' +
												/*'<img class="goods_img" src="' + picture_url srcset="img/product_pic@2x.png 2x, img/product_pic@3x.png 3x" alt="">*/
												'<img class="goods_img" src="' + picture_url + '">'+
											'</div>' +
											'<div class="good_info">' +
												'<div class="row1">' +
													'<div class="good_name">' + product_name +'</div>' +
													'<div class="row2_text">￥' + product_price +'</div>' +
												'</div>' +
												'<div class="row2">' +
													'<div class="good_classify">' +color + ' ' + memory_capacity +' '+supplier_name+' '+ contract_name + '</div>' +
												'</div>' +
												'<div class="product_num">×' + product_number + '</div>' +
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