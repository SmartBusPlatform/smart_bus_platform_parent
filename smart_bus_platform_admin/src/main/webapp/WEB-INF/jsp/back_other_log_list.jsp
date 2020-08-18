
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>日志列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/xadminR.css">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.5.1.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/lib/layui/layuiR.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/xadmin.js"></script>
</head>

<body class="">
<div class="x-nav">
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">

<%--    toolbar:  '#t   oolbarDemo',--%>
    <div class="layui-row">
        <div class="layui-col-sm-5 layui-col-sm-offset3">
            <table id="log_table"  > </table>
        </div>

    </div>


</div>

<script id="index" type="text/html">
    {{d.LAY_TABLE_INDEX+1}}
</script>
<script type="text/html" id="switchTpl">
    <!-- 这里的 checked 的状态只是演示 -->
<!--    <input type="checkbox" name="sex" value="{{d.id}}" lay-skin="switch" lay-text="女|男" lay-filter="sexDemo" {{ d.id == 10003 ? 'checked' : '' }}>-->
</script>





<script>

    layui.use(['table','form'], function(){
        var table = layui.table;
        var form = layui.form;
        table.render({
            elem: '#log_table',
            url:'${pageContext.request.contextPath}/admin/log/findLog',
            limit: 5,
            page:true,
            limits:[5,10,15,20,25],
            cellMinWidth:100,
            width:500,
            cols: [[
                {type:'checkbox'},
                ,{field: 'operator', title: '操作人' }
                ,{field: 'operation', title: '操作事项' }
                ,{field: 'type', title: '日志类型',width: 280 }
            ]],
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


    });


</script>

</body>

</html>
