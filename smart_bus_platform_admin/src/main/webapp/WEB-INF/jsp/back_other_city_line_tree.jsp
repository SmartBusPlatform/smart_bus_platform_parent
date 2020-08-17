<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.1</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/xadminR.css">
<!--    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.5.1.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/lib/layui/layuiR.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/xadmin.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/index.css">
    <script src="${pageContext.request.contextPath}/static/js/vue.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.15&key=01c4bad1d55c4b802d04ee5e62657af1&plugin=AMap.StationSearch"></script>
    <link rel="stylesheet" href="https://cache.amap.com/lbs/static/main1119.css"/>
    <link rel="stylesheet" href="https://a.amap.com/jsapi_demos/static/demo-center/css/demo-center.css"/>
    <script type="text/javascript" src="http://webapi.amap.com/demos/js/liteToolbar.js"></script>
    <style type="text/css">
        .layui-unselect dl { max-height:200px; }

        /*修改源码点击选中变色*/
        .custom-tree-item-clicked {
            color: #ff5722
        }
        #panel {
            position: fixed;
            background-color: white;
            max-height: 90%;
            overflow-y: auto;
            top: 10px;
            right: 10px;
            width: 280px;
            border-bottom: solid 1px silver;
        }
        .layui-form-label{
            width: 100px;
        }
        select, input[type="text"], input[type="date"]{
            width: 70%;
        }
        .layui-laypage-limits{
            width: 30%;
        }
        .tree{
            float: left;
            width: 15%;
            height:680px;
            overflow-y: auto;
            background-color: white;
            border: 0.5px solid #393D49;
        }
        .right{
            float: left;
            width: 80%;
            margin-left: 2.5%;
            background-color: white;
            height: 680px;
            overflow-y: auto;
        }
        .maginTop{
            margin-top: 20px;
            margin-left: 30px;
        }
    </style>
</head>

<body style="background-color: #F0F0F0">

<div class="x-body">
    <%--省市树状--%>
    <div  class="tree">
        <ul id="citySite_tree" lay-filter="citySite_tree-filter" style=" "></ul>
    </div>
    <%--右侧列表--%>
        <div class="right">
            <div class="maginTop">
                <h1>城市线路</h1>
                <div>
                    <div class="maginTop">
                        <form class="layui-form layui-col-space5">
                            <div class="layui-inline">
                                <h3 class="layui-inline">站点名称:</h3>
                                <div class="layui-input-inline">
                                    <input type="text" name="siteName" placeholder="请输入站点名称" autocomplete="off"
                                           class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline layui-col-lg-offset1">
                                <button class="layui-btn" type="button" lay-submit="" lay-filter="search"><i
                                        class="layui-icon">&#xe615;</i></button>
                                <a class="layui-btn layui-btn-normal layui-btn-xs" id="add">新增</a>
                            </div>
                        </form>
                    </div>
<%--                    <div class="layui-row">--%>
<%--                        <form class="layui-form layui-col-md12 x-so" method="post">--%>

<%--                            &lt;%&ndash;                站点名称:<input type="text" name="siteName"  placeholder="请输入站点名称" autocomplete="off" class="layui-input">&ndash;%&gt;--%>
<%--                            线路名称:<input type="text" name="lineName" placeholder="请输入线路名称" autocomplete="off"--%>
<%--                                        class="layui-input">--%>

<%--                            <button class="layui-btn" type="button" lay-submit="" lay-filter="search"><i--%>
<%--                                    class="layui-icon">&#xe615;</i></button>--%>
<%--                            <a class="layui-btn layui-btn-normal layui-btn-xs" id="add">新增</a>--%>

