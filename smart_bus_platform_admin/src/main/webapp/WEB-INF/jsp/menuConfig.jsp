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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/lib/layui/css/layui.css" media="all">
    <script src="${pageContext.request.contextPath}/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/xadmin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>

</head>
<body>


<div class="x-nav">
            <span class="layui-breadcrumb">
                <a href="">首页</a>
                <a href="">演示</a>
                <a>
                    <cite>导航元素</cite></a>
            </span>
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
                    <form class="layui-form layui-col-space5">

                        <div class="layui-inline">
                            <select id="chooseType" lay-filter="chooseType" lay-search>
                                <option value="0">请选择角色</option>
                            </select>
                        </div>
                    </form>
                </div>
                <div class="layui-card-body ">
                    <div class="layui-btn-container">
                        <button id="save" type="button" class="layui-btn layui-btn-sm" lay-demo="getChecked">保存</button>
<%--                        <button type="button" class="layui-btn layui-btn-sm" lay-demo="setChecked">勾选指定节点</button>--%>
<%--                        <button id="reload" type="button" class="layui-btn layui-btn-sm">重载实例</button>--%>
                    </div>
                    <div id="test12" class="demo-tree-more"></div>

                </div>
            </div>
        </div>
    </div>
</div>

<script>

    <%--$(function () {--%>
    <%--    $.ajax({--%>
    <%--        url: "${pageContext.request.contextPath}/menuConfigController/selectMenuConfig"--%>
    <%--        async: true,--%>
    <%--        data:['roleID',],--%>
    <%--        dataType: "json",--%>
    <%--    })--%>
    <%--});--%>


    // layui.use(['tree', 'util', 'table'], function () {
    //     var tree = layui.tree
    //         , layer = layui.layer
    //         , util = layui.util
    //         , $ = layui.$
    //         , table = layui.table

    //     tree.render({
    //         elem: '#test12'
    //         , data: data
    //         , showCheckbox: true  //是否显示复选框
    //         , id: 'demoId1'
    //         , isJump: true //是否允许点击节点时弹出新窗口跳转
    //         , click: function (obj) {
    //             var data = obj.data;  //获取当前点击的节点数据
    //             layer.msg('状态：' + obj.state + '<br>节点数据：' + JSON.stringify(data));
    //         }
    //     });
    //     //按钮事件
    //     // util.event('lay-demo', {
    //     //     getChecked: function (othis) {
    //     //         var checkedData = tree.getChecked('demoId1'); //获取选中节点的数据
    //     //
    //     //         layer.alert(JSON.stringify(checkedData), {shade: 0});
    //     //         console.log(checkedData);
    //     //     }
    //     //     , setChecked: function () {
    //     //         tree.setChecked('demoId1', [12, 16]); //勾选指定节点
    //     //     }
    //     //     , reload: function () {
    //     //         //重载实例
    //     //         tree.reload('demoId1', {});
    //     //
    //     //     }
    //     // });
    //
    //     $("#111").click(function () {
    //         var checkedData = tree.getChecked('demoId1'); //获取选中节点的数据
    //         layer.alert(JSON.stringify(checkedData), {shade: 0});
    //         console.log(checkedData);
    //     })
    //
    // })


</script>

</body>
<script>

    var beforeId;
    layui.use(['form', 'tree', 'util', 'table'], function () {
        var form = layui.form
            , tree = layui.tree
            , layer = layui.layer
            , util = layui.util
            , $ = layui.$
            , table = layui.table
        $.ajax({
            url: "${pageContext.request.contextPath}/admin/roleConfigController/selectRole",
            type: "post",
            dataType: "json",
            success: function (data) {
                $.each(data.data, function (index, item) {
                    var id = data.data[index].id;
                    var name = data.data[index].name;
                    $("#chooseType").append("<option value='" + id + "'>" + name + "</option>");
                    //form.render()渲染将option添加进去
                    form.render();
                })
            }
        });
        //下拉框主动触发事件
        form.on('select(chooseType)', function (id) {
            if (id.value != 0) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/admin/menuConfigController/selectMenuConfig",
                    type: "post",
                    dataType: "json",
                    data: {
                        'roleId': id.value
                    },
                    success: function (data) {
                        console.log(data.trees)
                        console.log(data.idList)
                        //渲染树形
                        tree.render({
                            elem: '#test12'
                            , data: data.trees
                            , showCheckbox: true  //是否显示复选框
                            , id: 'demoId1'
                            // , edit: ['update']
                        });
                        tree.setChecked('demoId1', data.idList); //批量勾选 id 为 2、3 的节点
                        beforeId = data.idList;
                    }
                });
            } else {
                $("#test12").children().remove();
            }
        })
        //保存选中的
        $("#save").click(function () {
            var roleId = $("#chooseType").select().val();
            if (roleId != 0) {  //判断是否选择了角色
                layer.confirm('确认提交菜单修改？', function () {
                        var checkedData = tree.getChecked('demoId1'); //获取选中节点的数据
                        var id = getCheckedId(checkedData);       //调用方法计算出所有选中的节点id
                        // layer.alert(JSON.stringify(idList), {shade: 0});
                        var afterId = id.sort(function (a, b) {
                            return a-b;
                        })
                        console.log(afterId);
                        console.log(beforeId);
                    if (afterId.toString() != beforeId.toString()) {   //数组没办法直接比较，要转字符串
                        $.ajax({
                             url: "${pageContext.request.contextPath}/admin/menuConfigController/changeRoleMenuTable"
                            ,type: "post"
                            ,data: {
                                'roleId': roleId
                                ,'beforeId':JSON.stringify(beforeId)
                                ,'afterId':JSON.stringify(afterId)
                                // 'beforeId':beforeId
                                // ,'afterId':afterId
                            }
                            // ,contentType: 'application/json;charset=utf-8'
                            // ,traditional:true  //用传统方式序列化数据
                            ,success:function (msg) {
                                if (msg == "success") {
                                    layer.msg("保存成功", {icon: 1,time: 2000,shade:0.3},function () {
                                        location.reload();
                                    });
                                } else {
                                    layer.msg("系统出错了，请联系管理员！",{icon:0})
                                }
                            }
                        })
                    } else {
                        layer.msg("您还未做任何修改",{time:2000});
                    }
                });
            } else {
                layer.msg("请先选择角色",{time:1000});
            }
        })

    });
</script>
<script>
    //获取所有选中的节点id
    function getCheckedId(jsonObj) {
        var id = new Array();
        $.each(jsonObj, function (index, item) {
            id.push(item.id);
            $.each(item.children,function (index2,item2) {
                if (item2.id != null) {
                    id.push(item2.id )
                }
            })
        });
        return id;
    }
</script>

</html>
