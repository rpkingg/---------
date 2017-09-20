<%@ page contentType="text/html;charset=GBK" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta charset="gbk">
		<title>ѡ���ջ���ַ</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-cache"/>
		<!-- ͼ���css -->
		<link rel="stylesheet" href="css/common/iconfont/iconfont.css">
		<link rel="stylesheet" href="css/dxt.css">
		<link rel="stylesheet" href="css/find_goods/select_address.css">
		<!-- ����jquery.js -->
		<script type="text/javascript" src="js/common/jquery-2.1.4.min.js"></script>
	</head>

	<body ontouchstart="" class="container">
		<section class="select-address-container row" id="goods_address_container">
			<!--<div class="goods-address-item col-xs-12" id="1" userFlag="1">
                <div class="select-icon col-xs-1">
                    <span class="selected-address iconfont icon-quan icon-xuanzedui"></span>
                </div>
                <div class="goods-address col-xs-11 pull-right">
                    <span class="address-user-info col-xs-12"><span id="receiver_name_id">����1</span>(<span id="receiver_phone_id">13965025668</span>)</span>
                    <span class="address-detail-info col-xs-12">
                        <span class="default-address-tip">[Ĭ�ϵ�ַ]</span>
                        <span id="address_content_id">����ʡ&nbsp;�Ϸ���&nbsp;������&nbsp;����·�������1��д��¥1702��</span>
                    </span>
                </div>
            </div>
            <div class="goods-address-item col-xs-12" id="1" userFlag="1">
                <div class="select-icon col-xs-1">
                    <span class="selected-address iconfont icon-quan"/>
                </div>
                <div class="goods-address col-xs-11 pull-right">
                    <span class="address-user-info col-xs-12"><span id="receiver_name_id">����2</span>(<span id="receiver_phone_id">13965025668</span>)</span>
                    <span class="address-detail-info col-xs-12">
                        <span id="address_content_id">����ʡ&nbsp;�Ϸ���&nbsp;������&nbsp;����·�������2��д��¥1702��</span>
                    </span>
                </div>
            </div>
            <div class="goods-address-item col-xs-12" id="1" userFlag="0">
                <div class="select-icon col-xs-1">
                    <span class="selected-address iconfont icon-quan"/>
                </div>
                <div class="goods-address col-xs-11 pull-right">
                    <span class="address-user-info col-xs-12"><span id="receiver_name_id">����3</span>(<span id="receiver_phone_id">13965025668</span>)</span>
                    <span class="address-detail-info col-xs-12">
                        <span id="address_content_id">����ʡ&nbsp;�Ϸ���&nbsp;������&nbsp;����·�������3��д��¥1702��</span>
                    </span>
                </div>
            </div>-->
		</section>
		<div class="no_address">
			<img class="no_address_img" src="img/no_address_icon.png" />
			<div class="no_address_content_one">��ǰû���ջ���ַ�������� һ���ɣ�</div>
			<div class="add_new_address_btn">�����ջ���ַ</div>
		</div>
		<div class="manage_address">����</div>

		<!--�����ջ���ַҳ��-->
		<div class="iframe_container" id="iframe_addOrEdit_address">
			<iframe id="iframe_addOrEdit_address_id" src="addOrEdit_address.html" width="100%" height="100%" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
		</div>

		<!--�����ջ���ַҳ��-->
		<div class="iframe_container" id="iframe_manage_address">
			<iframe id="iframe_manage_address_id" src="manage_address.html" width="100%" height="100%" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
		</div>
		
		<!--�洢ѡ���ջ���ַ����Ϣ-->
		<input style="display: none;" id="receiver_address_id" placeholder="�ջ���ַid"/>
		<input style="display: none;" id="receiver_address_content" placeholder="�ջ���ַ"/>
		<input style="display: none;" id="receiver_name" placeholder="�ջ�������"/>
		<input style="display: none;" id="receiver_phone" placeholder="�ջ��˵绰"/>
		
		
	</body>
	<script type="text/javascript" src="js/common_js/my_tools.js"></script>
	<script type="text/javascript" src="js/find_goods/select_address.js"></script>

</html>