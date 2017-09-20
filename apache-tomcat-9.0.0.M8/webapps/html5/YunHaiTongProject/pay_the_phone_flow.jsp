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
		<title>充流量</title>
		<link rel="stylesheet" href="css/common_css/initialization_style.css" />
		<link rel="stylesheet" href="css/common_css/public_style.css" />
		<link rel="stylesheet" href="css/pay_phone_bill_flow.css"/>
		<script type="text/javascript" src="js/common_js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="js/common_js/set_fontsize.js"></script>
	</head>

	<body class="background_color_FF">
		<div class="phone_input_container">
			<input class="phone_input_container_num" placeholder="请输入手机号" maxlength="13" onpropertychange="isDig();setPhoneNum(this)" oninput="setPhoneNum(this)">
			<div class="phone_input_container_content">当前充值手机号</div>
		</div>
		<div id="bill_container">
			<div class="first_line_container">
				<a class="phone_bill_item" style="">30M</a>
				<a class="phone_bill_item phone_bill_item_left">100M</a>
				<a class="phone_bill_item phone_bill_item_left">300M</a>
			</div>
			<div class="second_line_container">
				<a class="phone_bill_item">500M</a>
				<a class="phone_bill_item phone_bill_item_left">1G</a>
				<a class="phone_bill_item phone_bill_item_left">2G</a>
			</div>
		</div>
		<div class="phone_bill_need_pay">
			需付款：<span class="phone_bill_need_pay_num">￥<span class="amount">122</span></span>
		</div>
		<div class="pay_bill_btn">
			充值
		</div>
	</body>
	<script type="text/javascript" src="js/common_js/change_fontsize.js"></script>
	<script type="text/javascript" src="js/common_js/my_tools.js"></script>
	<script>
		(function($, document) {
			var feeId = 1;
			$("#bill_container").on("click",".phone_bill_item",function(){
				$(".phone_bill_item").removeClass("pay_bill_selected");
				$(this).addClass("pay_bill_selected");
				var amount = $(this).attr("fee");
				$(".amount").text(amount);
				feeId = $(this).attr("fee_id");
			});
			$(".pay_bill_btn").bind("click",function(){
				var amount = $(".amount").text();
				var mobileNum = $(".phone_input_container_num").val().replace(/\s/g,'');
				if(isMobile(mobileNum)){
					var hrefString = '?mobileNum='+mobileNum+"&amount="+amount+"&feeId="+feeId;
					native.openWebView("pay_flow.jsp"+hrefString);
				}else{
					alert("请输入正确的手机号！");
					return false;
				}
			})
			//接口路径：逛逛--充流量展示
			//http://120.76.190.223:8988/mrsyg/kqgoods/FlowFee.form
			var urlPath_bill = "mrsyg/kqgoods/FlowFee.form";
			var need_data_comment = {
			};
			
			var data = myAjax(urlPath_bill, need_data_comment);
			if(data != undefined) {
				init(data);
			}
			
			function init(datas){
				$("#bill_container").empty();
				var finalString = '';
				var endString = '</div>';
				$.each(data.feeinfo,function(index,getdatas){
					//流量id
					var flow_id = getdatas.flow_id;
					//流量名称
					var flow_name = getdatas.flow_name;
					//流量金额
					var flow_fee = getdatas.flow_fee;
					//判断是否为第一行数据
					var headString = index>=3?'<div class="second_line_container">':'<div class="first_line_container">';
					var feeString = '<a class="phone_bill_item" fee_id = "'+ flow_id +'" fee="'+ flow_fee +'">'+ flow_name +'</a>';
					if(0==index){
						feeString = '<a class="phone_bill_item pay_bill_selected" fee_id = "' + flow_id + '" fee="'+ flow_fee +'">'+ flow_name +'</a>';
						$(".amount").text(flow_fee);
					}
					if(index%3==0){
						finalString +=headString+feeString;
					}else{
						finalString +=feeString;
					}
					if(index%3==2){
						finalString += endString;
					}
				})
				$(finalString).appendTo("#bill_container");
			};
			//手机整数校验
		 	function isDig(){
				//整数正则表达式
				var re = /^[0-9]+$/;
				var count = $(".phone_input_container_num").val();
				if(!re.test(count)){
					$(".phone_input_container_num").val("");
				}
			};
		})(jQuery, document);
	</script>

</html>