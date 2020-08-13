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
        .layui-input{
            width: 200px;
        }
        .layui-form-label{
            width: 100px;
        }
        .btnWidth{
            margin-top: 10px;
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
                    <form class="layui-form layui-col-space5" method="post" action="">
                        <div class="layui-inline">
                            <label class="layui-form-label">车牌：</label>
                            <div class="layui-input-inline">
                                <input type="text" name="number" autocomplete="off" class="layui-input" placeholder="请输入">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">线路：</label>
                            <div class="layui-input-inline">
                                <input type="text" name="lineName" autocomplete="off" class="layui-input" placeholder="请输入">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">维护人：</label>
                            <div class="layui-input-inline">
                                <input type="text" name="repairmanName" autocomplete="off" class="layui-input" placeholder="请输入">
                            </div>
                        </div>
                        <p></p>
                        <div class="layui-inline">
                            <label class="layui-form-label">车辆状态：</label>
                            <div class="layui-input-inline">
                                <select name="stateId">
                                    <option value="">请选择</option>
                                    <option value="1">在用</option>
                                    <option value="2">故障待救援</option>
                                    <option value="3">维修</option>
                                    <option value="4">报废停用</option>
                                    <option value="5">删除</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">是否固定班次：</label>
                            <div class="layui-input-inline">
                                <select name="isFixedLine">
                                    <option value="">请选择</option>
                                    <option value="是">是</option>
                                    <option value="否">否</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <div class="layui-btn-container" style="margin-left: 60px">
                                <button class="layui-btn btnWidth" lay-submit lay-filter="query">查询</button>
                                <button class="layui-btn btnWidth" type="button" id="insert">新增</button>
                                <button class="layui-btn btnWidth" type="button" onclick="location.reload()">刷新</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="layui-card-body ">
                    <table class="layui-table" id="busTable" lay-filter="test">
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<%--    新增    --%>
<div class="layui-form-item layui-row" id="insertBus" hidden style="margin-top: 20px">
    <from class="layui-form layui-col-lg10 layui-col-lg-offset1" lay-filter="insert">
        <div class="layui-form-item">
            <label for="insertProvince" class="layui-form-label">省份：</label>
            <div class="layui-input-inline">
                <select id="insertProvince" lay-verify="required" lay-filter="insertProvince">
                    <option value="">请选择城市</option>
                    <option value="4">福建</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="insertCity" class="layui-form-label">城市：</label>
            <div class="layui-input-inline">
                <select name="cityId" id="insertCity" lay-verify="required">
                    <option value="">请先选择省份</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="insertNumber" class="layui-form-label">车牌：</label>
            <div class="layui-input-inline">
                <input type="text" name="number" id="insertNumber"  lay-verify="number" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="insertRepairmanId" class="layui-form-label">维护人：</label>
            <div class="layui-input-inline">
                <select name="repairmanId" id="insertRepairmanId" lay-verify="required">
                    <option value="">请先选择维护人</option>
                    <option value="2">吴师傅</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="insertEndTime" class="layui-form-label">车辆报废时间：</label>
            <div class="layui-input-inline">
                <input type="text" name="endTime" id="insertEndTime"  lay-verify="required" autocomplete="off" class="layui-input" placeholder="车辆报废时间">
            </div>
        </div>
        <div class="layui-form-item" style="text-align: center;margin-top: 30px">
            <button class="layui-btn btnWidth" lay-submit lay-filter="insert">新增</button>
        </div>
    </from>
</div>
<%--    修改窗口    --%>
<div class="layui-form-item layui-row" id="changeBus" hidden style="margin-top: 20px">
    <from class="layui-form layui-col-lg10 layui-col-lg-offset1" lay-filter="change">
        <div class="layui-form-item">
            <label for="changeNumber" class="layui-form-label">车牌：</label>
            <div class="layui-input-inline">
                <input type="text" id="changeNumber" name="number" lay-verify="number" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="changeRepairmanid" class="layui-form-label">维护人：</label>
            <div class="layui-input-inline">
                <select name="repairmanId" id="changeRepairmanid" lay-verify="required">
                    <option value="2">吴师傅</option>
                </select>
            </div>
        </div>
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
    });
