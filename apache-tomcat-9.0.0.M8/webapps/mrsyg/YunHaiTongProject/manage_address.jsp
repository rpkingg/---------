<%@ page contentType="text/html;charset=GBK" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta charset="gbk">
		<title>管理收货地址</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-cache"/>
		<!-- 图标库css -->
		<link rel="stylesheet" href="css/common/iconfont/iconfont.css">
		<link rel="stylesheet" href="css/dxt.css">
		<link rel="stylesheet" href="css/find_goods/manage_address.css">
		<!-- 引入jquery.js -->
		<script type="text/javascript" src="js/common/jquery-2.1.4.min.js"></script>
	</head>

	<body ontouchstart="" class="container">
		<section class="manage-address-container row">
			<!--<div class="goods-address-item col-xs-12" id="00">
				<div class="goods-address col-xs-12">
					<span class="address-user-info col-xs-12"><span class="receiver_name">李敏</span>(<span class="receiver_phone">13965025668</span>)</span>
					<span class="address-detail-info col-xs-12">
                    	<span class="receiver_area">安徽省&nbsp;合肥市&nbsp;政务区&nbsp;</span>
					<span class="receiver_detail_area">怀宁路天鹅湖万达2号写字楼1702室</span></span>
				</div>
				<div class="address-opt-bar col-xs-12">
					<div class="set-default col-xs-6" set-default-get-goods-address>
						<span class="iconfont icon-quan"></span>
						<span>设为默认</span>
					</div>
					<div class="del-address col-xs-2 col-xs-offset-1 text-right">
						<span class="iconfont icon-shanchu"></span>
						<span>删除</span>
					</div>
					<div class="edit-address col-xs-2 col-xs-offset-1 text-right">
						<span class="iconfont icon-bianji2"></span>
						<span>编辑</span>
					</div>
				</div>
			</div>-->
			<!--<div class="goods-address-item col-xs-12" id="01">
				<div class="goods-address col-xs-12">
					<span class="address-user-info col-xs-12"><span class="receiver_name">李敏</span>(<span class="receiver_phone">13965025668</span>)</span>
					<span class="address-detail-info col-xs-12">
                    	<span class="receiver_area">安徽省&nbsp;合肥市&nbsp;政务区&nbsp;</span>
					<span class="receiver_detail_area">怀宁路天鹅湖万达2号写字楼1702室</span></span>
				</div>
				<div class="address-opt-bar col-xs-12">
					<div class="set-default col-xs-6" set-default-get-goods-address>
						<span class="iconfont icon-xuanzedui"></span>
						<span class="default-text">设为默认</span>
					</div>
					<div class="del-address col-xs-2 col-xs-offset-1 text-right">
						<span class="iconfont icon-shanchu"></span>
						<span>删除</span>
					</div>
					<div class="edit-address col-xs-2 col-xs-offset-1 text-right">
						<span class="iconfont icon-bianji2"></span>
						<span>编辑</span>
					</div>
				</div>
			</div>-->
			
		</section>
		<div class="add_new_address">添加地址</div>
		
			
		<!--新增收货地址页面-->
         <div class="iframe_container" id="iframe_addOrEdit_address">
			<iframe id="iframe_addOrEdit_address_id" src="addOrEdit_address.html" width="100%" height="100%" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
		</div>
		
		<!--存储选中的收货地址信息-->
		<input style="display: none;" id="selected_manage_address_name" placeholder="收货人姓名"/>
		<input style="display: none;" id="selected_manage_address_phone" placeholder="收货人电话"/>
		<input style="display: none;" id="selected_manage_address_area" placeholder="收货地址（省市区）"/>
		<input style="display: none;" id="selected_manage_address_detail_area" placeholder="收货地址(详细地址)"/>
		<input style="display: none;" id="selected_manage_address_id" placeholder="地址id"/>
		<input style="display: none;" id="selected_manage_address_use_flag" placeholder="地址是否可用"/>
		
		<!--存储编辑收货地址的信息-->
		<input style="display: none;" id="edit_manage_address_name" placeholder="收货人姓名"/>
		<input style="display: none;" id="edit_manage_address_phone" placeholder="收货人电话"/>
		<input style="display: none;" id="edit_manage_address_area" placeholder="收货地址（省市区）"/>
		<input style="display: none;" id="edit_manage_address_detail_area" placeholder="收货地址(详细地址)"/>
		<input style="display: none;" id="edit_manage_address_id" placeholder="地址id"/>
		<input style="display: none;" id="edit_manage_address_use_flag" placeholder="地址是否可用"/>
	</body>
	<script type="text/javascript" src="js/common_js/my_tools.js"></script>
	<script type="text/javascript" src="js/find_goods/manage_address.js"></script>
</html>