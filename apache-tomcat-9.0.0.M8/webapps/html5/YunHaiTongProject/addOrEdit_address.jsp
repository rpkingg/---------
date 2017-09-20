<%@ page contentType="text/html;charset=GBK" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
    <head>
        <meta charset="gbk">
        <title>添加或者编辑收货地址</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no,minimal-ui">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta name="renderer" content="webkit">

        <!-- 图标库css -->
        <link rel="stylesheet" href="css/common/iconfont/iconfont.css">
        <link rel="stylesheet" href="css/common/mui.css">
        <link rel="stylesheet" href="css/common/mui.picker.css">
        <link rel="stylesheet" href="css/common/mui.poppicker.css">
        <link rel="stylesheet" href="css/dxt.css"> 
        <link rel="stylesheet" href="css/find_goods/addOrEdit_address.css">
        <!-- 引入jquery.js-->
        <script type="text/javascript" src="js/common/jquery-2.1.4.min.js"></script>
        <script type="text/javascript" src="js/common/city.data.js"></script>
        <script type="text/javascript" src="js/common/mui.min.js"></script>
        <script type="text/javascript" src="js/common/mui.picker.js"></script>
        <script type="text/javascript" src="js/common/mui.poppicker.js"></script>
    </head>
    <body ontouchstart="" class="container">
        <section class="add-edit-address-container row">
            <div class="input-address-container col-xs-12">
                <form class="form-horizontal">
                    <div class="user-name form-group col-xs-12">
                        <label class="control-label col-xs-3" for="userName">收货人</label>
                        <div class="input-view col-xs-9">
                            <input type="text" class="form-control" id="userName" name="getGoodsUserName" value="">
                        </div>
                    </div>
                    <div class="user-iphone form-group col-xs-12">
                        <label class="control-label col-xs-3" for="userIphone">联系电话</label>
                        <div class="input-view col-xs-9">
                            <input type="text" class="form-control" id="userIphone" name="getGoodsUserPhone" value="" maxlength="11">
                        </div>
                    </div>
                    <div id="userArea" class="user-area form-group col-xs-12">
                        <label class="control-label col-xs-3">所在区域</label>
                        <div class="input-view-child col-xs-8">
                            <span id="getGoodsUserOfProvince">&nbsp;</span>
                            <span id="getGoodsUserOfCity">&nbsp;</span>
                            <span id="getGoodsUserOfAreas">&nbsp;</span>
                        </div>
                        <div class="select-area col-xs-3 text-right">
                            <span>请选择</span><span class="iconfont icon-jiantou-copy"></span>
                        </div>
                    </div>
                    <div class="user-detail form-group col-xs-12">
                        <textarea class="form-control" id="user_detail_address" rows="4" placeholder="请填写详细地址，不少于5个字" name="getGoodsDetail"></textarea>
                    </div>
                </form>
                <div class="save-address-btn col-xs-12 text-center">
                    <a class="btn btn-default col-xs-12" role="button">保存</a>
                </div>
            </div>
        </section>
        
        <!--编辑或新增的地址信息-->
        <input style="display: none;" id="edited_address_name" placeholder="编辑后的收货人名称"/>
        <input style="display: none;" id="edited_address_phone" placeholder="编辑后的收货人电话"/>
        <input style="display: none;" id="edited_address_area" placeholder="编辑后的收货区域（省市区）"/>
        <input style="display: none;" id="edited_address_detail_area" placeholder="编辑后的收货详细地址"/>
        <input style="display: none;" id="edited_address_use_flag" placeholder="编辑后的收货地址是否可用"/>
        <input style="display: none;" id="edited_address_id" placeholder="新增后的收货地址id"/>
        
    </body>
    <script type="text/javascript" src="js/common_js/my_tools.js"></script>
    <script type="text/javascript" src="js/find_goods/addOrEdit_address.js"></script>
</html>