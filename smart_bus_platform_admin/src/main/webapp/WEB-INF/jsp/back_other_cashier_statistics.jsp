<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>线路收银统计</title>
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
<body   style="background-color: #F0F0F0">
<div  class="x-body">
    <%--省市树状--%>
    <div  class="tree">
        <ul id="citySite_tree" lay-filter="citySite_tree-filter" style=" "></ul>
    </div>
        <%--右侧列表--%>
        <div class="right">
            <div class="maginTop">
                <h1>线路收银图</h1>
            </div>
            <div class="maginTop">
                <form class="layui-form layui-col-space5">
                    <div class="layui-inline">
                        <h3 class="layui-inline">开始日期:</h3>
                        <div class="layui-input-inline" id="start">
                            <input type="text" class="layui-input" id="startDate" name="startDate" placeholder="yyyy-MM-dd">
                        </div>
                    </div>
                    <div class="layui-inline">
                        <h3 class="layui-inline">结束日期:</h3>
                        <div class="layui-input-inline" id="end">
                            <input type="text" class="layui-input" id="endDate" name="endDate" placeholder="yyyy-MM-dd">
                        </div>
                    </div>
                    <div class="layui-inline layui-col-lg-offset1">
                        <button class="layui-btn btnWidth" lay-submit lay-filter="search" type="button">查询</button>
                    </div>
                </form>
            </div>
            <div class="layui-inline layui-col-lg-offset8" style="margin-top: 30px">
                <h2 id="title"></h2>
            </div>
            <div id="echars" style="height: 400px;margin:50px 50px"></div>

        </div>

</div>
<div id="line" hidden>
    <div class="layui-inline layui-col-lg-offset8" style="margin-top: 30px">
        <h2 id="title2"></h2>
    </div>
    <div id="echars2" style="height: 400px;margin:50px 50px"></div>

</div>
<div id="time" hidden>
    <div class="layui-inline layui-col-lg-offset8" style="margin-top: 30px">
        <h2 id="title3"></h2>
    </div>
    <div id="echars3" style="height: 400px;margin:50px 50px"></div>
