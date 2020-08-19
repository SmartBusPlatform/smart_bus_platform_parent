<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>站点客流统计</title>
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
    <script  src="${pageContext.request.contextPath}/static/js/echarts.js" ></script>
    <script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.15&key=01c4bad1d55c4b802d04ee5e62657af1&plugin=AMap.StationSearch"></script>
    <link rel="stylesheet" href="https://cache.amap.com/lbs/static/main1119.css"/>
    <link rel="stylesheet" href="https://a.amap.com/jsapi_demos/static/demo-center/css/demo-center.css"/>
    <script type="text/javascript" src="http://webapi.amap.com/demos/js/liteToolbar.js"></script>
</head>
<style>
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
    }
    .maginTop{
        margin-top: 20px;
        margin-left: 30px;
    }
</style>
<body style="background-color: #F0F0F0">
    <div class="x-body">
        <%--省市树状--%>
        <div  class="tree">
            <ul id="citySite_tree" lay-filter="citySite_tree-filter" style=" "></ul>
        </div>

            <%--右侧列表--%>
            <div class="right">
                <div class="maginTop">
                    <h1>站点客流量统计</h1>
                </div>
                <div class="maginTop">
                    <form class="layui-form layui-col-space5">
                        <div class="layui-inline">
                            <h3 class="layui-inline">客流量></h3>
                            <div class="layui-input-inline" id="start">
                                <input type="text" class="layui-input" id="flow" name="flow" >
                            </div>
                        </div>
                        <div class="layui-inline">
                            <h3 class="layui-inline">站点名称:</h3>
                            <div class="layui-input-inline" id="end">
                                <input type="text" class="layui-input" id="siteName" name="siteName" >
                            </div>
                        </div>
                        <div class="layui-inline layui-col-lg-offset1">
                            <button class="layui-btn btnWidth" lay-submit lay-filter="search" type="button">查询</button>
                        </div>
                    </form>
                    <table id="site_table" lay-filter="site-filter"></table>
                </div>

            </div>
    </div>
</body>
<div id="site" hidden>
    <div class="layui-inline layui-col-sm-offset8" style="margin-top: 30px">
        <h2 id="title"></h2>
    </div>
    <div id="echars" style="height: 400px;margin:50px 50px"></div>

</div>
<%--自增--%>
<script id="index" type="text/html">
    {{d.LAY_TABLE_INDEX+1}}
</script>
<%--表格bar--%>
<script type="text/html" id="site_tablebar">
    <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="flowChart">流量图</a>
    <a class="layui-btn layui-btn-warm layui-btn-xs" lay-event="show">地图显示</a>
</script>
<div class="site-text layui-row" hidden id="findMap">
    <div id="container" style="margin-top: 0.2cm;width:100%;height: 100%;"></div>
    <div id="tip" class='info' style='min-width:18rem;'>

    </div>

