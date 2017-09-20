	<%@ page contentType="text/html;charset=GBK" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta charset="gbk">
		<title>买买-新上市</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-cache"/>
		<link rel="stylesheet" href="css/common/iconfont/iconfont.css">
		<link rel="stylesheet" href="css/dxt.css">
		<link rel="stylesheet" href="css/buy_buy/new_listed.css">
		<link rel="stylesheet" href="css/buy_buy/hot_goods.css">
		<link rel="stylesheet" href="css/buy_buy/time_buy.css">
		<script type="text/javascript" src="js/common/jquery-2.1.4.min.js"></script>
		<script type="text/javascript">
			function callByNativeWithParams(msg){
				/*var msg = JSON.parse(msg);*/
				var msg = msg;
				if(msg =="panel3"){
					$("#panel1").hide();
					$("#panel2").hide();
					$("#panel3").show();
					$("#01").removeClass("active");
					$("#03").addClass("active");
				}
				else {
					return false;
				}
			}
		</script>
	</head>

	<body ontouchstart="" class="container">
		<section class="new-listed-container row text-center">
			<header class="buy-buy-nav-bar col-xs-12">
				<span class="active col-xs-4" id="01"> 新上市</span>
				<span class="col-xs-4" id="02">抢手货</span>
				<span class="col-xs-4" id="03">限时购</span>
			</header>
			<!--新上市-->
			<div id="new_listed_container">
				<div class="new-listed-content col-xs-12" id="panel1">
					<!--<div class="new-listed-item col-xs-12">
						<div class="new-listed-goods-pic col-xs-12">
							<img src="image/buy_buy/8858A3D2-A11E-4199-8DC2-CBB095CF8672.png">
						</div>
						<div class="new-listed-goods-info col-xs-12">
							<span></span>
						</div>
					</div>
					<div class="new-listed-item col-xs-12">
						<div class="new-listed-goods-pic col-xs-12">
							<img src="image/buy_buy/A7ABA9DF-361D-4AAE-8DAA-D596686570D1.png">
						</div>
						<div class="new-listed-goods-info col-xs-12">
							<span>小米Note 2 128G 限时特惠</span>
						</div>
					</div>-->
				</div>
			</div>
			<!--抢手货-->
			<div id="hot_goods_container" style="display: none;" id="panel2">
				<div class="hot-goods-content col-xs-12">
					<div id="hot_goods_container_first">
						
						<!--<div class="hot-goods-top hot-goods-top2 col-xs-12">
							<div class="hot-goods-pic col-xs-12">
								<img src="image/buy_buy/8858A3D2-A11E-4199-8DC2-CBB095CF8672.png">
								<svg class="top-icon" aria-hidden="true">
									<use xlink:href="#icon-top"></use>
								</svg>
							</div>
							<div class="hot-goods-info col-xs-12">
								<span>荣耀 note8 大屏手机 就要2k</span>
							</div>
						</div>
						<div class="hot-goods-top hot-goods-top3 col-xs-12">
							<div class="hot-goods-pic col-xs-12">
								<img src="image/buy_buy/A7ABA9DF-361D-4AAE-8DAA-D596686570D1.png">
								<svg class="top-icon" aria-hidden="true">
									<use xlink:href="#icon-top1"></use>
								</svg>
							</div>
							<div class="hot-goods-info col-xs-12">
								<span>小米VR眼镜 等你来体验</span>
							</div>
						</div>-->
						
					</div>
					<div class="other-hot-goods-content col-xs-12">
						<div class="other-hot-goods-tip col-xs-12">
							<span class="left-tip-icon col-xs-3 text-right">
							<svg class="icon" aria-hidden="true">
							    <use xlink:href="#icon-zuobanbian"></use>
							</svg>
						</span>
							<span class="other-hot-tip-text col-xs-5">扫货时刻&nbsp;·&nbsp;不容错过</span>
							<span class="right-tip-icon col-xs-3 text-left">
							<svg class="icon" aria-hidden="true">
							    <use xlink:href="#icon-youbanbian"></use>
							</svg>
						</span>
						</div>
						<div class="hot-goods-list col-xs-12 text-center">


							<!--<div class="goods-left-item col-xs-6">
								<div class="hot-goods-item col-xs-12">
									<div class="goods-cover col-xs-8 col-xs-offset-2">
										<img src="image/buy_buy/0D23D0AA-5CF8-4213-A7E8-659DFCB48DD5.png" />
									</div>
									<span class="goods-title col-xs-12">Apple iphone 7</span>
									<span class="goods-price-container col-xs-12">
	                                <span class="goods-price-new col-xs-5 col-xs-offset-1">
	                                		<span class="yen">￥</span>3455
									</span>
									</span>
								</div>
							</div>
							<div class="goods-right-item col-xs-6">
								<div class="hot-goods-item col-xs-12">
									<div class="goods-cover col-xs-8 col-xs-offset-2">
										<img src="image/buy_buy/AF9E78DF-BF0E-4756-8A76-99969F30C51A.png" />
									</div>
									<span class="goods-title col-xs-12">Apple iphone 7</span>
									<span class="goods-price-container col-xs-12">
	                                <span class="goods-price-new col-xs-5 col-xs-offset-1">
	                                		<span class="yen">￥</span>3455
									</span>
									</span>
								</div>
							</div>-->


						</div>
					</div>
				</div>
			</div>
			<!--限时购-->
			<div id="time_buy_container" style="display: none;" id="panel3">
				<div class="time-buy-content col-xs-12">
					
					<!--<div class="time-buy-item col-xs-12">
						<div class="time-buy-goods-pic col-xs-12">
							<img src="image/buy_buy/8858A3D2-A11E-4199-8DC2-CBB095CF8672.png">
						</div>
						<div class="time-buy-goods-info col-xs-12">
							<div class="goods-base-info col-xs-12">
								<span class="goods-name col-xs-9 text-left">小米Max 2 大屏清新一整夏</span>
								<span class="goods-price col-xs-3 text-center">
            						<span class="yuan">￥</span>5688
								</span>
							</div>
							<div class="time-endline-opt col-xs-12">
								<span class="count-down col-xs-9 text-left">
            						<span class="iconfont icon-shijian"></span>
								<span>剩余2天21小时32分12秒</span>
								</span>
								<span class="buy-now col-xs-3 text-center">马上抢</span>
							</div>
						</div>
					</div>
					<div class="time-buy-item col-xs-12">
						<div class="time-buy-goods-pic col-xs-12">
							<img src="image/buy_buy/A7ABA9DF-361D-4AAE-8DAA-D596686570D1.png">
						</div>
						<div class="time-buy-goods-info col-xs-12">
							<div class="goods-base-info col-xs-12">
								<span class="goods-name col-xs-9 text-left">小米Note 2 128G 限时特惠</span>
								<span class="goods-price col-xs-3 text-center">
            						<span class="yuan">￥</span>5688
								</span>
							</div>
							<div class="time-endline-opt col-xs-12">
								<span class="count-down col-xs-9 text-left">
            						<span class="iconfont icon-shijian"></span>
								<span>剩余2天21小时32分12秒</span>
								</span>
								<span class="buy-now col-xs-3 text-center">马上抢</span>
							</div>
						</div>
					</div>-->
				</div>
			</div>
		</section>
	</body>
	<script type="text/javascript" src="js/common_js/my_tools.js"></script>
	<script type="text/javascript" src="js/buy_buy/new_listed.js"></script>
</html>