<%--
  Created by IntelliJ IDEA.
  User: 12614
  Date: 2020/7/30
  Time: 14:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.1</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/xadminR.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.5.1.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/lib/layui/layuiR.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/xadmin.js"></script>
    <style type="text/css">
        .layui-unselect dl { max-height:200px; }

        /*修改源码点击选中变色*/
        .custom-tree-item-clicked {
            color: #ff5722
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
            overflow-x: hidden;
        }
        .map{
            margin-top: 50px;
            width: 90%;
            height: 80%;
            margin-left: 5%;
        }
        .queryDiv{
            margin-top: 20px;
            margin-left: 5%;
        }
        .btnWidth{
            margin-top: 1px;
            width: 100px;
        }
    </style>
</head>

<body style="background-color: #F0F0F0">
<div class="x-body">
    <%--省市树状--%>
    <div class="tree">
        <ul id="citySite_tree" lay-filter="citySite_tree-filter"></ul>
    </div>
    <%--右侧列表--%>
    <div class="right">
        <div class="layui-row">
            <div class="queryDiv layui-col-lg-offset1">
                <form class="layui-form layui-col-space5" lay-filter="lineForm">
                    <div class="layui-inline">
                        <h3 class="layui-inline">线路：</h3>
                        <div class="layui-input-inline">
                            <select name="lineId" id="selectLine">
                                <option value="">请选择线路</option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-inline layui-col-lg-offset1">
                        <button class="layui-btn btnWidth layui-btn-disabled" lay-submit lay-filter="query" id="queryBtn" disabled>查询</button>
                    </div>
                </form>
            </div>
            <div id="container" class="map"></div>
        </div>
    </div>
</div>
<script src="https://webapi.amap.com/maps?v=1.4.15&key=73c89fb1d43ddc8e155990099cecbc12&plugin=AMap.Driving"></script>
<script>
    //当前点击省份
    var province;
    var provinceId;
    //当前点击城市
    var city;
    var cityId;
    var map = new AMap.Map("container", {
        center: [116.397428, 39.90923],//地图中心点
        zoom: 13 //地图显示的缩放级别
    });

    var markers = [];
    var lineArr = [];

    layui.use(['tree','form','layer'], function(){
        var tree = layui.tree;
        var form = layui.form;
        var layer = layui.layer;

        //查询省份和省份下的城市
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/admin/areas/getAreaTree",
            dataType: "json",
            success:function (data) {
                //渲染
                var inst1 = tree.render({
                    elem: '#citySite_tree'  //绑定元素
                    ,data: data.data
                    // ,showCheckbox: true
                    ,click:function (obj) {
                        if(obj.data.children==undefined){
                            city=obj.data.title;
                            cityId=obj.data.id;
                            map.setCity(obj.data.title);
                            map.clearMap();
                            queryLine(cityId);
                        }else{
                            province=obj.data.title;
                            provinceId=obj.data.id;
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

        //根据城市查线路
        function queryLine(cityId){
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/admin/line/getLineByCityId",
                dataType: "json",
                data : {"cityId":cityId},
                success:function (data) {
                    if(data.length>0){
                        $("#selectLine").empty();
                        $.each(data,function (index,item) {
                            $("#selectLine").append("<option value='"+item.id+"'>"+item.name+"</option>");
                        })
                        form.val("lineForm", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
                            "lineId": data[0].id
                        });
                        form.render('select');
                        $("#queryBtn").removeClass("layui-btn-disabled")
                        $("#queryBtn").removeAttr("disabled");
                    }else{
                        $("#selectLine").empty();
                        $("#selectLine").append("<option value=''>该城市暂无线路</option>");
                        form.render('select');
                        $("#queryBtn").addClass("layui-btn-disabled");
                        $("#queryBtn").attr("disabled","disabled");
                    }
                },
                error : function () {
                    layer.msg("服务器出错了");
                }
            });
        }
        //查询按钮
        form.on('submit(query)', function(data){
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/admin/lineSite/getLineSiteByLineId",
                dataType: "json",
                data : {"lineId":data.field.lineId},
                success:function (data) {
                    map.clearMap();
                    markers=[];
                   if(data.start.length>2){

                       //定义导航
                       var driving = new AMap.Driving({
                           map: map,
                           hideMarkers : true
                       });
                       //循环获取站点数组
                       $.each(data.start,function (index,item) {
                           markers.push([item.xPosition,item.yPosition,item.name]);
                       });
                       var path = new Array();
                       for (var i=0; i<markers.length;i++){
                           if(i!=0&&i!=markers.length-1){
                               path.push(new AMap.LngLat(markers[i][0],markers[i][1]));
                           }
                       }
                       driving.search(new AMap.LngLat(markers[0][0],markers[0][1]),new AMap.LngLat(markers[markers.length-1][0],markers[markers.length-1][1]),
                           {waypoints:path}
                           ,function(status, result) {
                                //成功就把所有站点显示出来
                               if (status === 'complete') {
                                   //设置maker图标
                                   var icon = new AMap.Icon({
                                       image: '/static/images/map_bus.png',  // Icon的图像
                                   });
                                   $.each(markers,function (index,item) {
                                       var marker = new AMap.Marker({
                                           position: [item[0],item[1]], // 基点位置
                                           icon : icon,
                                       });
                                       map.add(marker);
                                       if(index==0){
                                           marker.setLabel({
                                               content:item[2]+"(始发站)",
                                               direction: 'right'
                                           })
                                       }else if(index==markers.length-1){
                                           marker.setLabel({
                                               content:item[2]+"(终点站)",
                                               direction: 'right'
                                           })
                                       }else{
                                           marker.setLabel({
                                               content:item[2],
                                               direction: 'right'
                                           })
                                       }
                                   });

                               } else {
                                   layer.msg('获取数据失败')
                               }
                           }
                       );
                   }else{
                       layer.msg("该线路站点尚未配置齐全,无法显示");
                   }
                },
                error : function () {
                    layer.msg("服务器出错了");
                }
            });
            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });
    });
</script>
</body>

</html>