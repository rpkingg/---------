<%@ page contentType="text/html;charset=GBK" language="java" %>
<%@ include file="/YunHaiTongProject/common/taglibs.jsp" %>
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
		<link rel="stylesheet" href="css/my_user_side/exchange_coupons_detail.css?ts=${ts}">
		<script type="text/javascript" src="js/common/jquery-2.1.4.min.js"></script>
		<script type="text/javascript">
			/*ԭ��������Ͻ�*/
			if(window.native != null && typeof(window.native) != "undefined") {
				native.setTitleRight("����");
			} else {
				//alert(typeof(window.native));
			}

			function getUrlQueryStrig(url){
				var num = url.indexOf("?")
				if( num == - 1) {
					return "";
				}
				return url.substr(num + 1);
			}
			function callByNative(){
				var Persion ={
						title : $(".amount-text").text() + "Ԫ����ȯ",
						text : "����"+$(".full-amount-tip").text()+"��ʹ��\n" + $(".used-store-name").text() + "\n" + $(".effective_date").text()+"��"+$(".expire_date").text(),
						imageUrl : "http://120.76.190.223:8983/mrsyg/YunHaiTongProject/img/cloud_money@3x.png",
						url : "share_coupons.jsp?" + getUrlQueryStrig(location.href)
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
					<span class="coupons-attr col-xs-12">��ʹ����������<span class="full_money"></span>Ԫ�ɼ�<span class="less_money"></span>Ԫ</span>
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
		<c:if test="${DEBUG}">
			<script type="text/javascript" src="js/common_js/vconsole.min.js"></script>
		</c:if>
		<div class="backdrop hide"></div>
		<script type="text/javascript" src="js/common_js/my_tools.js?ts=${ts}"></script>
		<script type="text/javascript" src="js/my_user_side/exchange_coupons_detail.js"></script>
		<script type="text/javascript">
			$(function () {
					var jump_coupon_id = "";
				$(function(){
					/*"exchange_coupons_detail.html?jump_coupon_id="+coupon_id+"jump_effective_date="+effective_date+"jump_expire_date="+expire_data+"jump_coupon_amount="+coupon_amount+"jump_serve_amount="+serve_amount+"jump_remarks"*/
					var request = new queryString();
					//�Ż�ȯ���
					jump_coupon_id = request["jump_coupon_id"];
					//��Чʱ��
					var jump_effective_date = request["jump_effective_date"];
					//ʧЧʱ��
					var jump_expire_date = request["jump_expire_date"];
					//���ѽ��
					var jump_coupon_amount = request["jump_coupon_amount"];
					//�䵱���
					var jump_serve_amount = request["jump_serve_amount"];
					//��ע
					// var jump_remarks = fromUtf8ToChinese(request["jump_remarks"]);
					var jump_remarks = decodeURI(request["jump_remarks"]);

					console.log("jump_remarks:" + jump_remarks);
					//�Ʊ���
					var jump_cloud_number = request["jump_cloud_number"];

					$(".full_money").text(jump_coupon_amount);

					$(".less_money").text(jump_serve_amount);

					var html = '<div class="col-xs-12 col-xs-height" data-id="'+jump_coupon_id+'">'
					+'</div>'
					+'<div class="exchange-coupons-item col-xs-12">'
					+'<div class="voucher-amount col-xs-5 col-xs-width-5">'
					+'<span class="voucher-amount-attr col-xs-12">'
					+'<span class="yuan">��</span>'
					+'<span class="amount-text">'+jump_serve_amount+'</span>'
					+'<span class="voucher-type-text">����ȯ</span>'
					+'</span>'
					+'<span class="amount-right-top-icon"></span>'
					+'<span class="amount-right-bottom-icon"></span>'
					+'</div>'
					+'<div class="voucher-use-condition col-xs-7 text-left col-xs-width">'
					+'<span class="full-amount-tip col-xs-12">����'+jump_coupon_amount+'��ʹ��</span>'
					+'<span class="used-store-name col-xs-12">'+jump_remarks+'</span>'
					+'<span class="use-endline col-xs-12"><span class="effective_date">'+jump_effective_date+'</span>��<span class="expire_date">'+jump_expire_date+'</spanclass></span>'
					+'</div>'
					+'</div>'
					+'<span class="cloud-currency-amount col-xs-12 text-left">'+jump_cloud_number+'<span>�Ʊ�</span></span>'
					$(html).appendTo("#panel");
				})
			});
		</script>
    </body>
 		<script type="text/javascript" src="js/common_js/vconsole.min.js"></script>
</html>
