<%--
  Created by IntelliJ IDEA.
  User: 12614
  Date: 2020/7/30
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.2</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="/static/X-admin/css/font.css">
    <link rel="stylesheet" href="/static/css/xadmin.css">
    <script src="/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/static/js/xadmin.js"></script>
    <script type="text/javascript" src="/static/js/jquery-3.5.1.js"></script>
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        .btnWidth{
            width: 100px;
        }
        .layui-form-select dl{
            max-height: 200px;
            overflow-y: auto;
        }
    </style>
</head>

<body>
<div class="x-nav">
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <form class="layui-form layui-col-space5">
                        <div class="layui-inline layui-show-xs-block layui-col-lg2">
                            <input type="text" name="partner" placeholder="请输入合作商名称" autocomplete="off" class="layui-input"></div>
                        <div class="layui-inline layui-show-xs-block layui-col-lg2">
                            <select name="cityId" id="cityId">
                            </select></div>
                        <div class="layui-inline layui-show-xs-block layui-col-lg2">
                            <select name="typeId" id="typeId">
                            </select></div>
                        <div class="layui-btn-container">
                            <button class="layui-btn btnWidth" lay-submit lay-filter="query">查询</button>
                            <button class="layui-btn btnWidth" type="button" id="insert">新增</button>
                            <button class="layui-btn btnWidth" type="button" onclick="location.reload()">刷新</button>
                        </div>
                    </form>
                </div>
                <div class="layui-card-body ">
                    <table class="layui-table" id="advertiserTable" lay-filter="test">
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<%--    新增、修改窗口    --%>
<div class="layui-form-item layui-row" id="insertPartner" hidden style="margin-top: 20px">
    <from class="layui-form layui-col-lg10 layui-col-lg-offset1" lay-filter="from">
        <div class="layui-form-item">
            <label for="insertName" class="layui-form-label">名称：</label>
            <div class="layui-input-inline">
                <input type="text" id="insertName" name="partner" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="cityId" class="layui-form-label">地区：</label>
            <div class="layui-input-inline">
                <select name="cityId" id="insertCity" lay-verify="required">
                    <option value="">请选择城市</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="insertType" class="layui-form-label">类型：</label>
            <div class="layui-input-inline">
                <select name="typeId" id="insertType" lay-verify="required"></select>
            </div>
        </div>
        <input type="hidden" value="" name="id"></input>
        <div class="layui-form-item" style="text-align: center;margin-top: 150px">
            <button class="layui-btn btnWidth" lay-submit lay-filter="insert">新增</button>
        </div>
    </from>
