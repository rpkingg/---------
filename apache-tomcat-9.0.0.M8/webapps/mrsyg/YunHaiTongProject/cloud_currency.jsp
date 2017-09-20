<%@ page contentType="text/html;charset=GBK" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
    <head>
        <meta charset="gbk">
        <title>我的云币</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="renderer" content="webkit">
        <meta http-equiv="Cache-Control" content="no-cache"/>

        <link rel="stylesheet" href="css/common/iconfont/iconfont.css">
        <link rel="stylesheet" href="css/dxt.css"> 
        <link rel="stylesheet" href="css/my_user_side/cloud_currency.css">

        <script type="text/javascript" src="js/common/jquery-2.1.4.min.js"></script>
        <script type="text/javascript" src="js/common/iconfont.js"></script>
    </head>
    <body ontouchstart="" class="container">
        <section class="cloud-currency-container row text-center">
            <header class="cloud-currency-header col-xs-12">
            		<div class="my-cloud-currency-bg col-xs-12">
            			<img src="image/my_user_side/605FE9F2-B2EF-4F00-8445-DEDE1B50D560.png">
            		</div>
            		<div class="my-cloud-currency-count col-xs-12">
            			<span class="cloud-currency-text col-xs-12">26</span>
            			<span class="cloud-currency-count col-xs-12">云币数</span>
            		</div>
            </header>
            <span class="break-line-bar col-xs-12"></span>
            <div class="user-sign-in-container col-xs-12">
            		<div class="sign-in-tip-content col-xs-12">
            			<span class="already-sign-in-tip col-xs-9">
            				<span class="col-xs-9 text-left">·&nbsp;已连续签到<span class="sign-in-day">3</span>天</span>
            				<span class="col-xs-10 text-left">连续签到有惊喜，额外赠送云币</span>
            				
            			</span>
            			<span class="other-sign-in-tip col-xs-3">
            				<span class="col-xs-12">签到提醒</span>
            				<span class="sign-in-remind col-xs-10">
            					<span class="remind-icon disabled"></span>
					</span>
					</span>
					<div class="sign-in-container col-xs-12">
						<div class="sign-in-count col-xs-12">
							<span class="day-container">
            					<span class="col-xs-12 sign-day">1天</span>
							</span>
							<span class="day-container">
            					<span class="col-xs-12 sign-day">2天</span>
							</span>
							<span class="day-container">
            					<span class="col-xs-12 sign-day">3天</span>
							</span>
							<span class="day-container">
            					<span class="col-xs-12 sign-day">4天</span>
							</span>
							<span class="day-container">
            					<span class="col-xs-12 sign-day">5天</span>
							</span>
							<span class="day-container">
            					<span class="col-xs-12 sign-day">6天</span>
							</span>
							<span class="day-container">
            					<span class="col-xs-12 sign-day">7天</span>
							</span>
						</div>
						<div class="today-sign-in-container col-xs-12">
							<span class="today-sign-btn col-xs-6 col-xs-offset-2">今日签到</span>
							<span class="plus-cloud-currency col-xs-2">+10云币</span>
						</div>
					</div>
					<div class="exchange-coupons-container col-xs-12">
						<div class="exchange-coupons-tip-cont col-xs-12">
							<span class="exchange-coupons-title col-xs-7 text-left">兑换优惠券</span>
            					<span class="exchange-coupons-tip col-xs-5 text-right"><span class="exchange-coupons-tip-text" id="look_more">查看更多</span><span class="iconfont icon-rectangle1"></span></span>
						</div>

						<div class="exchange-coupons-content col-xs-12">
							<div class="exchange-coupons-item col-xs-12">
								<div class="voucher-amount col-xs-5">
									<span class="voucher-amount-attr col-xs-12">
				                			<span class="yuan">￥</span>
									<span class="amount-text">20</span>
									<span class="voucher-type-text">满减券</span>
									</span>
									<span class="full-amount-tip col-xs-12">满￥90可使用</span>
									<span class="amount-right-top-icon"></span>
									<span class="amount-right-bottom-icon"></span>
									<span class="amount-right-top-shadow"></span>
									<span class="amount-right-bottom-shadow"></span>
								</div>
								<div class="voucher-use-condition col-xs-7 text-left">
									<span class="used-store-name col-xs-12">仅适用于嘉兴市门店商品</span>
									<span class="use-endline col-xs-12">2017-06-26至2017-06-30</span>
									<span class="exchange-count-container col-xs-12">
				                    		<span class="exchange-count-text">50云币兑换</span>
									</span>
								</div>
							</div>
							<div class="exchange-coupons-item col-xs-12">
								<div class="voucher-amount col-xs-5">
									<span class="voucher-amount-attr col-xs-12">
				                			<span class="yuan">￥</span>
									<span class="amount-text">20</span>
									<span class="voucher-type-text">满减券</span>
									</span>
									<span class="full-amount-tip col-xs-12">满￥90可使用</span>
									<span class="amount-right-top-icon"></span>
									<span class="amount-right-bottom-icon"></span>
									<span class="amount-right-top-shadow"></span>
									<span class="amount-right-bottom-shadow"></span>
								</div>
								<div class="voucher-use-condition col-xs-7 text-left">
									<span class="used-store-name col-xs-12">仅适用于嘉兴市门店商品</span>
									<span class="use-endline col-xs-12">2017-06-26至2017-06-30</span>
									<span class="exchange-count-container col-xs-12">
				                    		<span class="exchange-count-text">50云币兑换</span>
									</span>
								</div>
							</div>
						</div>
					</div>
					<div class="cloud-currency-detail-container col-xs-12">
						<span class="cloud-currency-detail-title col-xs-12 text-left">云币明细</span>
						<div class="cloud-currency-detail-content col-xs-12">
							<div class="cloud-currency-detail-item col-xs-12">
								<span class="col-xs-4 text-left">8-23 14:00</span>
								<span class="col-xs-4">签到</span>
								<span class="cloud-currency-use-detail col-xs-4">
            							<svg class="cloud-currency-icon" aria-hidden="true">
									    <use xlink:href="#icon-yunbi"></use>
									</svg>
            							<span class="cloud-currency-value">+2</span>
								</span>
							</div>
							<div class="cloud-currency-detail-item col-xs-12">
								<span class="col-xs-4 text-left">8-23 14:00</span>
								<span class="col-xs-4">签到</span>
								<span class="cloud-currency-use-detail col-xs-4">
            							<svg class="cloud-currency-icon" aria-hidden="true">
									    <use xlink:href="#icon-yunbi"></use>
									</svg>
            							<span class="cloud-currency-value">+2</span>
								</span>
							</div>
							<div class="cloud-currency-detail-item col-xs-12">
								<span class="col-xs-4 text-left">8-23 14:00</span>
								<span class="col-xs-4">签到</span>
								<span class="cloud-currency-use-detail col-xs-4">
            							<svg class="cloud-currency-icon" aria-hidden="true">
									    <use xlink:href="#icon-yunbi"></use>
									</svg>
            							<span class="cloud-currency-value">-2</span>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</body>
	<script type="text/javascript" src="js/common_js/my_tools.js"></script>
	<script type="text/javascript" src="js/my_user_side/cloud_currency.js"></script>

</html>