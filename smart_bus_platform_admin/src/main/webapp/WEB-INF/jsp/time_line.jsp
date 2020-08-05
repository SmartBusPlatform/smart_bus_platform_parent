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
        .time_line{
            margin-top: 20px;
            height: 100px;
            max-width: 60%;
            margin-left: 20%;
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
            margin-top: 50px;
            margin-bottom: 50px;
            margin-left: 20%;
        }
        .selectLine{
            margin-left: 20%;
        }
        .btnGroup{
            max-width: 50%;
        }
        .btnWidth{
            border: 1.5px solid #393D49;
            width: 100px;
        }
        .time_line_info{
            margin-top: 20px;
        }
        .tableDiv{
            max-width: 60%;
            margin-left: 20%;
        }
        .tableBtn{
            width: 100px;
        }
        .titleColor{
            color: #FF5722;
        }
    </style>
</head>
<body style="background-color: #F0F0F0;height: 800px">
    <div>
        <h1 class="marginBottom layui-inline titleColor"></h1><h1 class="layui-inline">&nbsp;&nbsp;全天在用时间轴</h1>
        <div class="time_line">
            <nobr id="time_line">
            </nobr>
        </div>
    </div>

    <div id="selectLine" >
        <h1 class="marginBottom">可选班次</h1>
        <div class="selectLine">
            <div class="layui-btn-group btnGroup">
                <button type="button" class="layui-btn btnWidth">增加</button>
                <button type="button" class="layui-btn btnWidth">编辑</button>
                <button type="button" class="layui-btn btnWidth">删除</button>
                <button type="button" class="layui-btn btnWidth">增加</button>
                <button type="button" class="layui-btn btnWidth">编辑</button>
                <button type="button" class="layui-btn btnWidth">删除</button>
                <button type="button" class="layui-btn btnWidth">增加</button>
                <button type="button" class="layui-btn btnWidth">编辑</button>
                <button type="button" class="layui-btn btnWidth">删除</button>
            </div>
        </div>
    </div>

    <div class="layui-row tableDiv">
        <div class="time_line_info layui-col-lg5">
            <h1>始程</h1>
            <table class="layui-table" id="startTimeTable" lay-filter="startTable">
            </table>
        </div>
        <div class="time_line_info layui-col-lg5 layui-col-lg-offset1">
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

<%--    工具栏 --%>
<script type="text/html" id="btn">
    {{#  if(d.isRun ==1){  }}
        <text>已在{{d.lineName}}运行</text>
    {{# } }}
    {{#  if(d.isRun ==2){  }}
        <a class="layui-btn layui-btn-sm" lay-event="排班替换">排班替换</a>
    {{# } }}
    {{#  if(d.isRun ==3){  }}
        <a class="layui-btn layui-btn-sm" lay-event="排班">排班</a>
    {{# } }}
</script>
<%--  时间轴  --%>
<script>
    function queryBusWork() {
        var busId = $("#busId").val();
        $.ajax({
            url: '/busWork/queryBusWork',
            data: "id="+busId,
            method:'post',
            dataType:'json',
            success:function(msg){
                var time_line = new Array();
                if(msg.length>0){
                    $.each(msg,function (index,item) {
                        if(index==0){
                            time_line.push({'start':item.departureTime,'end':item.returnArrivalTime,'lineName':item.lineName});
                        }else{
                            $.each
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
        })
    };

    function queryLine() {
        var cityId = $("#cityId").val();
        $.ajax({
            url: '/line/getLineByPage',
            data: "id="+cityId,
            method:'post',
            dataType:'json',
            success:function(msg){

            },
        })
    }
</script>
<%--  表格  --%>
<script>
    layui.use('table', function() {
        var table = layui.table;

        //初始始程表格
        table.render({
            elem: '#startTimeTable'
            ,url: '/time/queryTime?beginOrReturn=1' //数据接口
            ,height:300
            ,cols: [[ //表头
                {field: 'id', title : 'ID' , hide:"true"}
                ,{field: 'busId', title : 'ID' , hide:"true"}
                ,{field: 'requiredTime', title : 'ID' , hide:"true"}
                ,{templet:'#zizeng', align: 'center', title : '序号'}
                ,{field: 'time', align: 'center', title : '时间'}
                ,{field: 'number', align: 'center', title : '发车'}
                ,{field: 'stateId', align:'center', templet: '#btn',title:'操作'}
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
            ,url: '/time/queryTime?beginOrReturn=2' //数据接口
            ,height:300
            ,cols: [[ //表头
                {field: 'id', title : 'ID' , hide:"true"}
                ,{templet:'#zizeng', align: 'center', title : '序号'}
                ,{field: 'time', align: 'center', title : '时间'}
                ,{field: 'number', align: 'center', title : '发车'}
                ,{field: 'stateId', align:'center', templet: '#btn',title:'操作'}
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

        //监听工具条
        table.on('tool(startTable)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）

            if(layEvent == '排班'){ //排班
                layer.confirm('是否排班？',{icon: 3, title:'提示'},function (index) {
                    var busId = $("#busId").val();
                    // var lineId = $("#lineId").val();
                    var lineId = 1;
                    var timeId = data.id;
                    var startTime = data.time;
                    var requiredTime = data.requiredTime;
                    $.ajax({
                        url: "/busWork/insertBusWork",
                        method:'post',
                        dataType:'json',
                        contentType : 'application/json;charset=utf-8',
                        data:JSON.stringify({"busId":busId,"lineId":lineId,"timeId":timeId,"startBeginOrReturn":1,"startTime":startTime,"isAddup":"否","allTime":60}),
                        success:function(msg){
                            if(msg=="success"){
                                layer.msg('排班成功');
                                // layer.closeAll('page');
                                // table.reload('busTable');
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

            } else{ //加开

            }
        });

        //监听工具条
        table.on('tool(returnTable)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）

            if(layEvent == '排班'){ //排班
                console.log(data)
            } else if(layEvent == '排班替换'){ //排班替换

            } else{ //加开

            }
        });
    })
</script>
<%--  自增序号  --%>
<script type="text/html" id="zizeng">
    {{d.LAY_TABLE_INDEX+1}}
</script>
</body>

</html>
