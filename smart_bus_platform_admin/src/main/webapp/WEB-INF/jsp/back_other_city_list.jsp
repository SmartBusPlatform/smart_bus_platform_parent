<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>城市配置</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/xadminR.css">
<!--    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.5.1.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/xadmin.js"></script>
    <script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.15&key=01c4bad1d55c4b802d04ee5e62657af1&plugin=AMap.StationSearch&plugin=AMap.Driving"></script>
    <link rel="stylesheet" href="https://cache.amap.com/lbs/static/main1119.css"/>
    <link rel="stylesheet" href="https://a.amap.com/jsapi_demos/static/demo-center/css/demo-center.css"/>
    <script type="text/javascript" src="http://webapi.amap.com/demos/js/liteToolbar.js"></script>
    <style type="text/css">
        .layui-unselect dl { max-height:200px; }
        .queryDiv{
            margin-top: 20px;
            margin-left: 5%;
        }
        .map{
            width: 90%;
            height: 80%;
            margin-top: 7%;
        }
        .layui-form-label{
            width: 85px;
        }
    </style>
</head>

<body class="">
<div class="x-nav">
<%--      <span class="layui-breadcrumb">--%>
<%--        <a href="">首页</a>--%>
<%--        <a href="">演示</a>--%>
<%--        <a>--%>
<%--          <cite>导航元素</cite></a>--%>
<%--      </span>--%>
<%--    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">--%>
<%--        <i class="layui-icon" style="line-height:30px">ဂ</i></a>--%>
</div>
<script id="index" type="text/html">
    {{d.LAY_TABLE_INDEX+1}}
</script>
<div class="x-body">
    <%--查看地图--%>
    <div class="site-text layui-row" hidden id="findMap">
        <div class="layui-row">
            <div class="queryDiv layui-col-lg-offset1" hidden>
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

        </div>
        <div class="map" id="container"  ></div>

    </div>
        <div class="layui-fluid">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-body ">
                            <form class="layui-form layui-col-space5" method="post" action="">
                                <div class="layui-inline">
                                    <label class="layui-form-label">省：</label>
                                    <div class="layui-input-inline">
                                        <select name="provinceName" id="provinceName">
                                            <option value="">请选择</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="layui-inline">
                                    <label class="layui-form-label">市：</label>
                                    <div class="layui-input-inline">
                                        <input type="text" name="cityName"  placeholder="请输入城市名称" autocomplete="off" class="layui-input">
                                    </div>
                                </div>
                                <div class="layui-inline">
                                    <div class="layui-btn-container" style="margin-left: 60px">
                                        <button class="layui-btn"  lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
                                        <a class="layui-btn layui-btn-normal layui-btn-xs" id="add">新增</a>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="layui-card-body ">
                            <table id="areas_table"  lay-filter="areas-filter"></table>
                        </div>
                    </div>
                </div>
            </div>
        </div>




</div>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
        <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
        <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
    </div>
</script>
<script type="text/html" id="switchTpl">
    <!-- 这里的 checked 的状态只是演示 -->
<!--    <input type="checkbox" name="sex" value="{{d.id}}" lay-skin="switch" lay-text="女|男" lay-filter="sexDemo" {{ d.id == 10003 ? 'checked' : '' }}>-->
</script>
<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });


    });
</script>
<script type="text/html" id="city_tablebar">
    <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
</script>


<div class="site-text layui-row" hidden id="addForm"  >
    <form class="layui-form layui-col-sm-offset1 layui-col-sm9" style="margin-top: 100px"  method="post" lay-filter="example">
        <div class="layui-form-item">
            <label class="layui-form-label ">城市名称:</label>
            <div class="layui-input-block">
                <input type="text" id="add_cityName" name="cityName" lay-verify="cityName" autocomplete="off" placeholder="请输入城市名称" class="layui-input">

            </div>
        </div>
        <div class="layui-form-item">

                <label class="layui-form-label">省:</label>
            <div class="layui-input-block">
                <select name="provinceName" id="add_provinceName">
                    <option value="">请选择</option>
                </select>
            </div>
        </div>
    </form>
