<%@ page contentType="text/html;charset=GBK" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="gbk">
    <title>�һ�����</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit">
    <link rel="stylesheet" href="css/common/iconfont/iconfont.css">
    <link rel="stylesheet" href="css/dxt.css">
    <link rel="stylesheet" href="css/my_user_side/conpon_center.css">
    <script type="text/javascript" src="js/common/jquery-2.1.4.min.js"></script>
</head>
<body ontouchstart="" class="container">
<section class="exchange-coupons-container row text-center">
    <div class="exchange-coupons-content col-xs-12 car-container" id="panel1">
        <!--<div class="exchange-coupons-item col-xs-12">
            <div class="voucher-amount col-xs-5">
                    <span class="voucher-amount-attr col-xs-12">
                        <span class="yuan">��</span>
                    <span class="amount-text">20</span>
                    <span class="voucher-type-text">����ȯ</span>
                    </span>
                <span class="full-amount-tip col-xs-12 text-left-margin">����90��ʹ��</span>
                <span class="amount-right-top-icon"></span>
                    <span class="amount-right-bottom-icon"></span>
            </div>
            <div class="voucher-use-condition col-xs-7 text-left">
                <span class="used-store-name col-xs-12">�������ڼ������ŵ���Ʒ</span>
                <span class="use-endline col-xs-12">2017-06-26��2017-06-30</span>
                <span class="exchange-count-container col-xs-12">
                        <span class="exchange-count-text">50�ƱҶһ�</span>
                </span>
            </div>
        </div>
        <div class="exchange-coupons-item col-xs-12">
            <div class="voucher-amount col-xs-5">
                    <span class="voucher-amount-attr col-xs-12">
                        <span class="yuan">��</span>
                    <span class="amount-text">20</span>
                    <span class="voucher-type-text">����ȯ</span>
                    </span>
                <span class="full-amount-tip col-xs-12">����90��ʹ��</span>
                <span class="amount-right-top-icon"></span>
                    <span class="amount-right-bottom-icon"></span>
            </div>
            <div class="voucher-use-condition col-xs-7 text-left">
                <span class="used-store-name col-xs-12">�������ڼ������ŵ���Ʒ</span>
                <span class="use-endline col-xs-12">2017-06-26��2017-06-30</span>
                <span class="exchange-count-container col-xs-12">
                        <span class="exchange-count-text">50�ƱҶһ�</span>
                </span>
            </div>
        </div>
        <div class="exchange-coupons-item col-xs-12">
            <div class="voucher-amount col-xs-5">
                    <span class="voucher-amount-attr col-xs-12">
                        <span class="yuan">��</span>
                    <span class="amount-text">20</span>
                    <span class="voucher-type-text">����ȯ</span>
                    </span>
                <span class="full-amount-tip col-xs-12">����90��ʹ��</span>
                <span class="amount-right-top-icon"></span>
                    <span class="amount-right-bottom-icon"></span>
            </div>
            <div class="voucher-use-condition col-xs-7 text-left">
                <span class="used-store-name col-xs-12">�������ڼ������ŵ���Ʒ</span>
                <span class="use-endline col-xs-12">2017-06-26��2017-06-30</span>
                <span class="exchange-count-container col-xs-12">
                        <span class="exchange-count-text">50�ƱҶһ�</span>
                </span>
            </div>
        </div>
         <div class="exchange-coupons-item col-xs-12">
             <div class="voucher-amount col-xs-5">
                     <span class="voucher-amount-attr col-xs-12">
                         <span class="yuan">��</span>
                     <span class="amount-text">20</span>
                     <span class="voucher-type-text">����ȯ</span>
                     </span>
                 <span class="full-amount-tip col-xs-12">����90��ʹ��</span>
                 <span class="amount-right-top-icon"></span>
                     <span class="amount-right-bottom-icon"></span>
             </div>
             <div class="voucher-use-condition col-xs-7 text-left">
                 <span class="used-store-name col-xs-12">�������ڼ������ŵ���Ʒ</span>
                 <span class="use-endline col-xs-12">2017-06-26��2017-06-30</span>
                 <span class="exchange-count-container col-xs-12">
                         <span class="exchange-count-text">50�ƱҶһ�</span>
                 </span>
             </div>
         </div>-->
    </div>
