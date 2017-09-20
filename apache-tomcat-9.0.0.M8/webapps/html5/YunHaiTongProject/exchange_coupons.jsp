<%@ page contentType="text/html;charset=GBK" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
    <head>
        <meta charset="gbk">
        <title>我的优惠券</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="renderer" content="webkit">

        <link rel="stylesheet" href="css/common/iconfont/iconfont.css">
        <link rel="stylesheet" href="css/dxt.css"> 
        <link rel="stylesheet" href="css/my_user_side/exchange_coupons.css">
        <script type="text/javascript" src="js/common/jquery-2.1.4.min.js"></script>
    </head>
    <body ontouchstart="">
		<header>
			<div class="exchange-coupons-header">
				<div class="tab-list">
					<div class="tab-item">
						<div class="tab selected">
							<span>未使用</span>
						</div>
					</div>
					<div class="tab-item">
						<div class="tab">
							<span>已使用</span>
						</div>
					</div>
					<div class="tab-item">
						<div class="tab">
							<span>已过期</span>
						</div>
					</div>
				</div>
			</div>
		</header>
		<div class="prompt">
			<div class="infor_tips">
				<img src="image/my_user_side/infor_tips.png" class="infor_tips_img"/>
			</div>
			<p>提示： 当前优惠券信息可以分享给你的好友哦</p>
			<div class="back_click">
				<img src="image/my_user_side/back_click.png" class="back_click_img"/>
			</div>
		</div>
        <section class="exchange-coupons-container row text-center">
			<div class="exchange-coupons-content col-xs-12 car-container" id="panel1">
				<!--<div class="exchange-coupons-item col-xs-12">
					<div class="voucher-amount col-xs-5">
	                		<span class="voucher-amount-attr col-xs-12 out-of-use">
	                			<span class="yuan">￥</span>
		                    <span class="amount-text">20</span>
		                    <span class="voucher-type-text">满减券</span>
	                		</span>
						<span class="amount-right-top-icon"></span>
						<span class="amount-right-bottom-icon"></span>
					</div>
					<div class="voucher-use-condition-nouse col-xs-7 text-left">
						<span class="full-amount-tip-nouse col-xs-12 out-of-use">满减券 满90可用</span>
						<span class="used-store-name-nouse col-xs-12 out-of-use">仅适用于嘉兴市门店商品</span>
						<span class="use-endline col-xs-12 out-of-use">2017-06-26已使用</span>
					</div>
					<div class="share_other">
						<img src="../../image/my_user_side/share_other.png" class="share_img"/>
					</div>
				</div>-->
				<!--<div class="exchange-coupons-item col-xs-12">
	                <div class="voucher-amount col-xs-5">
	                		<span class="voucher-amount-attr col-xs-12">
	                			<span class="yuan">￥</span>
		                    <span class="amount-text">20</span>
		                    <span class="voucher-type-text">满减券</span>
	                		</span>
	                    <span class="full-amount-tip col-xs-12">满￥90可使用</span>
	                    <span class="amount-right-top-icon"></span>
	    					<span class="amount-right-bottom-icon"></span>
	                </div>
	                <div class="voucher-use-condition col-xs-7 text-left">
	                    <span class="used-store-name col-xs-12">仅适用于嘉兴市门店商品</span>
	                    <span class="use-endline col-xs-12">2017-06-26至2017-06-30</span>
	                    <span class="exchange-count-container col-xs-12">
	                    		<span class="exchange-count-text">50云币兑换</span>
	                    </span>
	                </div>
	            </div>-->
	            <!--<div class="exchange-coupons-item col-xs-12">
	                <div class="voucher-amount col-xs-5">
	                		<span class="voucher-amount-attr col-xs-12">
	                			<span class="yuan">￥</span>
		                    <span class="amount-text">20</span>
		                    <span class="voucher-type-text">满减券</span>
	                		</span>
	                    <span class="full-amount-tip col-xs-12">满￥90可使用</span>
	                    <span class="amount-right-top-icon"></span>
	    					<span class="amount-right-bottom-icon"></span>
	                </div>
	                <div class="voucher-use-condition col-xs-7 text-left">
	                    <span class="used-store-name col-xs-12">仅适用于嘉兴市门店商品</span>
	                    <span class="use-endline col-xs-12">2017-06-26至2017-06-30</span>
	                    <span class="exchange-count-container col-xs-12">
	                    		<span class="exchange-count-text">50云币兑换</span>
	                    </span>
	                </div>
	            </div>-->
	            <!--<div class="exchange-coupons-item col-xs-12">
	                <div class="voucher-amount col-xs-5">
	                		<span class="voucher-amount-attr col-xs-12">
	                			<span class="yuan">￥</span>
		                    <span class="amount-text">20</span>
		                    <span class="voucher-type-text">满减券</span>
	                		</span>
	                    <span class="full-amount-tip col-xs-12">满￥90可使用</span>
	                    <span class="amount-right-top-icon"></span>
	    					<span class="amount-right-bottom-icon"></span>
	                </div>
	                <div class="voucher-use-condition col-xs-7 text-left">
	                    <span class="used-store-name col-xs-12">仅适用于嘉兴市门店商品</span>
	                    <span class="use-endline col-xs-12">2017-06-26至2017-06-30</span>
	                    <span class="exchange-count-container col-xs-12">
	                    		<span class="exchange-count-text">50云币兑换</span>
	                    </span>
	                </div>
	            </div>-->
	           <!-- <div class="exchange-coupons-item col-xs-12">
	                <div class="voucher-amount col-xs-5">
	                		<span class="voucher-amount-attr col-xs-12">
	                			<span class="yuan">￥</span>
		                    <span class="amount-text">20</span>
		                    <span class="voucher-type-text">满减券</span>
	                		</span>
	                    <span class="full-amount-tip col-xs-12">满￥90可使用</span>
	                    <span class="amount-right-top-icon"></span>
	    					<span class="amount-right-bottom-icon"></span>
	                </div>
	                <div class="voucher-use-condition col-xs-7 text-left">
	                    <span class="used-store-name col-xs-12">仅适用于嘉兴市门店商品</span>
	                    <span class="use-endline col-xs-12">2017-06-26至2017-06-30</span>
	                    <span class="exchange-count-container col-xs-12">
	                    		<span class="exchange-count-text">50云币兑换</span>
	                    </span>
	                </div>
	            </div>-->
			</div>
			<div class="exchange-coupons-content col-xs-12 car-container" id="panel2">
				<!--<div class="exchange-coupons-item col-xs-12">
					<div class="voucher-amount col-xs-5">
	                		<span class="voucher-amount-attr col-xs-12 out-of-use">
	                			<span class="yuan">￥</span>
		                    <span class="amount-text">20</span>
		                    <span class="voucher-type-text">满减券</span>
	                		</span>
						<span class="amount-right-top-icon"></span>
						<span class="amount-right-bottom-icon"></span>
					</div>
					<div class="voucher-use-condition-nouse col-xs-7 text-left">
						<span class="full-amount-tip-nouse col-xs-12 out-of-use">满减券 满90可用</span>
						<span class="used-store-name-nouse col-xs-12 out-of-use">仅适用于嘉兴市门店商品</span>
						<span class="use-endline col-xs-12 out-of-use">2017-06-26已使用</span>
					</div>
				</div>
				<div class="exchange-coupons-item col-xs-12">
					<div class="voucher-amount col-xs-5">
	                		<span class="voucher-amount-attr col-xs-12 out-of-use">
	                			<span class="yuan">￥</span>
		                    <span class="amount-text">20</span>
		                    <span class="voucher-type-text">满减券</span>
	                		</span>
						<span class="amount-right-top-icon"></span>
						<span class="amount-right-bottom-icon"></span>
					</div>
					<div class="voucher-use-condition-nouse col-xs-7 text-left">
						<span class="full-amount-tip-nouse col-xs-12 out-of-use">满减券 满90可用</span>
						<span class="used-store-name-nouse col-xs-12 out-of-use">仅适用于嘉兴市门店商品</span>
						<span class="use-endline col-xs-12 out-of-use">2017-06-26已使用</span>
					</div>
				</div>
				<div class="exchange-coupons-item col-xs-12">
					<div class="voucher-amount col-xs-5">
	                		<span class="voucher-amount-attr col-xs-12 out-of-use">
	                			<span class="yuan">￥</span>
		                    <span class="amount-text">20</span>
		                    <span class="voucher-type-text">满减券</span>
	                		</span>
						<span class="amount-right-top-icon"></span>
						<span class="amount-right-bottom-icon"></span>
					</div>
					<div class="voucher-use-condition-nouse col-xs-7 text-left">
						<span class="full-amount-tip-nouse col-xs-12 out-of-use">满减券 满90可用</span>
						<span class="used-store-name-nouse col-xs-12 out-of-use">仅适用于嘉兴市门店商品</span>
						<span class="use-endline col-xs-12 out-of-use">2017-06-26已使用</span>
					</div>
				</div>
				<div class="exchange-coupons-item col-xs-12">
					<div class="voucher-amount col-xs-5">
	                		<span class="voucher-amount-attr col-xs-12 out-of-use">
	                			<span class="yuan">￥</span>
		                    <span class="amount-text">20</span>
		                    <span class="voucher-type-text">满减券</span>
	                		</span>
						<span class="amount-right-top-icon"></span>
						<span class="amount-right-bottom-icon"></span>
					</div>
					<div class="voucher-use-condition-nouse col-xs-7 text-left">
						<span class="full-amount-tip-nouse col-xs-12 out-of-use">满减券 满90可用</span>
						<span class="used-store-name-nouse col-xs-12 out-of-use">仅适用于嘉兴市门店商品</span>
						<span class="use-endline col-xs-12 out-of-use">2017-06-26已使用</span>
					</div>
				</div>-->
			</div>
			<div class="exchange-coupons-content col-xs-12 car-container" id="panel3">
				<!--<div class="exchange-coupons-item col-xs-12">
					<div class="voucher-amount col-xs-5">
	                		<span class="voucher-amount-attr col-xs-12 out-of-use">
	                			<span class="yuan">￥</span>
		                    <span class="amount-text">20</span>
		                    <span class="voucher-type-text">满减券</span>
	                		</span>
						<span class="amount-right-top-icon"></span>
						<span class="amount-right-bottom-icon"></span>
					</div>
					<div class="voucher-use-condition-nouse col-xs-7 text-left">
						<span class="full-amount-tip-nouse col-xs-12 out-of-use">满减券 满90可用</span>
						<span class="used-store-name-nouse col-xs-12 out-of-use">仅适用于嘉兴市门店商品</span>
						<span class="use-endline col-xs-12 out-of-use">2017-06-26已使用</span>
					</div>
				</div>
				<div class="exchange-coupons-item col-xs-12">
					<div class="voucher-amount col-xs-5">
	                		<span class="voucher-amount-attr col-xs-12 out-of-use">
	                			<span class="yuan">￥</span>
		                    <span class="amount-text">20</span>
		                    <span class="voucher-type-text">满减券</span>
	                		</span>
						<span class="amount-right-top-icon"></span>
						<span class="amount-right-bottom-icon"></span>
					</div>
					<div class="voucher-use-condition-nouse col-xs-7 text-left">
						<span class="full-amount-tip-nouse col-xs-12 out-of-use">满减券 满90可用</span>
						<span class="used-store-name-nouse col-xs-12 out-of-use">仅适用于嘉兴市门店商品</span>
						<span class="use-endline col-xs-12 out-of-use">2017-06-26已使用</span>
					</div>
				</div>
				<div class="exchange-coupons-item col-xs-12">
					<div class="voucher-amount col-xs-5">
	                		<span class="voucher-amount-attr col-xs-12 out-of-use">
	                			<span class="yuan">￥</span>
		                    <span class="amount-text">20</span>
		                    <span class="voucher-type-text">满减券</span>
	                		</span>
						<span class="amount-right-top-icon"></span>
						<span class="amount-right-bottom-icon"></span>
					</div>
					<div class="voucher-use-condition-nouse col-xs-7 text-left">
						<span class="full-amount-tip-nouse col-xs-12 out-of-use">满减券 满90可用</span>
						<span class="used-store-name-nouse col-xs-12 out-of-use">仅适用于嘉兴市门店商品</span>
						<span class="use-endline col-xs-12 out-of-use">2017-06-26已使用</span>
					</div>
				</div>
				<div class="exchange-coupons-item col-xs-12">
					<div class="voucher-amount col-xs-5">
	                		<span class="voucher-amount-attr col-xs-12 out-of-use">
	                			<span class="yuan">￥</span>
		                    <span class="amount-text">20</span>
		                    <span class="voucher-type-text">满减券</span>
	                		</span>
						<span class="amount-right-top-icon"></span>
						<span class="amount-right-bottom-icon"></span>
					</div>
					<div class="voucher-use-condition-nouse col-xs-7 text-left">
						<span class="full-amount-tip-nouse col-xs-12 out-of-use">满减券 满90可用</span>
						<span class="used-store-name-nouse col-xs-12 out-of-use">仅适用于嘉兴市门店商品</span>
						<span class="use-endline col-xs-12 out-of-use">2017-06-26已使用</span>
					</div>
				</div>-->
			</div>
        </section>
	<script type="text/javascript" src="js/common_js/my_tools.js"></script>
        <script type="text/javascript" src="js/my_user_side/exchange_coupons.js"></script>
		<script type="text/javascript">
			//提示层
			$(".back_click").on("click",function () {
				$(".prompt").hide();
			})

			//头部控制
			$(".tab").on("click", function(e) {
				var tabIndex = $(this).parent().index();
				$(".tab-list .tab-item").each(function() {
					if($(this).index() == tabIndex) {
						$(this).children().addClass("selected");
					} else {
						$(this).children().removeClass("selected");
					}
				});

				switch(tabIndex) {
					case 0:
						showHidePanel(tabIndex + 1);
						break;
					case 1:
						showHidePanel(tabIndex + 1);
						break;
					case 2:
						showHidePanel(tabIndex + 1);
						break;
					case 3:
						showHidePanel(tabIndex + 1);
						break;
					case 4:
						showHidePanel(tabIndex + 1);
						break;
					case 5:
						showHidePanel(tabIndex + 1);
						break;
					default:
						break;
				}
			});

			function showHidePanel(index) {
				$("#panel" + index).show().siblings(".car-container").hide();
			}

			//未使用接口路径
			var urlPath_one = "mrsyg/kquser/MyCoupon.form";
			var need_data = {
				"status": "0"
			};
			var data_one = myAjax(urlPath_one, need_data);
			if(data_one != undefined) {
				init(data_one);
			}
			function init(datas) {
				$.each(datas.data, function(index, getdata) {
					//优惠券编号
					var coupon_id = getdata.coupon_id;
					//有效时间
					var effective_date = getdata.effective_date;
					//失效时间
					var expire_date = getdata.expire_date;
					//使用时间
					var use_time = getdata.use_time;
					//消费金额
					var coupon_amount = getdata.coupon_amount;
					//充当金额
					var serve_amount = getdata.serve_amount;
					//备注
					var remarks = getdata.remarks;
					var html = '<div class="exchange-coupons-item col-xs-12" data-id="+coupon_id+">'
					+ '<div class="voucher-amount col-xs-5">'
					+'<span class="voucher-amount-attr col-xs-12">'
					+'<span class="yuan">￥</span>'
					+'<span class="amount-text">'+serve_amount+'</span>'
					+'<span class="voucher-type-text">满减券</span>'
					+'</span>'
					+'<span class="amount-right-top-icon"></span>'
					+'<span class="amount-right-bottom-icon"></span>'
					+'</div>'
					+'<div class="voucher-use-condition-nouse col-xs-7 text-left">'
					+'<span class="full-amount-tip-nouse col-xs-12">满减券 满'+coupon_amount+'可用</span>'
					+'<span class="used-store-name-nouse col-xs-12 out-of-use">'+remarks+'</span>'
					+'<span class="use-endline col-xs-12 out-of-use">'+effective_date+'至'+expire_date+'</span>'
					+'</div>'
					+'<div class="share_other">'
					+'<img src="image/my_user_side/share_other.png" class="share_img"/>'
					+'</div>'
					+'</div>'
					$(html).appendTo("#panel1");
				})
			}

			//已使用接口路径
			var urlPath_old = "mrsyg/kquser/MyCoupon.form";
			var need_data_old = {
				"status": "1"
			};
			var data_old = myAjax(urlPath_old, need_data_old);
			if(data_old != undefined) {
				init_old(data_old);
			}
			function init_old(datas) {
				$.each(datas.data, function(index, getdata) {
					//优惠券编号
					var coupon_id = getdata.coupon_id;
					//有效时间
					var effective_date = getdata.effective_date;
					//失效时间
					var expire_date = getdata.expire_date;
					//使用时间
					var use_time = getdata.use_time;
					//消费金额
					var coupon_amount = getdata.coupon_amount;
					//充当金额
					var serve_amount = getdata.serve_amount;
					//备注
					var remarks = getdata.remarks;
					var hl = '<div class="exchange-coupons-item col-xs-12" data-id="+coupon_id+">'
							+ '<div class="voucher-amount col-xs-5">'
							+'<span class="voucher-amount-attr col-xs-12">'
							+'<span class="yuan">￥</span>'
							+'<span class="amount-text">'+serve_amount+'</span>'
							+'<span class="voucher-type-text">满减券</span>'
							+'</span>'
							+'<span class="amount-right-top-icon"></span>'
							+'<span class="amount-right-bottom-icon"></span>'
							+'</div>'
							+'<div class="voucher-use-condition-nouse col-xs-7 text-left">'
							+'<span class="full-amount-tip-nouse col-xs-12 out-of-use">满减券 满'+coupon_amount+'已过期</span>'
							+'<span class="used-store-name-nouse col-xs-12 out-of-use">'+remarks+'</span>'
							+'<span class="use-endline col-xs-12 out-of-use">'+effective_date+'至'+expire_date+'</span>'
							+'</div>'
							+'</div>'
					$(hl).appendTo("#panel2");
				})
			}

			//已使用接口路径
			var urlPath_used = "mrsyg/kquser/MyCoupon.form";
			var need_data_used = {
				"status": "2"
			};
			var data_used = myAjax(urlPath_used, need_data_used);
			if(data_used != undefined) {
				init_used(data_used);
			}
			function init_used(datas) {
				$.each(datas.data, function(index, getdata) {
					//优惠券编号
					var coupon_id = getdata.coupon_id;
					//有效时间
					var effective_date = getdata.effective_date;
					//失效时间
					var expire_date = getdata.expire_date;
					//使用时间
					var use_time = getdata.use_time;
					//消费金额
					var coupon_amount = getdata.coupon_amount;
					//充当金额
					var serve_amount = getdata.serve_amount;
					//备注
					var remarks = getdata.remarks;
					var htmlk = '<div class="exchange-coupons-item col-xs-12" data-id="+coupon_id+">'
							+ '<div class="voucher-amount col-xs-5">'
							+'<span class="voucher-amount-attr col-xs-12">'
							+'<span class="yuan">￥</span>'
							+'<span class="amount-text">'+serve_amount+'</span>'
							+'<span class="voucher-type-text">满减券</span>'
							+'</span>'
							+'<span class="amount-right-top-icon"></span>'
							+'<span class="amount-right-bottom-icon"></span>'
							+'</div>'
							+'<div class="voucher-use-condition-nouse col-xs-7 text-left">'
							+'<span class="full-amount-tip-nouse col-xs-12 out-of-use">满减券 满'+coupon_amount+'已使用</span>'
							+'<span class="used-store-name-nouse col-xs-12 out-of-use">'+remarks+'</span>'
							+'<span class="use-endline col-xs-12 out-of-use">'+effective_date+'至'+expire_date+'</span>'
							+'</div>'
							+'</div>'
					$(htmlk).appendTo("#panel3");
				})
			}

			//分享
			$(".share_other").on("click",function () {
				var Persion ={
					title : "满减券",
					text : "满100减200优惠券",
					imageUrl : "http://tva4.sinaimg.cn/crop.1.0.638.638.1024/a026df41jw8ea72uxthh7j20hs0hqaat.jpg",
					url : "http://www.baidu.com"
				}
				native.doShare(JSON.stringify(Persion));
			})
			//点击分享跳转
			/*$("#panel1").on("click",".col-xs-12",function () {
				var jump_coupon_id = $("this").attr("data-id")
				var jump_effective_date = $("this").attr("data-effective_date")
				var jump_expire_date = $("this").attr("data-expire_date")
				var jump_coupon_amount = $("this").attr("data-coupon_amount")
				var jump_serve_amount = $("this").attr("data-serve_amount")
				var jump_remarks = $("this").attr("data-remarks")
				native.openWebView("exchange_coupons_detail.html?jump_coupon_id="+coupon_id+"jump_effective_date="+effective_date+"jump_expire_date="+expire_data+"jump_coupon_amount="+coupon_amount+"jump_serve_amount="+serve_amount+"jump_remarks="+remarks);
			})*/
		</script>
    </body>
</html>