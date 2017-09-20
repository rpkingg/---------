<%@ page contentType="text/html;charset=GBK" language="java" %>
<%@ include file="/YunHaiTongProject/common/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<meta charset="gbk">
		<title>我的--收藏单（笔记-商品-店铺）</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-cache"/>
		<link rel="stylesheet" href="css/common/iconfont/iconfont.css">
		<link rel="stylesheet" href="css/dxt.css">
		<link rel="stylesheet" href="css/my_user_side/collect_notes.css?ts=${ts}">
		<link rel="stylesheet" href="css/my_user_side/collect_goods.css?ts=${ts}">
		<link rel="stylesheet" href="css/my_user_side/collect_stores.css?ts=${ts}">
		<script type="text/javascript" src="js/common/jquery-2.1.4.min.js"></script>
	</head>

	<body ontouchstart="" class="container">
		<section class="collect-notes-container row text-center">
			<header class="collect-list-nav-bar col-xs-12">
				<div class="collect-nav-bar col-xs-12">
					<span class="collect-notes active col-xs-4" id="note">笔记&nbsp;·&nbsp;<b id="node_num">0</b></span>
					<span class="col-xs-4" id="goods">商品&nbsp;·&nbsp;<b id="goods_num">0</b></span>
					<span class="col-xs-4" id="shop">店铺&nbsp;·&nbsp;<b id="shop_num">0</b></span>
				</div>
				<span class="break-line-bar col-xs-12"></span>
			</header>
			<!--收藏的笔记-->
			<div id="collection_note_container">
				<div class="collect-notes-content col-xs-12 hide">
					<div class="notes-left-item col-xs-6">
						
						<!--<div class="note-item col-xs-12">
							<div class="note-cover col-xs-12">
								<img src="image/my_user_side/292727D6-F304-48B9-B9C3-A62DC4CFAF6C.png" />
							</div>
							<span class="note-title col-xs-12 text-left">大家多年的晕血症估计被这iphone7红色特别...</span>
							<span class="note-intro-text col-xs-12 text-left">
	                    		自从红色特别版手机上市后大家对这中国红貌似还是情
	                    </span>
							<span class="collect-time col-xs-12 text-left">
		                    	<span class="iconfont icon-shijian"></span>
							<span class="collect-time-text">2017-06-29</span>
							</span>
							<span class="edit-icon hide">
	                    		<span class="iconfont icon-gou"></span>
							</span>
						</div>-->
						
						
					</div>
					<div class="notes-right-item col-xs-6">
						
						<!--<div class="note-item col-xs-12">
							<div class="note-cover col-xs-12">
								<video controls="controls" src="" poster="image/my_user_side/78D72D60-E50E-41C1-9BA0-30C01ACE3B44.png">
								</video>
								<span class="video-icon">视频</span>
							</div>
							<span class="note-title col-xs-12 text-left">大家多年的晕血症估计被这iphone7红色特别...</span>
							<span class="note-intro-text col-xs-12 text-left">
	                    		自从红色特别版手机上市后大家对这中国红貌似还是情
	                    </span>
							<span class="collect-time col-xs-12 text-left">
		                    	<span class="iconfont icon-shijian"></span>
							<span class="collect-time-text">2017-06-29</span>
							</span>
							<span class="edit-icon hide">
	                    		<span class="iconfont icon-gou"></span>
							</span>
						</div>-->
						
					</div>
				</div>
				<div class="notes-edit-opt-nar col-xs-12 edit-btn">
					<span class="notes-edit col-xs-12">编辑</span>
				</div>
				<div class="notes-edit-opt-nar col-xs-12 delete_btn hide">
					<span class="notes-edit col-xs-12">删除</span>
				</div>

				<div class="collection1">
					<img src="img/collection.png" class="collection_img"/>
					<p class="collection_text">暂无收藏</p>
				</div>
			</div>
			<!--收藏的商品-->
			<div id="collection_goods_container" style="display: none;">
				<div class="collect-goods-content col-xs-12 hide">
					<!--<div class="collect-goods-item col-xs-12">
						<span class="edit-icon hide">
                    		<span class="iconfont icon-quan"></span>
						</span>
						<div class="goods-pic col-xs-2">
							<img src="image/my_user_side/267F75AB-D89E-4F7D-8ECE-35DEA8CDADAA.png" />
						</div>
						<span class="goods-name col-xs-9 text-left">Apple iphone 7 红色特别版</span>
					</div>-->
				</div>
			<div class="notes-edit-opt-nar col-xs-12 edit-btn-goods">
				<span class="notes-edit col-xs-12">编辑</span>
			</div>
			<div class="notes-edit-opt-nar col-xs-12 delete_btn_goods hide">
				<span class="notes-edit col-xs-12">删除</span>
			</div>
			<div class="collection2">
				<img src="img/collection.png" class="collection_img"/>
				<p class="collection_text">暂无收藏</p>
			</div>
			</div>
			<!--收藏的店铺-->
			<div id="collection_shop_container" style="display: none;">
				<div class="collect-stores-content col-xs-12 hide">
					<!--<div class="collect-stores-item col-xs-12">
						<span class="edit-icon hide">
                    		<span class="iconfont icon-quan"></span>
						</span>
						<span class="stores-name col-xs-12 text-left">上海IFC国金中心店</span>
					</div>-->
					
				</div>

			<div class="notes-edit-opt-nar col-xs-12 edit-btn-shop">
				<span class="notes-edit col-xs-12">编辑</span>
			</div>
			<div class="notes-edit-opt-nar col-xs-12 delete_btn_shop hide">
				<span class="notes-edit col-xs-12">删除</span>
			</div>
				<div class="collection3">
					<img src="img/collection.png" class="collection_img"/>
					<p class="collection_text">暂无收藏</p>
				</div>
			</div>
		</section>
	</body>
	<c:if test="${DEBUG}"><script type="text/javascript" src="js/common_js/vconsole.min.js"></script> </c:if>
	<script type="text/javascript" src="js/common_js/my_tools.js?ts=${ts}"></script>
	<script type="text/javascript" src="js/my_user_side/collect_notes.js?ts=${ts}"></script>
</html>