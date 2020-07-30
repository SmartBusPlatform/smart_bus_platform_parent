<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.1</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/xadmin.css">
<!--    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.5.1.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/xadmin.js"></script>
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
    <a class="layui-btn layui-btn-normal layui-btn-xs" id="add">新增</a>
    <table id="areas_table"  lay-filter="fileType-filter">

    </table>

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

<div class="site-text" style="margin: 12%; display: none" id="editForm"  >
    <form class="layui-form" id="book" method="post" lay-filter="example">
        <div class="layui-form-item">
            <label class="layui-form-label">文件类型名称</label>
            <div class="layui-input-block">
                <input type="text" id="name" name="name" lay-verify="name" autocomplete="off" placeholder="请输入会员名称" class="layui-input">
            </div>
        </div>
    </form>
</div>

<div class="site-text" style="margin: 12%; display: none" id="addForm"  >
    <form class="layui-form" id="" method="post" lay-filter="example">
        <div class="layui-form-item">
            <label class="layui-form-label">文件类型名称</label>
            <div class="layui-input-block">
                <input type="text" id="add_name" name="add_name" lay-verify="add_name" autocomplete="off" placeholder="请输入会员名称" class="layui-input">
            </div>
        </div>
    </form>
</div>
<script>

        layui.use(['table','form'], function(){
            var table = layui.table;
            var form = layui.form;
            table.render({
                elem: '#areas_table',
                url:'${pageContext.request.contextPath}/areas/getAreasByPage',
                cols: [[
                    {type:'checkbox'},
                     {field: 'cityId', title: 'ID', sort: true, }
                    ,{field: 'provinceName', title: '省',sort: true,  }
                    ,{field: 'cityName', title: '城市名称' }
                    ,{field: 'siteNum', title: '站点数' }
                    ,{field: 'lineNum', title: '线路数' }
                    ,{field: '',title:'操作' ,templet:'#city_tablebar'}
                ]],
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
                    countName:'totalRecord',
                    dataName:'list'
                }
            });


        });


    function checkName(arr,name) {
        for(let i=0;i<arr.length;i++){
            if(arr[i].name==name){
                return false
            }
        }
        return true;
    }
</script>

</body>

</html>
