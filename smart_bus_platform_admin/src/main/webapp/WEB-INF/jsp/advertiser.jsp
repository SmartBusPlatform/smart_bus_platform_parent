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
        input{
            margin-top: 5px;
        }
        .btnWidth{
            margin-top: 10px;
            width: 100px;
        }
        .lookImage{
            width: 200px;
            height: 50px;
        }
        .layui-form-select dl{
            max-height: 200px;
            overflow-y: auto;
        }
        #lookImage{
            width: 400px;
            height: 200px;
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
                            <div class="layui-inline">
                                <label class="layui-form-label">合作商：</label>
                                <div class="layui-input-inline">
                                    <input type="text" name="partner" autocomplete="off" class="layui-input" placeholder="请输入合作商">
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">是否轮播：</label>
                                <div class="layui-input-inline">
                                    <select name="isCarousel">
                                        <option value="">请选择</option>
                                        <option value="1">是</option>
                                        <option value="2">否</option>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">状态：</label>
                                <div class="layui-input-inline">
                                    <select name="stateId">
                                        <option value="">请选择</option>
                                        <option value="1">启用</option>
                                        <option value="2">禁用</option>
                                        <option value="3">到期</option>
                                        <option value="4">删除</option>
                                    </select>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <div class="layui-btn-container">
                                    <button class="layui-btn btnWidth" lay-submit lay-filter="query">查询</button>
                                    <button class="layui-btn btnWidth" type="button" id="insert">新增</button>
                                    <button class="layui-btn btnWidth" type="button" onclick="location.reload()">刷新</button>
                                </div>
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
<%--    新增窗口    --%>
<div class="layui-form-item layui-row" id="insertAdvertiser" hidden style="margin-top: 20px">
    <from class="layui-form layui-col-lg10 layui-col-lg-offset1" lay-filter="insert">
        <div class="layui-form-item">
            <label class="layui-form-label">合作商：</label>
            <div class="layui-input-inline">
                <select id="insertPartner" name="partnerId" lay-verify="required" lay-filter="partnerId">
                    <option value=''>请选择广告商</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="insertTitle" class="layui-form-label">标题：</label>
            <div class="layui-input-inline">
                <input type="text" id="insertTitle" name="title" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="insertEndTime" class="layui-form-label">到期时间：</label>
            <div class="layui-input-inline">
                <input type="text" id="insertEndTime" name="endTime" lay-verify="required" autocomplete="off" class="layui-input" placeholder="到期时间">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="insertCarousel" class="layui-form-label">是否轮播：</label>
            <div class="layui-input-inline">
                <select name="isCarousel" id="insertCarousel" lay-verify="required" lay-filter="isCarousel">
                    <option value="">请选择</option>
                    <option value="1">是</option>
                    <option value="2">否</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="insertX" class="layui-form-label">经度：</label>
            <div class="layui-input-inline">
                <input type="text" id="insertX" name="advertiserX" lay-verify="x" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="insertY" class="layui-form-label">纬度：</label>
            <div class="layui-input-inline">
                <input type="text" id="insertY" name="advertiserY" lay-verify="y" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" style="text-align: center">
            <button type="button" class="layui-btn" id="uploadImage">上传图片</button>
            <div class="layui-upload-list">
                <img class="layui-upload-img lookImage" id="uploadLookImage">
            </div>
        </div>
        <input type="hidden" name="imgUrl" id="imgUrl" lay-verify="img">
        <div class="layui-form-item" style="text-align: center">
            <button class="layui-btn btnWidth" lay-submit lay-filter="insert" id="insertAdvertiserBtn">新增</button>
        </div>
    </from>
</div>
<%--    查看窗口    --%>
<div class="layui-form-item layui-row" id="lookAdvertiser" hidden style="margin-top: 20px;text-align: center">
    <img id="lookImage">
