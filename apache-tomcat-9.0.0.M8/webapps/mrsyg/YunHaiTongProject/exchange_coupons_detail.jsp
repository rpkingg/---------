<%@ page contentType="text/html;charset=GBK" language="java" %>
<%@ include file="/YunHaiTongProject/common/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta charset="gbk">
		<title>兑换优惠券详情界面</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="renderer" content="webkit">
		<link rel="stylesheet" href="css/common/iconfont/iconfont.css">
		<link rel="stylesheet" href="css/dxt.css">
		<link rel="stylesheet" href="css/my_user_side/exchange_coupons_detail.css?ts=${ts}">
		<script type="text/javascript" src="js/common/jquery-2.1.4.min.js"></script>
		<script type="text/javascript">
			/*原生点击右上角*/
			if(window.native != null && typeof(window.native) != "undefined") {
				native.setTitleRight("分享");
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
						title : $(".amount-text").text() + "元满减券",
						text : "满￥"+$(".full-amount-tip").text()+"可使用\n" + $(".used-store-name").text() + "\n" + $(".effective_date").text()+"至"+$(".expire_date").text(),
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
					<span class="coupons-attr-tip-text col-xs-10">优惠券说明</span>
				</div>
				<div class="coupons-attr-content-container col-xs-12 text-left">
					<span class="coupons-attr col-xs-12">【兑换条件】一个账号一天兑换一次</span>
					<span class="coupons-attr col-xs-12">【使用条件】满<span class="full_money"></span>元可减<span class="less_money"></span>元</span>
					<span class="coupons-attr col-xs-12">【使用有效期】有效期内使用</span>
					<span class="coupons-attr col-xs-12">【使用范围】指定地市门店商品</span>
					<span class="coupons-attr col-xs-12">【使用说明】兑换成功后，优惠券将直接放入“我的优惠券中”。优惠一经兑换，一律不退换云币。</span>
				</div>
			</div>
			<div class="exchange-opt-nar col-xs-12" id="exchange">
                <span class="exchange-coupons col-xs-12">兑换</span>
            </div>
            <!--<section class="exchange-coupons-share-wx col-xs-12 hide">
            		<div class="share-items col-xs-12">
            			<div class="share-item col-xs-4">
	            			<div class="share-friend">
	            				<span class="iconfont icon-weixin1"></span>
	            			</div>
	            			<span class="share-type-name">微信好友</span>
            			</div>
            			<div class="share-item col-xs-4">
	            			<div class="share-friend-circle">
	            				<svg class="top-icon" aria-hidden="true">
							    <use xlink:href="#icon-pengyouquan"></use>
							</svg>
	            			</div>
	            			<span class="share-type-name">微信朋友圈</span>
            			</div>	
            		</div>
            		<div class="cancel-share col-xs-12">
            			<span>取消</span>
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
					//优惠券编号
					jump_coupon_id = request["jump_coupon_id"];
					//有效时间
					var jump_effective_date = request["jump_effective_date"];
					//失效时间
					var jump_expire_date = request["jump_expire_date"];
					//消费金额
					var jump_coupon_amount = request["jump_coupon_amount"];
					//充当金额
					var jump_serve_amount = request["jump_serve_amount"];
					//备注
					// var jump_remarks = fromUtf8ToChinese(request["jump_remarks"]);
					var jump_remarks = decodeURI(request["jump_remarks"]);

					console.log("jump_remarks:" + jump_remarks);
					//云币数
					var jump_cloud_number = request["jump_cloud_number"];

					$(".full_money").text(jump_coupon_amount);

					$(".less_money").text(jump_serve_amount);

					var html = '<div class="col-xs-12 col-xs-height" data-id="'+jump_coupon_id+'">'
					+'</div>'
					+'<div class="exchange-coupons-item col-xs-12">'
					+'<div class="voucher-amount col-xs-5 col-xs-width-5">'
					+'<span class="voucher-amount-attr col-xs-12">'
					+'<span class="yuan">￥</span>'
					+'<span class="amount-text">'+jump_serve_amount+'</span>'
					+'<span class="voucher-type-text">满减券</span>'
					+'</span>'
					+'<span class="amount-right-top-icon"></span>'
					+'<span class="amount-right-bottom-icon"></span>'
					+'</div>'
					+'<div class="voucher-use-condition col-xs-7 text-left col-xs-width">'
					+'<span class="full-amount-tip col-xs-12">满￥'+jump_coupon_amount+'可使用</span>'
					+'<span class="used-store-name col-xs-12">'+jump_remarks+'</span>'
					+'<span class="use-endline col-xs-12"><span class="effective_date">'+jump_effective_date+'</span>至<span class="expire_date">'+jump_expire_date+'</spanclass></span>'
					+'</div>'
					+'</div>'
					+'<span class="cloud-currency-amount col-xs-12 text-left">'+jump_cloud_number+'<span>云币</span></span>'
					$(html).appendTo("#panel");
				})
			});
		</script>
    </body>
 		<script type="text/javascript" src="js/common_js/vconsole.min.js"></script>
</html>
