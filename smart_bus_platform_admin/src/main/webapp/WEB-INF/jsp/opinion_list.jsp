<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/8/3
  Time: 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.2</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/xadmin.css">
    <script src="${pageContext.request.contextPath}/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/xadmin.js"></script>
</head>

<body>
<div class="x-nav">
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i>
    </a>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <form class="layui-form layui-col-space5" method="post">
                        <div class="layui-inline layui-show-xs-block">
                            <select id="chooseState" lay-filter="chooseState" lay-search>
                                <option value="">请选择</option>
                                <option value="0">未处理</option>
                                <option value="1">已处理</option>
                            </select>
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <input class="layui-input search-input" autocomplete="off" placeholder="开始日" id="startTime">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <input class="layui-input search-input" autocomplete="off" placeholder="截止日" id="endTime">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" id="userPhone" placeholder="请输入查询用户" class="layui-input">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" id="adminAccount" placeholder="请输入查询管理员" class="layui-input">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <button class="layui-btn" lay-filter="search" id="search" type="button">
                                <i class="layui-icon">&#xe615;</i>
                            </button>
                        </div>
                        <hr>

                    </form>
                </div>
                <div class="layui-card-body">
                    <table class="layui-table"
                           lay-data="{url:'${pageContext.request.contextPath}/opinionController/selectOpinionList',page:true,toolbar: '#toolbarDemo',id:'test'}"
                           lay-filter="test">
                        <thead>
                        <tr>
                            <%--                            <th lay-data="{type:'checkbox'}">ID</th>--%>
                            <th lay-data="{width:60,templet:'#indexTable'}">序号</th>
                            <th lay-data="{field:'userPhone', sort: true, width:120}">用户</th>
                            <th lay-data="{field:'userOpinion'}">意见内容</th>
                            <th lay-data="{field:'opinionTime', sort: true}">时间</th>
                            <th lay-data="{field:'adminAccount', width:80}">处理人员</th>
                            <th lay-data="{field:'replay', minWidth: 100}">回复内容</th>
                            <th lay-data="{field:'replayTime', sort: true}">回复时间</th>
                            <th lay-data="{field:'result'}">处理结果</th>
                            <th lay-data="{fixed: 'right', width:160, align:'left', toolbar: '#barDemo'}"></th>

                        </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<%--意见回复框--%>
<%--<div id="replyDiv">--%>
<%--    <div  style="padding: 20px 100px; font-size: 20px;">意见回复</div>--%>
<%--</div>--%>
</body>
<script type="text/html" id="indexTable">
    <%--实现表格序号的自增--%>
    {{d.LAY_TABLE_INDEX+1}}