</section>
<script type="text/javascript" src="js/common_js/vconsole.min.js"></script>
<script type="text/javascript" src="js/common_js/my_tools.js"></script>
<script type="text/javascript" src="js/my_user_side/exchange_coupons.js"></script>
<script type="text/javascript">
    //��ȯ���Ľӿ�·��
    var urlPath_one = "mrsyg/kquser/CouponCenter.form";
    var data_one = myAjax(urlPath_one);
    if(data_one != undefined) {
        init(data_one);
    }
    function init(datas) {
        $.each(datas.data, function(index, getdata) {
            //�Ż�ȯ���
            var coupon_standard_id = getdata.coupon_standard_id;
            //��Чʱ��
            var effective_date = getdata.effective_date;
            //ʧЧʱ��
            var expire_date = getdata.expire_date;
            //�һ��Ʊ���
            var cloud_number = getdata.cloud_number;
            //���ѽ��
            var coupon_amount = getdata.coupon_amount;
            //�䵱���
            var serve_amount = getdata.serve_amount;
            //��ע
            var remarks = getdata.remarks;
            var html = '<div class="exchange-coupons-item col-xs-12" data-cloud_number="'+cloud_number+'" data-id="'+coupon_standard_id+'" data-effective_date="'+effective_date+'" data-expire_date="'+expire_date+'" data-coupon_amount="'+coupon_amount+'" data-serve_amount="'+serve_amount+'" data-remarks="'+remarks+'">'
                    + '<div class="voucher-amount col-xs-5 col-xs-width">'
                    +'<span class="voucher-amount-attr col-xs-12">'
                    +'<span class="yuan">��</span>'
                    +'<span class="amount-text">'+serve_amount+'</span>'
                    +'<span class="voucher-type-text">����ȯ</span>'
                    +'</span>'
                    +'<span class="full-amount-tip col-xs-12 text-left-margin">����'+coupon_amount+'��ʹ��</span>'
                    +'<span class="amount-right-top-icon"></span>'
                    +'<span class="amount-right-bottom-icon"></span>'
                    +'</div>'
                    +'<div class="voucher-use-condition-nouse col-xs-7 text-left padding_set">'
                    +'<span class="used-store-name col-xs-12">'+remarks+'</span>'
                    +'<span class="use-endline col-xs-12">'+effective_date+'��'+expire_date+'</span>'
                    +'<span class="exchange-count-container col-xs-12">'
                    +'<span class="exchange-count-text">'+cloud_number+'�ƱҶһ�</span>'
                    +'</span>'
                    +'</div>'
                    +'</div>'
            $(html).appendTo("#panel1");
        })
    }
    //ҳ����ת���Ż�ȯ�һ�ҳ��
    $("#panel1").on("click",".exchange-coupons-item",function () {
        var jump_coupon_id = $(this).attr("data-id");
        var jump_effective_date = $(this).attr("data-effective_date");
        var jump_expire_date = $(this).attr("data-expire_date");
        var jump_coupon_amount = $(this).attr("data-coupon_amount");
        var jump_serve_amount = $(this).attr("data-serve_amount");
        var jump_remarks = $(this).attr("data-remarks");
        var jump_cloud_number = $(this).attr("data-cloud_number");    
        jump_remarks = encodeURI(jump_remarks);
	native.openWebView("exchange_coupons_detail.jsp?jump_coupon_id="+jump_coupon_id+"&jump_effective_date="+jump_effective_date+"&jump_expire_date="+jump_expire_date+"&jump_coupon_amount="+jump_coupon_amount+"&jump_serve_amount="+jump_serve_amount+"&jump_remarks="+jump_remarks+"&jump_cloud_number="+jump_cloud_number);
    })
</script>
</body>
</html>