</div>
</body>

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
    var nameArrs2 = [];
    var valueArrs2 = [];
    var nameArrs3 = [];
    var valueArrs3= [];
    var sum1;
    var sum2;
    var sum3;
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
        //常规用法
        $("#start").children().remove()
        $("#start").html("<input type=\"text\" class=\"layui-input\" id=\"startDate\" placeholder=\"yyyy-MM-dd\">");
        $("#end").children().remove()
        $("#end").html(" <input type=\"text\" class=\"layui-input\" id=\"endDate\" placeholder=\"yyyy-MM-dd\">")
        var start=laydate.render({
            elem: '#startDate',
            done:function (value,date) {
                end.config.min = {
                    year : date.year,
                    month : date.month - 1,
                    date : date.date,
                }; //开始日选好后，重置结束日的最小日期
            },

        });
        var end=laydate.render({
            elem: '#endDate',

            done:function (value,date) {
                start.config.max = {
                    year : date.year,
                    month : date.month - 1,
                    date : date.date,
                }; //结束日选好后，重置开始日的最大日期
            }
        });
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
                            channel_volume_statistics()

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

        //监听提交 lay-filter="search"
        form.on('submit(search)', function(data){
            channel_volume_statistics();

            return false;//false：阻止表单跳转  true：表单跳转
        });

    });




    function channel_volume_statistics() {
        if($("#startDate").val()!=null&&$("#startDate").val()!=''&&$("#endDate").val()!=null&&$("#endDate").val()!=''){
            nameArrs.length=0;
            valueArrs.length=0;
            sum1=0
            $.ajax({
                method : "post",
                url : "${pageContext.request.contextPath}/admin/fee/getLineCashier",
                // data:{"startDate":startDate,"endDate":endDate},
                data:{"cityId":cityId,"startDate":$("#startDate").val(),"endDate":$("#endDate").val()},
                dataType : "json",
                success : function(res) {
                    console.log(res)
                    // $("#title").text("该段时间内总预约量为:"+arr.total);
                    for (var i = 0; i < res.length; i++) {
                        // 普通柱状图使用的数据
                        nameArrs.push(res[i].lineName);
                        valueArrs.push(res[i].lineFee);
                        sum1+=Number(res[i].lineFee);
                    }

                    createEchars(city,nameArrs,valueArrs);// 创建普通柱状图
                    $("#title").text("合计:"+sum1+"元")
                },

                error : function() {
                    alert("服务器正忙");
                }
            });
        }else{
            layer.msg("请选择要查询开始时间和结束时间")
        }



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
                text : title+'线路收银统计'
            },
            tooltip : {},
            legend : {
                data : [ '柱状数据表' ]
            },
            xAxis : {
                data : nameArr,
                axisLabel: {
                    interval: 0
                }
            },
            yAxis : {
                type:'value',
                name:'元'
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
                            formatter:'{c}'+'元',
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
        myChart.on('click',function (params) {
            let time=getAll($("#startDate").val(),$("#endDate").val())
            // getLineCashierByName
            $.ajax({
                method : "post",
                url : "${pageContext.request.contextPath}/admin/fee/getLineCashierByName",
                // data:{"startDate":startDate,"endDate":endDate},
                data:{"cityId":cityId,"startDate":$("#startDate").val(),"endDate":$("#endDate").val(),"lineName":params.name},
                dataType : "json",
                success : function(res) {
                    valueArrs2= new Array(time.length).fill(0);
                    for (let  i = 0; i < res.length; i++) {
                        for (let j=0;j<time.length;j++){
                            if(time[j]==res[i].feeTime){
                                valueArrs2[j]=res[i].dayFee;
                            }
                        }

                        // 普通柱状图使用的数据
                    }
                    sum2=0
                    for (let i=0;i<valueArrs2.length;i++){
                        sum2+=Number(valueArrs2[i]);
                    }
                    layer.open({
                        title: '线路收银日期图',
                        type: 1,
                        area: ['70%', '80%'],
                        offset: 'auto',
                        maxmin: true,
                        shadeClose: false,
                        content: $('#line'),
                        btn: ['返回'],
                        shade: [0.8, '#393D49'],
                        success: function (layero, index) {
                            createEchars2(params.name,time,valueArrs2);// 创建普通柱状图
                            $("#title2").text("合计:"+sum2+"元")
                        }
                    });
                },
                error : function() {
                    alert("服务器正忙");
                }
            })
        });

    }
   function  getAll(stime,etime){			// 开始日期和结束日期
       //获取两日期之间日期列表函数
           //初始化日期列表，数组
           var diffdate = new Array();
           var i=0;
           //开始日期小于等于结束日期,并循环
           while(stime<=etime){
               diffdate[i] = stime;

               //获取开始日期时间戳
               var stime_ts = new Date(stime).getTime();
               // console.log('当前日期：'+stime   +'当前时间戳：'+stime_ts);

               //增加一天时间戳后的日期
               var next_date = stime_ts + (24*60*60*1000);

               //拼接年月日，这里的月份会返回（0-11），所以要+1
               var next_dates_y = new Date(next_date).getFullYear()+'-';
               var next_dates_m = (new Date(next_date).getMonth()+1 < 10)?'0'+(new Date(next_date).getMonth()+1)+'-':(new Date(next_date).getMonth()+1)+'-';
               var next_dates_d = (new Date(next_date).getDate() < 10)?'0'+new Date(next_date).getDate():new Date(next_date).getDate();

               stime = next_dates_y+next_dates_m+next_dates_d;

               //增加数组key
               i++;
           }
           return diffdate;
    }
    var myChart2
    //普通柱状图
    function createEchars2(title,nameArr,valueArr) {
        if(myChart2!=null){
            myChart2.dispose();
        }
        //基于准备好的dom，初始化echarts实例
        myChart2 = echarts.init(document.getElementById('echars2'),'#ffffff');//dark为暗黑主题 不要可以去掉
        // 指定图表的配置项和数据
        var option = {
            title : {
                text : title+'收银日期图'
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
                name:'元'
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
                            formatter:'{c}'+'元',
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
        myChart2.setOption(option);
        myChart2.on('click',function (params) {
            console.log(params.name)
            $.ajax({
                method : "post",
                url : "${pageContext.request.contextPath}/admin/fee/getLineCashierByNameAndTime",
                // data:{"startDate":startDate,"endDate":endDate},
                data:{"cityId":cityId,"time":params.name,"lineName":title},
                dataType : "json",
                success : function(res) {
                    console.log(res)
                    valueArrs3= new Array(times.length).fill(0);
                    for (var  i = 0; i < res.length; i++) {
                        for (let j=0;j<times.length;j++){
                            if(times[j]==res[i].time){
                                valueArrs3[j]=res[i].timeFee;
                            }
                        }
                        sum3=0
                        for (let i=0;i<valueArrs3.length;i++){
                            sum3+=Number(valueArrs3[i]);
                        }
                        // 普通柱状图使用的数据
                        // nameArrs2.push(res[i].lineName);
                        // valueArrs2.push(res[i].lineFee);
                    }
                    layer.open({
                        title: '线路收银时段图',
                        type: 1,
                        area: ['70%', '80%'],
                        offset: 'auto',
                        maxmin: true,
                        shadeClose: false,
                        content: $('#time'),
                        btn: ['返回'],
                        shade: [0.8, '#393D49'],
                        success: function (layero, index) {
                            createEchars3(title,times,valueArrs3);// 创建普通柱状图
                            $("#title3").text("合计:"+sum3+"元")
                        }
                    });

                },
                error : function() {
                    alert("服务器正忙");
                }
            })
        });

    }

    var myChart3;
    //普通柱状图
    function createEchars3(title,nameArr,valueArr) {
        if(myChart3!=null){
            myChart3.dispose();
        }
        //基于准备好的dom，初始化echarts实例
        myChart3 = echarts.init(document.getElementById('echars3'),'#ffffff');//dark为暗黑主题 不要可以去掉

        // 指定图表的配置项和数据
        var option = {
            title : {
                text : title+'线路收银时段图'
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
                name:'元'
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
                            formatter:'{c}'+'元',
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
        myChart3.setOption(option);


    }
</script>
</html>
