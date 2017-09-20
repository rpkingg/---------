<%@ page contentType="text/html;charset=GBK" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<meta http-equiv="Content-Type" content="text/html;charset=GBK" />
		<meta content="yes" name="apple-mobile-web-app-capable" />
		<meta content="black" name="apple-mobile-web-app-status-bar-style" />
		<meta content="telephone=no" name="format-detection" />
		<meta http-equiv="Cache-Control" content="no-cache" />
		<title>选择收货地址</title>
		<link rel="stylesheet" href="css/common_css/initialization_style.css" />
		<link rel="stylesheet" href="css/common_css/public_style.css" />
		<link rel="stylesheet" href="css/select_delivery_address.css" />
		<script type="text/javascript" src="js/common_js/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="js/common_js/set_fontsize.js"></script>
		<link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css" />
		<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=30b434d6f0515dc391afb7932bd29183&plugin=AMap.Autocomplete,AMap.PlaceSearch"></script>
		<!--<script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>-->
		<!--<script type="text/javascript" src="http://code.jquery.com/jquery-1.4.1.min.js"></script>-->
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.4.1.js"></script>
		<script type="text/javascript" src="js/common_js/vconsole.min.js"></script>
	</head>

	<body>
		<!--<div>
			<div class="title_content">选择收货地址<span class="new_address">新增地址</span></div>
			<img class="title_back" src="img/back_btn@2x.png" srcset="img/back_btn@2x.png 2x,img/back_btn@3x.png 3x" />
		</div>-->
		<div class="input_your_adress">
			<img class="input_your_adress_bg" src="img/input_your_address_icon@2x.png" />
			<input id="tipinput" class="input_your_adress_input" placeholder="请输入您的收货地址" />
			<img class="input_your_adress_img" src="img/receiver_address@2x.png" />
		</div>
		<div id="address_container">
			<div class="my_delivery_address">我的收货地址</div>
			<div id="my_delivery_address_id">
				<!--<div class="some_address">天鹅湖万达二号写字楼17楼</div>
				<div class="line_all"></div>
				<div class="some_address">潜山路银泰城666号</div>-->
			</div>
			<div class="my_delivery_address">当前地址</div>
			<div class="current_delivery_address">
				<span id="current_delivery_address_id">私家房东直租公寓</span>
				<img class="current_delivery_address_img" src="img/reposition_icon@2x.png" srcset="img/reposition_icon@2x.png 2x,img/reposition_icon@3x.png 3x" />
				<span class="reposition">重新定位</span>
			</div>
			<div class="my_delivery_address">附近地址</div>
			<div id="nearby_address_id">
				<div class="nearby_address">新加坡沙顿国际学院</div>
				<div class="line_all"></div>
				<div class="nearby_address">新加坡沙顿国际学院</div>
				<div class="line_all"></div>
				<div class="nearby_address">新加坡沙顿国际学院</div>
			</div>
		</div>
	</body>
	<script type="text/javascript" src="js/common_js/change_fontsize.js"></script>
	<script type="text/javascript" src="js/common_js/my_tools.js"></script>
	<script>
		(function($, document) {
			var address = $("#tipinput").val();
			if(address != "") {
				AMap.service('AMap.Geocoder', function() {})
			}
			var autoOptions = {
				input: "tipinput"
			};
			var auto = new AMap.Autocomplete(autoOptions);
			var placeSearch = new AMap.PlaceSearch({});

			AMap.event.addListener(auto, "select", select);
			//选择输入的地址
			function select(e) {
				placeSearch.setCity(e.poi.adcode);
				placeSearch.search(e.poi.name);
			}
			//获取输入的地址
			$(".new_address").bind('click', function() {
				var t = $("#tipinput").val();
				alert(t);
				window.location.href = "addOrEdit_address.html";
			});

			//接口路径（初始化--收货地址）
			//mrsyg/kqgoods/SelectAddress.form
			var urlPath_one = "mrsyg/kqgoods/SelectAddress.form";
			var need_data = {};
			var data_one = myAjax(urlPath_one, need_data);
			if(data_one != undefined) {
				initAddress(data_one);
			}

			function initAddress(datas) {
				$.each(datas.data, function(index, getdata) {
					//收货地址id
					var address_id = getdata.address_id;
					//收货人地区
					var receiver_area = getdata.receiver_area;
					//收货人详细地址
					var detail_address = getdata.detail_address;
					//地址是否可选择（0表示是，1表示不是）
					var use_flag = getdata.use_flag;
					var needString = "";
					if(index == 0) {
						needString = '<div class="some_address selected_address" id="' + address_id + '" uesFlag="' + use_flag + '">' + receiver_area + detail_address + '<img src="img/choose_addresss.png" class="choose_yes"/>'
	+'</div>';
					} else if(index > 0) {
						needString = '<div class="line_all"></div>' +
							'<div class="some_address selected_address" id="' + address_id + '" uesFlag="' + use_flag + '">' + receiver_area + detail_address + '<img src="img/choose_addresss.png" class="choose_yes"/>'
							+'</div>';
					}
					$(needString).appendTo("#my_delivery_address_id");
				});
			}

			//选择收货地址
			<%--$("#address_container").on("click",".selected_address",function(){--%>
				$(".selected_address").bind("click",function(){
					$(this).find(".choose_yes").show().siblings(".choose_yes").hide();
					/*$(".selected_address").each(function(i,obj){
				if($(obj).find(".choose_yes").hasClass("selected")){
						$(this).find(".choose_yes").addClass("selected")
						$(this).show().siblings(".choose_yes").hide();

					}
					else{
							$(this).find(".choose_yes").addClass("selected")
							$(this).find(".choose_yes").show();
						}
				})*/

				/*if($(this).find(".choose_yes").hasClass("selected")){
					$(this).find(".choose_yes").removeClass("selected")
					$(this).find(".choose_yes").hide();
				}
				else{
					$(this).find(".choose_yes").addClass("selected")
					$(this).find(".choose_yes").show();
				}*/
				//获取地址id
				var address_id = $(this).attr("id");
				//地址是否可用(0表示是，1表示不是)
				var uesFlag = $(this).attr("uesFlag");
				console.log("首页，选择则收货地址=uesFlag"+uesFlag);
				if(uesFlag == 0) {
					var urlPath_selected = "mrsyg/kquser/SelectPosition.form";
					var need_selected = {
						"address_id": address_id
					};
					var data_selected = myAjax(urlPath_selected, need_selected);
					if(data_selected != undefined) {
						console.log("首页，选择则收货地址data_selected");
						//关闭当前webview
						native.destroyView();
					}
				} else {
					alert("当前地址不可用");
				}

			});

		})(jQuery, document);
	</script>

</html>