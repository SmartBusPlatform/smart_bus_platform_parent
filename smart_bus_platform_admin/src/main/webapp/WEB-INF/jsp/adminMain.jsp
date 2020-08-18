<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/7/29
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>管理员首页</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/xadminR.css">
    <!-- <link rel="stylesheet" href="./css/theme5.css"> -->
    <script src="${pageContext.request.contextPath}/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <script>
        // 是否开启刷新记忆tab功能
        // var is_remember = false;
        <%--$(function () {--%>
        <%--    window.location.href = "${pageContext.request.contextPath}/";--%>
        <%--})--%>
    </script>
</head>
<body class="index">
<!-- 顶部开始 -->
<div class="container">
    <div class="logo">
        <a href="./index.html">智慧公交系统</a></div>
    <div class="left_open">
        <a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
    </div>
    <ul class="layui-nav left fast-add" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;">模拟数据</a>
            <dl class="layui-nav-child">
                <!-- 二级菜单 -->
                <dd>
                    <a onclick="addUser()">
                        <i class="iconfont">&#xe6a2;</i>高峰客流</a></dd>
<%--                <dd>--%>
<%--                    <a onclick="xadmin.open('弹出自动宽高','http://www.baidu.com')">--%>
<%--                        <i class="iconfont">&#xe6a8;</i>弹出自动宽高</a></dd>--%>
<%--                <dd>--%>
<%--                    <a onclick="xadmin.open('弹出指定宽高','http://www.baidu.com',500,300)">--%>
<%--                        <i class="iconfont">&#xe6a8;</i>弹出指定宽高</a></dd>--%>
<%--                <dd>--%>
<%--                    <a onclick="xadmin.add_tab('在tab打开','member-list.html')">--%>
<%--                        <i class="iconfont">&#xe6b8;</i>在tab打开</a></dd>--%>
<%--                <dd>--%>
<%--                    <a onclick="xadmin.add_tab('在tab打开刷新','member-del.html',true)">--%>
<%--                        <i class="iconfont">&#xe6b8;</i>在tab打开刷新</a></dd>--%>
            </dl>
        </li>
    </ul>
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;">admin</a>
            <dl class="layui-nav-child">
                <!-- 二级菜单 -->
                <dd>
                    <a onclick="xadmin.open('个人信息','http://www.baidu.com')">个人信息</a></dd>
                <dd>
                    <a onclick="xadmin.open('切换帐号','http://www.baidu.com')">切换帐号</a></dd>
                <dd>
                    <a href="./login.html">退出</a></dd>
            </dl>
        </li>
    </ul>
</div>
<!-- 顶部结束 -->
<!-- 中部开始 -->
<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <c:forEach var="i" items="${menus}">
                <li>
                    <a href="javascript:;">
                        <i class="iconfont left-nav-li" lay-tips="分类管理">&#xe723;</i>
                        <cite>${i.menuName}</cite>
                        <i class="iconfont nav_right">&#xe697;</i></a>
                    <ul class="sub-menu">
                        <c:forEach var="j" items="${i.menuList}">
                            <li>
                                <a onclick="xadmin.add_tab('${j.menuName}','${pageContext.request.contextPath}/${j.menuUrl}')">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>${j.menuName}</cite></a>
                            </li>
                        </c:forEach>
                    </ul>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>
<!-- <div class="x-slide_left"></div> -->
<!-- 左侧菜单结束 -->
<!-- 右侧主体开始 -->
<div class="page-content">
    <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
        <ul class="layui-tab-title">
            <li class="home">
                <i class="layui-icon">&#xe68e;</i>我的桌面
            </li>
        </ul>
        <div class="layui-unselect layui-form-select layui-form-selected" id="tab_right">
            <dl>
                <dd data-type="this">关闭当前</dd>
                <dd data-type="other">关闭其它</dd>
                <dd data-type="all">关闭全部</dd>
            </dl>
        </div>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <%--                <iframe src='./welcome.html' frameborder="0" scrolling="yes" class="x-iframe"></iframe>--%>
            </div>
        </div>
        <div id="tab_show"></div>
    </div>
</div>
<div class="page-content-bg"></div>
<style id="theme_style"></style>

<div  id="addUser" hidden>
    <div class="layui-btn-container">
        <input id="number" type="text">
    </div>
</div>
<script>
    function addUser() {
        layui.use('layer',
        function () {
            var layer = layui.layer;
            var $ = layui.$;
            layer.open({
                type: 1
                , title: false
                , content: '<div style="padding: 20px 100px; font-size: 20px"> 乘客数量 </div>' +
                    '<div style="padding: 15px 40px;font-size: 15px">' +
                    '<input type="text" id="addNumber"></div>'
                , btn: ['确定', '取消']
                , btnAlign: 'c'
                , shade: 0
                ,yes:function () {
                    var number = $("#addNumber").val();
                    if (number == "") {
                        layer.msg('数量不能为空', {time: 1000});
                    } else {
                        $.ajax({
                            url: '${pageContext.request.contextPath}/simulationController/simulationAdd',
                            dataType: 'json',
                            type: 'post',
                            data:{
                                'number':number
                            },
                            success:function (msg) {

                            }
                        })
                    }

                }
            });
        })
    }
</script>
</body>

</html>