</script>
<script type="text/html" id="barDemo">
    {{#  if(d.stateId == '0'){ }}
    <a class="layui-btn layui-btn-xs" lay-event="reply">回复</a>
    {{#  } }}
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="result">处理结果</a>
</script>
<script>

    layui.use('laydate',
        function () {
            var laydate = layui.laydate;

            //执行一个laydate实例
            var startDate = laydate.render({
                elem: '#startTime', //指定元素
                done: function (value, date) {
                    console.log(value); //得到日期生成的值，如：2017-08-18
                    console.log(date); //得到日期时间对象：{year: 2017, month: 8, date: 18, hours: 0, minutes: 0, seconds: 0}
                    console.log(endDate); //得结束的日期时间对象，开启范围选择（range: true）才会返回。对象成员同上。
                    if (value != "") {
                        date.month = date.month - 1;
                        endDate.config.min = date;
                    } else {
                        endDate.config.min = startDate.config.min;
                    }
                }
            });
            //最大时间
            var endDate = laydate.render({
                elem: '#endTime',  //指定元素
                done: function (value, date) {
                    console.log(value); //得到日期生成的值，如：2017-08-18
                    console.log(date); //得到日期时间对象：{year: 2017, month: 8, date: 18, hours: 0, minutes: 0, seconds: 0}
                    console.log(endDate); //得结束的日期时间对象，开启范围选择（range: true）才会返回。对象成员同上。
                    if (value != "") {
                        date.month = date.month - 1;
                        startDate.config.max = date;
                    } else {
                        startDate.config.max = endDate.config.max;
                    }
                }
            });
        });
</script>
<script>
    layui.use('table', function () {
        var table = layui.table;
        var layer = layui.layer;
        //根据条件搜索
        $("#search").click(function () {
            var startTime = $("#startTime").val()
            var endTime = $("#endTime").val()
            var userPhone = $("#userPhone").val()
            var adminAccount = $("#adminAccount").val()
            var state = $("#chooseState").val()

            table.reload('test', {
                url: '${pageContext.request.contextPath}/opinionController/selectOpinionList',
                page: {
                    curr: 1
                },
                where: {
                    startTime: startTime,
                    endTime: endTime,
                    userPhone: userPhone,
                    adminAccount: adminAccount,
                    state: state,
                }
            })
        })

        table.on('tool(test)', function (obj) {
            var data = obj.data;
            var layEven = obj.event;
            var tr = obj.tr;
            console.log(data);
            //管理员提交回复
            if (layEven == 'reply') {
                layer.open({
                    type: 1,
                    title: false,
                    resize: false,
                    move: 'html',
                    area: ['600px,800px'],
                    content: '<div style="padding:15px 100px; font-size: 20px">意见回复</div>' +
                        '<div style="padding:15px;font-size: 15px">客户意见:<br><textarea readonly>' + data.userOpinion + '</textarea></div>' +
                        '<div style="padding:15px;font-size: 15px">回复内容:<br><textarea id="replyText"></textarea></div>',
                    btn: ['确定', '取消'],
                    btnAlign: 'c',
                    yes: function (index) {
                        var replyText = $("#replyText").val();

                        if (replyText == "") {
                            layer.msg("回复内容不能为空");
                        } else {
                            layer.confirm('是否确认提交？',{icon:3,title:'提示'},function () {
                                $.ajax({
                                    url: '${pageContext.request.contextPath}/opinionController/insertReplyContent',
                                    type: 'post',
                                    data: {
                                        'id': data.id,
                                        'reply':replyText
                                    },
                                    success:function (msg) {
                                        if (msg == 'success') {
                                            layer.close(index)
                                            layer.msg('提交成功', {time: 1500}, function () {
                                                location.reload();
                                            });
                                        } else {
                                            layer.msg("出错啦，请联系管理员");
                                        }
                                    }
                                })
                            })
                        }
                    }
                });
            }else if (layEven == 'result') {    //管理员修改处理结果
                var result2 = "";
                // debugger
                if (data.result != undefined && data.result != "") {
                    result2 = data.result;
                }

                layer.open({
                    type: 1,
                    title: false,
                    resize: false,
                    content: '<div style="padding:15px 100px; font-size: 20px">处理结果</div>' +
                        '<div style="padding:15px;font-size: 15px">处理结果：<br><textarea style="width: 230px" id="resultContent">' + result2 + '</textarea></div>',
                    btn: ['确定', '取消'],
                    btnAlign: 'c',
                    yes:function (index) {
                        var resultContent = $("#resultContent").val();

                        if (resultContent == "") {
                            layer.msg("内容不能为空");
                        } else {
                            layer.confirm('是否确认提交？',{icon:3,title:'提示'},function () {
                                $.ajax({
                                    url: '${pageContext.request.contextPath}/opinionController/insertResultContent',
                                    type: 'post',
                                    data:{
                                        'id': data.id,
                                        'result':resultContent
                                    },
                                    success:function (msg) {
                                        if (msg == 'success') {
                                            layer.close(index);
                                            layer.msg('提交成功', {time: 1500}, function () {
                                                location.reload();
                                            });
                                        } else {
                                            layer.msg('出错啦，请联系管理员')
                                        }
                                    }
                                })
                            })
                        }
                    }
                });
            }
        })
    })
</script>
</html>
