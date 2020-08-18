<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/7/30
  Time: 15:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>角色配置</title>
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
                    <table class="layui-table"
                           lay-data="{url:'${pageContext.request.contextPath}/roleConfigController/selectRole',page:true,toolbar: '#toolbarDemo',id:'test'}"
                           lay-filter="test">
                        <thead>
                        <tr>
                            <th lay-data="{ width:80, sort: true,templet:'#indexTable'}">序号</th>
                            <th lay-data="{field:'name', width:120}">角色名称</th>
                            <th lay-data="{fixed: 'right', width:200, align:'left', toolbar: '#barDemo'}"></th>
                        </tr>
                        </thead>
                    </table>

                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/html" id="indexTable">
    <%--    实现行序号的自增--%>
    {{d.LAY_TABLE_INDEX+1}}
</script>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm " lay-event="addRole">新增角色</button>
    </div>
</script>

<script>

    layui.use('layer',
        function () {
            var $ = layui.jquery, layer = layui.layer;
            //触发事件
            var active = {
                offset: function (othis) {
                    var type = othis.data('type')
                        , text = othis.text();

                    layer.open({
                        type: 1
                        , offset: type //具体配置参考：http://www.layui.com/doc/modules/layer.html#offset
                        , id: 'layerDemo' + type //防止重复弹出
                        , content: '<div style="padding: 20px 100px;">' + text + '</div>'
                        , btn: '关闭全部'
                        , btnAlign: 'c' //按钮居中
                        , shade: 0 //不显示遮罩
                        , yes: function () {
                            layer.closeAll();
                        }
                    });
                }
            };

            $('#layerDemo .layui-btn').on('click', function () {
                var othis = $(this), method = othis.data('method');
                active[method] ? active[method].call(this, othis) : '';
            });
        });
</script>
<script>
    layui.use(['table', 'layer'],
        function () {
            var table = layui.table;
            var $ = layui.jquery;
            var layer = layui.layer;
            $("#sreach").click(function () {
                var fileName = $("input[name='fileName']").val();
                var fileType = $("#chooseType").select().val();
                // alert("fileName="+fileName+"fileType="+fileType)
                table.reload('test', {
                    url: '${pageContext.request.contextPath}/adminServlet?methodName=selectFileList',
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
                        case 'addRole':
                            layer.open({
                                type: 1
                                , title: false
                                , content: '<div style="padding: 20px 100px; font-size: 20px"> 新增角色 </div>' +
                                    '<div style="padding: 15px 40px;font-size: 15px">' +
                                    '<input type="text" id="addRoleName"></div>'
                                , btn: ['确定', '取消']
                                , btnAlign: 'c'
                                , shade: 0
                                , yes: function (index) {
                                    var addRole = $("#addRoleName").val();
                                    if (addRole == "") {
                                        layer.msg('新增角色不能为空', {time: 1000});
                                    } else {
                                        layer.confirm('确认提交新角色？', {icon: 3, title: '提示'}, function () {
                                            $.ajax({
                                                url: '${pageContext.request.contextPath}/roleConfigController/addRole',
                                                async: 'true',
                                                type: 'post',
                                                data: 'roleName=' + addRole,
                                                success: function (msg) {
                                                    if (msg == 'success') {
                                                        layer.msg("新增成功", {time: 1000}, function () {
                                                            location.reload();
                                                        });
                                                        layer.close(index);
                                                    } else {
                                                        layer.msg("新增失败");
                                                    }
                                                }
                                            });
                                        });
                                    }
                                    // layer.close(index);
                                }
                            });
                            break;
                    }
                });

            //监听工具条
            table.on('tool(test)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
                var data = obj.data; //获得当前行数据
                var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
                var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）

                console.log(data.id)

                if (layEvent === 'update') { //修改
                    layer.open({
                        type: 1
                        , title: false
                        , content: '<div style="padding: 20px 100px; font-size: 20px"> 修改角色 </div>' +
                            '<div style="padding: 15px 40px;font-size: 17px">' +
                            '<input type="text" id="updateRoleName" value="' + data.name + '"></div>'
                        , btn: ['确定', '取消']
                        , btnAlign: 'c'
                        , shade: 0
                        , yes: function (index) {
                            //获得弹出框的值
                            var roleName = $("#updateRoleName").val();

                            if (roleName == "") {
                                layer.msg('角色名不能为空', {time: 1000});
                            } else if (roleName == data.name) {
                                layer.msg('请先修改角色名', {time: 1000});
                            } else {
                                layer.confirm('确认修改角色？', {icon: 3, title: '提示'}, function () {
                                    $.ajax({
                                        url: '${pageContext.request.contextPath}/roleConfigController/updateRole',
                                        async: 'true',
                                        type: 'post',
                                        data: {
                                            'id': data.id,
                                            'name': roleName
                                        }, //1、将数据转为json格式
                                        // contentType: 'application/json;charset=utf-8', //2、设置请求头信息。3、后台用模型接参数
                                        success: function (msg) {
                                            if (msg == 'success') {
                                                layer.msg("修改成功", {time: 1000}, function () {
                                                    location.reload();
                                                });
                                                layer.close(index);
                                            } else {
                                                layer.msg("修改失败");
                                            }
                                        }
                                    });
                                });
                            }
                        }
                    });
                } else if (layEvent === 'del') { //删除
                    layer.confirm('确定删除该角色？', function (index) {
                        // obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                        // layer.close(index);
                        //向服务端发送删除指令
                        $.ajax({
                            url: '${pageContext.request.contextPath}/roleConfigController/deleteRole',
                            async: 'true',
                            type: 'post',
                            data: 'id=' + data.id,
                            success: function (msg) {
                                if (msg == 'success') {
                                    layer.msg("删除成功", {time: 1000}, function () {
                                        location.reload();
                                    });
                                } else if (msg == 'isUsed') {
                                    layer.msg("该角色已被使用，无法删除");
                                } else {
                                    layer.msg("网络出错啦，请联系管理员");
                                }
                            }
                        })
                        layer.close(index);
                    });
                }
            });

        });
</script>
<script type="text/html" id="barDemo">
    {{#  if(d.id != '1'){ }}

    <a class="layui-btn layui-btn-xs" lay-event="update">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    {{#  } }}

</script>

</html>
