<%@ page contentType="text/html;charset=GBK" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
    <head>
        <meta charset="gbk">
        <title>ѡ�����</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-cache"/>
        <!-- ͼ���css -->
        <link rel="stylesheet" href="css/common/iconfont/iconfont.css">
        <link rel="stylesheet" href="css/dxt.css"> 
        <link rel="stylesheet" href="css/find_goods/select_store.css">
        <!-- ����jquery.js -->
        <script type="text/javascript" src="js/common/jquery-2.1.4.min.js"></script>
    </head>
    <body ontouchstart="" class="container">
        <section class="select-store-container row">
            <div class="select-store-content col-xs-12">
               
                <!--<div class="store-list-item col-xs-12">
                    <div class="store-info-item col-xs-12">
                        <div class="store-name-view col-xs-12">
                        		<span class="store-name-score col-xs-9">
	                            <span class="store-name">1����ͨ������</span>
	                            <span class="store-score">
	                            		<span class="iconfont icon-g score"></span>
	                            		<span class="iconfont icon-g score"></span>
	                            		<span class="iconfont icon-g score"></span>
	                            		<span class="iconfont icon-g score"></span>
	                            		<span class="iconfont icon-g"></span>
	                            		<span class="store-score-text">4.0</span>
	                            </span>
                            </span>
                            <span class="store-distance col-xs-3 text-right">������<50m</span>
                        </div>
                        <div class="store-other-info col-xs-12 text-center">
                        		<span class="col-xs-2">��Ʒ4.0</span>
                        		<span class="col-xs-2">����5.0</span>
                        		<span class="col-xs-2">����4.5</span>
                        		<span class="col-xs-2">�����4.0</span>
                        </div>
                        <div class="store-address col-xs-12">
                            <div class="store-detail-address col-xs-10">
                                <span class="iconfont icon-location text-center"></span>
                                <span class="col-xs-11 shop_address">4������·�뱱��·���������300��</span>
                            </div>
                        </div>
                    </div>
                </div>-->
                
            </div>
        </section>
        <!--�洢ѡ���ֵ�����Ϣ-->
        <input style="display: none;" id="selected_shop_id" placeholder="����id"/>
        <input style="display: none;" id="selected_shop_name" placeholder="��������"/>
        <input style="display: none;" id="selected_shop_grade" placeholder="��������"/>
        <input style="display: none;" id="selected_shop_address" placeholder="���̵�ַ"/>
        
    </body>
    <script type="text/javascript" src="js/common_js/my_tools.js"></script>
    <script type="text/javascript" src="js/find_goods/select_store.js"></script>
</html>