<%@ page contentType="text/html;charset=GBK" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta charset="gbk">
		<title>��Ʒ����</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta http-equiv="Cache-Control" content="no-cache"/>
		<meta name="renderer" content="webkit">

		<!-- ͼ���css -->
		<link rel="stylesheet" href="css/common/iconfont/iconfont.css">
		<!-- ͼƬ�ֲ�css -->
		<link rel="stylesheet" href="css/common/swiper-3.4.2.min.css">
		<link rel="stylesheet" href="css/dxt.css">
		<link rel="stylesheet" href="css/find_goods/goods_detail.css">
		<!-- ����jquery.js -->
		<script type="text/javascript" src="js/common/jquery-2.1.4.min.js"></script>
		<!-- ͼƬ�ֲ�js -->
		<script type="text/javascript" src="js/common/swiper-3.4.2.jquery.min.js"></script>
		<script type="text/javascript" src="js/common_js/vconsole.min.js"></script>
		<script type="text/javascript">
			//��׿����
			$(function () {
				if(window.native!=null&&typeof(window.native)!="undefined"){
					native.setTitleRight("����");
				}else{
					alert(typeof(window.native));
				}
			})
		</script>
	</head>

	<body ontouchstart="" class="container">
		<section class="goods-detail-hearder-bar row">
			<div class="hearder-tab-bar col-xs-12 text-center">
				<span class="goods-base-bar active col-xs-2 col-xs-offset-3">��Ʒ</span>
				<span class="goods-comments-bar col-xs-2">����</span>
				<span class="goods-detail-bar col-xs-2">����</span>
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
						<!-- �����Ҫ��ҳ�� -->
						<div class="swiper-pagination"></div>
					</div>
				</div>
				<div class="goods-base-info-container col-xs-12 text-left">
					<span class="goods-price-container col-xs-12">
                    <span class="goods-price-new col-xs-5" id="product_new_price_id">��5688</span>
					<span class="goods-price-old col-xs-4" id="product_old_price_id">��6200</span>
					<!--��ʱ����Ʒ���飬��ʱʣ��ʱ��-->
					<span class="remain-time-tip col-xs-6 text-right">�������ʣ<span class="remain-time"></span></span>
					</span>
					<span class="goods-title col-xs-12" id="product_name_id">ƻ�� iphone 7</span>
					<!--<span class="goods-attr col-xs-12" id="product_desc_id">���۱ر���ɫ�ر�� ���۱ر���ɫ�ر�� ���۱ر���ɫ�ر�� ���۱ر���ɫ�ر��</span>-->
				</div>
				<span class="break-line-bar col-xs-12"></span>
				<div class="user-goods-select-container col-xs-12">
					<div class="user-select-params col-xs-12 text-left">
						<span class="goods-label col-xs-2">��ѡ</span>
						<span class="goods-label-value col-xs-9" id="selected_parameter_id">��ɫ&nbsp;128G&nbsp;�ƶ���&nbsp;�ײ�һ</span>
						<span class="iconfont icon-jiantou-copy col-xs-1 text-right"></span>
					</div>
					<div class="get-goods-address col-xs-12 text-left">
						<span class="goods-label col-xs-2">����</span>
						<span class="goods-label-value col-xs-9" id="receiver_address_id">�Ϸ��������2��д��¥17¥��ȿƼ��Ϸ��������2��д��¥17¥��ȿƼ�</span>
						<span class="iconfont icon-jiantou-copy col-xs-1 text-right"></span>
					</div>
					<div class="goods-instruction col-xs-12 text-left">
						<span class="goods-label col-xs-2">˵��</span>
						<span class="goods-label-value col-xs-10">��Ʒ���� / �������� / ���� / 7���˻��� / ����ͨ�� ���ۺ�</span>
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
					<span class="tip-text col-xs-10">�û�ɹ��</span>
					</span>
					<span class="view-all-comment view-all col-xs-4 pull-right text-right">ȫ��<span class="iconfont icon-jiantou-copy"></span></span>
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
									<span class="comment-user-cont col-xs-12 text-left">�����̲�ס�����ˣ�����о�ͦ�����ģ�ҳû��������˵����������</span>
								</div>
								<span class="subject-jiaobiao iconfont icon-zuixin">
                                   <span class="subject-jiaobiao-text">����</span>
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
									<span class="comment-user-cont col-xs-12 text-left">�����̲�ס�����ˣ�����о�ͦ�����ģ�ҳû��������˵����������</span>
								</div>
								<span class="subject-jiaobiao iconfont icon-zuixin">
                                   <span class="subject-jiaobiao-text">����</span>
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
					<span class="tip-text col-xs-10">�ʼ�</span>
					</span>
					<span class="view-all-notes view-all col-xs-4 pull-right text-right">ȫ��<span class="iconfont icon-jiantou-copy"></span></span>
				</div>
				<div class="goods-notes-contents col-xs-12">
					<div class="goods-left-item col-xs-6" id="notes_left_container_id">

						<!--<div class="goods-note-item col-xs-12">
							<img class="note-pic col-xs-12" src="image/find_goods/648FDA50-B36F-4E56-B3F6-295EC054E162.png">
							<span class="goods-note-title col-xs-12 text-left">��Ҷ������Ѫ֢���Ʊ���iphone 7��ɫ</span>
							<span class="goods-note-cont col-xs-12 text-left">�Ժ�ɫ�ر���ֻ����к��Ҷ����й���ò��</span>
							<div class="goods-note-publish col-xs-12">
								<div class="comment-user-info col-xs-6 text-left">
									<div class="comment-user-face col-xs-4">
										<img src="image/find_goods/DB9F8E92-3C13-41B5-8945-B324E1291543.png">
									</div>
									<span class="comment-user-name col-xs-8 text-left">����</span>
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
								<span class="video-icon">��Ƶ</span>
							</div>
							<span class="goods-note-title col-xs-12 text-left">��Ҷ������Ѫ֢���Ʊ���iphone 7��ɫ</span>
							<span class="goods-note-cont col-xs-12 text-left">�Ժ�ɫ�ر���ֻ����к��Ҷ����й���ò��</span>
							<div class="goods-note-publish col-xs-12">
								<div class="comment-user-info col-xs-6 text-left">
									<div class="comment-user-face col-xs-4">
										<img src="image/find_goods/DB9F8E92-3C13-41B5-8945-B324E1291543.png">
									</div>
									<span class="comment-user-name col-xs-8 text-left">����</span>
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
						<span class="pic-word-attr active col-xs-4 col-xs-offset-2">ͼ�Ľ���</span>
						<span class="goods-params col-xs-4">��Ʒ����</span>
					</div>
					<div class="pic-word-attr-content col-xs-12 text-left">
						<div id="pic_word_des">
							<!--<img src="img/product_pic@3x.png" />-->
						</div>
						<div class="goods-promise-container col-xs-12 text-center">
							<span class="recommend-tip-text col-xs-12">���ǳ�ŵ&nbsp;�������</span>
							<div class="goods-promise-item col-xs-3">
								<div class="promise-icon col-xs-12">
									<span class="iconfont icon-zheng"></span>
								</div>
								<span class="promise-title col-xs-12">��Ʒ����</span>
							</div>
							<div class="goods-promise-item col-xs-3">
								<div class="promise-icon col-xs-12">
									<span class="iconfont icon-7tian"></span>
								</div>
								<span class="promise-title col-xs-12">7�췢��</span>
							</div>
							<div class="goods-promise-item col-xs-3">
								<div class="promise-icon col-xs-12">
									<span class="iconfont icon-wuliu"></span>
								</div>
								<span class="promise-title col-xs-12">��������</span>
							</div>
							<div class="goods-promise-item col-xs-3">
								<div class="promise-icon col-xs-12">
									<span class="iconfont icon-baozhang"></span>
								</div>
								<span class="promise-title col-xs-12">������</span>
							</div>
						</div>
						<div class="back-to-top col-xs-3 text-center">
							<span class="iconfont icon-dingbu"></span>
							<span class="back-top-text col-xs-12">����</span>
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
				<span class="join-cart col-xs-4">���빺�ﳵ</span>
				<span id="buyGoods" class="buy-goods col-xs-4">��������</span>
			</div>
		</section>

		<!--ѡ����Ʒ�����ĵ���-->
		<section class="place-order-container row hide">
			<div class="place-order-content col-xs-12">
				<div class="goods-base-info col-xs-12">
					<div class="goods-pic col-xs-2">
						<img id="pop_up_pic" src="image/find_goods/534A3527-6709-4A1C-8533-2B9B00072FEC.png" />
					</div>
					<div class="goods-info col-xs-9">
						<span class="goods-name col-xs-12">ƻ��iphone 7</span>
						<span class="goods-price-container col-xs-12">
                            <span class="goods-price-new col-xs-3"><span class="yen">��</span><span id="pop_up_new_price">5688</span></span>
						<span class="goods-price-old col-xs-5"><span class="yen">��</span><span id="pop_up_old_price">5688</span></span>
						</span>
					</div>
				</div>
				<div class="goods-other-params col-xs-12">
					<!--cannot_selected���ܱ�ѡ�У�selectedѡ��-->
					<div class="goods-params-item col-xs-12">
						<span class="params-name col-xs-2">��ɫ��</span>
						<div class="params-value col-xs-10 text-center" id="color_list">
							<!--<span class="param-cate col-xs-3">��ɫ</span>
							<span class="param-cate col-xs-3">��ɫ</span>-->
						</div>
					</div>
					<div class="goods-params-item col-xs-12">
						<span class="params-name col-xs-2">������</span>
						<div class="params-value col-xs-10 text-center" id="memory_list">
							<!--<span class="param-cate col-xs-3">32G</span>
							<span class="param-cate col-xs-3">64G</span>-->
						</div>
					</div>
					<div class="goods-params-item col-xs-12">
						<span class="params-name col-xs-2">�汾��</span>
						<div class="params-value col-xs-10 text-center" id="supplier_list">
							<!--<span class="param-cate col-xs-3">�ƶ���</span>
							<span class="param-cate col-xs-3">��ͨ��</span>
							<span class="param-cate col-xs-3">ȫ��ͨ</span>-->
						</div>
					</div>
					<div class="goods-params-item col-xs-12">
						<span class="params-name col-xs-2">�ײͣ�</span>
						<div class="params-value col-xs-10 text-center" id="contract_list">
							<!--<span class="param-cate col-xs-3">�ײ�һ</span>
							<span class="param-cate col-xs-3">�ײͶ�</span>
							<span class="param-cate col-xs-3">�ײ���</span>-->
						</div>
					</div>
					<!-- �������� -->
					<div class="goods-params-item col-xs-12">
						<span class="params-name col-xs-3">����������</span>
						<div class="params-value buy-goods-num col-xs-5 col-xs-offset-4 text-center">
							<span class="iconfont icon-jianshao"></span>
							<span class="buy-num">1</span>
							<span class="iconfont icon-jia2"></span>
						</div>
					</div>
				</div>
			</div>
			<span class="col-xs-12 go-place-order text-center">ȷ��</span>
		</section>
		<!--������ı���ɫ-->
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
		<!--ѡ���ַ��iframe-->
		<div class="iframe_container" id="iframe_select_address">
			<iframe id="iframe_select_address_id" src="select_address.html" width="100%" height="100%" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
		</div>
	</body>
	<script type="text/javascript" src="js/common_js/my_tools.js"></script>
	<script type="text/javascript" src="js/find_goods/goods_detail.js"></script>

</html>