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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/xadminR.css">
<!--    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.5.1.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/lib/layui/layuiR.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/xadmin.js"></script>
    <style type="text/css">
        .layui-unselect dl { max-height:200px; }

        /*修改源码点击选中变色*/
        .custom-tree-item-clicked {
            color: #ff5722
        }
        .maginTop{
            margin-top: 20px;
            margin-left: 30px;
        }
        .tree{
            float: left;
            width: 15%;
            height:680px;
            overflow-y: auto;
            background-color: white;
            border: 0.5px solid #393D49;
        }
        .right{
            float: left;
            width: 80%;
            margin-left: 2.5%;
            background-color: white;
            height: 680px;
            overflow-y: auto;
        }
        .btnWidth{
            margin-top: 1px;
            width: 100px;
        }
    </style>
</head>

<body style="background-color: #F0F0F0">
<div class="x-body">
        <%--省市树状--%>
        <div class="tree">
            <ul id="citySite_tree" lay-filter="citySite_tree-filter"></ul>
        </div>
        <%--右侧列表--%>
        <div class="right">
            <div class="maginTop">
                <h1>维修查看</h1>
            </div>
            <div class="maginTop">
                <h2>在修车辆查看</h2>
            </div>
            <div class="layui-fluid">
                <div class="layui-row layui-col-space15">
                    <div class="layui-col-md12">
                        <div class="layui-card">
                            <div class="layui-card-body ">
                                <table class="layui-table" id="repairBusTable" lay-filter="">
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="maginTop">
                <h1>维修记录查询</h1>
            </div>
            <div class="maginTop">
                <form class="layui-form layui-col-space5">
                    <div class="layui-inline">
                        <h3 class="layui-inline">车牌：</h3>
                        <div class="layui-input-inline">
                            <input type="text" name="number" autocomplete="off" class="layui-input" placeholder="请输入车牌">
                        </div>
                    </div>
                    <div class="layui-inline layui-col-lg-offset1">
                        <button class="layui-btn btnWidth" lay-submit lay-filter="query">查询</button>
                    </div>
                </form>
            </div>
            <div class="layui-fluid">
                <div class="layui-row layui-col-space15">
                    <div class="layui-col-md12">
                        <div class="layui-card">
                            <div class="layui-card-body ">
                                <table class="layui-table" id="busMainTainTable" lay-filter="">
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>
<script>
    //当前点击省份
    var province;
    var provinceId;
    //当前点击城市
    var city;
    var cityId;
    layui.use(['table','tree','form'], function(){
        var tree = layui.tree;
        var table = layui.table;
        var form = layui.form;

        //查询省份和省份下的城市
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/admin/areas/getAreaTree",
            dataType: "json",
            success:function (data) {
                //渲染
                var inst1 = tree.render({
                    elem: '#citySite_tree'  //绑定元素
                    ,data: data.data
                    // ,showCheckbox: true
                    ,click:function (obj) {
                        if(obj.data.children==undefined){
                            city=obj.data.title;
                            cityId=obj.data.id;
                            //正在维修车辆表
                            table.render({
                                elem: '#repairBusTable',
                                url:'${pageContext.request.contextPath}/admin/bus/queryBusByPage',
                                where:{
                                    "cityId":cityId,
                                    "stateId": 3
                                },
                                cols: [[
                                    {align: 'center', title : '序号',templet:'#zizeng'}
                                    ,{field: 'number', align: 'center', title : '车牌'}
                                    ,{field: 'maintainTime', align: 'center', title:'送修时间'}
                                    ,{field: 'repairmanName', align: 'center', title:'维护司机'}
                                ]],
                                page:true,
                                limit:5,
                                limits:[5,10,15,20,25],
                                method:'post',
                                parseData: function(res) { //res 即为原始返回的数据
                                    return {
                                        "code": res.status, //解析接口状态
                                        "msg": res.msg, //解析提示文本
                                        "count": res.data.totalRecord, //解析数据长度
                                        "data": res.data.list,
                                    };
                                }
                            });
                            //维修总记录表
                            table.render({
                                elem: '#busMainTainTable',
                                url:'${pageContext.request.contextPath}/admin/busMainTain/queryBusMainTainByPage',
                                where:{
                                    "cityId":cityId
                                },
                                cols: [[
                                    {align: 'center', title : '序号',templet:'#zizeng'}
                                    ,{field: 'number', align: 'center', title : '车牌'}
                                    ,{field: 'stateName', align: 'center', title:'事件'}
                                    ,{field: 'time', align: 'center', title:'时间'}
                                ]],
                                page:true,
                                limit:5,
                                limits:[5,10,15,20,25],
                                method:'post',
                                parseData: function(res) { //res 即为原始返回的数据
                                    return {
                                        "code": res.status, //解析接口状态
                                        "msg": res.msg, //解析提示文本
                                        "count": res.data.totalRecord, //解析数据长度
                                        "data": res.data.list,
                                    };
                                }
                            });
                        }else{
                            province=obj.data.title;
                            provinceId=obj.data.id;
                        }
                    }
                });
                //默认打开第一节点
                $($("#citySite_tree").find(".layui-tree-entry")[0]).find('.layui-tree-txt').click();
                //默认第一次点击第一个父节点下的第一个子节点
                $($($("#citySite_tree").find(".layui-tree-entry")[0]).next().find(".layui-tree-set")[0]).find(".layui-tree-txt").click();
                // $(".layui-tree-set").click(function (event) {
                //     alert(3);
                //     event.stopPropagation();
                // })
            }
        });

        //查询按钮
        form.on('submit(query)', function(data){
            table.reload('busMainTainTable', {
                url: '${pageContext.request.contextPath}/admin/busMainTain/queryBusMainTainByPage'
                ,where: {
                    cityId : cityId,
                    number : data.field.number
                } ,page: {
                    curr: 1 //重新从第 1 页开始
                }
            });

            return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
        });
    });
</script>
<script type="text/html" id="zizeng">
    {{d.LAY_TABLE_INDEX+1}}
</script>
</body>

</html>