</div>

<div class="site-text" style="margin: 12%; display: none" id="editForm"  >
    <form class="layui-form" id="" method="post" lay-filter="example">
        <div class="layui-form-item">
            <label class="layui-form-label">城市名称:</label>
            <div class="layui-input-block">
                <input type="text" id="upd_cityName" name="upd_cityName" lay-verify="cityName" autocomplete="off" placeholder="请输入城市名称" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">

            <label class="layui-form-label">省:</label>
            <div class="layui-input-block">
                <select name="upd_provinceName" id="upd_provinceName">
                    <option value="">请选择</option>
                </select>
            </div>


        </div>

    </form>
</div>

<div id="siteForm" hidden class="row">
    <table id="citySite_table" class="layui-col-sm8 layui-col-lg-offset4"  lay-filter="citySite_table-filter"></table>

</div>
<script>
var myMap;
var markers = [];
        layui.use(['table','form'], function(){
            var table = layui.table;
            var form = layui.form;
            table.render({
                elem: '#areas_table',
                url:'${pageContext.request.contextPath}/admin/areas/getAreasByPage',
                cols: [[
                    {type:'checkbox'}
                    ,{field: 'provinceName', title: '省',sort: true,  }
                    ,{field: 'cityName', title: '城市名称' }
                    ,{field: 'provinceId',title:'省份id' ,hide:'true'}
                    ,{field: 'cityId',title:'城市id' ,hide:'true'}
                    ,{field: 'siteNum', title: '站点数',event: 'siteNum' }
                    ,{field: 'lineNum', title: '线路数',event: 'lineNum' }
                    ,{field: '',title:'操作' ,templet:'#city_tablebar'}
                ]],
                page:true,
                limit:5,
                limits:[5,10,15,20,25],
                method:'post',
                request:{
                    pageName:'curPage',
                    limitName:'pageSize',
                },
                response:{
                    statusName:'status',
                    statusCode:200,
                },
                parseData: function(res){ //res 即为原始返回的数据
                    return {
                        "status":res.status,
                        "count": res.data.totalRecord, //解析数据长度
                        "data": res.data.list,
                    };
                }
            });
            //获取省份
            getProvinceName();

            //监听提交 lay-filter="search"
            form.on('submit(search)', function(data){
                var formData = data.field;
                var cityName = formData.cityName,
                    provinceName=formData.provinceName
                //执行重载
                table.reload('areas_table', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , where: {//这里传参  向后台
                        cityName: cityName,
                        provinceName:provinceName,
                        //可传多个参数到后台...  ，分隔
                    }
                    , url:'${pageContext.request.contextPath}/admin/areas/getAreasByPage'//后台做模糊搜索接口路径
                    , method: 'post'
                });
                return false;//false：阻止表单跳转  true：表单跳转
            });
            //城市编辑
            table.on('tool(areas-filter)', function (obj) {
                var event = obj.event;
                alert(event)
                if ("edit" === event) {
                    var item = obj.data;
                    layer.open({
                        title : '修改城市信息',
                        type : 1,
                        area: ['35%', '70%'],
                        offset:'auto',
                        maxmin : true,
                        shadeClose : true,
                        content : $('#editForm'),
                        btn: ['确定', '取消'],
                        shade: [0.8, '#393D49'],
                        success : function(layero, index) {
                            $("#upd_cityName").val("");
                            $("#upd_provinceName").empty();
                            $("#upd_cityName").val(item.cityName);

                            getupdProvinceName(item.provinceId);

                        }
                        ,yes:function(num,layero){
                            layer.confirm('确认是否修改信息?', {icon: 3, title:'提示'}, function(index){
                                if($("#upd_cityName").val().trim().length>0){
                                    if($("#upd_provinceName").val().trim().length>0){
                                        $.ajax({
                                            type: "post",
                                            url: "${pageContext.request.contextPath}/admin/areas/updAreaById",
                                            data: {"cityName":$("#upd_cityName").val(),"provinceId":$("#upd_provinceName").val(),"cityId":item.cityId},
                                            dataType: "json",
                                            success: function(data){
                                                if(data.status==200){
                                                    layer.msg(data.msg);
                                                    obj.update({
                                                        cityName:$("#upd_cityName").val(),
                                                        provinceId:$("#upd_provinceName").val()
                                                    });
                                                    layer.close(index)
                                                }else{
                                                    layer.msg(data.msg);
                                                }
                                            }
                                        });
                                    }else{
                                        layer.msg('省份的值不能为空', {
                                            btn: ['明白了',]
                                        });
                                    }
                                }else{
                                    layer.msg('城市名称不能为空', {
                                        btn: ['明白了']
                                    });
                                }


                            });
                        }

                    });

                }else if("delete"===event) {
                    var item = obj.data;
                    layer.confirm('确认是否删除改城市信息?', function(index) {
                        $.ajax({
                            url:"${pageContext.request.contextPath}/admin/areas/updAreaById",
                            method:"post",
                            dataType:"json",
                            traditional:true,
                            data:{"cityId":item.cityId,"stateId":2},
                            success:function (data) {
                                if(data.status==200){
                                    layer.msg(data.msg,{
                                        time: 1000
                                    },function () {
                                        window.location.reload();
                                    });
                                }else{
                                    layer.msg(data.msg);
                                }
                            },
                            error:function () {
                                layer.msg("网络繁忙，请稍候重试");
                            }
                        });
                        layer.close(index)
                    });
                }else if("siteNum"===event){
                    $(".queryDiv").css("display","none");
                    <%--layer.open({--%>
                    <%--    title : '修改线路信息',--%>
                    <%--    type : 1,--%>
                    <%--    area: ['50%', '70%'],--%>
                    <%--    offset:'auto',--%>
                    <%--    maxmin : true,--%>
                    <%--    shadeClose : false,--%>
                    <%--    content : $('#siteForm'),--%>
                    <%--    btn: ['返回'],--%>
                    <%--    shade: [0.8, '#393D49'],--%>
                    <%--    success : function(layero, index) {--%>
                    <%--        table.render({--%>
                    <%--            elem: '#citySite_table',--%>
                    <%--            url:'${pageContext.request.contextPath}/citySite/getCitySiteByPage',--%>
                    <%--            where:{--%>
                    <%--                "cityId":obj.data.cityId--%>
                    <%--            },--%>
                    <%--            cols: [[--%>
                    <%--                {type:'checkbox'},--%>
                    <%--                {field: 'sorId',title:'序号',templet: '#index'},--%>
                    <%--                {field: 'id',title:'id',hide:'true'}--%>
                    <%--                ,{field: 'name', title: '站点名称'  }--%>
                    <%--                ,{field: 'xPosition', title: 'x坐标' }--%>
                    <%--                ,{field: 'yPosition',title:'y坐标' }--%>
                    <%--                ,{field: 'throughLine',title:'经过线路'}--%>
                    <%--            ]],--%>
                    <%--            method:'post',--%>
                    <%--            request:{--%>
                    <%--                pageName:'curPage',--%>
                    <%--                limitName:'pageSize',--%>
                    <%--            },--%>
                    <%--            response:{--%>
                    <%--                statusName:'status',--%>
                    <%--                statusCode:200,--%>
                    <%--            },--%>
                    <%--            parseData: function(res){ //res 即为原始返回的数据--%>
                    <%--                return {--%>
                    <%--                    "status":res.status,--%>
                    <%--                    "count": res.data.totalRecord, //解析数据长度--%>
                    <%--                    "data": res.data.list,--%>
                    <%--                };--%>
                    <%--            }--%>
                    <%--        });--%>
                    <%--    }});--%>

                    findSite(obj.data.cityId,obj.data.cityName)
                }else if("lineNum"===event){

                    $(".queryDiv").css("display","block");
                    let map = new AMap.Map("container", {
                        // center: [116.397428, 39.90923],//地图中心点
                        zoom: 13 //地图显示的缩放级别
                    });
                    if(myMap!=undefined){
                        myMap.clear();
                    }

                    myMap=map;

                    layer.open({
                        title: '查看线路',
                        type: 1,
                        area: ['80%', '80%'],
                        offset: 'auto',
                        maxmin: true,
                        shadeClose: false,
                        content: $('#findMap'),
                        btn: ['返回'],
                        shade: [0.8, '#393D49'],
                        success: function (layero, index) {
                            map.setCity(obj.data.cityName);
                            queryLine(obj.data.cityId);

                        },yes:function(num,layero){
                            map.clearMap();
                            myMap.clearMap();
                            markers=[];
                            layer.close(num);
                        },btn2: function(index, layero){
                            map.clearMap();
                            myMap.clearMap();
                            markers=[];
                        }
                        ,cancel:function () {
                            map.clearMap();
                            myMap.clearMap();
                            markers=[];
                        }
                    });
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
                markers=[];
                myMap.clearMap();
                $.ajax({
                    type: "post",
                    url: "${pageContext.request.contextPath}/admin/lineSite/getLineSiteByLineId",
                    dataType: "json",
                    data : {"lineId":data.field.lineId},
                    success:function (data) {
                        if(data.start.length>2){
                            //定义导航
                            var driving = new AMap.Driving({
                                map: myMap,
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
                                            myMap.add(marker);
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


        //新增城市
        $("#add").click(function () {
            layer.open({
                title: '新增城市',
                type: 1,
                area: ['35%', '70%'],
                offset: 'auto',
                maxmin: true,
                shadeClose: true,
                content: $('#addForm'),
                btn: ['确定', '取消'],
                shade: [0.8, '#393D49'],
                success: function (layero, index) {
                    $("#add_cityName").val("");
                    $("#add_provinceName").empty();
                    getAddProvinceName()
                },
                yes:function (num,layero) {
                    layer.confirm('确认是否新增信息?', {icon: 3, title:'提示'}, function(index){
                        if($("#add_cityName").val().trim().length>0){
                            if($("#add_provinceName").val().trim().length>0){
                                $.ajax({
                                    type: "post",
                                    url: "${pageContext.request.contextPath}/admin/areas/addAreas",
                                    data: {"cityName":$("#add_cityName").val(),"provinceId":$("#add_provinceName").val()},
                                    dataType: "json",
                                    success: function(data){
                                        if(data.status==200){
                                            layer.msg(data.msg,{
                                                time:1000
                                            },function () {
                                                window.location.reload();
                                            });

                                        }else{
                                            layer.msg(data.msg);
                                        }
                                    }
                                });
                            }else{
                                layer.msg('省份的值不能为空', {
                                    btn: ['明白了',]
                                });
                            }
                        }else{
                            layer.msg('城市名称不能为空', {
                                btn: ['明白了']
                            });
                        }


                    });
                }

            });
        })
        function getProvinceName() {
            $.ajax({
                url:'${pageContext.request.contextPath}/admin/areas/getProvinceNameAll',
                method:'post',
                dataType:'json',
                data:{"type":1},
                success:function(data){
                    if(data.status==200){
                        for(var i =0;i<data.data.length;i++){
                            $("#provinceName").append("<option  value=\""+data.data[i].name+"\">"+data.data[i].name+"</option>");
                        }
                        //重新渲染
                        layui.form.render("select");
                    }else{
                        layer.msg(data.msg);
                    }
                }
            });
        }

        function getAddProvinceName() {
            $.ajax({
                url:'${pageContext.request.contextPath}/admin/areas/getProvinceNameAll',
                method:'post',
                dataType:'json',
                data:{"type":1},
                success:function(data){
                    if(data.status==200){
                        for(var i =0;i<data.data.length;i++){
                            $("#add_provinceName").append("<option  value=\""+data.data[i].id+"\">"+data.data[i].name+"</option>");
                        }

                        //重新渲染
                        layui.form.render("select");
                    }else{
                        layer.msg(data.msg);
                    }
                }
            });
        }

        function getupdProvinceName(provinceId) {
            $.ajax({
                url:'${pageContext.request.contextPath}/admin/areas/getProvinceNameAll',
                method:'post',
                dataType:'json',
                data:{"type":1},
                success:function(data){
                    if(data.status==200){
                        for(var i =0;i<data.data.length;i++){
                            $("#upd_provinceName").append("<option  value=\""+data.data[i].id+"\">"+data.data[i].name+"</option>");
                        }
                        //重新渲染
                        layui.form.render("select");
                        console.log(provinceId)
                        let currency = 'dd[lay-value='+provinceId+']';
                        $("#upd_provinceName").siblings("div.layui-form-select").find('dl').find(currency).click()
                    }else{
                        layer.msg(data.msg);
                    }
                }
            });
        }
        //地图查看
        function findSite(cityId,city) {
            let map;
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/admin/citySite/getCitySiteAllByCityId",
                data: {"cityId":cityId},
                dataType: "json",
                success: function(data){
                    map = new AMap.Map("container", {
                        resizeEnable: true,
                        // mapStyle:'amap://styles/f0c43041630ebe2835503272216aa80d',
                        features: ['bg', 'road', 'building', 'point'],
                        zoom:15,
                    });
                    //点击事件
                    map.on('click', function(e) {
                    });
                    layer.open({
                        title: '查看站点',
                        type: 1,
                        area: ['80%', '80%'],
                        offset: 'auto',
                        maxmin: true,
                        shadeClose: false,
                        content: $('#findMap'),
                        btn: ['返回'],
                        shade: [0.8, '#393D49'],
                        success: function (layero, index) {
                            AMap.plugin(['AMap.ToolBar','AMap.Scale'],
                                function(){
                                    map.addControl(new AMap.ToolBar());
                                    map.addControl(new AMap.Scale());
                                    // map.addControl(new AMap.DistrictSearch())
                                });
                            AMap.service(["AMap.PlaceSearch",'AMap.DistrictSearch'], function () {
                                //构造地点查询类
                                var placeSearch = new AMap.PlaceSearch({
                                    showCover:false,
                                    pageSize: 0, // 单页显示结果条数
                                    pageIndex: 1, // 页码
                                    city: city, // 兴趣点城市
                                    citylimit: true,  //是否强制限制在设置的城市内搜索
                                    map: map, // 展现结果的地图实例
                                    // autoFitView: true, // 是否自动调整地图视野使绘制的 Marker点都处于视口的可见范围
                                });
                                var districtSearch =  new AMap.DistrictSearch({
                                    extensions:'all',
                                    subdistrict:0,
                                })
                                districtSearch.search(city,function(status,result) {
                                    map.setCenter([result.districtList[0].center.lng,result.districtList[0].center.lat])
                                    addMarker(map,data)
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
                            });
                        }

                        ,yes:function(num,layero){

                            layer.close(num);
                            map.destroy();
                        },btn2: function(index, layero){
                            //按钮【按钮二】的回调
                            map.destroy();
                            // $("#add_startStation").val("");
                            // $("#add_reStation").val("");
                        }
                        ,cancel:function () {
                            map.destroy();
                            // $("#add_startStation").val("");
                            // $("#add_reStation").val("");
                        }});
                }
            });
        }
        // 实例化点标记
        function addMarker(map,markers) {
            let marker;
            let icon = new AMap.Icon({
                image: 'http://vdata.amap.com/icons/b18/1/2.png',
                size: new AMap.Size(24, 24)
            });
            markers.forEach(function(marker) {
                let ma=new AMap.Marker({
                    map: map,
                    position: [marker.xPosition, marker.yPosition],
                    offset: new AMap.Pixel(-13, -30)
                });
                ma.setLabel({
                    // offset: new AMap.Pixel(10, 10),  //设置文本标注偏移量
                    content: marker.name, //设置文本标注内容
                    direction: 'right' //设置文本标注方位
                });
            });
        }


        //地图查看线路
        function findLine() {

        }

</script>

</body>

</html>
