<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>城市站点配置</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/xadminR.css">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
<!--    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.5.1.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/lib/layui/layuiR.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/xadmin.js"></script>
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
        /*.info{*/
        /*    position: relative;*/
        /*    min-width: 0;*/
        /*    font-size: 8px;*/
        /*    width: 50px;*/
        /*    height: 10px;*/
        /*}*/

    </style>
</head>

<body class="">
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">演示</a>
        <a>
          <cite>导航元素</cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <%--省市树状--%>
    <div style="float: left;width: 18%; height:600px;overflow: scroll;" >
        <ul id="citySite_tree" lay-filter="citySite_tree-filter" style=" "></ul>
    </div>
    <%--右侧列表--%>
    <div style="float: left;margin:  50px 3%;width: 70%">
        <h1>城市站点配置</h1>
        <div class="layui-row">
            <form class="layui-form layui-col-md12 x-so" method="post">

                站点名称:<input type="text" name="siteName"  placeholder="请输入站点名称" autocomplete="off" class="layui-input">

                <button class="layui-btn" type="button"  lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
                <a class="layui-btn layui-btn-normal layui-btn-xs" id="add">新增</a>
            </form>

        </div>
        <table id="citySite_table"  lay-filter="citySite-filter" ></table>
    </div>
</div>
<%--新增站点--%>
<div class="site-text layui-row" hidden id="addForm"  >
    <form class="layui-form layui-col-sm-offset1 layui-col-sm9" style="margin-top: 100px"  method="post" lay-filter="example">
        <div class="layui-form-item">
            <label class="layui-form-label">省:</label>
            <div class="layui-input-block">
                <input type="text" id="add_provinceName" name="cityName" lay-verify="cityName" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">

            <label class="layui-form-label">城市名称:</label>
            <div class="layui-input-block">
                <input type="text" id="add_cityName" name="add_cityName" lay-verify="cityName" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">

            <label class="layui-form-label">站点名称:</label>
            <div class="layui-input-block">
                <input type="text" id="add_siteName" name="add_siteName" lay-verify="cityName" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">

            <label class="layui-form-label">x坐标:</label>
            <div class="layui-input-block">
                <input type="text" id="add_xPosition" name="add_xPosition" lay-verify="cityName" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">

            <label class="layui-form-label">y坐标:</label>
            <div class="layui-input-block">
                <input type="text" id="add_yPosition" name="add_yPosition" lay-verify="cityName" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" type="button" id="mapSelection">地图选点</button>
            </div>

        </div>

    </form>
</div>
<%--编辑站点--%>
<div class="site-text layui-row" hidden id="editForm"  >
    <form class="layui-form layui-col-sm-offset1 layui-col-sm9" style="margin-top: 100px"  method="post" lay-filter="example">
        <div class="layui-form-item">
            <label class="layui-form-label">省:</label>
            <div class="layui-input-block">
                <input type="text" id="edit_provinceName" name="edit_provinceName"  autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">

            <label class="layui-form-label">城市名称:</label>
            <div class="layui-input-block">
                <input type="text" id="edit_cityName" name="edit_cityName" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">

            <label class="layui-form-label">站点名称:</label>
            <div class="layui-input-block">
                <input type="text" id="edit_siteName" name="edit_siteName"  autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">

            <label class="layui-form-label">x坐标:</label>
            <div class="layui-input-block">
                <input type="text" id="edit_xPosition" name="edit_xPosition"  autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">

            <label class="layui-form-label">y坐标:</label>
            <div class="layui-input-block">
                <input type="text" id="edit_yPosition" name="edit_yPosition"  autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" type="button" id="mapSelection2">地图选点</button>
            </div>

        </div>

    </form>
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
    <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="find">地图查看</a>
