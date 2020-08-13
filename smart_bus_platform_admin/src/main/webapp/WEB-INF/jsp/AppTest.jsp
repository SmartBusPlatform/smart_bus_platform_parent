<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/7/9
  Time: 18:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>用户列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/xadmin.css">
    <script src="${pageContext.request.contextPath}/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/xadmin.js"></script>
    <style>
        .layui-table th {
            /*表头内容居中显示*/
            text-align: center;
        }

        .layui-table {
            text-align: center;
        }
    </style>
</head>

<body class="index">
<div class="container">
    <%--    <span class="layui-breadcrumb">--%>
    <%--        <a href="">首页</a>--%>
    <%--        <a href="">演示</a>--%>
    <%--        <a>--%>
    <%--            <cite>导航元素</cite></a>--%>
    <%--    </span>--%>
    <ul class="layui-nav" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;">功能选项</a>
            <dl class="layui-nav-child">
                <!-- 二级菜单 -->
                <dd>
                    <a onclick="xadmin.open('个人信息','userInfo.jsp')">我的文件列表</a></dd>
                <%--                <dd>--%>
                <%--                    <a onclick="xadmin.open('切换帐号','http://www.baidu.com')">切换帐号</a></dd>--%>
                <%--                <dd>--%>
                <%--                    <a href="./login.html">退出</a></dd>--%>
            </dl>
        </li>
        <%--        <li class="layui-nav-item to-index">--%>
        <%--            <a href="/">前台首页</a></li>--%>
        <%--    </ul>--%>

        <ul class="layui-nav right" lay-filter="">
            <li class="layui-nav-item">
                <a href="javascript:;">admin</a>
                <dl class="layui-nav-child">
                    <!-- 二级菜单 -->
                    <dd>
                        <a onclick="xadmin.open('个人信息','userInfo.jsp')">个人信息</a></dd>
                    <dd>
                        <a onclick="xadmin.open('切换帐号','http://www.baidu.com')">切换帐号</a></dd>
                    <dd>
                        <a href="./login.html">退出</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item to-index">
                <a href="/">前台首页</a></li>
        </ul>
        <%--    <a class="layui-btn layui-btn-small" style="text-align:center;margin-top:3px;float:right" onclick="location.reload()">个人信息</a>--%>
        <%--    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">--%>
        <%--        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i>--%>
        <%--    </a>--%>
        <%--    文件上传--%>

</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <%--                文件上传--%>
                <div class="layui-card-body ">
                    <div class="layui-upload">
                        <button type="button" class="layui-btn layui-btn-normal" id="test8">选择文件</button>
                        <button type="button" class="layui-btn" id="test9">开始上传</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData"> 获取选中行数据(下载)</button>
        <%--        <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button >--%>
        <%--        <button class = "layui-btn layui-btn-sm" lay-event = "isAll" > 验证是否全选</button>--%>
    </div>
</script>

<script>
    layui.use('table',
        function () {
            var table = layui.table;

            $("#sreach").click(function () {
                var fileName = $("input[name='fileName']").val();
                var fileType = $("#chooseType").select().val();
                // alert("fileName="+fileName+"fileType="+fileType)
                table.reload('test', {
                    url: '${pageContext.request.contextPath}/adminControl/selectFileList',
                    page: {
                        curr: 1
                    },
                    where: {
                        fileName: fileName,
                        fileType: fileType,
                    }
                })
            });

            //头工具栏事件
            table.on('toolbar(test)',
                function (obj) {
                    var checkStatus = table.checkStatus(obj.config.id);
                    switch (obj.event) {
                        case 'getCheckData':
                            var data = checkStatus.data;
                            // layer.alert(data.fileName);
                            // var data = obj.data;
                            layer.alert(JSON.stringify(data[0]));
                            location.href = "${pageContext.request.contextPath}/fileControl/downloadFile?id=" + data[0].fileId
                        <%--$.ajax({--%>
                        <%--    url:"${pageContext.request.contextPath}/fileControl/downloadFile",--%>
                        <%--    type: "post",--%>
                        <%--    data: JSON.stringify(data[0]),--%>
                        <%--    // ContentType:'application/json;charset=UTF-8',--%>
                        <%--    // contentType : 'application/json;charset=utf-8', //设置请求头信息--%>

                        <%--    success: function (msg) {--%>


                        <%--    }--%>
                        <%--})--%>
                            // layer.alert(JSON.stringify(data));
                            break;
                        case 'getCheckLength':
                            var data = checkStatus.data;
                            layer.msg('选中了：' + data.length + ' 个');
                            break;
                        case 'isAll':
                            layer.msg(checkStatus.isAll ? '全选' : '未全选');
                            break;
                    }
                    ;
                });

            //监听工具条
            table.on('tool(test)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
                var data = obj.data; //获得当前行数据
                var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
                var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）

                if (layEvent === 'detail') { //查看
                    //do somehing
                } else if (layEvent === 'del') { //删除
                    layer.confirm('真的删除行么', function (index) {
                        obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                        layer.close(index);
                        //向服务端发送删除指令
                    });
                } else if (layEvent === 'edit') { //编辑
                    //do something

                    //同步更新缓存对应的值
                    obj.update({
                        username: '123'
                        , title: 'xxx'
                    });
                } else if (layEvent === 'check') {

                } else if (layEvent === 'LAYTABLE_TIPS') {
                    layer.alert('Hi，头部工具栏扩展的右侧图标。');
                }
            });
            // $('#sreach').on('click', function(){
            //     var type = $(this).data('type');
            //     active[type] ? active[type].call(this) : '';
            // });
        });
</script>
<script type="text/html" id="barDemo">
    <%--    <a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>--%>
    <%--    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>--%>
    <%--    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>--%>

    <!-- 这里同样支持 laytpl 语法，如： -->
    {{#  if(d.fileState == '2'){ }}
    <a class="layui-btn layui-btn-xs" lay-event="check">审核</a>
    {{#  } }}
</script>


<script>
    layui.use('upload', function () {
        var $ = layui.jquery
            , upload = layui.upload;

        //普通图片上传
        var uploadInst = upload.render({
            elem: '#test8'
            , url: 'http://localhost:8089/opinionController/addOpinionImage' //改成您自己的上传接口
            , auto: false
            , multiple: true
            , accept: 'images'
            , bindAction: '#test9'
            , before: function () {
                layer.tips('接口地址：' + this.url, this.item, {tips: 1});
            }
            , done: function (res) {
                layer.msg(res.msg);
                console.log(res)
            }
        });
    })
</script>

</html>
