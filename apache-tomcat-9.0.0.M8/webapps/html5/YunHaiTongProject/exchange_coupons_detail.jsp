<%@ page contentType="text/html;charset=GBK" language="java" %>
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
        <link rel="stylesheet" href="css/my_user_side/exchange_coupons_detail.css">

        <script type="text/javascript" src="js/common/jquery-2.1.4.min.js"></script>
        <script type="text/javascript" src="js/common/iconfont.js"></script>
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

			/*原生点击右上角*/
			function callByNative(){
				var Persion ={
				title : "苹果",
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
					<span class="coupons-attr-tip-text col-xs-10">优惠券说明</span>
				</div>
				<div class="coupons-attr-content-container col-xs-12 text-left">
					<span class="coupons-attr col-xs-12">【兑换条件】一个账号一天兑换一次</span>
					<span class="coupons-attr col-xs-12">【使用条件】满100元可减5元</span>
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
		<div class="backdrop hide"></div>
		<script type="text/javascript" src="js/common_js/my_tools.js"></script>
        <script type="text/javascript" src="js/my_user_side/exchange_coupons_detail.js"></script>
		<script type="text/javascript">
			/*"exchange_coupons_detail.html?jump_coupon_id="+coupon_id+"jump_effective_date="+effective_date+"jump_expire_date="+expire_data+"jump_coupon_amount="+coupon_amount+"jump_serve_amount="+serve_amount+"jump_remarks"*/
			var request = new queryString();
			//优惠券编号
			var jump_coupon_id = request["jump_coupon_id"];
				console.log(location.href);
			//有效时间
			var jump_effective_date = request["jump_effective_date"];
			//失效时间
			var jump_expire_date = request["jump_expire_date"];
			//消费金额
			var jump_coupon_amount = request["jump_coupon_amount"];
			//充当金额
			var jump_serve_amount = request["jump_serve_amount"];
			//备注
			var jump_remarks = fromUtf8ToChinese(request["jump_remarks"]);
			//云币数
			var jump_cloud_number = request["jump_cloud_number"];

			var html = '<div class="col-xs-12">'
				+'<img src="image/my_user_side/exchange-coupons-detail-bg.png">'
				+'</div>'
				+'<div class="exchange-coupons-item col-xs-12">'
				+'<div class="voucher-amount col-xs-5">'
				+'<span class="voucher-amount-attr col-xs-12">'
				+'<span class="yuan">￥</span>'
				+'<span class="amount-text">'+jump_serve_amount+'</span>'
				+'<span class="voucher-type-text">满减券</span>'
				+'</span>'
				+'<span class="amount-right-top-icon"></span>'
				+'<span class="amount-right-bottom-icon"></span>'
				+'</div>'
				+'<div class="voucher-use-condition col-xs-7 text-left">'
				+'<span class="full-amount-tip col-xs-12">满￥'+jump_coupon_amount+'可使用</span>'
				+'<span class="used-store-name col-xs-12">'+jump_remarks+'</span>'
				+'<span class="use-endline col-xs-12">'+jump_effective_date+'至'+jump_expire_date+'</span>'
				+'</div>'
				+'</div>'
				+'<span class="cloud-currency-amount col-xs-12 text-left">'+jump_cloud_number+'<span>云币</span></span>'
			$(html).appendTo("#panel");
		</script>
    </body>
</html>
