<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/7/9/009
  Time: 16:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html  class="x-admin-sm">
<head>
    <meta charset="UTF-8">
    <title>后台登录</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/lib/layui/layui.js" charset="utf-8"></script>
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="login-bg">

<div class="login layui-anim layui-anim-up">
    <div class="message">管理登录</div>
    <div id="darkbannerwrap"></div>

    <form method="post" class="layui-form" action="/login">
        <input name="account" placeholder="用户名"  type="text" lay-verify="required" class="layui-input" >
        <hr class="hr15">
        <input name="password" lay-verify="required" placeholder="密码"  type="password" class="layui-input">
        <hr class="hr15">
        <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
        <hr class="hr20" >
    </form>
</div>

<script>
    $(function  () {
        layui.use('form', function(){
            var form = layui.form;
            var layer = layui.layer;
            //监听提交
            form.on('submit(login)', function(data){
                console.log(data);
                // alert(888)
                $.ajax({
                    url: '${pageContext.request.contextPath}/adminControl/login',
                    type: 'post',
                    dataType: 'json',
                    data: {
                        "account": data.field.account,
                        "password": data.field.password
                    },
                    success:function (msg) {
                        if (msg.code == '00') {
                            location.href = '${pageContext.request.contextPath}/adminController/selectRoleMenus';
                        } else {
                            layer.msg(msg.message);
                        }
                    }

                })
                    <%--location.href='${pageContext.request.contextPath}/adminController/selectRoleMenus';--%>
                return false;
            });
        });
    })


</script>
<!-- 底部结束 -->
</body>
</html>
