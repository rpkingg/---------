<%@ page contentType="text/html;charset=GBK" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta charset="gbk">
		<title>商品详情</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta http-equiv="Cache-Control" content="no-cache"/>
		<meta name="renderer" content="webkit">

		<!-- 图标库css -->
		<link rel="stylesheet" href="css/common/iconfont/iconfont.css">
		<!-- 图片轮播css -->
		<link rel="stylesheet" href="css/common/swiper-3.4.2.min.css">
		<link rel="stylesheet" href="css/dxt.css">
		<link rel="stylesheet" href="css/find_goods/goods_detail.css">
		<!-- 引入jquery.js -->
		<script type="text/javascript" src="js/common/jquery-2.1.4.min.js"></script>
		<!-- 图片轮播js -->
		<script type="text/javascript" src="js/common/swiper-3.4.2.jquery.min.js"></script>
		<script type="text/javascript" src="js/common_js/vconsole.min.js"></script>
		<script type="text/javascript">
			//安卓方法
			$(function () {
				if(window.native!=null&&typeof(window.native)!="undefined"){
					native.setTitleRight("分享");
				}else{
					alert(typeof(window.native));
				}
			})
		</script>
	</head>

	<body ontouchstart="" class="container">
		<section class="goods-detail-hearder-bar row">
			<div class="hearder-tab-bar col-xs-12 text-center">
				<span class="goods-base-bar active col-xs-2 col-xs-offset-3">商品</span>
				<span class="goods-comments-bar col-xs-2">评价</span>
				<span class="goods-detail-bar col-xs-2">详情</span>
			</div>
		</section>
		<section class="goods-detail-container row text-center">
			<section class="goods-base-target col-xs-12">
				<div class="goods-pics-container col-xs-12">
					<div class="swiper-container">
						<div class="swiper-wrapper" id="product_pic_container_id">
							<!--<div class="swiper-slide swiper-no-swiping" item-index="0" total="3" item-type="img">
								<img src="image/find_goods/D4F17AE5-80D9-48B2-8EBC-A9A995998504.png">
							</div>
							<div class="swiper-slide swiper-no-swiping" item-index="1" total="3" item-type="video">
								<video controls="controls" src="" poster="image/my_user_side/78D72D60-E50E-41C1-9BA0-30C01ACE3B44.png">
								</video>
							</div>
							<div class="swiper-slide swiper-no-swiping" item-index="2" total="3" item-type="img">
								<img src="image/find_goods/D4F17AE5-80D9-48B2-8EBC-A9A995998504.png">
							</div>-->
						</div>
						<!-- 如果需要分页器 -->
						<div class="swiper-pagination"></div>
					</div>
				</div>
				<div class="goods-base-info-container col-xs-12 text-left">
					<span class="goods-price-container col-xs-12">
                    <span class="goods-price-new col-xs-5" id="product_new_price_id">￥5688</span>
					<span class="goods-price-old col-xs-4" id="product_old_price_id">￥6200</span>
					<!--限时购商品详情，限时剩余时间-->
					<span class="remain-time-tip col-xs-6 text-right">距结束还剩<span class="remain-time"></span></span>
					</span>
					<span class="goods-title col-xs-12" id="product_name_id">苹果 iphone 7</span>
					<!--<span class="goods-attr col-xs-12" id="product_desc_id">果粉必备红色特别版 果粉必备红色特别版 果粉必备红色特别版 果粉必备红色特别版</span>-->
				</div>
				<span class="break-line-bar col-xs-12"></span>
				<div class="user-goods-select-container col-xs-12">
					<div class="user-select-params col-xs-12 text-left">
						<span class="goods-label col-xs-2">已选</span>
						<span class="goods-label-value col-xs-9" id="selected_parameter_id">红色&nbsp;128G&nbsp;移动版&nbsp;套餐一</span>
						<span class="iconfont icon-jiantou-copy col-xs-1 text-right"></span>
					</div>
					<div class="get-goods-address col-xs-12 text-left">
						<span class="goods-label col-xs-2">送至</span>
						<span class="goods-label-value col-xs-9" id="receiver_address_id">合肥天鹅湖万达2好写字楼17楼青谷科技合肥天鹅湖万达2好写字楼17楼青谷科技</span>
						<span class="iconfont icon-jiantou-copy col-xs-1 text-right"></span>
					</div>
					<div class="goods-instruction col-xs-12 text-left">
						<span class="goods-label col-xs-2">说明</span>
						<span class="goods-label-value col-xs-10">正品保障 / 货到付款 / 自提 / 7天退换货 / 迪信通发 货售后</span>
					</div>
				</div>
				<span class="break-line-bar col-xs-12"></span>
			</section>
			<section class="goods-comment-target col-xs-12">
				<div class="goods-comment-container col-xs-12">
					<div class="goods-comment-tip-container col-xs-12">
						<span class="comment-tip-text col-xs-8 text-left">  
                        		<div class="comment-tip-icon col-xs-1">
                            		<span class="iconfont icon-pinlun"></span>
					</div>
					<span class="tip-text col-xs-10">用户晒单</span>
					</span>
					<span class="view-all-comment view-all col-xs-4 pull-right text-right">全部<span class="iconfont icon-jiantou-copy"></span></span>
				</div>
				<div class="goods-comment-content-container col-xs-12">
					<div class="swiper-container">
						<div class="swiper-wrapper" id="user_shaidan_container_id">
							<!--<div class="swiper-slide text-center goods-comment-item col-xs-11">
								<div class="comment-pic col-xs-4">
									<img src="image/find_goods/16F15782-B531-4B67-947B-6EAA06D9D3C8.png">
								</div>
								<div class="comment-info col-xs-8">
									<div class="comment-user-info col-xs-12">
										<div class="comment-user-face col-xs-2">
											<img src="image/find_goods/DB9F8E92-3C13-41B5-8945-B324E1291543.png">
										</div>
										<span class="comment-user-name col-xs-10 text-left">lin_Mei</span>
									</div>
									<span class="comment-user-cont col-xs-12 text-left">还是忍不住剁手了，整体感觉挺不错的，页没有网上所说的有嗲流程</span>
								</div>
								<span class="subject-jiaobiao iconfont icon-zuixin">
                                   <span class="subject-jiaobiao-text">最新</span>
								</span>
							</div>-->
							<!--<div class="swiper-slide text-center goods-comment-item col-xs-11">
								<div class="comment-pic col-xs-4">
									<img src="image/find_goods/16F15782-B531-4B67-947B-6EAA06D9D3C8.png">
								</div>
								<div class="comment-info col-xs-8">
									<div class="comment-user-info col-xs-12">
										<div class="comment-user-face col-xs-2">
											<img src="image/find_goods/DB9F8E92-3C13-41B5-8945-B324E1291543.png">
										</div>
										<span class="comment-user-name col-xs-10 text-left">lin_Mei</span>
									</div>
									<span class="comment-user-cont col-xs-12 text-left">还是忍不住剁手了，整体感觉挺不错的，页没有网上所说的有嗲流程</span>
								</div>
								<span class="subject-jiaobiao iconfont icon-zuixin">
                                   <span class="subject-jiaobiao-text">最新</span>
								</span>
							</div>-->
						</div>
					</div>
				</div>
				</div>
				<span class="break-line-bar col-xs-12"></span>
				<div class="goods-notes-container col-xs-12">
					<div class="comment-tip-text-container col-xs-12">
						<span class="comment-tip-text col-xs-8 text-left">  
                        <div class="comment-tip-icon col-xs-1">
                            <span class="iconfont icon-biji"></span>
					</div>
					<span class="tip-text col-xs-10">笔记</span>
					</span>
					<span class="view-all-notes view-all col-xs-4 pull-right text-right">全部<span class="iconfont icon-jiantou-copy"></span></span>
				</div>
				<div class="goods-notes-contents col-xs-12">
					<div class="goods-left-item col-xs-6" id="notes_left_container_id">

						<!--<div class="goods-note-item col-xs-12">
							<img class="note-pic col-xs-12" src="image/find_goods/648FDA50-B36F-4E56-B3F6-295EC054E162.png">
							<span class="goods-note-title col-xs-12 text-left">大家多年的晕血症估计被这iphone 7红色</span>
							<span class="goods-note-cont col-xs-12 text-left">自红色特别版手机上市后大家对这中国红貌似</span>
							<div class="goods-note-publish col-xs-12">
								<div class="comment-user-info col-xs-6 text-left">
									<div class="comment-user-face col-xs-4">
										<img src="image/find_goods/DB9F8E92-3C13-41B5-8945-B324E1291543.png">
									</div>
									<span class="comment-user-name col-xs-8 text-left">丁雯</span>
								</div>
								<div class="goods-note-like col-xs-6 text-right">
									<span class="iconfont icon-dianzan1"></span>
									<span class="like-num">100</span>
								</div>
							</div>
						</div>-->
					</div>
					<div class="goods-right-item col-xs-6" id="notes_right_container_id">

						<!--<div class="goods-note-item col-xs-12">
							<div class="note-cover col-xs-12">
								<video controls="controls" src="" poster="image/my_user_side/78D72D60-E50E-41C1-9BA0-30C01ACE3B44.png">
								</video>
								<span class="video-icon">视频</span>
							</div>
							<span class="goods-note-title col-xs-12 text-left">大家多年的晕血症估计被这iphone 7红色</span>
							<span class="goods-note-cont col-xs-12 text-left">自红色特别版手机上市后大家对这中国红貌似</span>
							<div class="goods-note-publish col-xs-12">
								<div class="comment-user-info col-xs-6 text-left">
									<div class="comment-user-face col-xs-4">
										<img src="image/find_goods/DB9F8E92-3C13-41B5-8945-B324E1291543.png">
									</div>
									<span class="comment-user-name col-xs-8 text-left">丁雯</span>
								</div>
								<div class="goods-note-like col-xs-6 text-right">
									<span class="iconfont icon-dianzan1"></span>
									<span class="like-num">100</span>
								</div>
							</div>
						</div>-->

					</div>
				</div>
				</div>
				<span class="break-line-bar col-xs-12"></span>
			</section>
			<section class="goods-detail-target col-xs-12">
				<div class="goods-self-detail col-xs-12">
					<div class="goods-tab-bar col-xs-12">
						<span class="pic-word-attr active col-xs-4 col-xs-offset-2">图文介绍</span>
						<span class="goods-params col-xs-4">商品参数</span>
					</div>
					<div class="pic-word-attr-content col-xs-12 text-left">
						<div id="pic_word_des">
							<!--<img src="img/product_pic@3x.png" />-->
						</div>
						<div class="goods-promise-container col-xs-12 text-center">
							<span class="recommend-tip-text col-xs-12">我们承诺&nbsp;所有买家</span>
							<div class="goods-promise-item col-xs-3">
								<div class="promise-icon col-xs-12">
									<span class="iconfont icon-zheng"></span>
								</div>
								<span class="promise-title col-xs-12">正品保障</span>
							</div>
							<div class="goods-promise-item col-xs-3">
								<div class="promise-icon col-xs-12">
									<span class="iconfont icon-7tian"></span>
								</div>
								<span class="promise-title col-xs-12">7天发货</span>
							</div>
							<div class="goods-promise-item col-xs-3">
								<div class="promise-icon col-xs-12">
									<span class="iconfont icon-wuliu"></span>
								</div>
								<span class="promise-title col-xs-12">物流保障</span>
							</div>
							<div class="goods-promise-item col-xs-3">
								<div class="promise-icon col-xs-12">
									<span class="iconfont icon-baozhang"></span>
								</div>
								<span class="promise-title col-xs-12">服务保障</span>
							</div>
						</div>
						<div class="back-to-top col-xs-3 text-center">
							<span class="iconfont icon-dingbu"></span>
							<span class="back-top-text col-xs-12">顶部</span>
						</div>
					</div>
					<div class="goods-params-content hide col-xs-12 text-left">
						<div id="product_par_dse">
							<!--<img src="img/product_pic@3x.png" />
							<img src="img/product_pic@3x.png" />
							<img src="img/product_pic@3x.png" />-->
						</div>
					</div>
				</div>
			</section>
			<div class="goods-opt-nar col-xs-12">
				<div class="goods-comment-icon col-xs-2">
					<span class="iconfont icon-guangguan"></span>
				</div>
				<div class="goods-collect-icon col-xs-2">
					<span class="iconfont icon-g"></span>
				</div>
				<span class="join-cart col-xs-4">加入购物车</span>
				<span id="buyGoods" class="buy-goods col-xs-4">立即购买</span>
			</div>
		</section>

		<!--选择商品参数的弹窗-->
		<section class="place-order-container row hide">
			<div class="place-order-content col-xs-12">
				<div class="goods-base-info col-xs-12">
					<div class="goods-pic col-xs-2">
						<img id="pop_up_pic" src="image/find_goods/534A3527-6709-4A1C-8533-2B9B00072FEC.png" />
					</div>
					<div class="goods-info col-xs-9">
						<span class="goods-name col-xs-12">苹果iphone 7</span>
						<span class="goods-price-container col-xs-12">
                            <span class="goods-price-new col-xs-3"><span class="yen">￥</span><span id="pop_up_new_price">5688</span></span>
						<span class="goods-price-old col-xs-5"><span class="yen">￥</span><span id="pop_up_old_price">5688</span></span>
						</span>
					</div>
				</div>
				<div class="goods-other-params col-xs-12">
					<!--cannot_selected不能被选中，selected选中-->
					<div class="goods-params-item col-xs-12">
						<span class="params-name col-xs-2">颜色：</span>
						<div class="params-value col-xs-10 text-center" id="color_list">
							<!--<span class="param-cate col-xs-3">红色</span>
							<span class="param-cate col-xs-3">银色</span>-->
						</div>
					</div>
					<div class="goods-params-item col-xs-12">
						<span class="params-name col-xs-2">容量：</span>
						<div class="params-value col-xs-10 text-center" id="memory_list">
							<!--<span class="param-cate col-xs-3">32G</span>
							<span class="param-cate col-xs-3">64G</span>-->
						</div>
					</div>
					<div class="goods-params-item col-xs-12">
						<span class="params-name col-xs-2">版本：</span>
						<div class="params-value col-xs-10 text-center" id="supplier_list">
							<!--<span class="param-cate col-xs-3">移动版</span>
							<span class="param-cate col-xs-3">联通版</span>
							<span class="param-cate col-xs-3">全网通</span>-->
						</div>
					</div>
					<div class="goods-params-item col-xs-12">
						<span class="params-name col-xs-2">套餐：</span>
						<div class="params-value col-xs-10 text-center" id="contract_list">
							<!--<span class="param-cate col-xs-3">套餐一</span>
							<span class="param-cate col-xs-3">套餐二</span>
							<span class="param-cate col-xs-3">套餐三</span>-->
						</div>
					</div>
					<!-- 购买数量 -->
					<div class="goods-params-item col-xs-12">
						<span class="params-name col-xs-3">购买数量：</span>
						<div class="params-value buy-goods-num col-xs-5 col-xs-offset-4 text-center">
							<span class="iconfont icon-jianshao"></span>
							<span class="buy-num">1</span>
							<span class="iconfont icon-jia2"></span>
						</div>
					</div>
				</div>
			</div>
			<span class="col-xs-12 go-place-order text-center">确定</span>
		</section>
		<!--弹出框的背景色-->
		<div class="backdrop hide"></div>

		<div class="goods-big-preview-container col-xs-12 hide">
			<div class="goods-big-preview col-xs-12 text-center">
				<span class="preview-nav col-xs-12"></span>
				<div class="preview-content col-xs-12">
					<div class="swiper-container">
						<div class="swiper-wrapper">
							<div class="swiper-slide" item-index="0" total="3" item-type="img">
								<img src="image/find_goods/D4F17AE5-80D9-48B2-8EBC-A9A995998504.png">
							</div>
							<div class="swiper-slide" item-index="1" total="3" item-type="video">
								<video controls="controls" src="" poster="image/my_user_side/78D72D60-E50E-41C1-9BA0-30C01ACE3B44.png">
								</video>
							</div>
							<div class="swiper-slide" item-index="2" total="3" item-type="img">
								<img src="image/find_goods/D4F17AE5-80D9-48B2-8EBC-A9A995998504.png">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--选择地址的iframe-->
		<div class="iframe_container" id="iframe_select_address">
			<iframe id="iframe_select_address_id" src="select_address.html" width="100%" height="100%" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
		</div>
	</body>
	<script type="text/javascript" src="js/common_js/my_tools.js"></script>
	<script type="text/javascript" src="js/find_goods/goods_detail.js"></script>

</html>