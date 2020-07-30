
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/xadmin.js"></script>
<%--    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/cookie.js"></script>--%>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
   <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>-->
<!--    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>-->
<%--    <![endif]-->--%>
</head>

<body class="">
<div class="x-nav">
<%--      <span class="layui-breadcrumb">--%>
<%--        <a href="">首页</a>--%>
<%--        <a href="">演示</a>--%>
<%--        <a>--%>
<%--          <cite>导航元素</cite></a>--%>
<%--      </span>--%>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <a class="layui-btn layui-btn-normal layui-btn-xs" id="add">新增</a>
<%--    toolbar:  '#t   oolbarDemo',--%>
    <table id="demo"  lay-filter="fileType-filter">
<%--        <thead>--%>
<%--        <tr>--%>

<%--<!--            <th lay-data="{field:'dw_xinzhi',templet: function(d){ return d.dw_xinzhi.titel;}}">学校</th>-->--%>
<%--        </tr>--%>
<%--        </thead>--%>
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
<script type="text/html" id="fileType_tablebar">
    <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">编辑</a>
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
                elem: '#demo',
                url:'${pageContext.request.contextPath}/admin/findFileTypeAll',
                // limit: Number.MAX_VALUE,
                cols: [[
                     {type:'checkbox'}
                    ,{field: 'id', title: 'ID', sort: true, }
                    ,{field: 'name', title: '文件类型名称' }
                    ,{field: '',title:'操作' ,templet:'#fileType_tablebar'}
                ]],
                method:'post',
                // request:{
                //     pageName:'curPage',
                //     limitName:'pageSize',
                // },
                response:{
                    statusName:'status',
                    statusCode:200,
                    dataName:'data'
                }
            });


            table.on('tool(fileType-filter)', function (obj) {
                var event = obj.event;
                if ("edit" === event) {
                    var item = obj.data;
                    layer.open({
                        title : '编辑文件类型信息',
                        type : 1,
                        area : [ '62%', '80%' ],
                        offset:'auto',
                        maxmin : true,
                        shadeClose : true,
                        content : $('#editForm'),
                        btn: ['确定', '取消'],
                        shade: [0.8, '#393D49'],
                        success : function(layero, index) {
                            $("#name").val(item.name);
                        }
                        ,yes:function(num,layero){
                            layer.confirm('是否修改该信息?', {icon: 3, title:'提示'}, function(index){
                                //do something
                                //
                                if($("#name").val().trim().length>0){
                                    if(checkName(table.cache.demo,$("#name").val())){
                                        $.ajax({
                                            type: "post",
                                            url: "${pageContext.request.contextPath}/admin/updFileTypeById",
                                            data: {"id":item.id,"name":$("#name").val()},
                                            dataType: "json",
                                            success: function(data){
                                                if(data.status==200){
                                                    layer.msg(data.msg);
                                                    obj.update({
                                                        name: $("#name").val(),
                                                    })
                                                    layer.close(num); //再执行关闭
                                                }else{
                                                    layer.msg(data.msg);
                                                }
                                            }
                                        });
                                    }else{
                                        layer.msg('该文件类型已存在', {
                                            btn: ['明白了',]
                                        });
                                    }


                                }else{
                                    layer.msg('文件类型名称不能为空', {
                                        btn: ['明白了',]
                                    });
                                }


                            });
                    }

                    });

                }else if("delete"===event){
                    var item = obj.data;
                    layer.confirm('确认是否删除该行数据?', function(index) {
                        $.ajax({
                            url:"${pageContext.request.contextPath}/admin/delFileTypeById",
                            method:"post",
                            dataType:"json",
                            traditional:true,
                            data:{"id":item.id},
                            success:function (data) {
                                if(data.status==200){
                                    layer.msg(data.msg,{
                                        time: 1000
                                    },function () {
                                        window.location.reload();
                                    });

                                }else{
                                    layer.msg(data.msg);
                                }
                            },
                            error:function () {
                                layer.msg("网络繁忙，请稍候重试");
                            }
                        });
                        layer.close(index)
                })
                }
            });

            // //监听单元格编辑
            // table.on('edit(test)', function(obj){
            //     var value = obj.value //得到修改后的值
            //         ,data = obj.data //得到所在行所有键值
            //         ,field = obj.field; //得到字段
            //     layer.msg('[ID: '+ data.id +'] ' + field + ' 字段更改为：'+ value);
            // });
            //
            // //头工具栏事件
            // table.on('toolbar(test)', function(obj){
            //     var checkStatus = table.checkStatus(obj.config.id);
            //     switch(obj.event){
            //         case 'getCheckData':
            //             var data = checkStatus.data;
            //             layer.alert(JSON.stringify(data));
            //             break;
            //         case 'getCheckLength':
            //             var data = checkStatus.data;
            //             layer.msg('选中了：'+ data.length + ' 个');
            //             break;
            //         case 'isAll':
            //             layer.msg(checkStatus.isAll ? '全选': '未全选');
            //             break;
            //     };
            // });
            $("#add").click(function () {
                layer.open({
                    title: '新增会员信息',
                    type: 1,
                    area: ['62%', '80%'],
                    offset: 'auto',
                    maxmin: true,
                    shadeClose: true,
                    content: $('#addForm'),
                    btn: ['确定', '取消'],
                    shade: [0.8, '#393D49'],
                    success: function (layero, index) {
                        $("#add_name").val("");
                        $("#add_downLoadRatio").val("");
                        $("#add_uploadRatio").val("");
                    },
                    yes:function (num,layero) {
                        layer.confirm('确认是否新增文件类型?', {icon: 3, title:'提示'}, function(index){
                            //do something
                            //
                            if($("#add_name").val().trim().length>0){
                                if(checkName(layui.table.cache.demo,$("#add_name"))){
                                    $.ajax({
                                        type: "post",
                                        url: "${pageContext.request.contextPath}/admin/insFileType",
                                        data: {"name":$("#add_name").val()},
                                        dataType: "json",
                                        success: function(data){
                                            if(data.status==200){
                                                layer.msg(data.msg,{
                                                    time:1000
                                                },function () {
                                                    window.location.reload();
                                                });

                                            }else{
                                                layer.msg(data.msg);
                                            }
                                        }
                                    });
                                }else{
                                    layer.msg('该文件类型已存在', {
                                        btn: ['明白了',]
                                    });
                                }

                            }else{
                                layer.msg('文件类型名称不能为空', {
                                    btn: ['明白了',]
                                });
                            }


                        });
                    }

                });
            })
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
