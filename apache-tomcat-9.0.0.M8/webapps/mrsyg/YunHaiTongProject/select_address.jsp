<%@ page contentType="text/html;charset=GBK" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta charset="gbk">
		<title>选择收货地址</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-cache"/>
		<!-- 图标库css -->
		<link rel="stylesheet" href="css/common/iconfont/iconfont.css">
		<link rel="stylesheet" href="css/dxt.css">
		<link rel="stylesheet" href="css/find_goods/select_address.css">
		<!-- 引入jquery.js -->
		<script type="text/javascript" src="js/common/jquery-2.1.4.min.js"></script>
	</head>

	<body ontouchstart="" class="container">
		<section class="select-address-container row" id="goods_address_container">
			<!--<div class="goods-address-item col-xs-12" id="1" userFlag="1">
                <div class="select-icon col-xs-1">
                    <span class="selected-address iconfont icon-quan icon-xuanzedui"></span>
                </div>
                <div class="goods-address col-xs-11 pull-right">
                    <span class="address-user-info col-xs-12"><span id="receiver_name_id">李敏1</span>(<span id="receiver_phone_id">13965025668</span>)</span>
                    <span class="address-detail-info col-xs-12">
                        <span class="default-address-tip">[默认地址]</span>
                        <span id="address_content_id">安徽省&nbsp;合肥市&nbsp;政务区&nbsp;怀宁路天鹅湖万达1号写字楼1702室</span>
                    </span>
                </div>
            </div>
            <div class="goods-address-item col-xs-12" id="1" userFlag="1">
                <div class="select-icon col-xs-1">
                    <span class="selected-address iconfont icon-quan"/>
                </div>
                <div class="goods-address col-xs-11 pull-right">
                    <span class="address-user-info col-xs-12"><span id="receiver_name_id">李敏2</span>(<span id="receiver_phone_id">13965025668</span>)</span>
                    <span class="address-detail-info col-xs-12">
                        <span id="address_content_id">安徽省&nbsp;合肥市&nbsp;政务区&nbsp;怀宁路天鹅湖万达2号写字楼1702室</span>
                    </span>
                </div>
            </div>
            <div class="goods-address-item col-xs-12" id="1" userFlag="0">
                <div class="select-icon col-xs-1">
                    <span class="selected-address iconfont icon-quan"/>
                </div>
                <div class="goods-address col-xs-11 pull-right">
                    <span class="address-user-info col-xs-12"><span id="receiver_name_id">李敏3</span>(<span id="receiver_phone_id">13965025668</span>)</span>
                    <span class="address-detail-info col-xs-12">
                        <span id="address_content_id">安徽省&nbsp;合肥市&nbsp;政务区&nbsp;怀宁路天鹅湖万达3号写字楼1702室</span>
                    </span>
                </div>
            </div>-->
		</section>
		<div class="no_address">
			<img class="no_address_img" src="img/no_address_icon.png" />
			<div class="no_address_content_one">当前没有收货地址，请新增 一条吧！</div>
			<div class="add_new_address_btn">新增收货地址</div>
		</div>
		<div class="manage_address">管理</div>

		<!--新增收货地址页面-->
		<div class="iframe_container" id="iframe_addOrEdit_address">
			<iframe id="iframe_addOrEdit_address_id" src="addOrEdit_address.html" width="100%" height="100%" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
		</div>

		<!--管理收货地址页面-->
		<div class="iframe_container" id="iframe_manage_address">
			<iframe id="iframe_manage_address_id" src="manage_address.html" width="100%" height="100%" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
		</div>
		
		<!--存储选中收货地址的信息-->
		<input style="display: none;" id="receiver_address_id" placeholder="收货地址id"/>
		<input style="display: none;" id="receiver_address_content" placeholder="收货地址"/>
		<input style="display: none;" id="receiver_name" placeholder="收货人名称"/>
		<input style="display: none;" id="receiver_phone" placeholder="收货人电话"/>
		
		
	</body>
	<script type="text/javascript" src="js/common_js/my_tools.js"></script>
	<script type="text/javascript" src="js/find_goods/select_address.js"></script>

</html>