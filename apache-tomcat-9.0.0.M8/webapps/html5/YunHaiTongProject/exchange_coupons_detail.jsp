<%@ page contentType="text/html;charset=GBK" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
    <head>
        <meta charset="gbk">
        <title>�һ��Ż�ȯ�������</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="renderer" content="webkit">

        <link rel="stylesheet" href="css/common/iconfont/iconfont.css">
        <link rel="stylesheet" href="css/dxt.css"> 
        <link rel="stylesheet" href="css/my_user_side/exchange_coupons_detail.css">

        <script type="text/javascript" src="js/common/jquery-2.1.4.min.js"></script>
        <script type="text/javascript" src="js/common/iconfont.js"></script>
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

			/*ԭ��������Ͻ�*/
			function callByNative(){
				var Persion ={
				title : "ƻ��",
				text : "text",
				imageUrl : "http://tva4.sinaimg.cn/crop.1.0.638.638.1024/a026df41jw8ea72uxthh7j20hs0hqaat.jpg",
				url : "http://www.baidu.com"
			}
				console.log("callByNative")
				native.doShare(JSON.stringify(Persion));
			}
		</script>
    </head>
    <body ontouchstart="" class="container">
        <section class="exchange-coupons-detail-container row text-center">
			<div class="coupons-base-info col-xs-12" id="panel">
				
	                
			</div>
			<div class="coupons-attr-container col-xs-12">
				<div class="coupons-attr-tip-container col-xs-12 text-left">
					<span class="coupons-attr-tip-icon col-xs-1"></span>
					<span class="coupons-attr-tip-text col-xs-10">�Ż�ȯ˵��</span>
				</div>
				<div class="coupons-attr-content-container col-xs-12 text-left">
					<span class="coupons-attr col-xs-12">���һ�������һ���˺�һ��һ�һ��</span>
					<span class="coupons-attr col-xs-12">��ʹ����������100Ԫ�ɼ�5Ԫ</span>
					<span class="coupons-attr col-xs-12">��ʹ����Ч�ڡ���Ч����ʹ��</span>
					<span class="coupons-attr col-xs-12">��ʹ�÷�Χ��ָ�������ŵ���Ʒ</span>
					<span class="coupons-attr col-xs-12">��ʹ��˵�����һ��ɹ����Ż�ȯ��ֱ�ӷ��롰�ҵ��Ż�ȯ�С����Ż�һ���һ���һ�ɲ��˻��Ʊҡ�</span>
				</div>
			</div>
			<div class="exchange-opt-nar col-xs-12" id="exchange">
                <span class="exchange-coupons col-xs-12">�һ�</span>
            </div>
            <!--<section class="exchange-coupons-share-wx col-xs-12 hide">
            		<div class="share-items col-xs-12">
            			<div class="share-item col-xs-4">
	            			<div class="share-friend">
	            				<span class="iconfont icon-weixin1"></span>
	            			</div>
	            			<span class="share-type-name">΢�ź���</span>
            			</div>
            			<div class="share-item col-xs-4">
	            			<div class="share-friend-circle">
	            				<svg class="top-icon" aria-hidden="true">
							    <use xlink:href="#icon-pengyouquan"></use>
							</svg>
	            			</div>
	            			<span class="share-type-name">΢������Ȧ</span>
            			</div>	
            		</div>
            		<div class="cancel-share col-xs-12">
            			<span>ȡ��</span>
            		</div>
            </section>-->
        </section>
		<div class="backdrop hide"></div>
		<script type="text/javascript" src="js/common_js/my_tools.js"></script>
        <script type="text/javascript" src="js/my_user_side/exchange_coupons_detail.js"></script>
		<script type="text/javascript">
			/*"exchange_coupons_detail.html?jump_coupon_id="+coupon_id+"jump_effective_date="+effective_date+"jump_expire_date="+expire_data+"jump_coupon_amount="+coupon_amount+"jump_serve_amount="+serve_amount+"jump_remarks"*/
			var request = new queryString();
			//�Ż�ȯ���
			var jump_coupon_id = request["jump_coupon_id"];
				console.log(location.href);
			//��Чʱ��
			var jump_effective_date = request["jump_effective_date"];
			//ʧЧʱ��
			var jump_expire_date = request["jump_expire_date"];
			//���ѽ��
			var jump_coupon_amount = request["jump_coupon_amount"];
			//�䵱���
			var jump_serve_amount = request["jump_serve_amount"];
			//��ע
			var jump_remarks = fromUtf8ToChinese(request["jump_remarks"]);
			//�Ʊ���
			var jump_cloud_number = request["jump_cloud_number"];

			var html = '<div class="col-xs-12">'
				+'<img src="image/my_user_side/exchange-coupons-detail-bg.png">'
				+'</div>'
				+'<div class="exchange-coupons-item col-xs-12">'
				+'<div class="voucher-amount col-xs-5">'
				+'<span class="voucher-amount-attr col-xs-12">'
				+'<span class="yuan">��</span>'
				+'<span class="amount-text">'+jump_serve_amount+'</span>'
				+'<span class="voucher-type-text">����ȯ</span>'
				+'</span>'
				+'<span class="amount-right-top-icon"></span>'
				+'<span class="amount-right-bottom-icon"></span>'
				+'</div>'
				+'<div class="voucher-use-condition col-xs-7 text-left">'
				+'<span class="full-amount-tip col-xs-12">����'+jump_coupon_amount+'��ʹ��</span>'
				+'<span class="used-store-name col-xs-12">'+jump_remarks+'</span>'
				+'<span class="use-endline col-xs-12">'+jump_effective_date+'��'+jump_expire_date+'</span>'
				+'</div>'
				+'</div>'
				+'<span class="cloud-currency-amount col-xs-12 text-left">'+jump_cloud_number+'<span>�Ʊ�</span></span>'
			$(html).appendTo("#panel");
		</script>
    </body>
</html>
