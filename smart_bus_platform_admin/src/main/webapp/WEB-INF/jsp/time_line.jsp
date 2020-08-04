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
            max-width: 90%;
            margin-left: 5%;
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
            margin-left: 10%;
        }
        .selectLine{
            margin-left: 10%;
        }
        .btnGroup{
            max-width: 30%;
        }
        .btnWidth{
            border: 1.5px solid #393D49;
            width: 100px;
        }
        .time_line_info{
            margin-top: 20px;
        }
        .tableBtn{
            width: 100px;
        }
    </style>
</head>
<body style="background-color: #F0F0F0">
    <div>
        <h1 class="marginBottom">全天在用时间轴</h1>
        <div class="time_line">
            <nobr id="time_line">
            </nobr>
        </div>
    </div>

    <div id="selectLine" hidden>
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

    <div class="layui-row">
        <div class="time_line_info layui-col-lg4 layui-col-lg-offset1">
            <h1>始程</h1>
            <table class="layui-table" id="startTimeTable" lay-filter="test">
            </table>
        </div>
        <div class="time_line_info layui-col-lg4 layui-col-lg-offset2">
            <h1>返程</h1>
            <table class="layui-table" id="returnTimeTable" lay-filter="test">
            </table>
        </div>
    </div>
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
    $(function () {
        $.ajax({
            url: '/busWork/queryBusWork',
            data: "id=1",
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
    })
</script>
<%--  表格  --%>
<script>
    layui.use(['table','layer','form'], function() {
        var table = layui.table;

        //初始始程表格
        table.render({
            elem: '#startTimeTable'
            ,url: '/time/queryTime?beginOrReturn=1' //数据接口
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
    })
</script>
<%--  自增序号  --%>
<script type="text/html" id="zizeng">
    {{d.LAY_TABLE_INDEX+1}}
</script>
</body>

</html>
