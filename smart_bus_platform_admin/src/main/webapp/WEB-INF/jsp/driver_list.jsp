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
            width: 50px;
        }
    </style>
</head>

<body style="background-color: #F0F0F0">
<div class="x-body">
    <div class="allBorder">
        <%--省市树状--%>
        <div class="tree" >
            <ul id="citySite_tree" lay-filter="citySite_tree-filter" style=" "></ul>
        </div>
        <%--右侧列表--%>
        <div class="right">
            <div class="maginTop">
                <h1>司机名单</h1>
            </div>
            <div class="layui-row maginTop">
                <form class="layui-form layui-col-md12 x-so">
                    <div class="layui-input-inline">
                        <h3 class="layui-inline">姓名：</h3>
                        <input type="text" id="name"  placeholder="请输入查找姓名" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-input-inline">
                        <h3 class="layui-inline">手机号：</h3>
                        <input type="text" id="phone"  placeholder="请输入查找手机号" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-input-inline">
                        <h3 class="layui-inline">站点：</h3>
                        <input type="text" id="site"  placeholder="请输入查找站点" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-inline layui-show-xs-block">
                        <button class="layui-btn" lay-filter="search" id="search" type="button">
                            <i class="layui-icon">&#xe615;</i>
                        </button>
                    </div>
                    <hr>
                </form>
            </div>
            <div class="layui-fluid">
                <div class="layui-row layui-col-space15">
                    <div class="layui-col-md12">
                        <div class="layui-card">
                            <div class="layui-card-body ">
                                <table class="layui-table" id="table" lay-filter="test">
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="site-text layui-row" hidden id="addForm"  >
<%--    <form class="layui-form layui-col-sm-offset1 layui-col-sm9" style="margin-top: 100px"  method="post" lay-filter="example">--%>
<%--        <div class="layui-form-item">--%>
<%--            <label class="layui-form-label">省:</label>--%>
<%--            <div class="layui-input-block">--%>
<%--                <input type="text" id="add_provinceName" name="cityName" lay-verify="cityName" autocomplete="off" placeholder="" class="layui-input">--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="layui-form-item">--%>

<%--            <label class="layui-form-label">城市名称:</label>--%>
<%--            <div class="layui-input-block">--%>
<%--                <input type="text" id="add_cityName" name="add_cityName" lay-verify="cityName" autocomplete="off" placeholder="" class="layui-input">--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="layui-form-item">--%>

<%--            <label class="layui-form-label">站点名称:</label>--%>
<%--            <div class="layui-input-block">--%>
<%--                <input type="text" id="add_siteName" name="add_siteName" lay-verify="cityName" autocomplete="off" placeholder="" class="layui-input">--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="layui-form-item">--%>

<%--            <label class="layui-form-label">x坐标:</label>--%>
<%--            <div class="layui-input-block">--%>
<%--                <input type="text" id="add_xPosition" name="add_xPosition" lay-verify="cityName" autocomplete="off" placeholder="" class="layui-input">--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="layui-form-item">--%>

<%--            <label class="layui-form-label">y坐标:</label>--%>
<%--            <div class="layui-input-block">--%>
<%--                <input type="text" id="add_yPosition" name="add_yPosition" lay-verify="cityName" autocomplete="off" placeholder="" class="layui-input">--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="layui-form-item">--%>
<%--            <div class="layui-input-block">--%>
<%--                <button class="layui-btn" type="button">地图选点</button>--%>
<%--            </div>--%>

<%--        </div>--%>

<%--    </form>--%>
</div>
<%--自增--%>
<script id="index" type="text/html">
{{d.LAY_TABLE_INDEX+1}}
</script>
<%--表格bar--%>
<script type="text/html" id="tableBar">
    <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="update">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="find">工作量查看</a>