</div>
<%--    修改窗口    --%>
<div class="layui-form-item layui-row" id="changeAdvertiser" hidden style="margin-top: 20px">
    <from class="layui-form layui-col-lg10 layui-col-lg-offset1" lay-filter="change">
        <div class="layui-form-item">
            <label for="changeTitle" class="layui-form-label">标题：</label>
            <div class="layui-input-inline">
                <input type="text" id="changeTitle" name="title" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="changeEndTime" class="layui-form-label">到期时间：</label>
            <div class="layui-input-inline">
                <input type="text" id="changeEndTime" name="endTime" lay-verify="required" autocomplete="off" class="layui-input" placeholder="到期时间">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="changeCarousel" class="layui-form-label">是否轮播：</label>
            <div class="layui-input-inline">
                <select name="isCarousel" id="changeCarousel" lay-verify="required">
                    <option value="1">是</option>
                    <option value="2">否</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="changeX" class="layui-form-label">经度：</label>
            <div class="layui-input-inline">
                <input type="text" id="changeX" name="advertiserX" required="" lay-verify="x" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="changeY" class="layui-form-label">纬度：</label>
            <div class="layui-input-inline">
                <input type="text" id="changeY" name="advertiserY" required="" lay-verify="y" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item" style="text-align: center">
            <button type="button" class="layui-btn" id="changeImage">修改图片</button>
        </div>
        <input type="hidden" value="" id="imagePath">
        <input type="hidden" value="" name="id">
        <div class="layui-form-item" style="text-align: center">
            <button class="layui-btn btnWidth" lay-submit lay-filter="change">修改</button>
        </div>
    </from>
</div>
</body>
<%-- 日期控件 --%>
<script>
    layui.use('laydate', function() {
        var laydate = layui.laydate;
        //执行一个laydate实例
        laydate.render({
            elem: '#insertEndTime' //指定元素
        });
        laydate.render({
            elem: '#changeEndTime' //指定元素
        });
    });
