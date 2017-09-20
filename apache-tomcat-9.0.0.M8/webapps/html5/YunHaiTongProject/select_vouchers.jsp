<%@ page contentType="text/html;charset=GBK" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta charset="gbk">
		<title>选择抵用券</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-cache"/>
		<!-- 图标库css -->
		<link rel="stylesheet" href="css/common/iconfont/iconfont.css">
		<link rel="stylesheet" href="css/dxt.css">
		<link rel="stylesheet" href="css/find_goods/select_vouchers.css">
		<!-- 引入jquery.js -->
		<script type="text/javascript" src="js/common/jquery-2.1.4.min.js"></script>
	</head>

	<body ontouchstart="" class="container">
		<section class="select-vouchers-container row">
			<div id="can_use_container">
				<!--<div class="select-voucher-item can-use col-xs-12">
					<div class="voucher-amount col-xs-5">
						<span class="yuan">￥</span>
						<span class="amount-text">20</span>
						<span>满减券</span>
						<span class="amount-right-top-icon"></span>
						<span class="amount-right-bottom-icon"></span>
					</div>
					<div class="voucher-use-condition col-xs-7">
						<span class="full-amount-tip col-xs-12">满￥90可使用</span>
						<span class="used-store-name col-xs-12">仅适用于嘉兴市门店商品</span>
						<span class="use-endline col-xs-12">2017-06-26至2017-06-30</span>
						<span class="iconfont voucher-selected icon-xuanzhong hide">
                        <span class="iconfont icon-gou"></span>
						</span>
					</div>
				</div>-->
			</div>
			<div id="cannot_use_container">
				<!--<div class="select-voucher-item cannot-use col-xs-12">
					<div class="voucher-amount col-xs-5">
						<span class="yuan">￥</span>
						<span class="amount-text">50</span>
						<span>满减券</span>
						<span class="amount-right-top-icon"></span>
						<span class="amount-right-bottom-icon"></span>
					</div>
					<div class="voucher-use-condition col-xs-7">
						<span class="full-amount-tip col-xs-12">满￥300可使用</span>
						<span class="used-store-name col-xs-12">仅适用于嘉兴市门店商品</span>
						<span class="use-endline col-xs-12">2017-06-26至2017-06-30</span>
					</div>
				</div>-->
			</div>
			
			<!--优惠券id-->
			<input style="display: none;" id="coupon_id"/>
			<!--优惠券金额-->
			<input style="display: none;" id="coupon_amount"/>
			
		</section>
	</body>
	<script type="text/javascript" src="js/common_js/my_tools.js"></script>
	<script type="text/javascript" src="js/find_goods/select_vouchers.js"></script>
</html>