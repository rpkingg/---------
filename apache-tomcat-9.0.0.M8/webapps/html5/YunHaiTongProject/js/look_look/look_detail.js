$(function(){
	//跳转至聊天窗口
	$('.liao-liao-opt,.liao-liao-btn').click(function(){
		alert('跳转至聊天窗口');
		//如果不是好友，先添加好友
		$('.plus-liao-liao-container').show();
		$("body").on("touchmove",function(event){
            event.preventDefault;
        }, false);
	});
	
	//加聊聊确定事件
	$('.dialog-footer .sure').click(function(e){
		$('.dialog-footer .cancel').trigger('click');
	});
	
	//查看更多用户操作列表
	$('.more-user').click(function(){
		alert('查看更多用户操作列表!');
	});
	
	//商品评价效果渲染
    new Swiper ('.goods-list-container .swiper-container', {
        direction: 'horizontal',
        speed:300,
        slidesPerView : 3.5,
        spaceBetween:15,
        autoplayDisableOnInteraction:false
    });
    
    //查看剩下n条回复
    $('.view-other-replys').click(function(e){
    		$('.reply-item').show();
    		$(this).hide();
    });
    
    //查看更多评论
    $('.view-all-reply').click(function(e){
    		alert('查看更多评论!');
    });
    
    //评论及回复的点赞事件
    $('.dianzan-count').click(function(e){
    		e.preventDefault();
    		$(this).find('.iconfont').addClass('already-zan');
    		$(this).find('.count').html(Number($(this).find('.count').html())+1);
    });
    
    //云币-赏
    $('.publish-content-tip .shang-yunbi,.look-detail-opt-nar .shang-yunbi').click(function(e){
    		e.preventDefault();
    		alert('云币-打赏！');
    		$('.give-reward-container').show();
    		$("body").on("touchmove",function(event){
            event.preventDefault;
        }, false);
    });
    
    //打赏选择评语箭头展开收起事件
    $('.input-group-btn').click(function(e){
    		$(this).parent().toggleClass('open');
    		$(this).find('.icon-sanjiaojiantou').toggleClass('open');
    });
    
    //打赏选择评语事件
    $('.dropdown-menu li').click(function(e){
    		$('.input-group .form-control').val($(this).find('span').html());
    		$('.input-group-btn').trigger('click');
    });
    
    //加减云币
    $('.yunbi-opt-container span').click(function(e){
    		var count = Number($('.yunbi-opt-container').find('.form-control').val());
    		if($(this).hasClass('icon-jianshao') && count >0){
    			$('.yunbi-opt-container').find('.form-control').val(count-1);
    		}else if($(this).hasClass('icon-jia2') && count >= 0){
    			$('.yunbi-opt-container').find('.form-control').val(count+1);
    		}
    });
    //关闭对话框
    $('.close-opt .icon-guanbi2,.dialog-footer .cancel').click(function(e){
    		$('.give-reward-container').hide();
    		$('.plus-liao-liao-container').hide();
    		$("body").off("touchmove");
    });
    //打赏云币
    $('.give-shang span').click(function(){
    		alert('确定打赏云币！');
    		$('.close-opt .icon-guanbi2').trigger('click');
    });
    
    //收藏
    $('.publish-content-tip .collect-thing,.look-detail-opt-nar .collect-thing').click(function(e){
    		e.preventDefault();
    		$(this).find('.iconfont').addClass('already-collect');
    		$(this).find('.view-count').html(Number($(this).find('.view-count').html())+1);
    });
    
    //点赞
    $('.publish-content-tip .dian-zan-thing,.look-detail-opt-nar .dian-zan-thing').click(function(e){
    		e.preventDefault();
    		$(this).find('.iconfont').addClass('already-zan');
    		$(this).find('.zan-count').html(Number($(this).find('.zan-count').html())+1);
    });
    
    //商品详情
    $('.goods-list-container .goods-item').click(function(e){
    		alert('跳转至商品详情界面！');
    });
})