</script>
<script type="text/html" id="btn">
    {{#  if(d.stateId != '5'){  }}
        {{#  if(d.stateId != '4'){  }}
            {{#  if(d.stateId == '1'){  }}
            <a class="layui-btn layui-btn-xs" lay-event="排班">排班</a>
            {{# } }}
            <a class="layui-btn layui-btn-xs" lay-event="修改">修改</a>
            <a class="layui-btn layui-btn-xs" lay-event="报废停用">报废停用</a>
        {{# } }}
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="删除">删除</a>
    {{# } }}
</script>
<script>
    layui.use(['table','layer','form'], function() {
        var table = layui.table;
        var form = layui.form;

        //初始表格
        table.render({
            elem: '#busTable'
            ,url: '/bus/queryBusByPage' //数据接口
            ,page: true //开启分页
            ,limit: 5
            ,limits: [5,10,15,20]
            ,cols: [[ //表头
                {field: 'id', hide:"true"}
                ,{field: 'cityId', hide:"true"}
                ,{field: 'repairmanId', hide:"true"}
                ,{field: 'provinceId', hide:"true"}
                ,{field: 'number', align: 'center', title : '车牌'}
                ,{field: 'repairmanName', align: 'center', title : '维护人'}
                ,{field: 'lineName', align: 'center', title:'线路'}
                ,{field: 'isFixedLine', align: 'center', title:'是否固定线路'}
                ,{field: 'userTimeRatioStr', align: 'center', title:'全天在用时间比例'}
                ,{field: 'endTime', align: 'center', title:'车辆报废时间'}
                ,{field: 'stateName', align: 'center', title:'车辆状态'}
                ,{field: 'cityName', align: 'center', title:'所在城市'}
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

        //查询按钮
        form.on('submit(query)', function(data){
            table.reload('busTable', {
                url: '/bus/queryBusByPage'
                ,where: {
                    isFixedLine : data.field.isFixedLine,
                    stateId : data.field.stateId,
                    lineName : data.field.lineName,
                    repairmanName : data.field.repairmanName,
                    number : data.field.number
                } ,page: {
                    curr: 1 //重新从第 1 页开始
                }
            });
            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });

        //新增车辆弹窗
        $("#insert").on('click',function () {
            getProvince(null,true);
            layer.open({
                type: 1,
                title: '新增车辆',
                content: $('#insertBus'),
                offset: '150px',
                area: ['450px', '430px'],
                success : function(layero, index){
                    form.val('insert', {
                        "provinceId": ""
                        ,"cityId": ""
                        ,"number": ""
                        ,"repairmanId": ""
                        ,"endTime":""
                    });
                    $("#insertProvince").find("option[value='']").prop("selected",true);
                    form.render();
                }
            });
        });

        //新增按钮
        form.on('submit(insert)', function(data){
            layer.confirm('是否新增？',{icon: 3, title:'提示'},function (index) {
                $.ajax({
                    url: "/bus/insertBus",
                    method:'post',
                    dataType:'json',
                    contentType : 'application/json;charset=utf-8',
                    data:JSON.stringify(data.field),
                    success:function(msg){
                        if(msg=="success"){
                            layer.msg('新增成功');
                            layer.closeAll('page');
                            table.reload('busTable');
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

            //查看
            if(layEvent == '排班'){
                layer.open({
                    type: 2,
                    content: ['/manager/bus_work'],
                    maxmin:true,
                    area:['1300px','650px'],
                    success:function (layero, index) {
                        let body = layer.getChildFrame('body', index);
                        body.find(".transmitData").eq(0).val(data.number);
                        body.find(".transmitData").eq(1).val(data.cityId);
                        body.find(".transmitData").eq(2).val(data.id);
                        body.find(".marginBottom").eq(0).text(data.number);
                        var iframe = window['layui-layer-iframe' + index];
                        iframe.queryBusWork();
                        iframe.queryLine();
                    }
                });
                //修改巴士数据
            }else if (layEvent == '修改'){
                getProvince(data.provinceId,false);
                getCity(data.provinceId,data.cityId,false);
                layer.open({
                    type: 1,
                    title: '修改巴士',
                    content: $('#changeBus'),
                    offset: '150px',
                    area: ['450px', '250px'],
                    success : function(layero, index){
                        form.val('change', {
                            "number": data.number
                            ,"repairmanId": data.repairmanId
                            ,"id": data.id
                        });
                    }
                });
            //报废、删除
            }else{
                layer.confirm('是否'+layEvent+'?',{icon: 3, title:'提示'},function (index) {
                    var stateId = '';
                    if(layEvent=='报废停用'){
                        stateId = 4;
                    }else{
                        stateId = 5;
                    }
                    $.ajax({
                        url: "/bus/changeBus",
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
                    url: "/bus/changeBus",
                    method:'post',
                    dataType:'json',
                    contentType : 'application/json;charset=utf-8',
                    data:JSON.stringify(data.field),
                    success:function(msg){
                        if(msg=="success"){
                            layer.msg('修改成功');
                            layer.closeAll('page');
                            table.reload('busTable');
                        }else if(msg=="upDataError"){
                            layer.msg('提交数据出错');
                        }else if(msg=="repeat"){
                            layer.msg('车牌重复');
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

        //自定义表单验证
        form.verify({
            number: function(value, item){ //value：表单的值、item：表单的DOM对象
                if(value.trim().length==0){
                    return '必填项不能为空';
                }
                if(!/^(([京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领][A-Z](([0-9]{5}[DF])|([DF]([A-HJ-NP-Z0-9])[0-9]{4})))|([京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领][A-Z][A-HJ-NP-Z0-9]{4}[A-HJ-NP-Z0-9挂学警港澳使领]))$/.test(value)){
                    return '车牌格式错误，格式如闽AF12345';
                }
            },
        });

        //新增巴士省份选择框监听，选择了发送请求去获取对应城市
        form.on('select(insertProvince)', function(data){
            getCity(data.value,null,true);
        });

        //修改巴士省份选择框监听，选择了发送请求去获取对应城市
        form.on('select(changeProvince)', function(data){
            getCity(data.value,null,false);
        });

        function getCity(parentId,cityId){
            $.ajax({
                url:'/areas/getCityByProvince',
                method:'post',
                dataType:'json',
                data:{"parentId":parentId,"type":2},
                success:function(data){
                    if(data.length>0){
                        $("#insertCity").empty();
                        $("#insertCity").append("<option  value=''>请选择城市</option>");

                        for(var i =0;i<data.length;i++){
                            $("#insertCity").append("<option  value=\""+data[i].id+"\">"+data[i].name+"</option>");
                        }
                        form.render("select")
                    }else{
                        layer.msg(data.msg);
                    }
                }
            });
        }

        function getProvince(parentId) {
            //获取省份
            $.ajax({
                url:'/areas/getProvinceNameAll',
                method:'post',
                dataType:'json',
                data:{"type":1},
                success:function(data){
                    if(data.status==200){
                        $("#insertProvince").empty();
                        $("#insertProvince").append("<option  value=''>请选择省份</option>");
                        for(var i =0;i<data.data.length;i++){
                            $("#insertProvince").append("<option  value=\""+data.data[i].id+"\">"+data.data[i].name+"</option>");
                        }
                        form.val('insert', {
                            "provinceId": ""
                        });

                        form.render("select");
                    }else{
                        layer.msg(data.msg);
                    }
                }
            });
        }
    });
</script>

</html>