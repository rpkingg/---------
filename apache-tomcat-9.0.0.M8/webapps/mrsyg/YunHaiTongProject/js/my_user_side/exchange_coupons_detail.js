$(function(){
	//�һ��Ż�ȯ�ӿ�·��
	$('.exchange-opt-nar').click(function(e){
		var urlPath_one = "mrsyg/kquser/ExchangeCoupon.form";
		var jump_coupon_id = $(this).siblings("#panel").find(".col-xs-12").attr("data-id");
		var need_data = {
			"coupon_standard_id":jump_coupon_id
		}
		var data_one = myAjax(urlPath_one,need_data);
		if(data_one != undefined) {
			popHtml("�һ��ɹ�")
			window.location.href="exchange_coupons.jsp"
		}

		else{
			popHtml("�����Ʊ�����")
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