<%--                        </form>--%>

                        <%--        </div>--%>
                        <table id="line_table" lay-filter="line-filter"></table>
                    </div>
                </div>
                <div class="site-text layui-row" hidden id="addForm">
                    <form class="layui-form layui-col-sm-offset2 layui-col-sm10" style="margin-top: 100px" method="post"
                          lay-filter="example">
                        <div class="layui-form-item layui-col-sm6 layui-col-sm-offset2">
                            <label class="layui-form-label">省:</label>
                            <div class="layui-input-block ">
                                <input readonly type="text" id="add_provinceName" name="cityName" autocomplete="off"
                                       placeholder="" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item layui-col-sm6 layui-col-sm-offset2">

                            <label class="layui-form-label">城市名称:</label>
                            <div class="layui-input-block">
                                <input readonly type="text" id="add_cityName" name="add_cityName" autocomplete="off"
                                       placeholder="" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item layui-col-sm6 layui-col-sm-offset2">

                            <label class="layui-form-label">线路名称:</label>
                            <div class="layui-input-block">
                                <input type="text" id="add_lineName" name="add_lineName" autocomplete="off"
                                       placeholder="" class="layui-input">
                            </div>
                        </div>
                        <%--        <div class="layui-form-item">--%>

                        <%--            <label class="layui-form-label">始程发车站:</label>--%>
                        <%--            <div class="layui-input-block">--%>
                        <%--                <input type="text" id="add_startStation" name="add_startStation"  autocomplete="off" placeholder="" class="layui-input">--%>
                        <%--                <button class="layui-btn" i="-1" onclick="mapSelection(this,'left')" type="button">地图选择</button>--%>
                        <%--            </div>--%>

                        <%--        </div>--%>
                        <%--        <div class="layui-form-item">--%>
                        <%--            <label class="layui-form-label">返程发车站:</label>--%>
                        <%--            <div class="layui-input-block">--%>
                        <%--                <input type="text" id="add_reStation" name="add_reStation" autocomplete="off" placeholder="" class="layui-input">--%>
                        <%--                <button class="layui-btn mapSelection" i="-2" onclick="mapSelection(this,'right')" type="button">地图选择</button>--%>
                        <%--            </div>--%>
                        <%--        </div>--%>
                        <div class="layui-form-item layui-col-sm6 layui-col-sm-offset2">

                            <label class="layui-form-label">单程费用:</label>
                            <div class="layui-input-block">
                                <input type="text" id="add_oneMoney" name="add_oneMoney" lay-verify="required"
                                       autocomplete="off" placeholder="" class="layui-input">
                            </div>

                        </div>
                        <div class="layui-form-item layui-col-sm6 layui-col-sm-offset2">

                            <label class="layui-form-label">司机费用:</label>
                            <div class="layui-input-block">
                                <input type="text" id="add_travelMoney" name="add_travelMoney" lay-verify="required"
                                       autocomplete="off" placeholder="" class="layui-input">
                            </div>

                        </div>
                        <div class="layui-form-item layui-col-sm6 layui-col-sm-offset2">

                            <label class="layui-form-label">始程时间:</label>
                            <div class="layui-input-block">
                                <input type="text" id="add_startTime" name="add_startTime" lay-verify="required"
                                       autocomplete="off" placeholder="" class="layui-input">
                            </div>

                        </div>
                        <div class="layui-form-item layui-col-sm6 layui-col-sm-offset2">

                            <label class="layui-form-label">返程时间:</label>
                            <div class="layui-input-block">
                                <input type="text" id="add_endTime" name="add_endTime" lay-verify="required"
                                       autocomplete="off" placeholder="" class="layui-input">
                            </div>

                        </div>
                        <div id="app" class="layui-col-sm6" style="width: 100%">

                            <div class="layui-col-sm4"
                                 style="height: 400px; min-height: 400px;  float: left; border: solid 1px #ccc ;padding: 5px;overflow-x: auto">
                                <div class="layui-input-block" style="margin-left: 30%">
                                    <button class="layui-btn" v-if="arrs.length==0" i="-1"
                                            onclick="mapSelection(this,'left')" type="button">新增始程站点
                                    </button>
                                </div>
                                <div class="el-steps el-steps--vertical">
                                    <div v-for="(arr,i) in arrs" class="el-step is-vertical" style="flex-basis: 50%;">
                                        <div class="el-step__head is-finish">
                                            <div class="el-step__line" style="margin-right: 0px;"><i
                                                    class="el-step__line-inner"
                                                    style="transition-delay: 0ms; border-width: 0px; height: 0%;"></i>
                                            </div>
                                            <div class="el-step__icon is-text">
                                                <div class="el-step__icon-inner">{{i+1}}</div>
                                            </div>
                                        </div>
                                        <div class="el-step__main">
                                            <div class="el-step__title is-finish" style="font-size: 10px">{{arr.name}}
                                                <span style="float: right" :i="i" onclick="deleteStation(this,'left')">删除</span>
                                                <span style="float: right; margin-right: 10px" :i="i"
                                                      onclick="mapSelection(this,'left')">添加站点</span>

                                            </div>
                                            <div class="el-step__description is-finish">
                                                {{arr.distance}}
                                            </div>
                                        </div>
                                    </div>

                                    <%--                    <span v-if="arrs.length>1">始程时间:{{comp()}}</span>--%>
                                </div>
                                <div class="layui-input-block" style="margin-left: 0px">
                                    <button class="layui-btn" v-if="arrs.length==0" i="-1" type="button">线路预览</button>
                                </div>
                            </div>

                            <%--            <button type="button" onclick="productionResvese('edit')" class="el-button el-button--default" style="margin: 220px 20px;float: left;"><span>生成反向>></span>--%>
                            <%--            </button>--%>

                            <div class="layui-col-sm4 layui-col-sm-offset1"
                                 style="height:400px; max-height: 400px;   float: left; border: solid 1px #ccc ;padding: 5px;overflow-x: hidden">
                                <div class="layui-input-block" style="margin-left: 30%">
                                    <button class="layui-btn" v-if="resverArrs.length==0" i="-1"
                                            onclick="mapSelection(this,'right')" type="button">新增返程站点
                                    </button>
                                </div>
                                <div class="el-steps el-steps--vertical">
                                    <div v-for="(arr,i) in resverArrs" class="el-step is-vertical"
                                         style="flex-basis: 50%;">
                                        <div class="el-step__head is-finish">
                                            <div class="el-step__line" style="margin-right: 0px;"><i
                                                    class="el-step__line-inner"
                                                    style="transition-delay: 0ms; border-width: 0px; height: 0%;"></i>
                                            </div>
                                            <div class="el-step__icon is-text">
                                                <div class="el-step__icon-inner">{{i+1}}</div>
                                            </div>
                                        </div>
                                        <div class="el-step__main">
                                            <div class="el-step__title is-finish" style="font-size: 10px">{{arr.name}}
                                                <span style="float: right" :i="i" onclick="deleteStation(this,'right')">删除</span>
                                                <span style="float: right; margin-right: 10px" :i="i"
                                                      onclick="mapSelection(this,'right')">添加站点</span>

                                            </div>
                                            <div class="el-step__description is-finish">
                                                {{arr.distance}}
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>

                    </form>
                </div>

                <div class="site-text layui-row" hidden id="editForm">
                    <form class="layui-form layui-col-sm-offset1 layui-col-sm9" style="margin-top: 100px" method="post">
                        <div class="layui-form-item">
                            <label class="layui-form-label">省:</label>
                            <div class="layui-input-block">
                                <input readonly type="text" id="edit_provinceName" name="cityName" autocomplete="off"
                                       placeholder="" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">

                            <label class="layui-form-label">城市名称:</label>
                            <div class="layui-input-block">
                                <input readonly type="text" id="edit_cityName" name="add_cityName" autocomplete="off"
                                       placeholder="" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">

                            <label class="layui-form-label">线路名称:</label>
                            <div class="layui-input-block">
                                <input type="text" id="edit_lineName" name="add_lineName" autocomplete="off"
                                       placeholder="" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">

                            <label class="layui-form-label">单程费用:</label>
                            <div class="layui-input-block">
                                <input type="text" id="edit_oneMoney" name="add_oneMoney" lay-verify="required"
                                       autocomplete="off" placeholder="" class="layui-input">
                            </div>

                        </div>
                        <div class="layui-form-item">

                            <label class="layui-form-label">司机费用:</label>
                            <div class="layui-input-block">
                                <input type="text" id="edit_travelMoney" name="add_travelMoney" lay-verify="required"
                                       autocomplete="off" placeholder="" class="layui-input">
                            </div>

                        </div>

                    </form>
                </div>

                <div class="site-text layui-row" hidden id="editLineSite">
                    <form class="layui-form layui-col-sm-offset2 layui-col-sm10" style="margin-top: 100px" method="post"
                          lay-filter="example">

                        <div id="app2" style="width: 100%">
                            <div class="layui-col-sm4"
                                 style="height: 400px; min-height: 400px;   float: left; border: solid 1px #ccc ;padding: 5px;overflow-x: auto">
                                <div class="layui-input-block">
                                    <button class="layui-btn" v-if="arrs.length==0" i="-1"
                                            onclick="mapSelection(this,'edit_left')" type="button">新增始程站点
                                    </button>
                                </div>
                                <div class="el-steps el-steps--vertical">
                                    <div v-for="(arr,i) in arrs" class="el-step is-vertical" style="flex-basis: 50%;">
                                        <div class="el-step__head is-finish">
                                            <div class="el-step__line" style="margin-right: 0px;"><i
                                                    class="el-step__line-inner"
                                                    style="transition-delay: 0ms; border-width: 0px; height: 0%;"></i>
                                            </div>
                                            <div class="el-step__icon is-text">
                                                <div class="el-step__icon-inner">{{i+1}}</div>
                                            </div>
                                        </div>
                                        <div class="el-step__main">
                                            <div class="el-step__title is-finish" style="font-size: 10px">{{arr.name}}
                                                <span style="float: right" :i="i"
                                                      onclick="deleteStation(this,'edit_left')">删除</span>
                                                <span style="float: right; margin-right: 10px" :i="i"
                                                      onclick="mapSelection(this,'edit_left')">添加站点</span>

                                            </div>
                                            <div class="el-step__description is-finish">
                                                {{calDistance(i)}}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%--            <button type="button" onclick="productionResvese()" class="el-button el-button--default" style="margin: 220px 20px;float: left;"><span>生成反向>></span>--%>
                            <%--            </button>--%>
                            <div class="layui-col-sm4"
                                 style=" max-height: 400px;height: 400px;   float: left; border: solid 1px #ccc ;padding: 5px;overflow-x: hidden">
                                <div class="el-steps el-steps--vertical">
                                    <div class="layui-input-block">
                                        <button class="layui-btn" v-if="resverArrs.length==0" i="-1"
                                                onclick="mapSelection(this,'edit_right')" type="button">新增返程站点
                                        </button>
                                    </div>
                                    <div v-for="(arr,i) in resverArrs" class="el-step is-vertical"
                                         style="flex-basis: 50%;">
                                        <div class="el-step__head is-finish">
                                            <div class="el-step__line" style="margin-right: 0px;"><i
                                                    class="el-step__line-inner"
                                                    style="transition-delay: 0ms; border-width: 0px; height: 0%;"></i>
                                            </div>
                                            <div class="el-step__icon is-text">
                                                <div class="el-step__icon-inner">{{i+1}}</div>
                                            </div>
                                        </div>
                                        <div class="el-step__main">
                                            <div class="el-step__title is-finish" style="font-size: 10px">{{arr.name}}
                                                <span style="float: right" :i="i"
                                                      onclick="deleteStation(this,'edit_right')">删除</span>
                                                <span style="float: right; margin-right: 10px" :i="i"
                                                      onclick="mapSelection(this,'edit_right')">添加站点</span>

                                            </div>
                                            <div class="el-step__description is-finish">
                                                {{calDistanceResver(i)}}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                    </form>
                </div>
                <div class="site-text layui-row" hidden id="findLineSite">
                    <form class="layui-form layui-col-sm-offset1 layui-col-sm9" style="margin-top: 100px" method="post"
                          lay-filter="example">
                        <div id="app3" style="width: 100%">
                            <div style="height: 450px; min-height: 450px; width: 40%;  float: left; border: solid 1px #ccc ;padding: 5px;overflow-x: auto">
                                <div class="el-steps el-steps--vertical">
                                    <div v-for="(arr,i) in arrs" class="el-step is-vertical" style="flex-basis: 50%;">
                                        <div class="el-step__head is-finish">
                                            <div class="el-step__line" style="margin-right: 0px;"><i
                                                    class="el-step__line-inner"
                                                    style="transition-delay: 0ms; border-width: 0px; height: 0%;"></i>
                                            </div>
                                            <div class="el-step__icon is-text">
                                                <div class="el-step__icon-inner">{{i+1}}</div>
                                            </div>
                                        </div>
                                        <div class="el-step__main">
                                            <div class="el-step__title is-finish" style="font-size: 10px">{{arr.name}}

                                            </div>
                                            <div class="el-step__description is-finish">
                                                {{calDistance(i)}}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <button type="button" onclick="productionResvese()" class="el-button el-button--default"
                                    style="margin: 220px 20px;float: left;"><span>生成反向>></span>
                            </button>
                            <div style="height:450px; max-height: 450px; width: 40%;  float: left; border: solid 1px #ccc ;padding: 5px;overflow-x: hidden">
                                <div class="el-steps el-steps--vertical">
                                    <div v-for="(arr,i) in resverArrs" class="el-step is-vertical"
                                         style="flex-basis: 50%;">
                                        <div class="el-step__head is-finish">
                                            <div class="el-step__line" style="margin-right: 0px;"><i
                                                    class="el-step__line-inner"
                                                    style="transition-delay: 0ms; border-width: 0px; height: 0%;"></i>
                                            </div>
                                            <div class="el-step__icon is-text">
                                                <div class="el-step__icon-inner">{{i+1}}</div>
                                            </div>
                                        </div>
                                        <div class="el-step__main">
                                            <div class="el-step__title is-finish" style="font-size: 10px">{{arr.name}}

                                            </div>
                                            <div class="el-step__description is-finish">
                                                {{calDistanceResver(i)}}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </form>
                </div>
                <%--线路班次--%>
                <div id="findLineClasses" hidden class="layui-form-item">
                    <div class="layui-input-inline" style="float: left">

                        <table id="startLine_table" lay-filter="startLine-filter"
                               style="display: inline-block;float: left"></table>
                    </div>
                    <div class="layui-input-inline" style="float: right;margin-right: 30%">

                        <table id="backLine_table" lay-filter="backLine-filter"
                               style="display: inline-block;float: left"></table>
                    </div>

                </div>
                <%--线路在用车辆--%>
                <div id="lineReuseVehicle" hidden class="row">

                    <table id="lineReuseVehicle_table" class="layui-col-sm8 layui-col-lg-offset4"
                           lay-filter="lineReuseVehicle-filter"></table>

                </div>
                <%--查看地图--%>
                <div class="site-text layui-row" hidden id="findMap">
                    <div id="container" style="margin-top: 0.2cm;width:100%;height: 100%;"></div>
                    <div id="panel"></div>
                    <div id="tip" class='info' style='min-width:18rem;'>

                    </div>

                </div>
                <%--自增--%>
                <script id="index" type="text/html">
                    {{d.LAY_TABLE_INDEX+1}}
                </script>
                <%--表格bar--%>
                <script type="text/html" id="cityLine_tablebar">
                    <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="editBase">修改线路基础信息</a>
                    <a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="editLineSite">修改线路配置信息</a>
                    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
                </script>
                <script>
                    //当前点击省份
                    var province;
                    var provinceId;
                    //当前点击城市
                    var city;
                    var cityId;
                    var selprovince;
                    var selprovinceId;
                    layui.use(['table', 'tree', 'form'], function () {
                        var tree = layui.tree;
                        var table = layui.table;
                        var form = layui.form;
                        //查询省份和省份下的城市
                        $.ajax({
                            type: "post",
                            url: "${pageContext.request.contextPath}/admin/areas/getAreaTree",
                            dataType: "json",
                            success: function (data) {
                                //渲染
                                var inst1 = tree.render({
                                    elem: '#citySite_tree'  //绑定元素
                                    , data: data.data
                                    // ,showCheckbox: true
                                    , click: function (obj) {
                                        if (obj.data.children == undefined) {
                                            city = obj.data.title;
                                            cityId = obj.data.id;
                                            province = selprovince;
                                            provinceId = selprovinceId;
                                            table.render({
                                                elem: '#line_table',
                                                url: '${pageContext.request.contextPath}/admin/line/getLineByPage',
                                                where: {
                                                    "cityId": obj.data.id
                                                },
                                                width: 800,
                                                cols: [[
                                                    // {type:'checkbox'},
                                                    {field: 'sorId', title: '序号', templet: '#index'},
                                                    {field: 'id', title: 'id', hide: 'true'}
                                                    , {
                                                        field: 'name',
                                                        title: '线路名称',
                                                        sort: true,
                                                        width: 100,
                                                        event: 'line'
                                                    }
                                                    , {field: 'oneMoney', title: '单程费用/元', width: 100}
                                                    , {field: 'travelMoney', title: '司机费用/元', width: 100}
                                                    , {field: 'startTime', title: '始程时间/分钟', width: 150}
                                                    , {field: 'returnTime', title: '返程时间/分钟', width: 150}
                                                    , {field: 'siteNum', title: '经站点数/个', width: 150}
                                                    , {
                                                        field: 'dailyFrequencyNum',
                                                        title: '每日运行班次数/次',
                                                        width: 160,
                                                        event: 'lineClasses'
                                                    }
                                                    , {
                                                        field: 'useVehiclesNum',
                                                        title: '线路在用车辆/辆',
                                                        width: 150,
                                                        event: 'useVehicles'
                                                    }
                                                    , {
                                                        field: '',
                                                        title: '操作',
                                                        templet: '#cityLine_tablebar',
                                                        width: 400,
                                                        fixed: 'right'
                                                    }
                                                ]],
                                                page: true,
                                                limit: 5,
                                                limits: [5, 10, 15, 20, 25],
                                                method: 'post',
                                                request: {
                                                    pageName: 'curPage',
                                                    limitName: 'pageSize',
                                                },
                                                response: {
                                                    statusName: 'status',
                                                    statusCode: 200,
                                                },
                                                parseData: function (res) { //res 即为原始返回的数据
                                                    return {
                                                        "status": res.status,
                                                        "count": res.data.totalRecord, //解析数据长度
                                                        "data": res.data.list,
                                                    };
                                                }
                                            });

                                        } else {
                                            selprovince = obj.data.title;
                                            selprovinceId = obj.data.id;
                                        }
                                    }
                                });
                                //默认打开第一节点
                                $($("#citySite_tree").find(".layui-tree-entry")[0]).find('.layui-tree-txt').click();
                                //默认第一次点击第一个父节点下的第一个子节点
                                $($($("#citySite_tree").find(".layui-tree-entry")[0]).next().find(".layui-tree-set")[0]).find(".layui-tree-txt").click();
                                // $(".layui-tree-set").click(function (event) {
                                //     alert(3);
                                //     event.stopPropagation();
                                // })
                            }
                        });
                        //城市编辑
                        table.on('tool(line-filter)', function (obj) {
                            var event = obj.event;
                            alert(event)
                            if ("editBase" === event) {
                                var item = obj.data;
                                layer.open({
                                    title: '修改线路信息',
                                    type: 1,
                                    area: ['35%', '70%'],
                                    offset: 'auto',
                                    maxmin: true,
                                    shadeClose: false,
                                    content: $('#editForm'),
                                    btn: ['确定', '取消'],
                                    shade: [0.8, '#393D49'],
                                    success: function (layero, index) {
                                        $("#edit_cityName").val("");
                                        $("#edit_provinceName").val("");
                                        $("#edit_cityName").val(city);
                                        $("#edit_cityName").attr("cityId", cityId);
                                        $("#edit_provinceName").val(province);
                                        $("#edit_provinceName").attr("provinceId", provinceId)
                                        $("#edit_oneMoney").val(item.oneMoney);
                                        $("#edit_travelMoney").val(item.travelMoney);
                                        $("#edit_lineName").val(item.name)
                                    }
                                    , yes: function (num, layero) {
                                        layer.confirm('确认是否修改信息?', {icon: 3, title: '提示'}, function (index) {
                                            if ($("#edit_cityName").val().trim().length > 0) {
                                                if ($("#edit_provinceName").val().trim().length > 0) {
                                                    if ($("#edit_lineName").val().trim().length > 0) {
                                                        if (isRealNum($("#edit_oneMoney").val().trim())) {
                                                            if (isRealNum($("#edit_travelMoney").val().trim())) {
                                                                $.ajax({
                                                                    type: "post",
                                                                    url: "${pageContext.request.contextPath}/admin/line/updLineByLineId",
                                                                    data: {
                                                                        "cityId": cityId,
                                                                        "name": $("#edit_lineName").val(),
                                                                        "oneMoney": $("#edit_oneMoney").val().trim(),
                                                                        "travelMoney": $("#edit_travelMoney").val().trim(),
                                                                        "id": item.id
                                                                    },
                                                                    dataType: "json",
                                                                    success: function (data) {
                                                                        if (data.status == 200) {
                                                                            layer.msg(data.msg, {
                                                                                time: 1000
                                                                            }, function () {
                                                                                window.location.reload();
                                                                            });

                                                                        } else {
                                                                            layer.msg(data.msg);
                                                                        }
                                                                    }
                                                                });
                                                            } else {
                                                                layer.msg('请输入正确的司机费用值', {
                                                                    btn: ['明白了',]
                                                                });
                                                            }
                                                        } else {
                                                            layer.msg('请输入正确的单程费用值', {
                                                                btn: ['明白了',]
                                                            });
                                                        }

                                                    } else {
                                                        layer.msg('站点的值不能为空', {
                                                            btn: ['明白了',]
                                                        });
                                                    }

                                                } else {
                                                    layer.msg('省份的值不能为空', {
                                                        btn: ['明白了',]
                                                    });
                                                }
                                            } else {
                                                layer.msg('城市名称不能为空', {
                                                    btn: ['明白了']
                                                });
                                            }


                                        });
                                    }

                                });

                            } else if ("delete" === event) {
                                // delLineById
                                var item = obj.data;
                                layer.confirm('确认是否删除该线路信息?', function (index) {
                                    $.ajax({
                                        url: "${pageContext.request.contextPath}/admin/line/delLineById",
                                        method: "post",
                                        dataType: "json",
                                        data: {"lineId": item.id},
                                        success: function (data) {
                                            if (data.status == 200) {
                                                layer.msg(data.msg, {
                                                    time: 1000
                                                }, function () {
                                                    window.location.reload();
                                                });
                                            } else {
                                                layer.msg(data.msg);
                                            }
                                        },
                                        error: function () {
                                            layer.msg("网络繁忙，请稍候重试");
                                        }
                                    });
                                    layer.close(index)
                                });
                            } else if ("editLineSite" === event) {
                                var item = obj.data;
                                layer.open({
                                    title: '修改配置线路信息',
                                    type: 1,
                                    area: ['80%', '90%'],
                                    offset: 'auto',
                                    maxmin: true,
                                    shadeClose: false,

                                    content: $('#editLineSite'),
                                    btn: ['确定', '取消'],
                                    shade: [0.8, '#393D49'],
                                    success: function (layero, index) {
                                        $.ajax({
                                            url: "${pageContext.request.contextPath}/admin/lineSite/getLineSiteByLineId",
                                            method: "post",
                                            dataType: "json",

                                            data: {"lineId": item.id},
                                            success: function (data) {
                                                vm2.arrs = data.start;
                                                vm2.resverArrs = data.back
                                            },
                                            error: function () {
                                                layer.msg("网络繁忙，请稍候重试");
                                            }
                                        });
                                    }, yes: function (num, layero) {
                                        layer.confirm('确认是否修改信息?', {icon: 3, title: '提示'}, function (index) {
                                            if (vm2.arrs.length > 2 && vm2.resverArrs.length > 2) {
                                                if (vm2.arrs[0].name == vm2.resverArrs[vm2.resverArrs.length - 1].name &&
                                                    vm2.arrs[vm2.arrs.length - 1].name == vm2.resverArrs[0].name) {
                                                    $.ajax({
                                                        url: "${pageContext.request.contextPath}/admin/lineSite/updLineSiteByLineId",
                                                        method: "post",
                                                        dataType: "json",
                                                        traditional: true,
                                                        contentType: "application/json;charset=UTF-8",
                                                        data: JSON.stringify({
                                                            "cityId": cityId,
                                                            "name": item.name,
                                                            "lineId": item.id,
                                                            "arrs": vm2.arrs,
                                                            "resverArrs": vm2.resverArrs
                                                        }),
                                                        success: function (data) {
                                                            if (data.status == 200) {
                                                                layer.msg(data.msg, {
                                                                    time: 1000
                                                                }, function () {
                                                                    window.location.reload();
                                                                });
                                                            } else if (data.status == 203) {
                                                                layer.msg(data.msg);
                                                            } else {
                                                                layer.msg(data.msg);
                                                            }
                                                        },
                                                        error: function () {
                                                            layer.msg("网络繁忙，请稍候重试");
                                                        }
                                                    });
                                                } else {
                                                    layer.msg('您配置的站点有误请重新配置', {
                                                        btn: ['明白了',]
                                                    });
                                                }
                                            } else {
                                                layer.msg('请配置始程和返程的站点', {
                                                    btn: ['明白了',]
                                                });
                                            }

                                        })
                                    }
                                })

                            } else if ("line" === event) {
                                var item = obj.data;
                                layer.open({
                                    title: '查看线路信息',
                                    type: 1,
                                    area: ['100%', '100%'],
                                    offset: 'auto',
                                    maxmin: true,
                                    shadeClose: false,
                                    content: $('#findLineSite'),
                                    btn: ['确定', '取消'],
                                    shade: [0.8, '#393D49'],
                                    success: function (layero, index) {
                                        $.ajax({
                                            url: "${pageContext.request.contextPath}/admin/lineSite/getLineSiteByLineId",
                                            method: "post",
                                            dataType: "json",

                                            data: {"lineId": item.id},
                                            success: function (data) {
                                                vm3.arrs = data.start;
                                                vm3.resverArrs = data.back
                                            },
                                            error: function () {
                                                layer.msg("网络繁忙，请稍候重试");
                                            }
                                        });
                                    }, yes: function (num, layero) {
                                        layer.close(num);
                                    }
                                })
                            } else if ("lineClasses" === event) {
                                var item = obj.data;
                                //线路班次界面
                                layer.open({
                                    title: '查看线路信息',
                                    type: 1,
                                    area: ['100%', '100%'],
                                    offset: 'auto',
                                    maxmin: true,
                                    shadeClose: false,
                                    content: $('#findLineClasses'),
                                    btn: ['返回'],
                                    shade: [0.8, '#393D49'],
                                    success: function (layero, index) {
                                        table.render({
                                            elem: '#startLine_table',
                                            url: '${pageContext.request.contextPath}/admin/busWork/getBusWorkByLineId',
                                            where: {
                                                "lineId": item.id,
                                                "startBeginOrReturn": 1
                                            },
                                            cols: [[
                                                {type: 'checkbox'},
                                                {field: 'sorId', title: '序号', templet: '#index'}
                                                , {field: 'time', title: '时间', sort: true}
                                                , {field: 'oneMoney', title: '时间段'}
                                                , {field: 'number', title: '发车'}
                                                , {field: 'remarks', title: '备注'}
                                            ]],
                                            width: 500,
                                            method: 'post',
                                            response: {
                                                statusName: 'status',
                                                statusCode: 200,
                                            },
                                            parseData: function (res) { //res 即为原始返回的数据
                                                return {
                                                    "status": res.status,
                                                    "data": res.data,
                                                };
                                            }
                                        });

                                        table.render({
                                            elem: '#backLine_table',
                                            url: '${pageContext.request.contextPath}/admin/busWork/getBusWorkByLineId',
                                            where: {
                                                "lineId": item.id,
                                                "startBeginOrReturn": 2
                                            },
                                            cols: [[
                                                {type: 'checkbox'},
                                                {field: 'sorId', title: '序号', templet: '#index'}
                                                , {field: 'time', title: '时间', sort: true}
                                                , {field: 'oneMoney', title: '时间段'}
                                                , {field: 'number', title: '发车'}
                                                , {field: 'remarks', title: '备注'}
                                            ]],
                                            width: 500,
                                            method: 'post',
                                            response: {
                                                statusName: 'status',
                                                statusCode: 200,
                                            },
                                            parseData: function (res) { //res 即为原始返回的数据
                                                return {
                                                    "status": res.status,
                                                    "data": res.data,
                                                };
                                            }
                                        });
                                    }, yes: function (num, layero) {
                                        layer.close(num);
                                    }
                                })

                            } else if ("useVehicles" === event) {
                                var item = obj.data;
                                //线路班次界面
                                layer.open({
                                    title: '查看线路信息',
                                    type: 1,
                                    area: ['80%', '90%'],
                                    offset: 'auto',
                                    maxmin: true,
                                    shadeClose: false,
                                    content: $('#lineReuseVehicle'),
                                    btn: ['返回'],
                                    shade: [0.8, '#393D49'],
                                    success: function (layero, index) {
                                        table.render({
                                            elem: '#lineReuseVehicle_table',
                                            url: '${pageContext.request.contextPath}/admin/bus/getBusByLineId',
                                            where: {
                                                "id": item.id,
                                            },
                                            cols: [[
                                                {type: 'checkbox'},
                                                {field: 'sorId', title: '序号', templet: '#index'}
                                                , {field: 'number', title: '车牌',}
                                                , {field: 'departureTime', title: '发车时刻'}
                                                , {field: 'propertyName', title: '属性'}
                                            ]],
                                            method: 'post',
                                            response: {
                                                statusName: 'status',
                                                statusCode: 200,
                                            },
                                            parseData: function (res) { //res 即为原始返回的数据
                                                return {
                                                    "status": res.status,
                                                    "data": res.data,
                                                };
                                            }
                                        });

                                    }, yes: function (num, layero) {
                                        layer.close(num);
                                    }
                                })
                            }
                        });


                        //监听提交 lay-filter="search"
                        form.on('submit(search)', function (data) {
                            var formData = data.field;
                            var name = formData.lineName
                            //执行重载
                            table.reload('line_table', {
                                page: {
                                    curr: 1 //重新从第 1 页开始
                                }
                                , where: {//这里传参  向后台
                                    name: name,
                                    //可传多个参数到后台...  ，分隔
                                }
                                , url: '${pageContext.request.contextPath}/admin/line/getLineByPage'//后台做模糊搜索接口路径
                                , method: 'post'
                            });
                            return false;//false：阻止表单跳转  true：表单跳转
                        });


                    });
                    //新增站点
                    $("#add").click(function () {
                        layer.open({
                            title: '新增线路',
                            type: 1,
                            area: ['80%', '80%'],
                            offset: 'auto',
                            maxmin: true,
                            shadeClose: false,
                            content: $('#addForm'),
                            btn: ['确定', '取消'],
                            shade: [0.8, '#393D49'],
                            success: function (layero, index) {
                                $("#add_cityName").val("");
                                $("#add_provinceName").val("");
                                $("#add_cityName").val(city);
                                $("#add_cityName").attr("cityId", cityId);
                                $("#add_provinceName").val(province);
                                $("#add_provinceName").attr("provinceId", provinceId);
                                $("#add_oneMoney").attr("");
                                $("#add_travelMoney").attr("");

                            },
                            yes: function (num, layero) {
                                layer.confirm('确认是否新增信息?', {icon: 3, title: '提示'}, function (index) {
                                    if ($("#add_cityName").val().trim().length > 0) {
                                        if ($("#add_provinceName").val().trim().length > 0) {
                                            if ($("#add_lineName").val().trim().length > 0) {
                                                if (vm.arrs.length > 2 && vm.resverArrs.length > 2) {
                                                    if (vm.arrs[0].name == vm.resverArrs[vm.resverArrs.length - 1].name &&
                                                        vm.arrs[vm.arrs.length - 1].name == vm.resverArrs[0].name) {
                                                        if ($("#add_oneMoney").val().trim().length > 0 && isRealNum($("#add_oneMoney").val().trim())) {
                                                            if ($("#add_travelMoney").val().trim().length > 0 && isRealNum($("#add_travelMoney").val().trim())) {
                                                                if ($("#add_startTime").val().length > 0 && isRealNum($("#add_startTime").val().trim())) {
                                                                    if ($("#add_endTime").val().length > 0 && isRealNum($("#add_startTime").val().trim())) {
                                                                        $.ajax({
                                                                            type: "post",
                                                                            url: "${pageContext.request.contextPath}/admin/line/addLine",
                                                                            traditional: true,
                                                                            data: JSON.stringify({
                                                                                "cityId": cityId,
                                                                                "name": $("#add_lineName").val(),
                                                                                "oneMoney": $("#add_oneMoney").val().trim(),
                                                                                "travelMoney": $("#add_travelMoney").val().trim(),
                                                                                "startTime": $("#add_startTime").val().trim(),
                                                                                "returnTime": $("#add_endTime").val().trim(),
                                                                                "arrs": vm.arrs,
                                                                                "resverArrs": vm.resverArrs
                                                                            }),
                                                                            contentType: "application/json;charset=UTF-8",
                                                                            dataType: "json",
                                                                            success: function (data) {
                                                                                if (data.status == 200) {
                                                                                    layer.msg(data.msg, {
                                                                                        time: 1000
                                                                                    }, function () {
                                                                                        window.location.reload();
                                                                                    });

                                                                                } else {
                                                                                    layer.msg(data.msg);
                                                                                }
                                                                            }
                                                                        });
                                                                    } else {
                                                                        layer.msg('请正确输入返程时间', {
                                                                            btn: ['明白了',]
                                                                        });
                                                                    }
                                                                } else {
                                                                    layer.msg('请正确输入始程时间', {
                                                                        btn: ['明白了',]
                                                                    });
                                                                }

                                                            } else {
                                                                layer.msg('请输入正确的司机费用值', {
                                                                    btn: ['明白了',]
                                                                });
                                                            }
                                                        } else {
                                                            layer.msg('请输入正确的单程费用值', {
                                                                btn: ['明白了',]
                                                            });
                                                        }
                                                    } else {
                                                        layer.msg('您配置的站点有误请重新配置', {
                                                            btn: ['明白了',]
                                                        });
                                                    }
                                                } else {
                                                    layer.msg('请配置始程和返程的站点', {
                                                        btn: ['明白了',]
                                                    });
                                                }

                                            } else {
                                                layer.msg('线路的值不能为空', {
                                                    btn: ['明白了',]
                                                });
                                            }

                                        } else {
                                            layer.msg('省份的值不能为空', {
                                                btn: ['明白了',]
                                            });
                                        }
                                    } else {
                                        layer.msg('城市名称不能为空', {
                                            btn: ['明白了']
                                        });
                                    }


                                });
                                return false;
                            }

                        });

                    })
                    //校验经度是否符合规范
                    //校验经度x
                    function checkLong(longitude) {
                        var longrg = /^(\-|\+)?(((\d|[1-9]\d|1[0-7]\d|0{1,3})\.\d{0,6})|(\d|[1-9]\d|1[0-7]\d|0{1,3})|180\.0{0,6}|180)$/;
                        if (!longrg.test(longitude)) {
                            return false;
                        }
                        return true;
                    }

                    //校验纬度是否符合规范
                    //纬度y
                    function checkLat(latitude) {
                        var latreg = /^(\-|\+)?([0-8]?\d{1}\.\d{0,6}|90\.0{0,6}|[0-8]?\d{1}|90)$/;
                        if (!latreg.test(latitude)) {
                            return '纬度整数部分为0-90,小数部分为0到6位!';
                        }
                        return true;
                    }

                    //删除站点
                    function deleteStation(node, direction) {
                        if (confirm("确认是否删除该站点")) {

                            if (direction == "left") {
                                if ($(node).attr("i") == 0) {
                                    $("#add_startStation").val("");
                                } else if (vm.arrs.length - 1 == $(node).attr("i")) {
                                    $("#add_reStation").val("");
                                    // $("#add_reStation").val(vm.arrs[vm.arrs.length-2].name);
                                }
                                vm.arrs.splice($(node).attr("i"), 1);
                            } else if (direction == "right") {
                                if ($(node).attr("i") == 0) {
                                    $("#add_startStation").val("");
                                } else if (vm.resverArrs.length - 1 == $(node).attr("i")) {
                                    $("#add_reStation").val("");
                                    // $("#add_reStation").val(vm.arrs[vm.arrs.length-2].name);
                                }
                                vm.resverArrs.splice($(node).attr("i"), 1);
                            } else if (direction == "edit_left") {
                                vm2.arrs.splice($(node).attr("i"), 1);
                            } else if (direction == "edit_right") {
                                vm2.resverArrs.splice($(node).attr("i"), 1);
                            }
                        }
                    }

                    //地图选择
                    function mapSelection(node, direction) {

                        let select = node;
                        let map;
                        $.ajax({
                            type: "post",
                            url: "${pageContext.request.contextPath}/admin/citySite/getCitySiteAllByCityId",
                            data: {"cityId": cityId},
                            dataType: "json",
                            success: function (data) {
                                console.log(data)
                                map = new AMap.Map("container", {
                                    resizeEnable: true,
                                    // mapStyle:'amap://styles/f0c43041630ebe2835503272216aa80d',
                                    features: ['bg', 'road', 'building', 'point'],
                                    zoom: 15,
                                });
                                // map.setMapStyle('amap://styles/f0c43041630ebe2835503272216aa80d');
                                // map.setFeatures(['road','bg','building','point']);
                                // mapObj=map;


                                //点击事件
                                map.on('click', function (e) {
                                    // document.getElementById('tip').innerHTML="经度:"+ e.lnglat.getLng()+","+"纬度:"+e.lnglat.getLat();
                                    // $("#add_xPosition").val(e.lnglat.getLng());
                                    // $("#add_yPosition").val(e.lnglat.getLat());
                                    // //经度
                                    // document.getElementById("#lat").value = e.lnglat.getLng();
                                    // //纬度
                                    // document.getElementById("#lon").value = e.lnglat.getLat();
                                });

                                // AMap.event.addListener(map, 'click', getLnglat);

                                layer.open({
                                    title: '选定站点',
                                    type: 1,
                                    area: ['80%', '80%'],
                                    offset: 'auto',
                                    maxmin: true,
                                    shadeClose: false,
                                    content: $('#findMap'),
                                    btn: ['确定', '取消'],
                                    shade: [0.8, '#393D49'],
                                    success: function (layero, index) {
                                        AMap.plugin(['AMap.ToolBar', 'AMap.Scale'],
                                            function () {
                                                map.addControl(new AMap.ToolBar());
                                                map.addControl(new AMap.Scale());
                                                map.addControl(new AMap.DistrictSearch())
                                            });
                                        AMap.service(["AMap.PlaceSearch", 'AMap.DistrictSearch'], function () {
                                            //构造地点查询类
                                            var placeSearch = new AMap.PlaceSearch({
                                                showCover: false,
                                                pageSize: 0, // 单页显示结果条数
                                                pageIndex: 1, // 页码
                                                city: city, // 兴趣点城市
                                                citylimit: true,  //是否强制限制在设置的城市内搜索
                                                map: map, // 展现结果的地图实例
                                                // autoFitView: true, // 是否自动调整地图视野使绘制的 Marker点都处于视口的可见范围
                                            });
                                            // placeSearch.search(city,() => {
                                            //
                                            //     placeSearch.render.markerList.clear() // 这个为清除搜索结果的点，不想清除注释即可
                                            // })
                                            var districtSearch = new AMap.DistrictSearch({
                                                extensions: 'all',
                                                subdistrict: 0,
                                            })
                                            districtSearch.search(city, function (status, result) {
                                                console.log(result)
                                                map.setCenter([result.districtList[0].center.lng, result.districtList[0].center.lat])
                                                addMarker(map, data, select, direction, index)
                                                // 外多边形坐标数组和内多边形坐标数组
                                                var outer = [
                                                    new AMap.LngLat(-360, 90, true),
                                                    new AMap.LngLat(-360, -90, true),
                                                    new AMap.LngLat(360, -90, true),
                                                    new AMap.LngLat(360, 90, true),
                                                ];
                                                var holes = result.districtList[0].boundaries

                                                var pathArray = [
                                                    outer
                                                ];
                                                pathArray.push.apply(pathArray, holes)
                                                var polygon = new AMap.Polygon({
                                                    pathL: pathArray,
                                                    strokeColor: '#00eeff',
                                                    strokeWeight: 1,
                                                    fillColor: '#71B3ff',
                                                    fillOpacity: 0.5
                                                });
                                                polygon.setPath(pathArray);
                                                map.add(polygon)
                                            });
                                            // var cpoint = [119.299506,26.075097]; //中心点坐标
                                            // var cpoint = [obj.data.xPosition,obj.data.yPosition]; //中心点坐标
                                            // placeSearch.searchNearBy('', cpoint, 120, function (status, result) {
                                            // });
                                        });
                                    }

                                    , yes: function (num, layero) {

                                        layer.close(num);
                                        // map.destroy();
                                    }, btn2: function (index, layero) {
                                        //按钮【按钮二】的回调
                                        // map.destroy();
                                        // $("#add_startStation").val("");
                                        // $("#add_reStation").val("");
                                    }
                                    , cancel: function () {
                                        // map.destroy();
                                        // $("#add_startStation").val("");
                                        // $("#add_reStation").val("");
                                    }
                                });
                            }
                        });
                    }

                    // 实例化点标记
                    function addMarker(map, markers, select, direction, index) {
                        let marker;
                        let icon = new AMap.Icon({
                            image: 'http://vdata.amap.com/icons/b18/1/2.png',
                            size: new AMap.Size(24, 24)
                        });
                        markers.forEach(function (marker) {
                            let ma = new AMap.Marker({
                                map: map,
                                position: [marker.xPosition, marker.yPosition],
                                offset: new AMap.Pixel(-13, -30)
                            });
                            ma.setLabel({
                                // offset: new AMap.Pixel(10, 10),  //设置文本标注偏移量
                                content: marker.name, //设置文本标注内容
                                direction: 'right', //设置文本标注方位
                                title: marker.id
                            });
                            AMap.event.addListener(ma, 'click', function (e) {
                                alert(direction)

                                if (confirm("确认是否添加该站点到线路中")) {
                                    if (direction == 'left') {
                                        console.log(e)
                                        for (let i = 0; i < vm.arrs.length; i++) {
                                            if (vm.arrs[i].name == e.target.Ce.label.content) {
                                                layer.msg('已存在相同站点,请重新添加');
                                                return;
                                            }
                                        }
                                        //首站
                                        if ($(select).attr('i') == -1) {
                                            document.getElementById('tip').innerHTML = e.target.Ce.label.content;
                                            $(select).prev().val(e.target.Ce.label.content);
                                            $(select).prev().attr("title", e.target.Ce.label.title);
                                            // let distance;
                                            if (vm.arrs.length >= 1) {
                                                // distance = Math.round(new AMap.LngLat(e.lnglat.lng, e.lnglat.lat).distance(new AMap.LngLat(vm.arrs[vm.arrs.length - 1].xPosition, vm.arrs[vm.arrs.length - 1].yPosition)));
                                                //首站和下一站距离
                                                $.ajax({
                                                    url: "https://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                                    dataType: "json",
                                                    method: "get",
                                                    data: {
                                                        "output": "json",
                                                        "origin": vm.arrs[0].xPosition + "," + vm.arrs[0].yPosition,
                                                        "destination": e.lnglat.lng + "," + e.lnglat.lat,
                                                        "city": city
                                                    },
                                                    success: function (data) {
                                                        if (data.info == "OK") {
                                                            vm.arrs.splice(0, 0, {
                                                                name: e.target.Ce.label.content,
                                                                title: e.target.Ce.label.title,
                                                                xPosition: e.lnglat.lng,
                                                                yPosition: e.lnglat.lat,
                                                                distance: data.route.distance
                                                            });
                                                        }
                                                    }
                                                });

                                            } else {
                                                vm.arrs.splice(0, 0, {
                                                    name: e.target.Ce.label.content,
                                                    title: e.target.Ce.label.title,
                                                    xPosition: e.lnglat.lng,
                                                    yPosition: e.lnglat.lat,
                                                    distance: ''
                                                });
                                                // $("#add_yPosition").val(e.lnglat.getLat());

                                            }

                                        } else if ($(select).attr('i') == -2) {
                                            document.getElementById('tip').innerHTML = e.target.Ce.label.content;
                                            $(select).prev().val(e.target.Ce.label.content);
                                            $(select).prev().attr("title", e.target.Ce.label.title);
                                            //尾站
                                            if (vm.arrs.length > 0) {

                                                $.ajax({
                                                    url: "https://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                                    dataType: "json",
                                                    method: "get",
                                                    data: {
                                                        "origin": vm.arrs[vm.arrs.length - 1].xPosition + "," + vm.arrs[vm.arrs.length - 1].yPosition,
                                                        "destination": e.lnglat.lng + "," + e.lnglat.lat,
                                                        "city": city,
                                                        "cityd": city
                                                    },
                                                    success: function (data) {
                                                        if (data.info == "OK") {
                                                            vm.arrs.splice(vm.arrs.length, 0, {
                                                                name: e.target.Ce.label.content,
                                                                title: e.target.Ce.label.title,
                                                                xPosition: e.lnglat.lng,
                                                                yPosition: e.lnglat.lat,
                                                            });
                                                            vm.arrs[vm.arrs.length - 2].distance = data.route.distance
                                                        }
                                                    }
                                                });

                                            } else {
                                                vm.arrs.splice(0, 0, {
                                                    name: e.target.Ce.label.content,
                                                    title: e.target.Ce.label.title,
                                                    xPosition: e.lnglat.lng,
                                                    yPosition: e.lnglat.lat,
                                                    distance: ''
                                                });
                                            }

                                        } else {
                                            //点击第一个
                                            if ($(select).attr('i') == 0) {
                                                alert(1)
                                                if (vm.arrs.length > 1) {
                                                    $.ajax({
                                                        url: "https://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                                        dataType: "json",
                                                        method: "get",
                                                        data: {
                                                            "output": "json",
                                                            "origin": vm.arrs[0].xPosition + "," + vm.arrs[0].yPosition,
                                                            "destination": e.lnglat.lng + "," + e.lnglat.lat,
                                                            "city": city
                                                        },
                                                        success: function (data) {
                                                            console.log(data);
                                                            vm.arrs.splice($(select).attr('i') + 1, 0, {
                                                                name: e.target.Ce.label.content,
                                                                title: e.target.Ce.label.title,
                                                                xPosition: e.lnglat.lng,
                                                                yPosition: e.lnglat.lat,

                                                            });
                                                            vm.arrs[$(select).attr('i')].distance = data.route.distance;
                                                            $.ajax({
                                                                url: "http://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                                                dataType: "json",
                                                                method: "get",
                                                                data: {
                                                                    "origin": e.lnglat.lng + "," + e.lnglat.lat,
                                                                    "destination": vm.arrs[Number($(select).attr('i')) + 2].xPosition + "," + vm.arrs[Number($(select).attr('i')) + 2].yPosition,
                                                                    "city": city
                                                                },
                                                                success: function (data) {
                                                                    console.log(data);
                                                                    alert(data.route.distance)
                                                                    vm.arrs[Number($(select).attr('i')) + 1].distance = data.route.distance
                                                                    //强制刷新页面
                                                                    vm.$forceUpdate()
                                                                }
                                                            });
                                                        }
                                                    });

                                                } else {
                                                    $.ajax({
                                                        url: "https://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                                        dataType: "json",
                                                        method: "get",
                                                        data: {
                                                            "output": "json",
                                                            "origin": vm.arrs[0].xPosition + "," + vm.arrs[0].yPosition,
                                                            "destination": e.lnglat.lng + "," + e.lnglat.lat,
                                                            "city": city
                                                        },
                                                        success: function (data) {
                                                            console.log(data);
                                                            vm.arrs.splice($(select).attr('i') + 1, 0, {
                                                                name: e.target.Ce.label.content,
                                                                title: e.target.Ce.label.title,
                                                                xPosition: e.lnglat.lng,
                                                                yPosition: e.lnglat.lat,

                                                            });
                                                            vm.arrs[Number($(select).attr('i'))].distance = data.route.distance;
                                                        }
                                                    });

                                                }


                                            } else if ($(select).attr('i') == vm.arrs.length - 1) {
                                                $.ajax({
                                                    url: "https://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                                    dataType: "json",
                                                    method: "get",
                                                    data: {
                                                        "output": "json",
                                                        "origin": vm.arrs[vm.arrs.length - 1].xPosition + "," + vm.arrs[vm.arrs.length - 1].yPosition,
                                                        "destination": e.lnglat.lng + "," + e.lnglat.lat,
                                                        "city": city
                                                    },
                                                    success: function (data) {
                                                        console.log(data);
                                                        vm.arrs.splice(Number($(select).attr('i') + 1), 0, {
                                                            name: e.target.Ce.label.content,
                                                            title: e.target.Ce.label.title,
                                                            xPosition: e.lnglat.lng,
                                                            yPosition: e.lnglat.lat,
                                                        });
                                                        vm.arrs[Number($(select).attr('i'))].distance = data.route.distance;
                                                    }
                                                });
                                            } else {
                                                alert(3)
                                                $.ajax({
                                                    url: "http://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                                    dataType: "json",
                                                    method: "get",
                                                    data: {
                                                        "origin": vm.arrs[$(select).attr('i')].xPosition + "," + vm.arrs[$(select).attr('i')].yPosition,
                                                        "destination": e.lnglat.lng + "," + e.lnglat.lat,
                                                        "city": city
                                                    },
                                                    success: function (data) {
                                                        console.log(data);
                                                        vm.arrs.splice(Number($(select).attr('i')) + 1, 0, {
                                                            name: e.target.Ce.label.content,
                                                            title: e.target.Ce.label.title,
                                                            xPosition: e.lnglat.lng,
                                                            yPosition: e.lnglat.lat,

                                                        });
                                                        vm.arrs[$(select).attr('i')].distance = data.route.distance
                                                        $.ajax({
                                                            url: "http://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                                            dataType: "json",
                                                            method: "get",
                                                            data: {
                                                                "origin": e.lnglat.lng + "," + e.lnglat.lat,
                                                                "destination": vm.arrs[Number($(select).attr('i')) + 2].xPosition + "," + vm.arrs[Number($(select).attr('i')) + 2].yPosition,
                                                                "city": city
                                                            },
                                                            success: function (data) {
                                                                console.log(data);
                                                                vm.arrs[Number($(select).attr('i')) + 1].distance = data.route.distance
                                                                //强制刷新页面
                                                                vm.$forceUpdate()
                                                            }
                                                        });
                                                    }
                                                });

                                            }


                                        }
                                    } else if (direction == "right") {
                                        console.log(e)
                                        for (let i = 0; i < vm.resverArrs.length; i++) {
                                            if (vm.resverArrs[i].name == e.target.Ce.label.content) {
                                                layer.msg('已存在相同站点,请重新添加');
                                                return;
                                            }
                                        }
                                        //首站
                                        if ($(select).attr('i') == -1) {
                                            document.getElementById('tip').innerHTML = e.target.Ce.label.content;
                                            $(select).prev().val(e.target.Ce.label.content);
                                            $(select).prev().attr("title", e.target.Ce.label.title);
                                            // let distance;
                                            if (vm.resverArrs.length > 1) {
                                                // distance = Math.round(new AMap.LngLat(e.lnglat.lng, e.lnglat.lat).distance(new AMap.LngLat(vm.arrs[vm.arrs.length - 1].xPosition, vm.arrs[vm.arrs.length - 1].yPosition)));
                                                //首站和下一站距离
                                                $.ajax({
                                                    url: "https://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                                    dataType: "json",
                                                    method: "get",
                                                    data: {
                                                        "output": "json",
                                                        "origin": vm.resverArrs[0].xPosition + "," + vm.resverArrs[0].yPosition,
                                                        "destination": e.lnglat.lng + "," + e.lnglat.lat,
                                                        "city": city
                                                    },
                                                    success: function (data) {
                                                        console.log(data);
                                                        vm.resverArrs.splice(0, 0, {
                                                            name: e.target.Ce.label.content,
                                                            title: e.target.Ce.label.title,
                                                            xPosition: e.lnglat.lng,
                                                            yPosition: e.lnglat.lat,
                                                            distance: data.route.distance
                                                        });
                                                    }
                                                });

                                            } else {
                                                vm.resverArrs.splice(0, 0, {
                                                    name: e.target.Ce.label.content,
                                                    title: e.target.Ce.label.title,
                                                    xPosition: e.lnglat.lng,
                                                    yPosition: e.lnglat.lat,
                                                    distance: ''
                                                });
                                                // $("#add_yPosition").val(e.lnglat.getLat());

                                            }

                                        } else if ($(select).attr('i') == -2) {
                                            //尾站
                                            document.getElementById('tip').innerHTML = e.target.Ce.label.content;
                                            $(select).prev().val(e.target.Ce.label.content);
                                            $(select).prev().attr("title", e.target.Ce.label.title);
                                            $.ajax({
                                                url: "https://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                                dataType: "json",
                                                method: "get",
                                                data: {
                                                    "origin": vm.resverArrs[vm.resverArrs.length - 1].xPosition + "," + vm.resverArrs[vm.resverArrs.length - 1].yPosition,
                                                    "destination": e.lnglat.lng + "," + e.lnglat.lat,
                                                    "city": city,
                                                    "cityd": city
                                                },
                                                success: function (data) {
                                                    if (data.info == "OK") {
                                                        vm.resverArrs.splice(vm.resverArrs.length, 0, {
                                                            name: e.target.Ce.label.content,
                                                            title: e.target.Ce.label.title,
                                                            xPosition: e.lnglat.lng,
                                                            yPosition: e.lnglat.lat,
                                                        });
                                                        vm.resverArrs[vm.resverArrs.length - 2].distance = data.route.distance
                                                    }
                                                }
                                            });

                                        } else {
                                            //点击第一个
                                            if ($(select).attr('i') == 0) {
                                                if (vm.resverArrs.length > 1) {
                                                    $.ajax({
                                                        url: "https://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                                        dataType: "json",
                                                        method: "get",
                                                        data: {
                                                            "output": "json",
                                                            "origin": vm.resverArrs[0].xPosition + "," + vm.resverArrs[0].yPosition,
                                                            "destination": e.lnglat.lng + "," + e.lnglat.lat,
                                                            "city": city
                                                        },
                                                        success: function (data) {
                                                            console.log(data);
                                                            if (data.info == "OK") {
                                                                vm.resverArrs.splice($(select).attr('i') + 1, 0, {
                                                                    name: e.target.Ce.label.content,
                                                                    title: e.target.Ce.label.title,
                                                                    xPosition: e.lnglat.lng,
                                                                    yPosition: e.lnglat.lat,

                                                                });
                                                                vm.resverArrs[$(select).attr('i')].distance = data.route.distance;
                                                                $.ajax({
                                                                    url: "http://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                                                    dataType: "json",
                                                                    method: "get",
                                                                    data: {
                                                                        "origin": e.lnglat.lng + "," + e.lnglat.lat,
                                                                        "destination": vm.resverArrs[Number($(select).attr('i')) + 2].xPosition + "," + vm.resverArrs[Number($(select).attr('i')) + 2].yPosition,
                                                                        "city": city
                                                                    },
                                                                    success: function (data) {
                                                                        if (data.info == "OK") {
                                                                            vm.resverArrs[Number($(select).attr('i')) + 1].distance = data.route.distance
                                                                            //强制刷新页面
                                                                            vm.$forceUpdate()
                                                                        }
                                                                    }
                                                                });
                                                            }


                                                        }
                                                    });

                                                } else {
                                                    $.ajax({
                                                        url: "https://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                                        dataType: "json",
                                                        method: "get",
                                                        data: {
                                                            "output": "json",
                                                            "origin": vm.resverArrs[0].xPosition + "," + vm.resverArrs[0].yPosition,
                                                            "destination": e.lnglat.lng + "," + e.lnglat.lat,
                                                            "city": city
                                                        },
                                                        success: function (data) {
                                                            if (data.info == "OK") {
                                                                vm.resverArrs.splice($(select).attr('i') + 1, 0, {
                                                                    name: e.target.Ce.label.content,
                                                                    title: e.target.Ce.label.title,
                                                                    xPosition: e.lnglat.lng,
                                                                    yPosition: e.lnglat.lat,

                                                                });
                                                                vm.resverArrs[Number($(select).attr('i'))].distance = data.route.distance;
                                                            }
                                                        }
                                                    });

                                                }


                                            } else if ($(select).attr('i') == vm.resverArrs.length - 1) {
                                                $.ajax({
                                                    url: "https://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                                    dataType: "json",
                                                    method: "get",
                                                    data: {
                                                        "output": "json",
                                                        "origin": vm.resverArrs[vm.resverArrs.length - 1].xPosition + "," + vm.resverArrs[vm.resverArrs.length - 1].yPosition,
                                                        "destination": e.lnglat.lng + "," + e.lnglat.lat,
                                                        "city": city
                                                    },
                                                    success: function (data) {
                                                        if (data.info == "OK") {
                                                            vm.resverArrs.splice(Number($(select).attr('i') + 1), 0, {
                                                                name: e.target.Ce.label.content,
                                                                title: e.target.Ce.label.title,
                                                                xPosition: e.lnglat.lng,
                                                                yPosition: e.lnglat.lat,
                                                            });
                                                            vm.resverArrs[Number($(select).attr('i'))].distance = data.route.distance;
                                                        }
                                                    }
                                                });
                                            } else {
                                                $.ajax({
                                                    url: "http://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                                    dataType: "json",
                                                    method: "get",
                                                    data: {
                                                        "origin": vm.resverArrs[$(select).attr('i')].xPosition + "," + vm.resverArrs[$(select).attr('i')].yPosition,
                                                        "destination": e.lnglat.lng + "," + e.lnglat.lat,
                                                        "city": city
                                                    },
                                                    success: function (data) {
                                                        if (data.info == "OK") {
                                                            vm.resverArrs.splice(Number($(select).attr('i')) + 1, 0, {
                                                                name: e.target.Ce.label.content,
                                                                title: e.target.Ce.label.title,
                                                                xPosition: e.lnglat.lng,
                                                                yPosition: e.lnglat.lat,

                                                            });
                                                            vm.resverArrs[$(select).attr('i')].distance = data.route.distance
                                                            $.ajax({
                                                                url: "http://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                                                dataType: "json",
                                                                method: "get",
                                                                data: {
                                                                    "origin": e.lnglat.lng + "," + e.lnglat.lat,
                                                                    "destination": vm.resverArrs[Number($(select).attr('i')) + 2].xPosition + "," + vm.resverArrs[Number($(select).attr('i')) + 2].yPosition,
                                                                    "city": city
                                                                },
                                                                success: function (data) {
                                                                    if (data.info == "OK") {
                                                                        vm.resverArrs[Number($(select).attr('i')) + 1].distance = data.route.distance
                                                                        //强制刷新页面
                                                                        vm.$forceUpdate()
                                                                    }
                                                                }
                                                            });
                                                        }
                                                    }
                                                });

                                            }


                                        }
                                    } else if (direction == "edit_left") {
                                        for (let i = 0; i < vm2.arrs.length; i++) {
                                            if (vm2.arrs[i].name == e.target.Ce.label.content) {
                                                layer.msg('已存在相同站点,请重新添加');
                                                return;
                                            }
                                        }
                                        //首站
                                        if ($(select).attr('i') == -1) {
                                            document.getElementById('tip').innerHTML = e.target.Ce.label.content;
                                            $(select).prev().val(e.target.Ce.label.content);
                                            $(select).prev().attr("title", e.target.Ce.label.title);
                                            // let distance;
                                            if (vm2.arrs.length > 1) {
                                                // distance = Math.round(new AMap.LngLat(e.lnglat.lng, e.lnglat.lat).distance(new AMap.LngLat(vm.arrs[vm.arrs.length - 1].xPosition, vm.arrs[vm.arrs.length - 1].yPosition)));
                                                //首站和下一站距离
                                                $.ajax({
                                                    url: "https://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                                    dataType: "json",
                                                    method: "get",
                                                    data: {
                                                        "output": "json",
                                                        "origin": vm2.arrs[0].xPosition + "," + vm2.arrs[0].yPosition,
                                                        "destination": e.lnglat.lng + "," + e.lnglat.lat,
                                                        "city": city
                                                    },
                                                    success: function (data) {
                                                        if (data.info == "OK") {
                                                            vm2.arrs.splice(0, 0, {
                                                                name: e.target.Ce.label.content,
                                                                title: e.target.Ce.label.title,
                                                                xPosition: e.lnglat.lng,
                                                                yPosition: e.lnglat.lat,
                                                                distance: data.route.distance
                                                            });
                                                        }
                                                    }
                                                });

                                            } else {
                                                vm2.arrs.splice(0, 0, {
                                                    name: e.target.Ce.label.content,
                                                    title: e.target.Ce.label.title,
                                                    xPosition: e.lnglat.lng,
                                                    yPosition: e.lnglat.lat,
                                                    distance: ''
                                                });

                                            }

                                        } else if ($(select).attr('i') == -2) {
                                            //尾站
                                            document.getElementById('tip').innerHTML = e.target.Ce.label.content;
                                            $(select).prev().val(e.target.Ce.label.content);
                                            $(select).prev().attr("title", e.target.Ce.label.title);
                                            $.ajax({
                                                url: "https://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                                dataType: "json",
                                                method: "get",
                                                data: {
                                                    "origin": vm2.arrs[vm2.arrs.length - 1].xPosition + "," + vm2.arrs[vm2.arrs.length - 1].yPosition,
                                                    "destination": e.lnglat.lng + "," + e.lnglat.lat,
                                                    "city": city,
                                                    "cityd": city
                                                },
                                                success: function (data) {
                                                    if (data.info == "OK") {
                                                        vm2.arrs.splice(vm2.arrs.length, 0, {
                                                            name: e.target.Ce.label.content,
                                                            title: e.target.Ce.label.title,
                                                            xPosition: e.lnglat.lng,
                                                            yPosition: e.lnglat.lat,
                                                        });
                                                        vm2.arrs[vm2.arrs.length - 2].distance = data.route.distance
                                                    }
                                                }
                                            });

                                        } else {
                                            //点击第一个
                                            if ($(select).attr('i') == 0) {
                                                if (vm2.arrs.length > 1) {
                                                    $.ajax({
                                                        url: "https://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                                        dataType: "json",
                                                        method: "get",
                                                        data: {
                                                            "output": "json",
                                                            "origin": vm2.arrs[0].xPosition + "," + vm2.arrs[0].yPosition,
                                                            "destination": e.lnglat.lng + "," + e.lnglat.lat,
                                                            "city": city
                                                        },
                                                        success: function (data) {
                                                            if (data.info == "OK") {
                                                                vm2.arrs.splice($(select).attr('i') + 1, 0, {
                                                                    name: e.target.Ce.label.content,
                                                                    title: e.target.Ce.label.title,
                                                                    xPosition: e.lnglat.lng,
                                                                    yPosition: e.lnglat.lat,

                                                                });
                                                                vm2.arrs[$(select).attr('i')].distance = data.route.distance;
                                                                $.ajax({
                                                                    url: "http://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                                                    dataType: "json",
                                                                    method: "get",
                                                                    data: {
                                                                        "origin": e.lnglat.lng + "," + e.lnglat.lat,
                                                                        "destination": vm2.arrs[Number($(select).attr('i')) + 2].xPosition + "," + vm2.arrs[Number($(select).attr('i')) + 2].yPosition,
                                                                        "city": city
                                                                    },
                                                                    success: function (data) {
                                                                        if (data.info == "OK") {
                                                                            alert(data.route.distance)
                                                                            vm2.arrs[Number($(select).attr('i')) + 1].distance = data.route.distance
                                                                            //强制刷新页面
                                                                            vm2.$forceUpdate()
                                                                        }
                                                                    }
                                                                });
                                                            }
                                                        }
                                                    });

                                                } else {
                                                    $.ajax({
                                                        url: "https://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                                        dataType: "json",
                                                        method: "get",
                                                        data: {
                                                            "output": "json",
                                                            "origin": vm2.arrs[0].xPosition + "," + vm2.arrs[0].yPosition,
                                                            "destination": e.lnglat.lng + "," + e.lnglat.lat,
                                                            "city": city
                                                        },
                                                        success: function (data) {
                                                            if (data.info == "OK") {
                                                                vm2.arrs.splice($(select).attr('i') + 1, 0, {
                                                                    name: e.target.Ce.label.content,
                                                                    title: e.target.Ce.label.title,
                                                                    xPosition: e.lnglat.lng,
                                                                    yPosition: e.lnglat.lat,

                                                                });
                                                                vm2.arrs[Number($(select).attr('i'))].distance = data.route.distance;
                                                            }
                                                        }
                                                    });

                                                }


                                            } else if ($(select).attr('i') == vm2.arrs.length - 1) {
                                                $.ajax({
                                                    url: "https://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                                    dataType: "json",
                                                    method: "get",
                                                    data: {
                                                        "output": "json",
                                                        "origin": vm2.arrs[vm2.arrs.length - 1].xPosition + "," + vm2.arrs[vm2.arrs.length - 1].yPosition,
                                                        "destination": e.lnglat.lng + "," + e.lnglat.lat,
                                                        "city": city
                                                    },
                                                    success: function (data) {
                                                        if (data.info == "OK") {
                                                            vm2.arrs.splice(Number($(select).attr('i') + 1), 0, {
                                                                name: e.target.Ce.label.content,
                                                                title: e.target.Ce.label.title,
                                                                xPosition: e.lnglat.lng,
                                                                yPosition: e.lnglat.lat,
                                                            });
                                                            vm2.arrs[Number($(select).attr('i'))].distance = data.route.distance;
                                                        }
                                                    }
                                                });
                                            } else {
                                                $.ajax({
                                                    url: "http://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                                    dataType: "json",
                                                    method: "get",
                                                    data: {
                                                        "origin": vm2.arrs[$(select).attr('i')].xPosition + "," + vm2.arrs[$(select).attr('i')].yPosition,
                                                        "destination": e.lnglat.lng + "," + e.lnglat.lat,
                                                        "city": city
                                                    },
                                                    success: function (data) {
                                                        if (data.info == "OK") {
                                                            vm2.arrs.splice(Number($(select).attr('i')) + 1, 0, {
                                                                name: e.target.Ce.label.content,
                                                                title: e.target.Ce.label.title,
                                                                xPosition: e.lnglat.lng,
                                                                yPosition: e.lnglat.lat,

                                                            });
                                                            vm2.arrs[$(select).attr('i')].distance = data.route.distance
                                                            $.ajax({
                                                                url: "http://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                                                dataType: "json",
                                                                method: "get",
                                                                data: {
                                                                    "origin": e.lnglat.lng + "," + e.lnglat.lat,
                                                                    "destination": vm2.arrs[Number($(select).attr('i')) + 2].xPosition + "," + vm2.arrs[Number($(select).attr('i')) + 2].yPosition,
                                                                    "city": city
                                                                },
                                                                success: function (data) {
                                                                    if (data.info == 200) {
                                                                        vm2.arrs[Number($(select).attr('i')) + 1].distance = data.route.distance
                                                                        //强制刷新页面
                                                                        vm2.$forceUpdate()
                                                                    }
                                                                }
                                                            });
                                                        }
                                                    }
                                                });

                                            }


                                        }
                                    } else if (direction == "edit_right") {
                                        for (let i = 0; i < vm2.resverArrs.length; i++) {
                                            if (vm2.resverArrs[i].name == e.target.Ce.label.content) {
                                                layer.msg('已存在相同站点,请重新添加');
                                                return;
                                            }
                                        }
                                        //首站
                                        if ($(select).attr('i') == -1) {
                                            document.getElementById('tip').innerHTML = e.target.Ce.label.content;
                                            $(select).prev().val(e.target.Ce.label.content);
                                            $(select).prev().attr("title", e.target.Ce.label.title);
                                            // let distance;
                                            if (vm2.resverArrs.length > 1) {
                                                // distance = Math.round(new AMap.LngLat(e.lnglat.lng, e.lnglat.lat).distance(new AMap.LngLat(vm.arrs[vm.arrs.length - 1].xPosition, vm.arrs[vm.arrs.length - 1].yPosition)));
                                                //首站和下一站距离
                                                $.ajax({
                                                    url: "https://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                                    dataType: "json",
                                                    method: "get",
                                                    data: {
                                                        "output": "json",
                                                        "origin": vm2.resverArrs[0].xPosition + "," + vm2.resverArrs[0].yPosition,
                                                        "destination": e.lnglat.lng + "," + e.lnglat.lat,
                                                        "city": city
                                                    },
                                                    success: function (data) {
                                                        console.log(data);
                                                        vm2.resverArrs.splice(0, 0, {
                                                            name: e.target.Ce.label.content,
                                                            title: e.target.Ce.label.title,
                                                            xPosition: e.lnglat.lng,
                                                            yPosition: e.lnglat.lat,
                                                            distance: data.route.distance
                                                        });
                                                    }
                                                });

                                            } else {
                                                vm2.resverArrs.splice(0, 0, {
                                                    name: e.target.Ce.label.content,
                                                    title: e.target.Ce.label.title,
                                                    xPosition: e.lnglat.lng,
                                                    yPosition: e.lnglat.lat,
                                                    distance: ''
                                                });
                                                // $("#add_yPosition").val(e.lnglat.getLat());

                                            }

                                        } else if ($(select).attr('i') == -2) {
                                            //尾站
                                            document.getElementById('tip').innerHTML = e.target.Ce.label.content;
                                            $(select).prev().val(e.target.Ce.label.content);
                                            $(select).prev().attr("title", e.target.Ce.label.title);
                                            $.ajax({
                                                url: "https://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                                dataType: "json",
                                                method: "get",
                                                data: {
                                                    "origin": vm2.resverArrs[vm2.resverArrs.length - 1].xPosition + "," + vm2.resverArrs[vm2.resverArrs.length - 1].yPosition,
                                                    "destination": e.lnglat.lng + "," + e.lnglat.lat,
                                                    "city": city,
                                                    "cityd": city
                                                },
                                                success: function (data) {
                                                    console.log(data);
                                                    if (data.info == "OK") {
                                                        vm2.resverArrs.splice(vm2.resverArrs.length, 0, {
                                                            name: e.target.Ce.label.content,
                                                            title: e.target.Ce.label.title,
                                                            xPosition: e.lnglat.lng,
                                                            yPosition: e.lnglat.lat,
                                                        });
                                                        vm2.resverArrs[vm2.resverArrs.length - 2].distance = data.route.distance
                                                    }
                                                }
                                            });

                                        } else {
                                            //点击第一个
                                            if ($(select).attr('i') == 0) {
                                                if (vm2.resverArrs.length > 1) {
                                                    $.ajax({
                                                        url: "https://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                                        dataType: "json",
                                                        method: "get",
                                                        data: {
                                                            "output": "json",
                                                            "origin": vm2.resverArrs[0].xPosition + "," + vm2.resverArrs[0].yPosition,
                                                            "destination": e.lnglat.lng + "," + e.lnglat.lat,
                                                            "city": city
                                                        },
                                                        success: function (data) {
                                                            if (data.info == "OK") {
                                                                vm2.resverArrs.splice($(select).attr('i') + 1, 0, {
                                                                    name: e.target.Ce.label.content,
                                                                    title: e.target.Ce.label.title,
                                                                    xPosition: e.lnglat.lng,
                                                                    yPosition: e.lnglat.lat,

                                                                });
                                                                vm2.resverArrs[$(select).attr('i')].distance = data.route.distance;
                                                                $.ajax({
                                                                    url: "http://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                                                    dataType: "json",
                                                                    method: "get",
                                                                    data: {
                                                                        "origin": e.lnglat.lng + "," + e.lnglat.lat,
                                                                        "destination": vm2.resverArrs[Number($(select).attr('i')) + 2].xPosition + "," + vm2.resverArrs[Number($(select).attr('i')) + 2].yPosition,
                                                                        "city": city
                                                                    },
                                                                    success: function (data) {
                                                                        if (data.info == "OK") {
                                                                            vm2.resverArrs[Number($(select).attr('i')) + 1].distance = data.route.distance
                                                                            //强制刷新页面
                                                                            vm2.$forceUpdate()
                                                                        }
                                                                    }
                                                                });
                                                            }
                                                        }
                                                    });

                                                } else {
                                                    $.ajax({
                                                        url: "https://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                                        dataType: "json",
                                                        method: "get",
                                                        data: {
                                                            "output": "json",
                                                            "origin": vm2.resverArrs[0].xPosition + "," + vm2.resverArrs[0].yPosition,
                                                            "destination": e.lnglat.lng + "," + e.lnglat.lat,
                                                            "city": city
                                                        },
                                                        success: function (data) {
                                                            if (data.info == "OK") {
                                                                vm2.resverArrs.splice($(select).attr('i') + 1, 0, {
                                                                    name: e.target.Ce.label.content,
                                                                    title: e.target.Ce.label.title,
                                                                    xPosition: e.lnglat.lng,
                                                                    yPosition: e.lnglat.lat,

                                                                });
                                                                vm2.resverArrs[Number($(select).attr('i'))].distance = data.route.distance;
                                                            }
                                                        }
                                                    });

                                                }


                                            } else if ($(select).attr('i') == vm2.resverArrs.length - 1) {
                                                $.ajax({
                                                    url: "https://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                                    dataType: "json",
                                                    method: "get",
                                                    data: {
                                                        "output": "json",
                                                        "origin": vm2.resverArrs[vm2.resverArrs.length - 1].xPosition + "," + vm2.resverArrs[vm2.resverArrs.length - 1].yPosition,
                                                        "destination": e.lnglat.lng + "," + e.lnglat.lat,
                                                        "city": city
                                                    },
                                                    success: function (data) {
                                                        if (data.info == "OK") {
                                                            vm2.resverArrs.splice(Number($(select).attr('i') + 1), 0, {
                                                                name: e.target.Ce.label.content,
                                                                title: e.target.Ce.label.title,
                                                                xPosition: e.lnglat.lng,
                                                                yPosition: e.lnglat.lat,
                                                            });
                                                            vm2.resverArrs[Number($(select).attr('i'))].distance = data.route.distance;
                                                        }
                                                    }
                                                });
                                            } else {
                                                alert(3)
                                                $.ajax({
                                                    url: "http://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                                    dataType: "json",
                                                    method: "get",
                                                    data: {
                                                        "origin": vm2.resverArrs[$(select).attr('i')].xPosition + "," + vm2.resverArrs[$(select).attr('i')].yPosition,
                                                        "destination": e.lnglat.lng + "," + e.lnglat.lat,
                                                        "city": city
                                                    },
                                                    success: function (data) {
                                                        if (data.info == "OK") {
                                                            vm2.resverArrs.splice(Number($(select).attr('i')) + 1, 0, {
                                                                name: e.target.Ce.label.content,
                                                                title: e.target.Ce.label.title,
                                                                xPosition: e.lnglat.lng,
                                                                yPosition: e.lnglat.lat,

                                                            });
                                                            vm2.resverArrs[$(select).attr('i')].distance = data.route.distance
                                                            $.ajax({
                                                                url: "http://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                                                dataType: "json",
                                                                method: "get",
                                                                data: {
                                                                    "origin": e.lnglat.lng + "," + e.lnglat.lat,
                                                                    "destination": vm2.resverArrs[Number($(select).attr('i')) + 2].xPosition + "," + vm2.resverArrs[Number($(select).attr('i')) + 2].yPosition,
                                                                    "city": city
                                                                },
                                                                success: function (data) {
                                                                    if (data.info == "OK") {
                                                                        vm2.resverArrs[Number($(select).attr('i')) + 1].distance = data.route.distance
                                                                        //强制刷新页面
                                                                        vm2.$forceUpdate()
                                                                    }
                                                                }
                                                            });
                                                        }
                                                    }
                                                });

                                            }


                                        }
                                    }
                                    layer.close(index);
                                }


                            });
                        });

                    }

                    var vm = new Vue({
                        el: "#app",
                        data: {
                            arrs: [],
                            resverArrs: [],
                            startTime: '',
                            returnTime: ''
                        },
                        computed: {
                            comp() {
                                return function () {
                                    let distince = 0;
                                    //单程费用
                                    for (let i = 0; i < this.arrs.length; i++) {
                                        //运行距离
                                        if (this.arrs.length - 1 != i) {
                                            console.log(Number(this.arrs[i].distance))
                                            distince += Number(this.arrs[i].distance);
                                        }
                                    }
                                    this.startTime = Math.ceil((distince / 13.9 + (this.arrs.length / 2) * 180 + this.arrs.length * 30) / 60);
                                    //50km/h-13.8889m/s,每两个站一个红绿灯，一个站等待30s
                                    return Math.ceil((distince / 13.9 + (this.arrs.length / 2) * 180 + this.arrs.length * 30) / 60) + '分钟';
                                }
                            },
                            reverComp() {
                                return function () {
                                    let distince = 0;
                                    //单程费用
                                    for (let i = 0; i < this.resverArrs.length; i++) {
                                        //运行距离
                                        if (this.resverArrs.length - 1 != i) {
                                            console.log(Number(this.resverArrs[i].distance))
                                            distince += Number(this.resverArrs[i].distance);
                                        }
                                    }
                                    this.returnTime = Math.ceil((distince / 13.9 + (this.resverArrs.length / 2) * 180 + this.resverArrs.length * 30) / 60);
                                    //50km/h-13.8889m/s,每两个站一个红绿灯，一个站等待30s
                                    return Math.ceil((distince / 13.9 + (this.resverArrs.length / 2) * 180 + this.resverArrs.length * 30) / 60) + '分钟';
                                }
                            },

                        }
                    });
                    /*修改站点*/
                    var vm2 = new Vue({
                        el: "#app2",
                        data: {
                            arrs: [],
                            resverArrs: [],
                            startTime: '',
                            returnTime: ''
                        },
                        computed: {
                            calDistance(o) {
                                return function (o) {
                                    //第一个并且长度大于1
                                    if (o == 0 && this.arrs.length > 1) {
                                        $.ajax({
                                            url: "https://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                            dataType: "json",
                                            method: "get",
                                            data: {
                                                "output": "json",
                                                "origin": vm2.arrs[0].xPosition + "," + vm2.arrs[0].yPosition,
                                                "destination": vm2.arrs[1].xPosition + "," + vm2.arrs[1].yPosition,
                                                "city": city
                                            },
                                            success: function (data) {
                                                if (data.info == "OK") {
                                                    vm2.arrs[0].distance = data.route.distance;
                                                }
                                            }
                                        });
                                        return vm2.arrs[o].distance;
                                        //不是最后一个并且长度大于等于2
                                    } else if (this.arrs.length >= 2 && (o != this.arrs.length - 1)) {
                                        $.ajax({
                                            url: "https://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                            dataType: "json",
                                            method: "get",
                                            data: {
                                                "output": "json",
                                                "origin": vm2.arrs[o].xPosition + "," + vm2.arrs[o].yPosition,
                                                "destination": vm2.arrs[Number(o) + 1].xPosition + "," + vm2.arrs[Number(o) + 1].yPosition,
                                                "city": city
                                            },
                                            success: function (data) {
                                                if (data.info == "OK") {
                                                    vm2.arrs[o].distance = data.route.distance;
                                                }
                                            }
                                        });
                                        return vm2.arrs[o].distance;
                                        //是最后一个并且长度等于2
                                    } else if (o == this.arrs.length - 1 && this.arrs.length == 2) {
                                        $.ajax({
                                            url: "https://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                            dataType: "json",
                                            method: "get",
                                            data: {
                                                "output": "json",
                                                "origin": vm2.arrs[vm2.arrs.length - 2].xPosition + "," + vm2.arrs[this.arrs.length - 2].yPosition,
                                                "destination": vm2.arrs[Number(o)].xPosition + "," + vm2.arrs[Number(o)].yPosition,
                                                "city": city
                                            },
                                            success: function (data) {
                                                if (data.info == "OK") {
                                                    vm2.arrs[vm2.arrs.length - 2].distance = data.route.distance;
                                                }
                                            }
                                        });
                                    }

                                }
                            },
                            calDistanceResver(o) {
                                return function (o) {
                                    if (o == 0 && this.resverArrs.length > 1) {
                                        $.ajax({
                                            url: "https://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                            dataType: "json",
                                            method: "get",
                                            data: {
                                                "output": "json",
                                                "origin": vm2.resverArrs[0].xPosition + "," + vm2.resverArrs[0].yPosition,
                                                "destination": vm2.resverArrs[1].xPosition + "," + vm2.resverArrs[1].yPosition,
                                                "city": city
                                            },
                                            success: function (data) {
                                                if (data.info == "OK") {
                                                    vm2.resverArrs[0].distance = data.route.distance;
                                                }


                                            }
                                        });
                                        return vm2.resverArrs[o].distance;
                                    } else if (this.resverArrs.length >= 2 && (o != this.resverArrs.length - 1)) {
                                        $.ajax({
                                            url: "https://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                            dataType: "json",
                                            method: "get",
                                            data: {
                                                "output": "json",
                                                "origin": vm2.resverArrs[o].xPosition + "," + vm2.resverArrs[o].yPosition,
                                                "destination": vm2.resverArrs[Number(o) + 1].xPosition + "," + vm2.resverArrs[Number(o) + 1].yPosition,
                                                "city": city
                                            },
                                            success: function (data) {
                                                if (data.info == "OK") {
                                                    vm2.resverArrs[o].distance = data.route.distance;
                                                }
                                            }
                                        });
                                        return vm2.resverArrs[o].distance;
                                    } else if (o == this.resverArrs.length - 1 && this.resverArrs.length == 2) {
                                        $.ajax({
                                            url: "https://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                            dataType: "json",
                                            method: "get",
                                            data: {
                                                "output": "json",
                                                "origin": vm2.resverArrs[vm2.resverArrs.length - 2].xPosition + "," + vm2.resverArrs[this.resverArrs.length - 2].yPosition,
                                                "destination": vm2.resverArrs[Number(o)].xPosition + "," + vm2.resverArrs[Number(o)].yPosition,
                                                "city": city
                                            },
                                            success: function (data) {
                                                if (data.info == "OK") {
                                                    vm2.resverArrs[vm2.resverArrs.length - 2].distance = data.route.distance;
                                                }

                                            }
                                        });
                                    }

                                }
                            }


                        }
                    });
                    /*查看站点*/
                    var vm3 = new Vue({
                        el: "#app3",
                        data: {
                            arrs: [],
                            resverArrs: [],
                            startTime: '',
                            returnTime: ''
                        },
                        computed: {
                            calDistance(o) {
                                return function (o) {
                                    if (o == 0 && this.arrs.length > 1) {
                                        $.ajax({
                                            url: "https://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                            dataType: "json",
                                            method: "get",
                                            data: {
                                                "output": "json",
                                                "origin": vm3.arrs[0].xPosition + "," + vm3.arrs[0].yPosition,
                                                "destination": vm3.arrs[1].xPosition + "," + vm3.arrs[1].yPosition,
                                                "city": city
                                            },
                                            success: function (data) {
                                                if (data.info == "OK") {
                                                    vm3.arrs[0].distance = data.route.distance;
                                                }
                                            }
                                        });
                                        return vm3.arrs[o].distance;
                                    } else if (this.arrs.length >= 2 && (o != this.arrs.length - 1)) {
                                        $.ajax({
                                            url: "https://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                            dataType: "json",
                                            method: "get",
                                            data: {
                                                "output": "json",
                                                "origin": vm3.arrs[o].xPosition + "," + vm3.arrs[o].yPosition,
                                                "destination": vm3.arrs[Number(o) + 1].xPosition + "," + vm3.arrs[Number(o) + 1].yPosition,
                                                "city": city
                                            },
                                            success: function (data) {
                                                if (data.info == "OK") {
                                                    vm3.arrs[o].distance = data.route.distance;
                                                }
                                            }
                                        });
                                        return vm3.arrs[o].distance;
                                    } else if (o == this.arrs.length - 1) {
                                        $.ajax({
                                            url: "https://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                            dataType: "json",
                                            method: "get",
                                            data: {
                                                "output": "json",
                                                "origin": vm3.arrs[vm3.arrs.length - 2].xPosition + "," + vm3.arrs[this.arrs.length - 2].yPosition,
                                                "destination": vm3.arrs[Number(o)].xPosition + "," + vm3.arrs[Number(o)].yPosition,
                                                "city": city
                                            },
                                            success: function (data) {
                                                if (data.info == "OK") {
                                                    vm3.arrs[vm3.arrs.length - 2].distance = data.route.distance;
                                                }
                                            }
                                        });
                                    }

                                }
                            },
                            calDistanceResver(o) {
                                return function (o) {
                                    if (o == 0 && this.resverArrs.length > 1) {
                                        $.ajax({
                                            url: "https://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                            dataType: "json",
                                            method: "get",
                                            data: {
                                                "output": "json",
                                                "origin": vm3.resverArrs[0].xPosition + "," + vm3.resverArrs[0].yPosition,
                                                "destination": vm3.resverArrs[1].xPosition + "," + vm3.resverArrs[1].yPosition,
                                                "city": city
                                            },
                                            success: function (data) {
                                                if (data.info == "OK") {
                                                    vm3.resverArrs[0].distance = data.route.distance;
                                                }


                                            }
                                        });
                                        return vm3.resverArrs[o].distance;
                                    } else if (this.resverArrs.length >= 2 && (o != this.resverArrs.length - 1)) {
                                        $.ajax({
                                            url: "https://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                            dataType: "json",
                                            method: "get",
                                            data: {
                                                "output": "json",
                                                "origin": vm3.resverArrs[o].xPosition + "," + vm3.resverArrs[o].yPosition,
                                                "destination": vm3.resverArrs[Number(o) + 1].xPosition + "," + vm3.resverArrs[Number(o) + 1].yPosition,
                                                "city": city
                                            },
                                            success: function (data) {
                                                if (data.info == "OK") {
                                                    vm3.resverArrs[o].distance = data.route.distance;
                                                }
                                            }
                                        });
                                        return vm3.resverArrs[o].distance;
                                    } else if (o == this.resverArrs.length - 1 && (this.resverArrs.length - 1) >= 2) {
                                        $.ajax({
                                            url: "https://restapi.amap.com/v3/direction/transit/integrated?key=c738d2680f189e057f7d5885f53e014c",
                                            dataType: "json",
                                            method: "get",
                                            data: {
                                                "output": "json",
                                                "origin": vm3.resverArrs[vm3.resverArrs.length - 2].xPosition + "," + vm3.resverArrs[this.resverArrs.length - 2].yPosition,
                                                "destination": vm3.resverArrs[Number(o)].xPosition + "," + vm3.resverArrs[Number(o)].yPosition,
                                                "city": city
                                            },
                                            success: function (data) {
                                                if (data.info == "OK") {
                                                    vm3.resverArrs[vm3.resverArrs.length - 2].distance = data.route.distance;
                                                }

                                            }
                                        });
                                    }

                                }
                            }


                        }
                    });

                    function reverseArr(arr) {
                        var a = [];
                        var b = [];
                        for (let i = 0; i < arr.length; i++) {
                            b.push({
                                name: arr[i].name,
                                title: arr[i].title,
                                xPosition: arr[i].xPosition,
                                yPosition: arr[i].yPosition,
                                distance: arr[i].distance
                            })
                        }
                        for (var i = b.length - 1; i >= 0; i--) {
                            if (i >= 1) {
                                b[i].distance = b[i - 1].distance
                                a.push(b[i]);
                            } else {
                                b[i].distance = ''
                                a.push(b[i])
                            }


                        }
                        return a;
                    }

                    function productionResvese(direction) {
                        if ("edit") {
                            vm2.resverArrs = [];
                            vm2.resverArrs = reverseArr(vm2.arrs);
                        } else {
                            vm.resverArrs = [];
                            vm.resverArrs = reverseArr(vm.arrs);
                        }

                    }

                    function isRealNum(val) {
                        // isNaN()函数 把空串 空格 以及NUll 按照0来处理 所以先去除，


                        if (val === "" || val == null) {
                            return false;
                        }
                        if (!isNaN(val)) {
                            return true;
                        } else {
                            return false;
                        }
                    }
                </script>


            </div></body>

</html>
