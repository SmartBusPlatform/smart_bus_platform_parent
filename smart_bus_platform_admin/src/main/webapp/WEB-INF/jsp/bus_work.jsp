<%--
  Created by IntelliJ IDEA.
  User: 12614
  Date: 2020/8/4
  Time: 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/static/lib/layui/css/layui.css">
    <script src="/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/static/js/jquery-3.5.1.js"></script>
    <style>
        #time_line_div{
            margin-top: 20px;
        }
        .time_line{
            margin-top: 20px;
            height: 70px;
            max-width: 80%;
            margin-left: 10%;
            overflow-x: auto;
        }
        .time_line_box{
            border: 1px solid #2F4056;
            width: 100px;
            height: 30px;
            text-align: center;
            padding-top: 10px
        }
        .time_line_tips{
            border-top: 2px solid #FF5722;
            width: 100px;
            margin-top: 15px;
            text-align: center
        }
        .marginBottom{
            margin-left: 10%;
        }
        #selectLine{
            margin-top: 20px;
        }
        .selectLine{
            margin-top: 20px;
            margin-left: 10%;
        }
        .btnGroup{
            max-width: 40%;
        }
        .btnWidth{
            border: 1.5px solid #393D49;
            width: 100px;
        }
        #returnLine{
            margin-left: 10%;margin-top: 30px
        }
        .returnBtn{
            border: 1.5px solid #393D49;
            width: 100px;
        }
        .time_line_info{
            margin-top: 20px;
        }
        .tableDiv{
            max-width: 90%;
            margin-left: 10%;
        }
        .tableBtn{
            width: 100px;
        }
        .titleColor{
            color: #FF5722;
        }
        .text{
            margin-left: 20px;
        }
    </style>
</head>
<body style="background-color: #f2f2f2;height: 550px">
    <div id="time_line_div">
        <h1 class="marginBottom layui-inline titleColor"></h1><h1 class="layui-inline">&nbsp;&nbsp;全天在用时间轴</h1>
        <div class="time_line">
            <nobr id="time_line">
            </nobr>
        </div>
    </div>

    <div id="selectLine">
        <h1 class="marginBottom">可选班次</h1>
        <div class="selectLine">
            <div class="layui-btn-group btnGroup" id="lineBtnGroup">
            </div>
        </div>
    </div>

    <div id="returnLine" style="display: none">
        <button type="button" class="layui-btn returnBtn" onclick="returnLine()">返回</button>
        <label id="nowLine" class="text">当前线路：</label>
        <label id="nowAllTime" class="text" style="color: #FF5722">一趟时间（加休息）：</label>
    </div>


    <div class="layui-row tableDiv" id="time_line_table" style="display: none">
        <div class="time_line_info layui-col-lg5">
            <h1>始程</h1>
            <table class="layui-table" id="startTimeTable" lay-filter="startTable">
            </table>
        </div>
        <div class="time_line_info layui-col-lg5" style="margin-left: 50px">
            <h1>返程</h1>
            <table class="layui-table" id="returnTimeTable" lay-filter="returnTable">
            </table>
        </div>
    </div>

    <%-- 获取父界面的参数--%>
    <input type="hidden" class="transmitData" value="" id="number">
    <input type="hidden" class="transmitData" value="" id="cityId">
    <input type="hidden" class="transmitData" value="" id="busId">

    <input type="hidden" class="transmitData" value="" id="lineId">
    <input type="hidden" class="transmitData" value="" id="allTime">