</script>
<script>
    //当前点击省份
    var province;
    var provinceId;
    //当前点击城市
    var city;
    var cityId;
    layui.use(['table','tree'], function(){
        var tree = layui.tree;
        var table = layui.table;
        var layer = layui.layer;
        var citeId = '';
        //查询省份和省份下的城市
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/areas/getAreaTree",
            dataType: "json",
            success:function (data) {
                //渲染
                var inst1 = tree.render({
                    elem: '#citySite_tree'  //绑定元素
                    ,data: data.data
                    // ,showCheckbox: true
                    ,click:function (obj) {
                        citeId = obj.data.id;
                        //点击的城市如果没有子节点说明选中了地区，执行查询数据操作
                        if(obj.data.children==undefined){
                            city=obj.data.title;
                            cityId=obj.data.id;
                            table.render({
                                elem: '#table',
                                url:'${pageContext.request.contextPath}/driverWorkController/selectDriverList',
                                where:{
                                    "cityId":obj.data.id
                                },
                                cols: [[
                                    // {type:'checkbox'},
                                    {title:'序号',templet: '#index'}
                                    ,{field: 'name', title: '姓名' }
                                    ,{field: 'phone', title: '电话' }
                                    ,{field: 'workSiteName',title:'上班站点' }
                                    ,{field: '',title:'操作', width: 200,templet:'#tableBar'}
                                ]],
                                page:true,
                                // limit:5,
                                // limits:[5,10,15,20,25],
                                method:'post',
                                request:{
                                    pageName:'page',
                                    limitName:'limit',
                                },
                                // response:{
                                //     statusName:'code',
                                //     statusCode:200,
                                // },
                                parseData: function(res){ //res 即为原始返回的数据
                                    return {
                                        "code":res.code,
                                        "count": res.count, //解析数据长度
                                        "data": res.data,
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

        // //渲染
        // var inst1 = tree.render({
        //     elem: '#demo'  //绑定元素
        //     ,data: [{
        //         title: '江西' //一级菜单
        //         ,children: [{
        //             title: '南昌' //二级菜单
        //             ,children: [{
        //                 title: '高新区' //三级菜单
        //                 //…… //以此类推，可无限层级
        //             }]
        //         }]
        //     },{
        //         title: '陕西' //一级菜单
        //         ,children: [{
        //             title: '西安' //二级菜单
        //         }]
        //     }]
        // });
        //根据条件查找
        $("#search").click(function () {
            var cityId = cityId;
            var name = $("#name").val();
            var phone = $("#phone").val();
            var site = $("#site").val();

            if (name != null && name != null && site != null){
                table.reload('table',{
                    url: '${pageContext.request.contextPath}/driverWorkController/selectDriverList',
                    page:{
                        curr: 1
                    },
                    where:{
                        cityId: cityId,
                        name: name,
                        phone: phone,
                        site: site
                    }
                })
            }
        })

        //监听修改和工作量查看
        table.on('tool(test)',function (obj) {
            var data = obj.data;
            var layEven = obj.event;
            console.log(data)
            console.log(layEven)
            console.log(obj.tr)
            if (layEven == 'update') {
                layer.open({
                    type:1
                    ,title:false
                    ,resize: false
                    ,content: '<div style="padding:15px 100px;font-size: 20px">信息修改</div>' +
                        '<div style="padding: 15px;font-size: 15px">司机姓名：<input id="updateName" value="' +data.name+ '"></div>' +
                        '<div style="padding: 15px;font-size: 15px">司机电话：<input id="updatePhone" value="' +data.phone+ '"></div>'
                    ,btn:['保存','取消']
                    ,btnAlign: 'c'
                    ,yes:function (index) {
                        var name = $("#updateName").val();
                        var phone = $("#updatePhone").val();

                        if (phone == '' || name == '') {
                            layer.msg("修改信息不能为空");
                        } else if (phone == data.phone && name == data.name) {
                            layer.msg("您还未做出修改");
                        } else {
                            layer.confirm('确认提交？',{icon:3,title:'提示'},function () {
                                $.ajax({
                                    url:'${pageContext.request.contextPath}/driverWorkController/updateDriver'
                                    ,type: 'post'
                                    ,data :{
                                        'name': name,
                                        'phone': phone,
                                        'id': data.id
                                    },
                                    success:function (msg) {
                                        debugger
                                        if (msg == 'success') {
                                            layer.close(index);
                                            layer.msg('保存成功', {time: 1500}, function () {
                                                location.reload();
                                            });
                                        } else {
                                            layer.msg('出错啦，请联系管理员');
                                        }
                                    }
                                })
                            })
                        }
                    }
                })
            }
        })

    });

</script>


<script>




</script>

</body>

</html>
