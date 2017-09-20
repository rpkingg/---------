$(function(){
	//兑换优惠券接口路径
	$('.exchange-opt-nar').click(function(e){
		var urlPath_one = "mrsyg/kquser/ExchangeCoupon.form";
		var need_data = {
			"coupon_standard_id":jump_coupon_id
		}
		var data_one = myAjax(urlPath_one,need_data);
		if(data_one != undefined) {
			alert("做其他事情")
		}
	});
	
	//原生调用方法
	/*var shareExchangeCoupons = function(){
		$('.backdrop').show();
        $('.exchange-coupons-share-wx').show();
        $("body").on("touchmove",function(event){
            event.preventDefault;
        }, false);
	}*/
	
	//选择分享的类型
	/*$('.share-item').click(function(e){
		//todo 调用原生方法实现分享功能
		alert('调用原生方法实现分享功能!');
	});*/
	
	//取消分享事件
	/*$('.cancel-share').click(function(){
		$('.exchange-coupons-share-wx').hide();
        $('.backdrop').hide();
        $("body").off("touchmove");
	});*/
	
	/*setTimeout(function(){
		shareExchangeCoupons();
	},5000)*/
})
