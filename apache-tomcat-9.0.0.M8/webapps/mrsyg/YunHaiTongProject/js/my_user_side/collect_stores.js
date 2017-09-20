$(function(){
	//我的-收藏单导航事件
	$('.collect-nav-bar span').click(function(e){
		$(this).siblings('span').removeClass('active');
		$(this).addClass('active');
		if($(this).hasClass('collect-stores')){
			$('.collect-stores-content').show();
		}
	});
	
	//查看店铺详情事件
	$('.collect-stores-item').click(function(e){
		alert('跳转查看店铺详情界面！');
	});
	
	
	//点击编辑按钮
	/*var editCollectedStores = function(){
		$('.collect-stores-content .collect-stores-item').find('.edit-icon').show();
		$('.stores-edit-opt-nar').show();
		$('.collect-stores-content').css({marginBottom:'3.5rem'});
		//编辑模式下，单个店铺点击事件
		if($('.collect-stores-content .collect-stores-item').find('.edit-icon').length > 0){
			$('.collect-stores-item').unbind("click");
			$('.collect-stores-item').click(function(e){
				$(this).find('.iconfont').removeClass('icon-quan');
				$(this).find('.iconfont').addClass('icon-xuanzedui');
			})
		}
	}
	
	//取消编辑事件
	var cancleCollectedStores = function(){
		$('.collect-stores-content .collect-stores-item').find('.edit-icon').hide();
		$('.stores-edit-opt-nar').hide();
		$('.collect-stores-content').css({marginBottom:'0'})
		$('.collect-stores-item').unbind("click");
		//查看店铺详情事件
		$('.collect-stores-item').click(function(e){
			alert('跳转查看店铺详情界面！');
		});
	}*/
	
	//模拟编辑和取消编辑事件，实际开发需删除
	setTimeout(function(){
		editCollectedStores();
	},3000)

	setTimeout(function(){
		cancleCollectedStores();
	},8000)

	//批量删除收藏的店铺
	$('.stores-edit-opt-nar').click(function(e){
		alert('批量删除收藏的店铺!')
	});
	
})
