$(function(){
	//�һ��Ż�ȯ�ӿ�·��
	$('.exchange-opt-nar').click(function(e){
		var urlPath_one = "mrsyg/kquser/ExchangeCoupon.form";
		var need_data = {
			"coupon_standard_id":jump_coupon_id
		}
		var data_one = myAjax(urlPath_one,need_data);
		if(data_one != undefined) {
			alert("����������")
		}
	});
	
	//ԭ�����÷���
	/*var shareExchangeCoupons = function(){
		$('.backdrop').show();
        $('.exchange-coupons-share-wx').show();
        $("body").on("touchmove",function(event){
            event.preventDefault;
        }, false);
	}*/
	
	//ѡ����������
	/*$('.share-item').click(function(e){
		//todo ����ԭ������ʵ�ַ�����
		alert('����ԭ������ʵ�ַ�����!');
	});*/
	
	//ȡ�������¼�
	/*$('.cancel-share').click(function(){
		$('.exchange-coupons-share-wx').hide();
        $('.backdrop').hide();
        $("body").off("touchmove");
	});*/
	
	/*setTimeout(function(){
		shareExchangeCoupons();
	},5000)*/
})
