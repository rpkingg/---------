$(function(){
	
	$(".look-search").bind('input propertychange',function(){
		if($('.look-search').find('input').val() == ''){
			$('.look-search').find('.icon-search').show();
		}else{
			$('.look-search').find('.icon-search').hide();
		}
		
	});
	
	//跳转至详情界面
	$('.look-content-item').click(function(e){
		alert('跳转至详情界面！');
	})
	
	
	//导航事件
	$('.look-location').click(function(e){
		alert('导航事件！');
	});
	
	//查看邮件
	$('.look-email').click(function(e){
		alert('查看邮件！');
	})
	
	
})