</div>
</body>
<script type="text/html" id="btn">
    {{#  if(d.stateId != '3'){  }}
        <a class="layui-btn layui-btn-xs" lay-event="修改">修改</a>
        {{#  if(d.stateId == '1'){  }}
            <a class="layui-btn layui-btn-xs" lay-event="禁用">禁用</a>
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="删除">删除</a>
        {{# } }}
        {{#  if(d.stateId == '2'){  }}
            <a class="layui-btn layui-btn-xs" lay-event="启用">启用</a>
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="删除">删除</a>
        {{# } }}
    {{# } }}
</script>
<script>
    layui.use(['table','layer','form'], function() {
        var table = layui.table;
        var form = layui.form;

        //获取城市下拉框
        $.ajax({
            url:'/areas/getProvinceNameAll',
            method:'post',
            dataType:'json',
            data:{"type":2},
            success:function(data){
                $("#cityId").empty();
                $("#cityId").append("<option  value=''>请选择城市</option>");
                $("#insertCity").empty();
                $("#insertCity").append("<option  value=''>请选择城市</option>");
                if(data.status==200){
                    for(var i =0;i<data.data.length;i++){
                        $("#cityId").append("<option  value=\""+data.data[i].id+"\">"+data.data[i].name+"</option>");
                        $("#insertCity").append("<option  value=\""+data.data[i].id+"\">"+data.data[i].name+"</option>");
                    }
                    //重新渲染
                    form.render("select");
                }else{
                    layer.msg(data.msg);
                }
            }
        });

        //初始表格
        table.render({
            elem: '#advertiserTable'
            ,url: '/partner/queryPartnerByPage' //数据接口
            ,page: true //开启分页
            ,limit: 5
            ,limits: [5,10,15,20]
            ,cols: [[ //表头
                {field: 'id', title : 'ID' , hide:"true"}
                ,{field: 'cityId', align: 'center', title:'地区ID'}
                ,{field: 'partner', align: 'center', title : '合作商'}
                ,{field: 'typeName', align: 'center', title : '合作商类型'}
                ,{field: 'cityName', align: 'center', title:'合作商地区'}
                ,{field: 'stateName', align: 'center', title:'状态'}
                ,{field: 'stateId',fixed: 'right', width:'300', align:'center', templet: '#btn',title:'操作'}
            ]]
            ,parseData: function(res){ //res 即为原始返回的数据
                return {
                    "code": res.status, //解析接口状态
                    "msg": res.msg, //解析提示文本
                    "count":res.data.totalRecord, //解析数据长度
                    "data": res.data.list,
                };
            }
            ,loading:true
        });

        //广告商类型
        $.ajax({
            url: "/partner/queryPartnerType",
            method:'post',
            dataType:'json',
            success:function(msg){
                $("#typeId").empty();
                $("#typeId").append("<option value=''>请选择广告商类型</option>");
                $("#insertType").empty();
                $("#insertType").append("<option value=''>请选择广告商类型</option>");
                $.each(msg,function (index,item) {
                    $("#typeId").append("<option value='"+item.value+"'>"+item.name+"</option>");
                    $("#insertType").append("<option value='"+item.value+"'>"+item.name+"</option>");
                });
                form.render('select');
            },
        });

        //查询按钮
        form.on('submit(query)', function(data){
            table.reload('advertiserTable', {
                url: '/partner/queryPartnerByPage'
                ,where: {
                    partner : data.field.partner,
                    cityId : data.field.cityId,
                    typeId : data.field.typeId
                } ,page: {
                    curr: 1 //重新从第 1 页开始
                }
            });

            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

        //新增广告商弹窗
        $("#insert").on('click',function () {
            $("#insertType").val("");
            layer.open({
                type: 1,
                title: '新增广告商',
                content: $('#insertPartner'),
                offset: '150px',
                area: ['450px', '430px'],
                success : function(layero, index){
                    $(layero).find("input").val("");
                    $(layero).find("button").text("新增");
                    $(layero).find("button").attr("lay-filter","insert");
                }
            });
        });

        //新增按钮
        form.on('submit(insert)', function(data){
            layer.confirm('是否新增？',{icon: 3, title:'提示'},function (index) {
                $.ajax({
                    url: "/partner/insertPartner",
                    method:'post',
                    dataType:'json',
                    contentType : 'application/json;charset=utf-8',
                    data:JSON.stringify(data.field),
                    success:function(msg){
                        if(msg=="success"){
                            layer.msg('新增成功');
                            layer.closeAll('page');
                            table.reload('advertiserTable');
                        }else if(msg=="upDataError"){
                            layer.msg('数据出错');
                        }else if(msg=="repeat"){
                            layer.msg('广告商重复');
                        }else{
                            layer.msg('新增失败');
                        }
                    },
                    error:function (msg) {
                        layer.msg('网络出错');
                    }
                });
                layer.close(index);
            });
            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

        //工具条，修改、删除、禁用/启用
        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）

            //禁用、启用、删除
            if(layEvent != '修改'){ //查看
                layer.confirm('是否'+layEvent+'?',{icon: 3, title:'提示'},function (index) {
                    var stateId = '';
                    if(layEvent=='删除'){
                        stateId = 3;
                    }else if(layEvent=='禁用'){
                        stateId = 2;
                    }else{
                        stateId = 1;
                    }
                    $.ajax({
                        url: "/partner/changePartner",
                        method:'post',
                        dataType:'json',
                        contentType : 'application/json;charset=utf-8',
                        data:JSON.stringify({"id":data.id,'stateId':stateId}),
                        success:function(msg){
                            if(msg=="success"){
                                layer.msg('修改成功');
                                obj.update({
                                    stateName : layEvent,
                                    stateId : stateId
                                });
                            }else if(msg=="upDataError"){
                                layer.msg('数据出错');
                            }else{
                                layer.msg('修改失败');
                            }
                        },
                        error:function (msg) {
                            layer.msg('网络出错');
                        }
                    });
                    layer.close(index);
                });
            //修改广告商
            }else{
                $("#insertType").val("");
                layer.open({
                    type: 1,
                    title: '修改广告商',
                    content: $('#insertPartner'),
                    offset: '150px',
                    area: ['450px', '430px'],
                    success : function(layero, index){
                        form.val("from", {
                            "partner": data.partner
                            ,"id": data.id
                            ,"cityId": data.cityId
                            ,"typeId": data.typeId
                        });
                        $(layero).find("button").text("修改");
                        $(layero).find("button").attr("lay-filter","change");
                        //重新渲染
                        form.render("select");
                    }
                });
            }
        });

        //修改按钮
        form.on('submit(change)', function(data){
            layer.confirm('是否修改？',{icon: 3, title:'提示'},function (index) {
                $.ajax({
                    url: "/partner/changePartner",
                    method:'post',
                    dataType:'json',
                    contentType : 'application/json;charset=utf-8',
                    data:JSON.stringify(data.field),
                    success:function(msg){
                        if(msg=="success"){
                            layer.msg('修改成功');
                            layer.closeAll('page');
                            table.reload('advertiserTable');
                        }else if(msg=="upDataError"){
                            layer.msg('数据出错');
                        }else if(msg=="repeat"){
                            layer.msg('广告商重复');
                        }else{
                            layer.msg('新增失败');
                        }
                    },
                    error:function (msg) {
                        layer.msg('网络出错');
                    }
                });
                layer.close(index);
            });
            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });
    });
</script>

</html>