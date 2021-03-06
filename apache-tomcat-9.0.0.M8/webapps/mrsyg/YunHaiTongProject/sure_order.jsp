<%@ page contentType="text/html;charset=GBK" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
    <head>
        <meta charset="gbk">
        <title>确认订单</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="renderer" content="webkit">
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <!-- 图标库css -->
        <link rel="stylesheet" href="css/common/iconfont/iconfont.css">
        <link rel="stylesheet" href="css/common/mui.css">
        <link rel="stylesheet" href="css/common/mui.picker.css">
        <link rel="stylesheet" href="css/common/mui.poppicker.css">
        <link rel="stylesheet" href="css/dxt.css"> 
        <link rel="stylesheet" href="css/find_goods/sure_order.css">
        <!-- 引入jquery.js -->
        <script type="text/javascript" src="js/common/jquery-2.1.4.min.js"></script>
        <script type="text/javascript" src="js/common/pay_mode.data.js"></script>
        <script type="text/javascript" src="js/common/distribution_mode.data.js"></script>
        <script type="text/javascript" src="js/common/mui.min.js"></script>
        <script type="text/javascript" src="js/common/mui.picker.js"></script>
        <script type="text/javascript" src="js/common/mui.poppicker.js"></script>
        <script type="text/javascript" src="js/common_js/vconsole.min.js"></script>
    </head>
    <body ontouchstart="" class="container">
        <section class="sure-order-container row text-center">
            <div class="get-goods-address col-xs-12">
                <div class="no-default-address col-xs-11 hide">
                    <span class="col-xs-12">添加收货地址</span>
                </div>
                <div class="has-default-address col-xs-11 text-left hide">
                    <span class="col-xs-12"><span id="receiver_name_id">李敏</span>（<span id="receiver_phone_id">13965025668</span>）</span>
                    <span class="col-xs-12" id="receiver_address_id">安徽省&nbsp;合肥市&nbsp;政务区&nbsp;怀宁路天鹅湖万达2号写字楼</span>
                </div>
                <span class="iconfont icon-jiantou-copy col-xs-1"></span>
            </div>
            <div id="payModecontainer" class="pay-mode-container col-xs-12">
                <span class="pay-mode-tip col-xs-9 text-left">付款方式</span>
                <span id="payModeText" class="pay-mode-text col-xs-2">货到付款</span>
                <span class="pay-mode-select-icon iconfont icon-jiantou-copy col-xs-1"></span>
            </div>
            <div class="distribution-store-info col-xs-12">
            		<div class="distribution-store col-xs-12">
            			<span class="distribution-store-tip col-xs-11 text-left">配送门店</span>
            			<span class="pay-mode-select-icon iconfont icon-jiantou-copy col-xs-1"></span>
            		</div>
            		<div class="distribution-store-base col-xs-12  text-left">
            			<span class="selected-store" id="shop_name_id">百联中环店</span>
            			<span class="store-score" id="shop_grade_score_container">
                    		<span class="iconfont icon-g score"></span>
                    		<span class="iconfont icon-g score"></span>
                    		<span class="iconfont icon-g score"></span>
                    		<span class="iconfont icon-g score"></span>
                    		<span class="iconfont icon-g"></span>
                    		<span class="store-score-text">4.0</span>
                    </span>
                    <span class="distribution-store-address col-xs-12">
                    		<span class="iconfont icon-didian"></span>
                    		<span id="shop_address_id">迪信通怀宁路天鹅湖万达28号</span>
                    </span>
            		</div>
            </div>
            <div class="goods-order-detail col-xs-12">
                <div class="goods-detail-info col-xs-12">
                    <div id="distributionModeInfo" class="distribution-mode-info col-xs-12">
		                <span class="distribution-mode-tip col-xs-9 text-left">配送方式</span>
		                <span id="distributionModeText" class="distribution-mode-text col-xs-2">到店自提</span>
		                <span class="pay-mode-select-icon iconfont icon-jiantou-copy col-xs-1"></span>
		            </div>
                    <div class="goods-selected-info col-xs-12">
                        <div class="goods-pic col-xs-2">
                            <img id="product_pic_id" src="image/find_goods/534A3527-6709-4A1C-8533-2B9B00072FEC.png">
                        </div>
                        <div class="goods-base-info col-xs-8 text-left">
                            <span class="goods-name col-xs-12" id="product_name_id">苹果 iphone 7</span>
                            <span class="goods-attr col-xs-12" id="product_par">红色 32G 移动版 套餐一</span>
                        </div>
                        <div class="goods-price-num col-xs-2 text-right">
                            <span class="goods-price col-xs-12">￥<span id="product_price_id">5688</span></span>
                            <span class="buy-num col-xs-12">x<span id="product_count_id">1</span></span>
                        </div>
                    </div>
                    <div class="buy-other-info col-xs-12">
                        <div class="total-price col-xs-12">
                            <span class="col-xs-9 text-left">商品总价：</span>
                             <span class="col-xs-3 text-right">￥<span id="product_sum_price">5688</span></span>
                        </div>
                        <div class="goods-carriage col-xs-12">
                            <span class="col-xs-9 text-left">商品运费：</span>
                             <span class="col-xs-3 text-right">￥0</span>
                        </div>
                    </div> 
                </div>
            </div>
            <div class="goods-voucher col-xs-12">
                <span class="col-xs-9 text-left">商品优惠券：</span>
                 <span class="voucher-sum col-xs-2 text-right" id="voucher-sum">未使用</span>
                 <span class="iconfont icon-jiantou-copy col-xs-1 text-right"></span>
            </div>
            <div class="pay-price col-xs-12">
                <span class="col-xs-9 text-left">小计：</span>
                 <span class="col-xs-3 text-right" id="sub_total">￥5688</span>
            </div>
            <div class="pay-opt-nar col-xs-12">
                <span class="pay-amount-text col-xs-7">
                    <span>需支付：</span>
                    <span id="need_pay">￥5688</span>
                </span>
                <span id="payNow" class="pay-now col-xs-5">立即支付</span>
            </div>
        </section>

        <section class="select-pay-tool-container row text-center hide">
            <div class="pay-tool-info col-xs-12">
                <div class="pay-title col-xs-12">
                    <span class="col-xs-11">请选择付款方式</span>
                    <span class="iconfont icon-guanbi col-xs-1"></span>
                </div>
                <div class="pay-select-info col-xs-12">
                    <span class="pay-amount col-xs-12">金额：
                        <span id="pop_up_money">￥5688</span>
                        （请在30分钟内完成支付）
                    </span>
                    <div class="pay-tool-items col-xs-12">
                        <div class="pay-tool-item col-xs-12">
                            <div class="col-xs-1 text-left">
                                <span class="iconfont icon-alipay"></span>
                            </div>
                            <span class="pay-tool-name col-xs-10 text-left" id="1">支付宝</span>
                            <div class="col-xs-1">
                                <span class="selected-pay iconfont icon-quan"></span>
                            </div>
                        </div>
                        <div class="pay-tool-item col-xs-12">
                            <div class="col-xs-1 text-left">
                                <span class="iconfont icon-wechatpay-scan col-xs-2 text-left"></span>
                            </div>
                            <span class="pay-tool-name col-xs-10 text-left" id="2">微信支付</span>
                            <div class="col-xs-1">
                                <span class="selected-pay iconfont icon-xuanzedui"></span>
                            </div>
                        </div>
                    </div>
                </div> 
                <div class="sure-pay-opt-nar col-xs-12">
                    <span class="sure-pay col-xs-12">确认支付</span>
                </div>
            </div>
        </section>
        <div class="backdrop hide"></div>
        
        <!--选择收货地址页面-->
        <div class="iframe_container" id="iframe_select_address">
			<iframe id="iframe_select_address_id" src="select_address.html" width="100%" height="100%" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
		</div>
		<!--选择配送门店-->
        <div class="iframe_container" id="iframe_select_store">
			<iframe id="iframe_select_store_id" src="select_store.html" width="100%" height="100%" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
		</div>
        <!--选择优惠券页面-->
        <div class="iframe_container" id="iframe_select_vouchers">
			<iframe id="iframe_select_vouchers_id" src="select_vouchers.html" width="100%" height="100%" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
		</div>
		
    </body>
    <script type="text/javascript" src="js/common_js/my_tools.js"></script>
    <script type="text/javascript" src="js/find_goods/sure_order.js"></script>
</html>