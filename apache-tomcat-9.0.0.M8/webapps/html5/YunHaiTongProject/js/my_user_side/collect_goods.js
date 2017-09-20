$(function(){
	//我的-收藏单导航事件
	$('.collect-nav-bar span').click(function(e){
		$(this).siblings('span').removeClass('active');
		$(this).addClass('active');
		if($(this).hasClass('collect-goods')){
			$('.collect-goods-content').show();
		}
	});
	
	//查看商品详情事件
	$('.collect-goods-item').click(function(e){
		alert('跳转查看商品详情界面！');
	});
	
	
	//点击编辑按钮
	var editCollectedGoods = function(){
		$('.collect-goods-content .collect-goods-item').find('.edit-icon').show();
		$('.goods-edit-opt-nar').show();
		$('.collect-goods-content').css({marginBottom:'3.5rem'});
		//编辑模式下，单个商品点击事件
		if($('.collect-goods-content .collect-goods-item').find('.edit-icon').length > 0){
			$('.collect-goods-item').unbind("click");
			$('.collect-goods-item').click(function(e){
				$(this).find('.iconfont').removeClass('icon-quan');
				$(this).find('.iconfont').addClass('icon-xuanzedui');
			})
		}
	}
	
	//取消编辑事件
	var cancleCollectedGoods = function(){
		$('.collect-goods-content .collect-goods-item').find('.edit-icon').hide();
		$('.goods-edit-opt-nar').hide();
		$('.collect-goods-content').css({marginBottom:'0'})
		$('.collect-goods-item').unbind("click");
		//查看商品详情事件
		$('.collect-goods-item').click(function(e){
			alert('跳转查看商品详情界面！');
		});
	}
	
	//模拟编辑和取消编辑事件，实际开发需删除
	setTimeout(function(){
		editCollectedGoods();
	},3000)

	setTimeout(function(){
		cancleCollectedGoods();
	},10000)
	
	//批量删除收藏的商品
	$('.goods-edit-opt-nar').click(function(e){
		alert('批量删除收藏的商品!')
	})
	
})