<%--    工具栏 --%>
<script type="text/html" id="btn">
    {{#  if(d.isRun ==1){  }}
        {{#  if(d.workType ==1){  }}
            <text>已在{{d.lineName}}运行</text>
            <a class="layui-btn layui-btn-sm" lay-event="加开">加开</a>
        {{# } }}
        {{#  if(d.workType ==2){  }}
        <a class="layui-btn layui-btn-sm" lay-event="删除加开班次">删除加开班次</a>
        {{# } }}
    {{# } }}
    {{#  if(d.isRun ==2){  }}
        {{#  if(d.workType ==1){  }}
            <a class="layui-btn layui-btn-sm" lay-event="排班替换">排班替换</a>
            <a class="layui-btn layui-btn-sm" lay-event="加开">加开</a>
        {{# } }}
        {{#  if(d.workType ==2){  }}
            <a class="layui-btn layui-btn-sm" lay-event="删除加开班次">删除加开班次</a>
        {{# } }}
    {{# } }}
    {{#  if(d.isRun ==3){  }}
        <a class="layui-btn layui-btn-sm" lay-event="排班">排班</a>
    {{# } }}
</script>
<script>
    //时间轴
    function queryBusWork() {
        var busId = $("#busId").val();
        $.ajax({
            url: '${pageContext.request.contextPath}/admin/busWork/queryBusWork',
            data: "id="+busId,
            method:'post',
            dataType:'json',
            success:function(msg){
                $("#time_line").empty();
                var time_line = new Array();
                if(msg.length>0){
                    $.each(msg,function (index,item) {
                        if(index==0){
                            time_line.push({'start':item.departureTime,'end':item.returnArrivalTime,'lineName':item.lineName});
                        }else{
                            if (time_line[time_line.length-1].start==item.departureTime){
                                time_line[time_line.length-1].end = item.returnArrivalTime;
                            }else{
                                time_line.push({'start':item.departureTime,'end':item.returnArrivalTime,'lineName':item.lineName});
                            }
                        }
                    });
                    $("#time_line").empty();
                    $.each(time_line,function (index,item) {
                        if(index!=0){
                            $("#time_line").append("<div class='layui-inline time_line_tips'>空闲时间</div>");
                        };
                        $("#time_line").append("<div class='layui-inline time_line_box'>"+item.start+"</div>");
                        $("#time_line").append("<div class='layui-inline time_line_tips'>"+item.lineName+"</div>");
                        $("#time_line").append("<div class='layui-inline time_line_box'>"+item.end+"</div>");
                        if(index==time_line.length-1){
                            $("#time_line").append("<div class='layui-inline time_line_tips'>空闲时间</div>");
                            $("#time_line").append("<div class='layui-inline time_line_box'>下班</div>");
                        };
                    });
                }else{
                    $("#time_line").empty();
                    $("#time_line").append("<div class='layui-inline time_line_box'>6:00</div>");
                    $("#time_line").append("<div class='layui-inline time_line_tips' style='width: 80%'>空闲时间</div>");
                    $("#time_line").append("<div class='layui-inline time_line_box'>下班</div>");
                }
            },
            error:function () {
                alert("获取时间轴出错,请点击刷新按钮");
                $("#time_line").empty();
                $("#time_line").append("<button type='button' class='layui-btn btnWidth' onclick='queryBusWork()'>刷新</button>");
            }
        })
    };

    //查询线路
    function queryLine() {
        var cityId = $("#cityId").val();
        $.ajax({
            url: '${pageContext.request.contextPath}/admin/line/getLineByCityId',
            data: "cityId="+cityId,
            method:'post',
            dataType:'json',
            success:function(msg){
                $("#lineBtnGroup").empty();
                if(msg.length!=0){
                    $.each(msg,function (index,item) {
                        $("#lineBtnGroup").append("<button type='button' class='layui-btn btnWidth' value='"+item.id+"' onclick='queryLineTime(this)'>"+item.name+"<input type='hidden' value='"+item.allTime+"'></button>")
                    });
                }else{
                    $("#lineBtnGroup").append("<button type='button' class='layui-btn' disabled style='width: 200px'>该城市暂未开线路</button>")
                }
            },
            error:function () {
                alert('获取线路出错,请点击刷新按钮');
                $("#lineBtnGroup").empty();
                $("#lineBtnGroup").append("<button type='button' class='layui-btn btnWidth' onclick='queryLine()'>刷新</button>")
            }
        })
    }

    //查询线路时刻表,始程返程表格
    function queryLineTime(node) {
        //隐藏自己，显示返回按钮和表格
        $("#selectLine").css("display","none");
        $("#returnLine").css("display","");
        $("#time_line_table").css("display","");
        $("#nowLine").text("当前线路："+$(node).text());
        $("#nowAllTime").text("一趟耗时（加休息）："+$(node).children('input').eq(0).val());

        var line = $(node).val();
        $("#lineId").val(line);
        layui.use(['table','layer'], function() {
            var table = layui.table;
            var layer = layui.layer;

            //初始始程表格
            table.render({
                elem: '#startTimeTable'
                ,url: '${pageContext.request.contextPath}/admin/time/queryTime?beginOrReturn=1&lineId='+line //数据接口
                ,height:300
                ,cols: [[ //表头
                    {field: 'id', title : 'ID' , hide:"true"}
                    ,{field: 'busWorkId', title : '巴士排班ID' , hide:"true"}
                    ,{field: 'busId', title : 'ID' , hide:"true"}
                    ,{field: 'requiredTime', title : 'ID' , hide:"true"}
                    // ,{templet:'#zizeng', align: 'center', title : '序号'}
                    ,{field: 'time', align: 'center', title : '时间',width:'100'}
                    ,{field: 'number', align: 'center', title : '发车',minWidth:'180'}
                    ,{field: 'isRun', align:'center', templet: '#btn',title:'操作',minWidth:'200'}
                ]]
                ,parseData: function(res){ //res 即为原始返回的数据
                    return {
                        "code": 0, //解析接口状态
                        "msg": "0", //解析提示文本
                        "count": 0, //解析数据长度
                        "data": res,
                    };
                }
            });

            //初始返程表格
            table.render({
                elem: '#returnTimeTable'
                ,url: '${pageContext.request.contextPath}/admin/time/queryTime?beginOrReturn=2&lineId='+line //数据接口
                ,height:300
                ,cols: [[ //表头
                    {field: 'id', title : 'ID' , hide:"true"}
                    ,{field: 'busWorkId', title : '巴士排班ID' , hide:"true"}
                    ,{field: 'busId', title : 'ID' , hide:"true"}
                    ,{field: 'requiredTime', title : 'ID' , hide:"true"}
                    // ,{templet:'#zizeng', align: 'center', title : '序号'}
                    ,{field: 'time', align: 'center', title : '时间',width:'100'}
                    ,{field: 'number', align: 'center', title : '发车',minWidth:'180'}
                    ,{field: 'isRun', align:'center', templet: '#btn',title:'操作',minWidth:'200'}
                ]]
                ,parseData: function(res){ //res 即为原始返回的数据
                    return {
                        "code": 0, //解析接口状态
                        "msg": "0", //解析提示文本
                        "count": 0, //解析数据长度
                        "data": res,
                    };
                }
            });

            //监听始程工具条
            table.on('tool(startTable)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
                var data = obj.data; //获得当前行数据
                var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
                var nowBusId = $("#busId").val();   //当前排班的车ID
                var nowNumber = $("#number").val(); //当前车牌号
                var requiredTime = data.requiredTime;   //一趟总耗时
                var startTime = data.time;  //开始时间
                var lineId = $("#lineId").val();    //线路ID
                var timeId = data.id;   //时间段ID
                var id = data.busWorkId;    //巴士排班ID
                var busId = data.busId; //时刻表上的巴士ID

                if(layEvent == '排班'){ //排班
                    layer.confirm('是否排班？',{icon: 3, title:'提示'},function (index) {
                        $.ajax({
                            url: "${pageContext.request.contextPath}/admin/busWork/insertBusWork",
                            method:'post',
                            dataType:'json',
                            contentType : 'application/json;charset=utf-8',
                            data:JSON.stringify({"busId":nowBusId,"lineId":lineId,"timeId":timeId,"startBeginOrReturn":1,"startTime":startTime,"workType":"1","allTime":requiredTime}),
                            success:function(msg){
                                if(msg=="success"){
                                    layer.msg('排班成功');
                                    table.reload('startTimeTable');
                                    queryBusWork();
                                }else if(msg=="upDataError"){
                                    layer.msg('数据出错');
                                }else if(msg=="busIsRunning"){
                                    layer.msg('该时间段车辆正在行驶或准备发车，无法排班');
                                }else{
                                    layer.msg('新增失败');
                                }
                            },
                            error:function (msg) {
                                layer.msg('网络出错');
                            }
                        });
                        layer.close(index);
                    });
                } else if(layEvent == '排班替换'){ //排班替换
                    if(busId != nowBusId){
                        layer.confirm('是否排班替换？',{icon: 3, title:'提示'},function (index) {
                            $.ajax({
                                url: "${pageContext.request.contextPath}/admin/busWork/changeBusWork",
                                method:'post',
                                dataType:'json',
                                contentType : 'application/json;charset=utf-8',
                                data:JSON.stringify({"id":id,"busId":nowBusId,"startTime":startTime,"allTime":requiredTime}),
                                success:function(msg){
                                    if(msg=="success"){
                                        layer.msg('排班替换成功');
                                        obj.update({
                                            number: nowNumber
                                            ,busId: nowBusId
                                        });
                                        queryBusWork();
                                    }else if(msg=="upDataError"){
                                        layer.msg('数据出错');
                                    }else if(msg=="busIsRunning"){
                                        layer.msg('该时间段车辆正在行驶或准备发车，无法排班');
                                    }else{
                                        layer.msg('新增失败');
                                    }
                                },
                                error:function (msg) {
                                    layer.msg('网络出错');
                                }
                            });
                            layer.close(index);
                        });
                    }else{
                        layer.msg('无法对自己进行排班替换');
                    }
                } else if(layEvent == '加开'){ //加开
                    if(busId != nowBusId){
                        layer.confirm('是否'+layEvent+'?',{icon: 3, title:'提示'},function (index) {
                            $.ajax({
                                url: "${pageContext.request.contextPath}/admin/busWork/insertBusWork",
                                method:'post',
                                dataType:'json',
                                contentType : 'application/json;charset=utf-8',
                                data:JSON.stringify({"busId":nowBusId,"lineId":lineId,"timeId":timeId,"startBeginOrReturn":1,"startTime":startTime,"workType":"2","allTime":requiredTime}),
                                success:function(msg){
                                    if(msg=="success"){
                                        layer.msg('加开成功');
                                        table.reload('startTimeTable');
                                        queryBusWork();
                                    }else if(msg=="upDataError"){
                                        layer.msg('数据出错');
                                    }else if(msg=="busIsRunning"){
                                        layer.msg('该时间段车辆正在行驶或准备发车，无法加开');
                                    }else{
                                        layer.msg('新增失败');
                                    }
                                },
                                error:function (msg) {
                                    layer.msg('网络出错');
                                }
                            });
                            layer.close(index);
                        });
                    }else{
                        layer.msg("无法对自己进行加开排班");
                    }
                }else{  //删除加开
                    layer.confirm('是否'+layEvent+'班次?',{icon: 3, title:'提示'},function (index) {
                        $.ajax({
                            url: "${pageContext.request.contextPath}/admin/busWork/deleteBusWork",
                            method:'post',
                            dataType:'json',
                            contentType : 'application/json;charset=utf-8',
                            data:JSON.stringify({'id':data.busWorkId}),
                            success:function(msg){
                                if(msg=="success"){
                                    layer.msg('删除加开成功');
                                    table.reload('startTimeTable');
                                    queryBusWork();
                                }else if(msg=="upDataError"){
                                    layer.msg('网络出错');
                                }else{
                                    layer.msg('删除失败');
                                }
                            },
                            error:function (msg) {
                                layer.msg('网络出错');
                            }
                        });
                        layer.close(index);
                    });
                }
            });

            //监听返程工具条
            table.on('tool(returnTable)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
                var data = obj.data; //获得当前行数据
                var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
                var nowBusId = $("#busId").val();   //当前排班的车ID
                var nowNumber = $("#number").val(); //当前车牌号
                var requiredTime = data.requiredTime;   //一趟总耗时
                var startTime = data.time;  //开始时间
                var lineId = $("#lineId").val();    //线路ID
                var timeId = data.id;   //时间段ID
                var id = data.busWorkId;    //巴士排班ID
                var busId = data.busId; //时刻表上的巴士ID

                if(layEvent == '排班'){ //排班
                    layer.confirm('是否'+layEvent+'?',{icon: 3, title:'提示'},function (index) {
                        $.ajax({
                            url: "${pageContext.request.contextPath}/admin/busWork/insertBusWork",
                            method:'post',
                            dataType:'json',
                            contentType : 'application/json;charset=utf-8',
                            data:JSON.stringify({"busId":nowBusId,"lineId":lineId,"timeId":timeId,"startBeginOrReturn":2,"startTime":startTime,"workType":"1","allTime":requiredTime,"isAddup":1}),
                            success:function(msg){
                                if(msg=="success"){
                                    layer.msg('排班成功');
                                    table.reload('returnTimeTable');
                                    queryBusWork();
                                }else if(msg=="upDataError"){
                                    layer.msg('数据出错');
                                }else if(msg=="busIsRunning"){
                                    layer.msg('该时间段车辆正在行驶或准备发车，无法排班');
                                }else{
                                    layer.msg('新增失败');
                                }
                            },
                            error:function (msg) {
                                layer.msg('网络出错');
                            }
                        });
                        layer.close(index);
                    });
                } else if(layEvent == '排班替换'){ //排班替换
                    if(busId != nowBusId){
                        layer.confirm('是否'+layEvent+'?',{icon: 3, title:'提示'},function (index) {
                            $.ajax({
                                url: "${pageContext.request.contextPath}/admin/busWork/changeBusWork",
                                method:'post',
                                dataType:'json',
                                contentType : 'application/json;charset=utf-8',
                                data:JSON.stringify({"id":id,"busId":nowBusId,"startTime":startTime,"allTime":requiredTime}),
                                success:function(msg){
                                    if(msg=="success"){
                                        layer.msg('排班替换成功');
                                        obj.update({
                                            number: nowNumber
                                            ,busId: nowBusId
                                        });
                                        queryBusWork();
                                    }else if(msg=="upDataError"){
                                        layer.msg('数据出错');
                                    }else if(msg=="busIsRunning"){
                                        layer.msg('该时间段车辆正在行驶或准备发车，无法替换');
                                    }else{
                                        layer.msg('新增失败');
                                    }
                                },
                                error:function (msg) {
                                    layer.msg('网络出错');
                                }
                            });
                            layer.close(index);
                        });
                    }else{
                        layer.msg('无法对自己进行排班替换');
                    }
                } else if(layEvent == '加开'){ //加开
                    if(busId != nowBusId){
                        layer.confirm('是否'+layEvent+'?',{icon: 3, title:'提示'},function (index) {
                            $.ajax({
                                url: "${pageContext.request.contextPath}/admin/busWork/insertBusWork",
                                method:'post',
                                dataType:'json',
                                contentType : 'application/json;charset=utf-8',
                                data:JSON.stringify({"busId":nowBusId,"lineId":lineId,"timeId":timeId,"startBeginOrReturn":2,"startTime":startTime,"workType":"2","allTime":requiredTime,"isAddup":2}),
                                success:function(msg){
                                    if(msg=="success"){
                                        layer.msg('加开成功');
                                        table.reload('returnTimeTable');
                                        queryBusWork();
                                    }else if(msg=="upDataError"){
                                        layer.msg('数据出错');
                                    }else if(msg=="busIsRunning"){
                                        layer.msg('该时间段车辆正在行驶或准备发车，无法加开');
                                    }else{
                                        layer.msg('新增失败');
                                    }
                                },
                                error:function (msg) {
                                    layer.msg('网络出错');
                                }
                            });
                            layer.close(index);
                        });
                    }else{
                        layer.msg("无法对自己进行加开排班");
                    }
                }else{
                    layer.confirm('是否'+layEvent+'?',{icon: 3, title:'提示'},function (index) {
                        $.ajax({
                            url: "${pageContext.request.contextPath}/admin/busWork/deleteBusWork",
                            method:'post',
                            dataType:'json',
                            contentType : 'application/json;charset=utf-8',
                            data:JSON.stringify({'id':data.busWorkId}),
                            success:function(msg){
                                if(msg=="success"){
                                    layer.msg('删除加开成功');
                                    table.reload('startTimeTable');
                                    queryBusWork();
                                }else if(msg=="upDataError"){
                                    layer.msg('网络出错');
                                }else{
                                    layer.msg('删除失败');
                                }
                            },
                            error:function (msg) {
                                layer.msg('网络出错');
                            }
                        });
                        layer.close(index);
                    });
                }
            });
        })
    }

    //返回按钮
    function returnLine() {
        $("#selectLine").css("display","");
        $("#returnLine").css("display","none");
        $("#time_line_table").css("display","none");
    }
</script>
<%--  自增序号  --%>
<script type="text/html" id="zizeng">
    {{d.LAY_TABLE_INDEX+1}}
</script>
</body>

</html>