</script>
<script>
    //当前点击省份
    var province;
    var provinceId;
    var selprovince;
    var selprovinceId;
    // var map2 = new AMap.Map("container2", {
    //     resizeEnable: true
    // });
    //当前点击城市
    var city;
    var cityId;
    var table;
    layui.use(['table','tree','form'], function(){
        var tree = layui.tree;
         table = layui.table;
       var form = layui.form;
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
                            province=selprovince;
                            provinceId=selprovinceId;
                            table.render({
                                elem: '#citySite_table',
                                url:'${pageContext.request.contextPath}/admin/citySite/getCitySiteByPage',
                                where:{
                                    "cityId":obj.data.id
                                },
                                cols: [[
                                    {type:'checkbox'},
                                    {field: 'sorId',title:'序号',templet: '#index'},
                                    {field: 'id',title:'id',hide:'true'}
                                    ,{field: 'name', title: '站点名称',sort: true,  }
                                    ,{field: 'xPosition', title: 'x坐标' }
                                    ,{field: 'yPosition',title:'y坐标' }
                                    ,{field: 'throughLine',title:'经过线路'}
                                    ,{field: '',title:'操作' ,templet:'#cityLine_tablebar',minWidth:200}
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

                        }else{
                            selprovince=obj.data.title;
                            selprovinceId=obj.data.id
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
        table.on('tool(citySite-filter)', function (obj) {
            var event = obj.event;
            alert(event)
            if ("edit" === event) {
                var item = obj.data;
                layer.open({
                    title : '修改站点信息',
                    type : 1,
                    area: ['35%', '70%'],
                    offset:'auto',
                    maxmin : true,
                    shadeClose : false,
                    content : $('#editForm'),
                    btn: ['确定', '取消'],
                    shade: [0.8, '#393D49'],
                    success : function(layero, index) {
                        $("#edit_cityName").val("");
                        $("#edit_provinceName").val("");
                        $("#edit_cityName").val(city);
                        $("#edit_cityName").attr("cityId",cityId);
                        $("#edit_provinceName").val(province);
                        $("#edit_provinceName").attr("provinceId",provinceId)
                        $("#edit_siteName").val(item.name);
                        $("#edit_xPosition").val(item.xPosition);
                        $("#edit_yPosition").val(item.yPosition);
                    }
                    ,yes:function(num,layero){
                        layer.confirm('确认是否修改信息?', {icon: 3, title:'提示'}, function(index){
                            if($("#edit_cityName").val().trim().length>0){
                                if($("#edit_provinceName").val().trim().length>0){
                                    if($("#edit_siteName").val().trim().length>0){
                                        if(checkLong($("#edit_xPosition").val().trim())){
                                            if(checkLong($("#edit_yPosition").val().trim())){
                                                $.ajax({
                                                    type: "post",
                                                    url: "${pageContext.request.contextPath}/admin/citySite/updCitySiteByCityId",
                                                    data: {"cityId":cityId,"name":$("#edit_siteName").val(),"xPosition":$("#edit_xPosition").val().trim(),"yPosition":$("#edit_yPosition").val().trim(),"id":item.id},
                                                    dataType: "json",
                                                    success: function(data){
                                                        if(data.status==200){
                                                            layer.msg(data.msg,{
                                                                time:1000
                                                            },function () {
                                                                obj.update({
                                                                    name:$("#edit_siteName").val(),
                                                                    xPosition: $("#edit_xPosition").val().trim(),
                                                                    yPosition: $("#edit_yPosition").val().trim(),
                                                                })
                                                                // window.location.reload();
                                                            });

                                                        }else{
                                                            layer.msg(data.msg);
                                                        }
                                                        layer.close(num)
                                                    }
                                                });
                                            }else{
                                                layer.msg('纬度整数部分为0-180,小数部分为0到6位!', {
                                                    btn: ['明白了',]
                                                });
                                            }
                                        }else{
                                            layer.msg('经度整数部分为0-180,小数部分为0到6位!', {
                                                btn: ['明白了',]
                                            });
                                        }

                                    }else{
                                        layer.msg('站点的值不能为空', {
                                            btn: ['明白了',]
                                        });
                                    }

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

            }else if("find"===event){
                let map = new AMap.Map("container", {
                    resizeEnable: true,
                    features: ['bg', 'road', 'building', 'point'],
                    center: [obj.data.xPosition,obj.data.yPosition],
                    zoom: 15
                });
                var item = obj.data;
                layer.open({
                    title: '查看站点信息',
                    type: 1,
                    area: ['35%', '50%'],
                    offset: 'auto',
                    maxmin: true,
                    shadeClose: true,
                    content: $('#findMap'),
                    btn: ['确定'],
                    shade: [0.8, '#393D49'],
                    success: function (layero, index) {
                        map.plugin(["AMap.ToolBar"], function() {
                            map.addControl(new AMap.ToolBar());
                        });
                        var marker;
                        var icon = new AMap.Icon({
                            image: 'http://vdata.amap.com/icons/b18/1/2.png',
                            size: new AMap.Size(24, 24)
                        });
                        marker = new AMap.Marker({
                            offset: new AMap.Pixel(-12, -12),
                            zIndex: 101,
                            map: map,
                            name:obj.data.name
                        });
                        marker.setLabel({
                            // offset: new AMap.Pixel(10, 10),  //设置文本标注偏移量
                            content: obj.data.name, //设置文本标注内容
                            direction: 'right' //设置文本标注方位
                        });
                        document.getElementById('tip').innerHTML="经度:"+ obj.data.xPosition+","+"纬度:"+obj.data.yPosition;
                        // AMap.service(["AMap.PlaceSearch"], function () {
                        //     //构造地点查询类
                        //     var placeSearch = new AMap.PlaceSearch({
                        //         showCover:false,
                        //         pageSize: 1, // 单页显示结果条数
                        //         pageIndex: 1, // 页码
                        //         city: city, // 兴趣点城市
                        //         citylimit: true,  //是否强制限制在设置的城市内搜索
                        //         map: map, // 展现结果的地图实例
                        //         autoFitView: true, // 是否自动调整地图视野使绘制的 Marker点都处于视口的可见范围
                        //     });
                        //     placeSearch.search(city,[obj.data.xPosition,obj.data.yPosition],() => {
                        //         // 其实这个地方是我最主要讲的，请往下看
                        //         placeSearch.render.markerList.clear() // 这个为清除搜索结果的点，不想清除注释即可
                        //     })
                            // //构造地点查询类
                            // var placeSearch = new AMap.PlaceSearch({
                            //     type: '', // 兴趣点类别
                            //     showCover:false,
                            //     // pageSize: 1, // 单页显示结果条数
                            //     // pageIndex: 1, // 页码
                            //     city: city, // 兴趣点城市
                            //     citylimit: true,  //是否强制限制在设置的城市内搜索
                            //     map: map, // 展现结果的地图实例
                            //     panel: "panel", // 结果列表将在此容器中进行展示。
                            //     // autoFitView: true // 是否自动调整地图视野使绘制的 Marker点都处于视口的可见范围
                            // });
                            //
                            // // var cpoint = [119.299506,26.075097]; //中心点坐标
                            // var cpoint = [obj.data.xPosition,obj.data.yPosition]; //中心点坐标
                            // placeSearch.searchNearBy('', cpoint, 120, function (status, result) {
                            //     console.log(result)
                            // });
                        // });
                    }
                    ,yes:function(num,layero){
                        layer.close(num)
                        map.destroy();
                    }
                    ,cancel:function () {
                        map.destroy();
                    }   });
            }
        });


        //监听提交 lay-filter="search"
        form.on('submit(search)', function(data){
            var formData = data.field;
            var name = formData.siteName
            //执行重载
            table.reload('citySite_table', {
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                , where: {//这里传参  向后台
                    name: name,
                    //可传多个参数到后台...  ，分隔
                }
                , url:'${pageContext.request.contextPath}/admin/citySite/getCitySiteByPage'//后台做模糊搜索接口路径
                , method: 'post'
            });
            return false;//false：阻止表单跳转  true：表单跳转
        });

        //



        // //渲染
        // var inst1 = tree.render({
        //     elem: '#demo'  //绑定元素
        //     ,data: [{
        //         title: '江西' //一级菜单
        //         ,children: [{
        //             title: '南昌' //二级菜单
        //             ,children: [{
        //                 title: '高新区' //三级菜单
        //                 //…… //以此类推，可无限层级
        //             }]
        //         }]
        //     },{
        //         title: '陕西' //一级菜单
        //         ,children: [{
        //             title: '西安' //二级菜单
        //         }]
        //     }]
        // });
    });


    //新增站点
    $("#add").click(function () {
        layer.open({
            title: '新增站点',
            type: 1,
            area: ['35%', '80%'],
            offset: 'auto',
            maxmin: true,
            shadeClose: true,
            content: $('#addForm'),
            btn: ['确定', '取消'],
            shade: [0.8, '#393D49'],
            success: function (layero, index) {
                $("#add_cityName").val("");
                $("#add_provinceName").val("");
                $("#add_cityName").val(city);
                $("#add_cityName").attr("cityId",cityId);
                $("#add_provinceName").val(province);
                $("#add_provinceName").attr("provinceId",provinceId);
                $("#add_siteName").val("");
                $("#add_xPosition").val("");
                $("#add_yPosition").val("")
            },
            yes:function (num,layero) {
                layer.confirm('确认是否新增信息?', {icon: 3, title:'提示'}, function(index){
                    if($("#add_cityName").val().trim().length>0){
                        if($("#add_provinceName").val().trim().length>0){
                            if($("#add_siteName").val().trim().length>0){
                                if(checkLong($("#add_xPosition").val().trim())){
                                    if(checkLong($("#add_yPosition").val().trim())){
                                        $.ajax({
                                            type: "post",
                                            url: "${pageContext.request.contextPath}/admin/citySite/addCitySite",
                                            data: {"cityId":cityId,"name":$("#add_siteName").val(),"xPosition":$("#add_xPosition").val().trim(),"yPosition":$("#add_yPosition").val().trim()},
                                            dataType: "json",
                                            success: function(data){
                                                if(data.status==200){
                                                    layer.msg(data.msg,{
                                                        time:1000
                                                    },function () {
                                                        table.reload('citySite_table');
                                                    });

                                                }else{
                                                    layer.msg(data.msg);
                                                }
                                            }
                                        });
                                        layer.close(num)
                                    }else{
                                        layer.msg('纬度整数部分为0-180,小数部分为0到6位!', {
                                            btn: ['明白了',]
                                        });
                                    }
                                }else{
                                    layer.msg('经度整数部分为0-180,小数部分为0到6位!', {
                                        btn: ['明白了',]
                                    });
                                }

                            }else{
                                layer.msg('站点的值不能为空', {
                                    btn: ['明白了',]
                                });
                            }

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

    //校验经度是否符合规范
    //校验经度x
    function checkLong(longitude){
        var longrg = /^(\-|\+)?(((\d|[1-9]\d|1[0-7]\d|0{1,3})\.\d{0,6})|(\d|[1-9]\d|1[0-7]\d|0{1,3})|180\.0{0,6}|180)$/;
        if(!longrg.test(longitude)){
            return false;
        }
        return true;
    }

    //校验纬度是否符合规范
    //纬度y
    function checkLat(latitude){
        var latreg = /^(\-|\+)?([0-8]?\d{1}\.\d{0,6}|90\.0{0,6}|[0-8]?\d{1}|90)$/;
        if(!latreg.test(latitude)){
            return '纬度整数部分为0-90,小数部分为0到6位!';
        }
        return true;
    }

    //鼠标点击，获取经纬度坐标
       function getLnglat(e) {
           mapObj.clearMap();
           var x = e.lnglat.getLng();
           var y = e.lnglat.getLat();
           // document.getElementById("lnglat").innerHTML = x + "," + y;
           $("#add_xPosition").val(x);
           $("#add_yPosition").val(y);
           lnglatXY = new AMap.LngLat(x, y);
           geocoder();
        }
    function geocoder() {
        var MGeocoder;
        //加载地理编码插件
        mapObj.plugin(["AMap.Geocoder"], function () {
            MGeocoder = new AMap.Geocoder({
                radius: 1000,
                extensions: "all"
            });
            //返回地理编码结果
            AMap.event.addListener(MGeocoder, "complete", geocoder_CallBack);
            //逆地理编码
            MGeocoder.getAddress(lnglatXY);
        });
    }
    var mapObj;
    //回调函数
       function geocoder_CallBack(data) {
          console.log("ddd");
           var address;
           //返回地址描述
          address = data.regeocode.formattedAddress;
           console.log(address);
           //返回结果拼接输出
          // document.getElementById("iAddress").innerHTML = address;
           $("#add_siteName").val(address);
       }
       //选点
    $("#mapSelection").click(function () {
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/admin/citySite/getCitySiteAllByCityId",
            data: {"cityId":cityId},
            dataType: "json",
            success: function(data){
                console.log(data)
                let map = new AMap.Map("container", {
                    resizeEnable: true,
                    // mapStyle:'amap://styles/f0c43041630ebe2835503272216aa80d',
                    features: ['bg', 'road', 'building', 'point'],
                    zoom:15,
                });
                // map.setMapStyle('amap://styles/f0c43041630ebe2835503272216aa80d');
                // map.setFeatures(['road','bg','building','point']);
                // mapObj=map;


                //点击事件
                map.on('click', function(e) {
                    document.getElementById('tip').innerHTML="经度:"+ e.lnglat.getLng()+","+"纬度:"+e.lnglat.getLat();
                    $("#add_xPosition").val(e.lnglat.getLng());
                    $("#add_yPosition").val(e.lnglat.getLat());
                    console.log(e)
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
                    shadeClose: true,
                    content: $('#findMap'),
                    btn: ['确定', '取消'],
                    shade: [0.8, '#393D49'],
                    success: function (layero, index) {
                        AMap.plugin(['AMap.ToolBar','AMap.Scale'],
                            function(){
                                map.addControl(new AMap.ToolBar());
                                map.addControl(new AMap.Scale());
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
                            // placeSearch.search(city,() => {
                            //
                            //     placeSearch.render.markerList.clear() // 这个为清除搜索结果的点，不想清除注释即可
                            // })
                            var districtSearch =  new AMap.DistrictSearch({
                                extensions:'all',
                                subdistrict:0,
                            })
                            districtSearch.search(city,function(status,result) {
                                console.log(result)
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
                            // var cpoint = [119.299506,26.075097]; //中心点坐标
                            // var cpoint = [obj.data.xPosition,obj.data.yPosition]; //中心点坐标
                            // placeSearch.searchNearBy('', cpoint, 120, function (status, result) {
                            // });
                        });
                    }

                    ,yes:function(num,layero){
                        layer.close(num);
                        map.destroy();
                    },btn2: function(index, layero){
                        //按钮【按钮二】的回调
                        map.destroy();
                        $("#add_xPosition").val("");
                        $("#add_yPosition").val("");
                    }
                    ,cancel:function () {
                        map.destroy();
                        $("#add_xPosition").val("");
                        $("#add_yPosition").val("");
                    }});
            }
        });


    })

    //选点
    $("#mapSelection2").click(function () {
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/admin/citySite/getCitySiteAllByCityId",
            data: {"cityId":cityId},
            dataType: "json",
            success: function(data){
                console.log(data);
                let x;
                let y;
                let map = new AMap.Map("container", {
                    resizeEnable: true,
                    center: [$("#edit_xPosition").val(),$("#edit_yPosition").val()],
                    // mapStyle:'amap://styles/f0c43041630ebe2835503272216aa80d',
                    features: ['bg', 'road', 'building', 'point'],
                    zoom:15,
                });
                // map.setMapStyle('amap://styles/f0c43041630ebe2835503272216aa80d');
                // map.setFeatures(['road','bg','building','point']);
                // mapObj=map;


                //点击事件
                map.on('click', function(e) {
                    document.getElementById('tip').innerHTML="经度:"+ e.lnglat.getLng()+","+"纬度:"+e.lnglat.getLat();
                    x=e.lnglat.getLng();
                    y=e.lnglat.getLat();

                    console.log(e)
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
                    shadeClose: true,
                    content: $('#findMap'),
                    btn: ['确定', '取消'],
                    shade: [0.8, '#393D49'],
                    success: function (layero, index) {
                        AMap.plugin(['AMap.ToolBar','AMap.Scale'],
                            function(){
                                map.addControl(new AMap.ToolBar());
                                map.addControl(new AMap.Scale());
                                map.addControl(new AMap.DistrictSearch())
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
                            // placeSearch.search(city,() => {
                            //
                            //     placeSearch.render.markerList.clear() // 这个为清除搜索结果的点，不想清除注释即可
                            // })
                            var districtSearch =  new AMap.DistrictSearch({
                                extensions:'all',
                                subdistrict:0,
                            })
                            districtSearch.search(city,function(status,result) {
                                console.log(result)
                                // map.setCenter([result.districtList[0].center.lng,result.districtList[0].center.lat])
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
                            // var cpoint = [119.299506,26.075097]; //中心点坐标
                            // var cpoint = [obj.data.xPosition,obj.data.yPosition]; //中心点坐标
                            // placeSearch.searchNearBy('', cpoint, 120, function (status, result) {
                            // });
                        });
                    }

                    ,yes:function(num,layero){
                        if(confirm("确认是否使用该坐标")){
                            $("#edit_xPosition").val(x);
                            $("#edit_yPosition").val(y);
                            layer.close(num);
                            map.destroy();
                        }

                    },btn2: function(index, layero){
                        //按钮【按钮二】的回调
                        map.destroy();
                    }
                    ,cancel:function () {
                        map.destroy();
                    }});
            }
        });


    })
    /*公交站点查询*/
    function stationSearch(map) {

        // var stationKeyWord  = document.getElementById('stationKeyWord').value
        // if(!stationKeyWord) return
        //实例化公交站点查询类
        var station = new AMap.StationSearch({
            pageIndex: 1, //页码
            pageSize: 60, //单页显示结果条数
            city: city   //确定搜索城市
        });
        station.search('站', function(status, result) {
            if (status === 'complete' && result.info === 'OK') {
                console.log(result);

                stationSearch_CallBack(result,map);
            } else {
                document.getElementById('tip').innerHTML = JSON.stringify(result);
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
        // marker = new AMap.Marker({
        //     offset: new AMap.Pixel(-12, -12),
        //     zIndex: 101,
        //     map: map,
        //     name:name
        // });
        // marker.setLabel({
        //     // offset: new AMap.Pixel(10, 10),  //设置文本标注偏移量
        //     content: '11', //设置文本标注内容
        //     direction: 'right' //设置文本标注方位
        // });

        // marker.setMap(map);
    }
    /*公交站点查询返回数据解析*/
    function stationSearch_CallBack(searchResult,map) {
        var stationArr = searchResult.stationInfo;
        var searchNum = stationArr.length;
        if (searchNum > 0) {
            document.getElementById('tip').innerHTML = '查询结果：共' + searchNum + '个相关站点';
            for (var i = 0; i < searchNum; i++) {
                var marker = new AMap.Marker({
                    icon:new AMap.Icon({
                        image:'https://a.amap.com/jsapi_demos/static/resource/img/pin.png',
                        size:new AMap.Size(32,32),
                        imageSize:new AMap.Size(32,32)
                    }),
                    offset:new AMap.Pixel(-16,-32),
                    position: stationArr[i].location,
                    map: map,
                    title: stationArr[i].name
                });
                marker.info = new AMap.InfoWindow({
                    content: stationArr[i].name,
                    offset: new AMap.Pixel(0, -30)
                });
                marker.on('mouseover', function(e) {
                    e.target.info.open(map, e.target.getPosition())
                });
                marker.on('click',function(e) {

                    $("#add_xPosition").val(e.target.getPosition().lng);
                    $("#add_yPosition").val(e.target.getPosition().lat);
                    $("#add_siteName").val(e.target.w.title);
                })
            }
            map.setFitView();
        }
    }
</script>


</body>

</html>