</script>
<%--  工具条  --%>
<script type="text/html" id="btn">
    {{#  if(d.stateId != '4'){  }}
        <a class="layui-btn layui-btn-xs" lay-event="查看">查看</a>
        <a class="layui-btn layui-btn-xs" lay-event="修改">修改</a>
        {{#  if(d.stateId == '1'){  }}
            <a class="layui-btn layui-btn-xs" lay-event="禁用">禁用</a>
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="删除">删除</a>
        {{# } }}
        {{#  if(d.stateId == '2'){  }}
            <a class="layui-btn layui-btn-xs" lay-event="启用">启用</a>
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="删除">删除</a>
        {{# } }}
        {{#  if(d.stateId == '3'){  }}
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="删除">删除</a>
        {{# } }}
    {{# } }}
</script>
<script>
    layui.use(['table','layer','form','upload'], function() {
        var table = layui.table;
        var form = layui.form;
        var upload = layui.upload;

        //初始表格
        table.render({
            elem: '#advertiserTable'
            ,url: '/advertiser/queryAdvertiserByPage' //数据接口
            ,page: true //开启分页
            ,limit: 5
            ,limits: [5,10,15,20]
            ,cols: [[ //表头
                {field: 'id', title : 'ID' , hide:"true"}
                ,{field: 'advertiserX', title : '经度' , hide:"true"}
                ,{field: 'advertiserY', title : '纬度' , hide:"true"}
                ,{field: 'partnerName', align: 'center', title : '合作商'}
                ,{field: 'title', align: 'center', title : '广告标题'}
                ,{field: 'carouselName', align: 'center', title:'是否首页轮播'}
                ,{field: 'coordinate', align: 'center', title:'广告坐标'}
                ,{field: 'releaseTime', align: 'center', title:'发布时间'}
                ,{field: 'endTime', align: 'center', title:'到期时间'}
                ,{field: 'stateName', align: 'center', title:'状态'}
                ,{field: 'stateId', fixed: 'right', width:'300', align:'center', templet: '#btn',title:'操作'}
            ]]
            ,parseData: function(res){ //res 即为原始返回的数据
                return {
                    "code": res.status, //解析接口状态
                    "msg": res.msg, //解析提示文本
                    "count": res.data.totalRecord, //解析数据长度
                    "data": res.data.list,
                };
            }
        });

        //查询按钮
        form.on('submit(query)', function(data){
            table.reload('advertiserTable', {
                url: '/advertiser/queryAdvertiserByPage'
                ,where: {
                    partner : data.field.partner,
                    isCarousel : data.field.isCarousel,
                    stateId : data.field.stateId
                } ,page: {
                    curr: 1 //重新从第 1 页开始
                }
            });

            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

        //新增广告弹窗
        $("#insert").on('click',function () {
            $("#insertAdvertiser").find("input").val("");
            form.render('select');
            $.ajax({
                url: '/partner/queryPartner',
                method:'post',
                dataType:'json',
                success:function(msg){
                    $("#insertPartner").empty();
                    $("#insertPartner").append("<option value=''>请选择广告商</option>");
                    $.each(msg,function (index,item) {
                        $("#insertPartner").append("<option value='"+item.id+"'>"+item.partner+"</option>");
                    });
                    form.render('select');
                    layer.open({
                        type: 1,
                        title: '新增广告',
                        content: $('#insertAdvertiser'),
                        area: ['450px', '600px'],
                        success : function(layero, index){
                        }
                    });
                },
            })
        });

        //自定义表单验证
        form.verify({
            x: function(value, item){ //value：表单的值、item：表单的DOM对象
                if(value.trim().length==0){
                    return '必填项不能为空';
                }
                if(!/^(\-|\+)?(((\d|[1-9]\d|1[0-7]\d|0{1,3})\.\d{0,6})|(\d|[1-9]\d|1[0-7]\d|0{1,3})|180\.0{0,6}|180)$/.test(value)){
                    return '经度整数部分为0-180,小数部分为0到6位!';
                }
            },
            y:function(value, item){ //value：表单的值、item：表单的DOM对象
                if(value.trim().length==0){
                    return '必填项不能为空';
                }
                if(! /^(\-|\+)?([0-8]?\d{1}\.\d{0,6}|90\.0{0,6}|[0-8]?\d{1}|90)$/.test(value)){
                    return '纬度整数部分为0-90,小数部分为0到6位!';
                }
            },
            img:function (value, item) {
                if(value.trim().length==0){
                    return '请选择图片';
                }
            }
        });

        //工具条，修改、删除、禁用/启用
        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）

            //查看
            if(layEvent == '查看'){
                $("#lookImage").removeAttr('src')
                $("#lookImage").attr('src', "/advertiser/queryAdvertiserImage?id="+data.id+"&time="+new Date().getTime());
                layer.open({
                    type: 1,
                    title: '查看广告',
                    content: $('#lookAdvertiser'),
                    offset: '150px',
                    area: ['500px', '300px'],
                });
            //修改广告数据
            }else if (layEvent == '修改'){
                layer.open({
                    type: 1,
                    title: '修改广告',
                    content: $('#changeAdvertiser'),
                    offset: '150px',
                    area: ['450px', '430px'],
                    success : function(layero, index){
                        $("#imagePath").val(data.imgUrl);
                        form.val('change', {
                            "title": data.title
                            ,"endTime": data.endTime
                            ,"isCarousel": data.isCarousel
                            ,"advertiserX": data.advertiserX //复选框选中状态
                            ,"advertiserY": data.advertiserY //开关状态
                            ,"id": data.id
                        });
                    }
                });
            //禁用、启用、删除
            }else{
                layer.confirm('是否'+layEvent+'?',{icon: 3, title:'提示'},function (index) {
                    var stateId = '';
                    if(layEvent=='删除'){
                        stateId = 4;
                    }else if(layEvent=='禁用'){
                        stateId = 2;
                    }else{
                        stateId = 1;
                    }
                    $.ajax({
                        url: "/advertiser/changeAdvertiser",
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
            }
        });

        //修改按钮
        form.on('submit(change)', function(data){
            layer.confirm('是否修改？',{icon: 3, title:'提示'},function (index) {
                $.ajax({
                    url: "/advertiser/changeAdvertiser",
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
            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

        //广告图片上传
        upload.render({
            elem: '#uploadImage'
            ,url: '/advertiser/insertIamge' //改成您自己的上传接口
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#uploadLookImage').attr('src', result);
                });
            }
            ,done: function(res){
                if (res.msg=='error'){
                    layer.msg("服务器出错，请重新上传");
                    $('#uploadLookImage').attr('src', "");
                }else if(res.msg=='repeat'){
                    layer.msg("文件存在,请重新上传");
                    $('#uploadLookImage').attr('src', "");
                }else{
                    $("#imgUrl").val(res.msg);
                }
            }
            ,error: function(){
                layer.alert("上传失败，请重试");
            }
        });

        //修改图片上传
        upload.render({
            elem: '#changeImage'
            ,url: '/advertiser/insertIamge' //改成您自己的上传接口
            ,data: {
                filePath: function () {
                    return $('#imagePath').val();
                }
            }
            ,done: function(res){
                if (res.msg=='error'){
                    layer.msg("服务器出错，修改失败");
                }else{
                    layer.msg("修改成功");
                }
            }
            ,error: function(res){
                layer.alert("上传失败，请重试");
            }
        });


        // 新增按钮
        form.on('submit(insert)', function(data){
            layer.confirm('是否新增？',{icon: 3, title:'提示'},function (index) {
                $.ajax({
                    url: "/advertiser/insertAdvertiser",
                    type:'post',
                    dataType:'json',
                    data : JSON.stringify(data.field),
                    contentType: 'application/json',
                    success:function(msg){
                        if(msg=="success"){
                            layer.msg('新增成功');
                            layer.closeAll('page');
                            table.reload('advertiserTable');
                        }else if(msg=="upDataError"){
                            layer.msg('数据出错');
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