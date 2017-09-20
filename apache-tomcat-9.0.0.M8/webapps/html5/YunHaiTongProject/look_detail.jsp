<%@ page contentType="text/html;charset=GBK" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta charset="gbk">
		<title>��������</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-cache" />
		<!-- ͼ���css -->
		<link rel="stylesheet" href="css/common/iconfont/iconfont.css">
		<!-- ͼƬ�ֲ�css -->
		<link rel="stylesheet" href="css/common/swiper-3.4.2.min.css">
		<link rel="stylesheet" href="css/dxt.css">
		<link rel="stylesheet" href="css/look_look/look_detail.css">
		<!-- ����jquery.js -->
		<script type="text/javascript" src="js/common/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="js/common/iconfont.js"></script>
		<!-- ͼƬ�ֲ�js -->
		<script type="text/javascript" src="js/common/swiper-3.4.2.jquery.min.js"></script>
	</head>

	<body ontouchstart="" class="container">
		<section class="look-detail-container row text-center">

			<div class="look-item-base-info col-xs-12">
				<video id="video_id" controls="controls" src=""></video>
				<div class="look-item-info col-xs-12">
					<span class="look-item-name col-xs-12 text-left">�ֻ�֧����ȫ�Կ�������׵��ֻ�����ô��</span>
					<div class="look-item-tip col-xs-12">
						<span class="view-count col-xs-3">
         					<span class="iconfont icon-eye-open"></span>
						<span id="page_view">32��</span>
						</span>
						<span class="col-xs-6 text-left" id="video_duration">ʱ����18:20</span>
					</div>
				</div>
				<div class="look-publish-user-container col-xs-12">
					<div class="publish-user-base-info col-xs-12">
						<div class="user-face col-xs-2">
							<img id="customer_picture" src="image/look_look/BAA07D9F-6296-4E30-B813-369D21266CFD.png" />
						</div>
						<div class="user-info col-xs-7 text-left">
							<span class="user-name">������</span>
							<span class="store-name">�����л��ǵ�</span>
						</div>
						<div class="liao-liao-opt col-xs-3">
							<div class="liao-liao-text">
								<span>+</span>
								<span>����</span>
							</div>
						</div>
					</div>
					<div class="publish-content-info col-xs-12">
						<span id="action_content" class="publish-content col-xs-12 text-left">ͬ��������Ϊʲô�ĳ�������Ƭ��һ�����ֲе����֪ �����ֻ�����ͷ������ ������������ֻ������Լ�������ͷʱ���ֹĴ������ʿ��ȵ�������������������ʡ�������Ϊ��Ӱ������Ҳ֪���ֻ��ĸй�Ԫ���ߴ�͵�������û���ȣ���ô�������ˣ�Ŀǰ�ֻ�����ͷ������IMX214234�����ܾ����ܴﵽʲôˮ׼�����������������������Ƿ�������������� �ǵģ��ֻ���ǿ��ŵ�����õ��ǲ�˾��֤�������õ���ʩ�͵���֤���Ҹ�������Ƭ���������ۿ����ܲ��ֱܷ��iphone6��5D3��</span>
						<div class="publish-content-tip col-xs-12">
							<div class="publish-time col-xs-5 text-left"><span id="created_at">06-14</span></div>
							<div class="tip-items col-xs-7">
								<div class="col-xs-3 tip-item shang-yunbi">
									<svg class="icon-yunbi" aria-hidden="true">
										<use xlink:href="#icon-yunbi"></use>
									</svg>
									<span class="shang">��</span>
								</div>
								<span class="yuan-dian col-xs-1"></span>
								<div class="col-xs-3 tip-item collect-thing">
									<span class="iconfont icon-g"></span>
									<span class="view-count collection_total">120</span>
								</div>
								<span class="yuan-dian col-xs-1"></span>
								<div class="col-xs-3 tip-item dian-zan-thing">
									<span class="iconfont icon-dianzan"></span>
									<span class="zan-count">759</span>
								</div>
							</div>
						</div>
						<div class="other-users-container col-xs-12">
							<div class="user-face col-xs-2">
								<img src="image/look_look/14532EB8-855F-47D2-8346-258D26E15C0A.png" />
							</div>
							<div class="user-face col-xs-2">
								<img src="image/look_look/14532EB8-855F-47D2-8346-258D26E15C0A.png" />
							</div>
							<div class="user-face col-xs-2">
								<img src="image/look_look/14532EB8-855F-47D2-8346-258D26E15C0A.png" />
							</div>
							<div class="user-face col-xs-2">
								<img src="image/look_look/14532EB8-855F-47D2-8346-258D26E15C0A.png" />
							</div>
							<div class="user-face col-xs-2">
								<img src="image/look_look/14532EB8-855F-47D2-8346-258D26E15C0A.png" />
							</div>
							<div class="user-face col-xs-2">
								<img src="image/look_look/14532EB8-855F-47D2-8346-258D26E15C0A.png" />
							</div>
							<div class="more-user col-xs-2">
								<svg class="icon-gengduo1" aria-hidden="true">
									<use xlink:href="#icon-gengduo1"></use>
								</svg>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="recommend-goods-container col-xs-12">
				<div class="recommend-tip-title col-xs-12">
					<span class="iconfont icon-rexiao"></span>
					<span>�Ƽ���Ʒ</span>
				</div>
				<div class="goods-list-container col-xs-12">
					<div class="swiper-container">
						<div class="swiper-wrapper overflow_x">
							<div class="swiper-slide text-center goods-item col-xs-3">
								<div class="goods-pic">
									<img src="image/look_look/AAB9535B-12F2-479E-91BA-9B7966B9C185.png" />
								</div>
								<span class="goods-name">���� note5��ɫ 32g</span>
								<span class="goods-price">��1299</span>
							</div>
							<div class="swiper-slide text-center goods-item col-xs-3">
								<div class="goods-pic">
									<img src="image/look_look/AAB9535B-12F2-479E-91BA-9B7966B9C185.png" />
								</div>
								<span class="goods-name">���� note5��ɫ 32g</span>
								<span class="goods-price">��1299</span>
							</div>
							<div class="swiper-slide text-center goods-item col-xs-3">
								<div class="goods-pic">
									<img src="image/look_look/AAB9535B-12F2-479E-91BA-9B7966B9C185.png" />
								</div>
								<span class="goods-name">���� note5��ɫ 32g</span>
								<span class="goods-price">��1299</span>
							</div>
							<div class="swiper-slide text-center goods-item col-xs-3">
								<div class="goods-pic">
									<img src="image/look_look/AAB9535B-12F2-479E-91BA-9B7966B9C185.png" />
								</div>
								<span class="goods-name">���� note5��ɫ 32g</span>
								<span class="goods-price">��1299</span>
							</div>
							<div class="swiper-slide text-center goods-item col-xs-3">
								<div class="goods-pic">
									<img src="image/look_look/AAB9535B-12F2-479E-91BA-9B7966B9C185.png" />
								</div>
								<span class="goods-name">���� note5��ɫ 32g</span>
								<span class="goods-price">��1299</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="user-comments-container col-xs-12">
				<div class="comments-tip-title col-xs-12">
					<svg class="icon-pinlun" aria-hidden="true">
						<use xlink:href="#icon-pinlun"></use>
					</svg>
					<span>�û�����(<span id="comment_sum">20</span>)</span>
				</div>
				<div class="publish-comments col-xs-12">
					<span class="iconfont icon-morentouxiang"></span>
					<div class="input-comment col-xs-9">
						<input type="text" class="col-xs-12" placeholder="˵˵��Ŀ���..." />
					</div>
					<span class="iconfont icon-emot"></span>
				</div>
				<div class="comment-content-container col-xs-12">
					<div class="comment-item col-xs-12">
						<div class="user-comment-face col-xs-2">
							<img src="image/look_look/CD0B954D-3C29-44EC-8239-551D7E26CDD8.png" />
						</div>
						<div class="comment-other-info col-xs-10 text-left">
							<span class="user-name col-xs-12">JOJO-ϪϪ</span>
							<span class="comment-cont col-xs-12">������ֻ��Ƚ����Ƚ�ȥ��ʵ�ɶ���࣬�����Ҹ� ���õ�ϰ�߲��ͺ���ô���ͺ���ô�ͺ���ô�ͺ���ô</span>
							<div class="comment-tip-info col-xs-12">
								<div class="publish-time-jinbi col-xs-5">
									<span class="time-text">06-15 08:52</span>
									<span class="jinbi-info">
     							<svg class="icon-yunbi" aria-hidden="true">
								    <use xlink:href="#icon-yunbi"></use>
								</svg>
								<span class="yunbi-count">5</span>
									</span>
								</div>
								<div class="publish-other-tip col-xs-7">
									<span class="reply-count col-xs-offset-4">
     								<span class="iconfont icon-comment"></span>
									<span class="count">0</span>
									</span>
									<span class="dianzan-count">
     								<span class="iconfont icon-dianzan1"></span>
									<span class="count">16</span>
									</span>
								</div>
							</div>
						</div>
					</div>
					<div class="comment-item col-xs-12">
						<div class="user-comment-face col-xs-2">
							<img src="image/look_look/CD0B954D-3C29-44EC-8239-551D7E26CDD8.png" />
						</div>
						<div class="comment-other-info col-xs-10 text-left">
							<span class="user-name col-xs-12">�Ҳ��ǳ���</span>
							<span class="comment-cont col-xs-12">������ֻ��Ƚ����Ƚ�ȥ��ʵ�ɶ���࣬�����Ҹ� ���õ�ϰ�߲��ͺ���ô��</span>
							<div class="comment-tip-info col-xs-12">
								<div class="publish-time-jinbi col-xs-5">
									<span class="time-text">06-15 08:52</span>
									<span class="jinbi-info">
     							<svg class="icon-yunbi" aria-hidden="true">
								    <use xlink:href="#icon-yunbi"></use>
								</svg>
								<span class="yunbi-count">5</span>
									</span>
								</div>
								<div class="publish-other-tip col-xs-7">
									<span class="reply-count col-xs-offset-4">
     								<span class="iconfont icon-comment"></span>
									<span class="count">0</span>
									</span>
									<span class="dianzan-count">
     								<span class="iconfont icon-dianzan1"></span>
									<span class="count">16</span>
									</span>
								</div>
							</div>
							<div class="reply-content-container col-xs-12">
								<div class="reply-list-container col-xs-12">
									<div class="reply-item col-xs-12">
										<div class="reply-main-info col-xs-12">
											<span class="reply-user-name">���⿾��: </span>
											<span class="user-reply-cont">¥����λ�о�˵�����Ǻ���ʵ��,���� ���ҵ�����˭���аɣ�����...</span>
										</div>
										<div class="reply-other-info col-xs-12">
											<span class="user-reply-time">06-15 08:52</span>
											<span class="dianzan-count">
	         								<span class="iconfont icon-dianzan1"></span>
											<span class="count">16</span>
											</span>
										</div>
									</div>
									<!--Ĭ����ʾһ��-->
									<span class="view-other-replys col-xs-12">�鿴ʣ��3���ظ�</span>
									<div class="reply-item col-xs-12 hide">
										<div class="reply-main-info col-xs-12">
											<span class="reply-user-name">���⿾��: </span>
											<span class="user-reply-cont">¥����λ�о�˵�����Ǻ���ʵ��,���� ���ҵ�����˭���аɣ�����...</span>
										</div>
										<div class="reply-other-info col-xs-12">
											<span class="user-reply-time">06-15 08:52</span>
											<span class="dianzan-count">
	         								<span class="iconfont icon-dianzan1"></span>
											<span class="count">16</span>
											</span>
										</div>
									</div>
									<div class="reply-item col-xs-12 hide">
										<div class="reply-main-info col-xs-12">
											<span class="reply-user-name">���⿾��: </span>
											<span class="user-reply-cont">¥����λ�о�˵�����Ǻ���ʵ��,���� ���ҵ�����˭���аɣ�����...</span>
										</div>
										<div class="reply-other-info col-xs-12">
											<span class="user-reply-time">06-15 08:52</span>
											<span class="dianzan-count">
	         								<span class="iconfont icon-dianzan1"></span>
											<span class="count">16</span>
											</span>
										</div>
									</div>
									<div class="reply-item col-xs-12 hide">
										<div class="reply-main-info col-xs-12">
											<span class="reply-user-name">���⿾��: </span>
											<span class="user-reply-cont">¥����λ�о�˵�����Ǻ���ʵ��,���� ���ҵ�����˭���аɣ�����...</span>
										</div>
										<div class="reply-other-info col-xs-12">
											<span class="user-reply-time">06-15 08:52</span>
											<span class="dianzan-count">
	         								<span class="iconfont icon-dianzan1"></span>
											<span class="count">16</span>
											</span>
										</div>
									</div>
								</div>
								<span class="reply-icon"></span>
							</div>
						</div>
					</div>
					<div class="comment-item col-xs-12">
						<div class="user-comment-face col-xs-2">
							<img src="image/look_look/CD0B954D-3C29-44EC-8239-551D7E26CDD8.png" />
						</div>
						<div class="comment-other-info col-xs-10 text-left">
							<span class="user-name col-xs-12">������һ��</span>
							<span class="comment-cont col-xs-12">�Թ�Ⱥ�ڣ�����·������</span>
							<div class="comment-tip-info col-xs-12">
								<div class="publish-time-jinbi col-xs-5">
									<span class="time-text">06-15 08:52</span>
									<span class="jinbi-info">
     							<svg class="icon-yunbi" aria-hidden="true">
								    <use xlink:href="#icon-yunbi"></use>
								</svg>
								<span class="yunbi-count">5</span>
									</span>
								</div>
								<div class="publish-other-tip col-xs-7">
									<span class="reply-count col-xs-offset-4">
     								<span class="iconfont icon-comment"></span>
									<span class="count">0</span>
									</span>
									<span class="dianzan-count">
     								<span class="iconfont icon-dianzan1"></span>
									<span class="count">16</span>
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<span class="view-all-reply col-xs-12">
    				<span>�鿴ȫ��</span><span class="iconfont icon-jiantou-copy"></span>
				</span>
			</div>
			<div class="look-detail-opt-nar col-xs-12">
				<div class="tip-items col-xs-8">
					<div class="col-xs-3 tip-item shang-yunbi">
						<svg class="icon-yunbi" aria-hidden="true">
							<use xlink:href="#icon-yunbi"></use>
						</svg>
						<span class="shang">��</span>
					</div>
					<span class="yuan-dian col-xs-1"></span>
					<div class="col-xs-3 tip-item collect-thing">
						<span class="iconfont icon-g"></span>
						<span class="view-count collection_total">120</span>
					</div>
					<span class="yuan-dian col-xs-1"></span>
					<div class="col-xs-3 tip-item dian-zan-thing">
						<span class="iconfont icon-dianzan"></span>
						<span class="zan-count">759</span>
					</div>
				</div>
				<div class="liao-liao-btn col-xs-4">
					<span class="iconfont icon-guangguan"></span>
					<span class="liao-liao-text">����</span>
				</div>
			</div>
		</section>
		<!--���͵�����-->
		<div class="give-reward-container text-center hide">
			<div class="give-reward-content col-xs-12">
				<div class="user-opt-dialog col-xs-9">
					<div class="close-opt col-xs-12 text-right">
						<span class="iconfont icon-guanbi2"></span>
					</div>
					<div class="dialog-header col-xs-8 col-xs-offset-2">
						<span class="header-title col-xs-10">����</span>
					</div>
					<div class="dialog-content col-xs-12">
						<div class="input-group">
							<input type="text" class="shang-remark form-control col-xs-12">
							<div class="input-group-btn">
								<span class="iconfont icon-sanjiaojiantou"></span>
							</div>
							<ul class="dropdown-menu dropdown-menu-right">
								<li><span>����д��̫���ˣ���һ����</span></li>
								<li><span>���ݷǳ���ָ�����壡</span></li>
								<li><span>�Զ�������</span></li>
							</ul>
						</div>
						<div class="yunbi-opt-container col-xs-12">
							<span class="iconfont icon-jianshao"></span>
							<input type="text" class="shang-count form-control col-xs-3 text-center" oninput="isDig()">
							<span class="iconfont icon-jia2"></span>
						</div>
						<div class="give-shang col-xs-12">
							<span class="col-xs-8 col-xs-offset-2">����</span>
						</div>
						<span class="yunbi-tip-count col-xs-10">��ʣ���Ʊ�����: <span class="total-yunbi">15</span></span>
					</div>
				</div>
			</div>
		</div>
		<!--�����ĵ�����-->
		<div class="plus-liao-liao-container text-center hide">
			<div class="plus-liao-liao-content col-xs-12">
				<div class="user-opt-dialog col-xs-9">
					<div class="close-opt col-xs-12 text-right">
						<span class="iconfont icon-guanbi2"></span>
					</div>
					<div class="dialog-header col-xs-8 col-xs-offset-2">
						<span class="header-title col-xs-10">������</span>
					</div>
					<div class="dialog-content col-xs-12">
						<div class="liao-liao-user-info col-xs-12">
							<div class="user-face col-xs-2">
								<img src="../../image/look_look/BAA07D9F-6296-4E30-B813-369D21266CFD.png" />
							</div>
							<span class="user-name col-xs-12">������</span>
							<span class="yunbi-tip-text col-xs-10">
								<span>ֻҪ����20</span>
							<svg class="icon-yunbi" aria-hidden="true">
								<use xlink:href="#icon-yunbi"></use>
							</svg>
							<span>�ƱҼ��ɼ����ģ�</span> ���ھͼ�ta������
							</span>
						</div>
					</div>
					<div class="dialog-footer col-xs-12">
						<span class="cancel col-xs-6">ȡ��</span>
						<span class="sure col-xs-6">ȷ��</span>
					</div>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript" src="js/common_js/my_tools.js"></script>
	<script type="text/javascript" src="js/look_look/look_detail.js"></script>
	<script>
		(function($, document) {
			var request = new queryString();
			if(request["jump_action_id"]) {
			 var action_id = request["jump_action_id"];
			 alert("��������--action_id="+action_id);
			} else {
				//product_id = "4";
			}
			//�ӿ�·��������--�����ҳ/���ޣ����ͣ��ղع��û����/�����ҳ������Ʒ/�����ҳ���ۣ�
			//http://120.76.190.223:8988/mrsyg/kqgoods/ActionDetail.form?action_id=1
			//http://120.76.190.223:8988/mrsyg/kqgoods/ActionOperate.form?action_id=1&pag_no=1&pag_num=100
			//http://120.76.190.223:8988/mrsyg/kqgoods/ActionGoods.form?action_id=1
			//http://120.76.190.223:8988/mrsyg/kqgoods/ActionComment.form?action_id=1&page_no=1&page_num=100
			//���۽ӿ�
			//http://120.76.190.223:8988/mrsyg/kqgoods/PublishComment.form?parameter_id=1&comment_content=�������ۿ����&type=4
			//�ظ��ӿ�
			//http://120.76.190.223:8988/mrsyg/kqgoods/ReplyComment.form?comment_id=399&reply_content=���Իظ�����һ
			var urlPath_detail = "mrsyg/kqgoods/ActionDetail.form";
			var need_data_detail = {
				"action_id": "1"
			};

			var urlPath_operate = "mrsyg/kqgoods/ActionOperate.form";
			var need_data_operate = {
				"action_id": "1",
				"pag_no": "1",
				"pag_num": "100"
			};

			var urlPath_goods = "mrsyg/kqgoods/ActionGoods.form";
			var need_data_goods = {
				"action_id": "1"
			};

			var urlPath_comment = "mrsyg/kqgoods/ActionComment.form";
			var need_data_comment = {
				"action_id": "1"
			};

			var data_detail = myAjax(urlPath_detail, need_data_detail);
			if(data_detail != undefined) {
				init_detail(data_detail);
			}

			var data_operate = myAjax(urlPath_operate, need_data_operate);
			if(data_operate != undefined) {
				init_operate(data_operate);
			}

			var data_goods = myAjax(urlPath_goods, need_data_goods);
			if(data_goods != undefined) {
				init_goods(data_goods);
			}

			var data_comment = myAjax(urlPath_comment, need_data_comment);
			if(data_comment != undefined) {
				init_comment(data_comment);
			}

			function init_detail(datas) {
				//�id
				var action_id = datas.action_id;
				//����id
				var shop_id = datas.shop_id;
				//ӪҵԱid
				var assistant_id = datas.assistant_id;
				//��Ƶ����
				var action_video = datas.action_video;
				//��Ƶ��֡ͼƬ
				var video_picture = datas.video_picture;
				//�����
				var action_title = datas.action_title;
				//�������
				var page_view = datas.page_view;
				//��Ƶʱ��
				var video_duration = datas.video_duration;
				//ӪҵԱ��Ƭ
				var customer_picture = datas.customer_picture;
				//ӪҵԱ����
				var customer_name = datas.customer_name;
				//��������
				var shop_name = datas.shop_name;
				//�����
				var action_content = datas.action_content;
				//����ʱ��
				var created_at = datas.created_at;
				//�ղش���
				var action_collection_total = datas.action_collection_total;
				//���޴���
				var action_like_total = datas.action_like_total;

				$("#video_id").attr("src", action_video);
				$("#video_id").attr("poster", video_picture);
				$(".look-item-name").text(action_title);
				$("#page_view").text(page_view + "��");
				$("#video_duration").text("ʱ����" + video_duration);
				$("#customer_picture").attr("src", customer_picture);
				$(".user-name").text(customer_name);
				$(".store-name").text(shop_name);
				$("#action_content").text(action_content);
				$("#created_at").text(created_at);
				$(".collection_total").text(action_collection_total);
				$(".zan-count").text(action_like_total);
			}

			function init_operate(datas) {
				$(".other-users-container").empty();
				$.each(datas.data, function(index, getdata) {
					//��������Ƭ
					var customer_picture = getdata.customer_picture;

					var needString = '<div class="user-face col-xs-2">' +
						'<img src="' + customer_picture + '" />' +
						'</div>';
					$(needString).appendTo(".other-users-container");
				});
			}

			function init_goods(datas) {
				$(".overflow_x").empty();
				$.each(datas.goodsinfo, function(index, getdata) {
					//��Ʒ����
					var product_name = getdata.product_name;
					//��Ʒid
					var product_id = getdata.product_id;
					//��Ʒ��Ƭ
					var picture_url = getdata.picture_url;
					//��Ʒ�۸�
					var product_price = getdata.product_price;

					var needString = '<div class="swiper-slide text-center goods-item col-xs-3">' +
						'<div class="goods-pic">' +
						'<img src="' + picture_url + '" />' +
						'</div>' +
						'<span class="goods-name">' + product_name + '</span>' +
						'<span class="goods-price">��' + product_price + '</span>' +
						'</div>';
					$(needString).appendTo(".overflow_x");
				});
			}

			function init_comment(datas) {
				//��������
				var comment_sum = datas.comment_sum;
				$(".comment-content-container").empty();
				$("#comment_sum").text(comment_sum);
				if(comment_sum != 0) {
					$.each(datas.commentinfo, function(index, getdata) {
						//��������Ƭ
						var customer_picture = getdata.customer_picture;
						//������id
						var customer_id = getdata.customer_id;
						//����������
						var customer_name = getdata.customer_name;
						//����ʱ��
						var created_at = getdata.created_at;
						//����id
						var comment_id = getdata.comment_id;
						//��������
						var comment_content = getdata.comment_content;
						//�ظ�����
						var reply_total = getdata.reply_total;
						//���۵�������
						var comment_like_total = getdata.comment_like_total;

						var startString = '<div class="comment-item col-xs-12">' +
							'<div class="user-comment-face col-xs-2">' +
							'<img src="' + customer_picture + '" />' +
							'</div>' +
							'<div class="comment-other-info col-xs-10 text-left">' +
							'<span class="user-name col-xs-12">' + customer_name + '</span>' +
							'<span class="comment-cont col-xs-12">' + comment_content + '</span>' +
							'<div class="comment-tip-info col-xs-12">' +
							'<div class="publish-time-jinbi col-xs-5">' +
							'<span class="time-text">' + created_at + '</span>' +
							'<span class="jinbi-info">' +
							'<svg class="icon-yunbi" aria-hidden="true">' +
							'<use xlink:href="#icon-yunbi"></use>' +
							'</svg>' +
							'<span class="yunbi-count">5</span>' +
							'</span>' +
							'</div>' +
							'<div class="publish-other-tip col-xs-7">' +
							'<span class="reply-count col-xs-offset-4">' +
							'<span class="iconfont icon-comment"></span>' +
							'<span class="count">' + reply_total + '</span>' +
							'</span>' +
							'<span class="dianzan-count">' +
							'<span class="iconfont icon-dianzan1"></span>' +
							'<span class="count">' + comment_like_total + '</span>' +
							'</span>' +
							'</div>' +
							'</div>';

						if(reply_total != 0) {
							startString += '<div class="reply-content-container col-xs-12">' +
								'<div class="reply-list-container col-xs-12" id="reply_of_comment_' + index + '">' +
								'</div>' +
								'<span class="reply-icon"></span>' +
								'</div>';
						}
						startString += '</div></div>';
						//�������۵�DOM
						$(startString).appendTo(".comment-content-container");
						if(reply_total != 0) {
							init_reply(getdata, index, reply_total);
						}
					});
				}
			}

			function init_reply(datas, commentId, replyTotal) {
				$.each(datas.reply_info, function(index, getdata) {
					//�ظ�id
					var reply_id = getdata.reply_id;
					//��������
					var reply_content = getdata.reply_content;
					//�ظ���������
					var reply_like_total = getdata.reply_like_total;
					//����ʱ��
					var created_at = getdata.created_at;
					//�ظ�������
					var customer_name = getdata.customer_name;
					//ʣ��������
					var remain = replyTotal - 1;
					//��ʾʣ��������
					var remainTip = '<span class="view-other-replys col-xs-12"> �鿴ʣ��' + remain + '������</span>';
					//��һ��������ʾ
					var displayReply = '<div class="reply-item col-xs-12">';
					//����һ����������
					var hiddenReply = '<div class="reply-item col-xs-12 hide">';
					//����չʾ
					var replyString = '<div class="reply-main-info col-xs-12">' +
						'<span class="reply-user-name">' + customer_name + '��</span>' +
						'<span class="user-reply-cont">' + reply_content + '</span>' +
						'</div>' +
						'<div class="reply-other-info col-xs-12">' +
						'<span class="user-reply-time">' + created_at + '</span>' +
						'<span class="dianzan-count">' +
						'<span class="iconfont icon-dianzan1"></span>' +
						'<span class="count">' + reply_like_total + '</span>' +
						'</span>' +
						'</div>' +
						'</div>';
					var finalString;
					//�ж��Ƿ�Ϊ��һ������
					if(0 == index) {
						finalString = displayReply + replyString;
					} else if(1 == index) {
						finalString = remainTip + hiddenReply + replyString;
					} else {
						finalString = hiddenReply + replyString;
					}

					$(finalString).appendTo("#reply_of_comment_" + commentId);
				});
			}
		})(jQuery, document);

		//���ͽ��У��
		function isDig() {
			//�����������ʽ
			var re = /^[0-9]+$/;
			var count = $(".shang-count").val();
			if(!re.test(count)) {
				$(".shang-count").val(1);
			}
		};
	</script>

</html>