</div>
<script>
    //当前点击省份
    var province;
    var provinceId;
    //当前点击城市
    var city;
    var cityId;
    var selprovince;
    var selprovinceId;
    var nameArrs = [];
    var valueArrs = [];
    var sum;
    var times=[
        '0:00-0:59',
        '1:00-1:59',
        '2:00-2:59',
        '3:00-3:59',
        '4:00-4:59',
        '5:00-5:59',
        '6:00-6:59',
        '7:00-7:59',
        '8:00-8:59',
        '9:00-9:59',
        '10:00-10:59',
        '11:00-11:59',
        '12:00-12:59',
        '13:00-13:59',
        '14:00-14:59',
        '15:00-15:59',
        '16:00-16:59',
        '17:00-17:59',
        '18:00-18:59',
        '19:00-19:59',
        '20:00-20:59',
        '21:00-21:59',
        '22:00-22:59',
        '23:00-23:59',
    ]
    layui.use(['table', 'tree', 'form','laydate'], function () {
        var tree = layui.tree;
        var table = layui.table;
        var form = layui.form;
        var laydate = layui.laydate;
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
                                elem: '#site_table',
                                url: '${pageContext.request.contextPath}/admin/fee/getSiteFlowByPage',
                                where: {
                                    "cityId": obj.data.id
                                },
                                width: 800,
                                cols: [[
                                    // {type:'checkbox'},
                                    {field: 'sorId',title:'序号',templet: '#index'},
                                    {field: 'id',title:'id',hide:'true'},
                                    {field: 'xPosition',hide:'true'},
                                    {field: 'yPosition',hide:'true'}
                                    ,{field: 'name', title: '站点名称'  }
                                    ,{field: 'throughLine',title:'经过线路'}
                                    ,{field: 'flowNum',title:'客流量'}
                                    ,{field: '',title:'操作' ,templet:'#site_tablebar',minWidth:200}
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
        table.on('tool(site-filter)', function (obj) {
            var event = obj.event;
            alert(event)
            if (event == 'flowChart') {
                layer.open({
                    title: '站点客流量统计图',
                    type: 1,
                    area: ['70%', '80%'],
                    offset: 'auto',
                    maxmin: true,
                    shadeClose: false,
                    content: $('#site'),
                    btn: ['返回'],
                    shade: [0.8, '#393D49'],
                    success: function (layero, index) {
                        // createEchars3(title,times,valueArrs3);// 创建普通柱状图
                        // $("#title3").text("合计:"+sum3+"元")
                        channel_volume_statistics(obj.data.id, obj.data.name)
                    }
                });
            }else if("show"===event){
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
                    }
                    ,yes:function(num,layero){
                        layer.close(num)
                        map.destroy();
                    }
                    ,cancel:function () {
                        map.destroy();
                    }   });
            }
        })
        //监听提交 lay-filter="search"
        form.on('submit(search)', function(data){
            var formData = data.field;
            console.log(formData)
            var name = formData.siteName;
            var flowNum = formData.flow;
            //执行重载
            table.reload('site_table', {
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                , where: {//这里传参  向后台
                    name: name,
                    flowNum:flowNum
                    //可传多个参数到后台...  ，分隔
                }
                , url:'${pageContext.request.contextPath}/admin/fee/getSiteFlowByPage'//后台做模糊搜索接口路径
                , method: 'post'
            });
            return false;//false：阻止表单跳转  true：表单跳转
        });

    });


    function channel_volume_statistics(siteId,siteName) {
            nameArrs.length=0;
            valueArrs.length=0;
            sum1=0
            $.ajax({
                method : "post",
                url : "${pageContext.request.contextPath}/admin/fee/getSiteFlowByCityIdAndSiteId",
                data:{"cityId":cityId,"siteId":siteId},
                dataType : "json",
                success : function(res) {
                    console.log(res)
                    valueArrs= new Array(times.length).fill(0);
                    for (let  i = 0; i < res.length; i++) {
                        for (let j=0;j<times.length;j++){
                            if(times[j]==res[i].time){
                                valueArrs[j]=res[i].flowNum;
                            }
                        }

                        // 普通柱状图使用的数据
                    }
                    sum=0
                    for (let i=0;i<valueArrs.length;i++){
                        sum+=Number(valueArrs[i]);
                    }
                    createEchars(siteName,times,valueArrs);// 创建普通柱状图
                    $("#title").text("合计:"+sum+"人")
                },

                error : function() {
                    alert("服务器正忙");
                }
            });
    }
    var myChart;
    //普通柱状图
    function createEchars(title,nameArr,valueArr) {
        if(myChart!=null){
            myChart.dispose();
        }
        //基于准备好的dom，初始化echarts实例
        myChart = echarts.init(document.getElementById('echars'),'#ffffff');//dark为暗黑主题 不要可以去掉

        // 指定图表的配置项和数据
        var option = {
            title : {
                text : title+'站点客流量统计图'
            },
            tooltip : {},
            legend : {
                data : [ '柱状数据表' ]
            },
            xAxis : {
                data : nameArr,
                boundaryGap: true,
                axisLabel: {
                    interval: 0,
                    rotate: 40
                }
            },
            yAxis : {
                type:'value',
                name:'人'
            },
            series : [ {
                name : '数据',
                type : 'bar',
                data : valueArr,
                showAllSymbol: true,
                barWidth:20,
                itemStyle:{
                    normal:{
                        label:{
                            formatter:'{c}'+'人',
                            show:true,
                            position:'top',
                            textStyle:{
                                color:'black',
                                font:30
                            }
                        },
                        color:'#000000'
                    }
                }
            } ],
            dataZoom:[{
                // start:0,
                // end:10,
                zoomLock:true
            }],
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);


    }
</script>
</html>
