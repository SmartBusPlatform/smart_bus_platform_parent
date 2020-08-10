<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                <h1>司机排班</h1>
            </div>
            <div class="layui-row maginTop">
                <form class="layui-form layui-col-md12 x-so">
                    <div class="layui-inline layui-show-xs-block">
                        <h3 class="layui-inline">日期：</h3>
                        <input class="layui-input search-input" type="text" autocomplete="off" placeholder="选择日期" id="chooseDate">
                    </div>
<%--                    <div class="layui-input-inline">--%>
<%--                        <h3 class="layui-inline">姓名：</h3>--%>
<%--                        <input type="text" id="name"  placeholder="请输入查找姓名" autocomplete="off" class="layui-input">--%>
<%--                    </div>--%>
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
                                <table class="layui-table" id="table" lay-filter="test"></table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<%--自增--%>
<script id="index" type="text/html">
    {{d.LAY_TABLE_INDEX+1}}
</script>
<%--判断当前日期是否有上班--%>
<script id="monday" type="text/html">
    {{# if(d.monday == null){ }}
        <a class="layui-btn layui-btn-lg" lay-event="monday" id="mondayBtn">操作</a>
    {{# }  else { }}
    {{d.monday}}
    {{# } }}
</script>
<script id="tuesday" type="text/html">
    {{# if(d.tuesday == null){ }}
    <a class="layui-btn layui-btn-lg" lay-event="tuesday" id="tuesdayBtn">操作</a>
    {{# }  else { }}
    {{d.tuesday}}
    {{# } }}
</script>
<script id="wednesday" type="text/html">
    {{# if(d.wednesday == null){ }}
    <a class="layui-btn layui-btn-lg" lay-event="wednesday" id="wednesdayBtn">操作</a>
    {{# } else { }}
    {{d.wednesday}}
    {{# } }}
</script>
<script id="thursday" type="text/html">
    {{# if(d.thursday == null){ }}
    <a class="layui-btn layui-btn-lg" lay-event="thursday" id="thursdayBtn">操作</a>
    {{# }  else { }}
    {{d.thursday}}
    {{# } }}
</script>
<script id="friday" type="text/html">
    {{# if(d.friday == null){ }}
    <a class="layui-btn layui-btn-lg" lay-event="friday" id="fridayBtn">操作</a>
    {{# }  else { }}
    {{d.friday}}
    {{# } }}
</script>
<script id="saturday" type="text/html">
    {{# if(d.saturday == null){ }}
    <a class="layui-btn layui-btn-lg" lay-event="saturday" id="saturdayBtn">操作</a>
    {{# }  else { }}
    {{d.saturday}}
    {{# } }}
</script>
<script id="sunday" type="text/html">
    {{# if(d.sunday == null){ }}
    <a class="layui-btn layui-btn-lg" lay-event="sunday" id="sundayBtn">操作</a>
    {{# }  else { }}
    {{d.sunday}}
    {{# } }}
</script>
<script>
    //当前点击省份
    var province;
    var provinceId;
    var weekList=[];
    //当前点击城市
    var city;
    var cityId;
    layui.use(['table','tree','form'], function(){
        var form = layui.form;
        var tree = layui.tree;
        var table = layui.table;
        var layer = layui.layer;
        var cityId = '';
        // var weekList;
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
                            $.ajax({
                                url: '${pageContext.request.contextPath}/driverWorkListController/getWeekDate',
                                method: 'post',
                                dataType: 'json',
                                data: {
                                    'timestamp':new Date().getTime()
                                },
                                success:function (msg) {
                                    // if (msg == 'success') {
                                        console.log("msg="+msg)
                                        weekList=msg;
                                    // }
                                    table.render({
                                        elem: '#table',
                                        url:'${pageContext.request.contextPath}/driverWorkListController/renderDriverWorkTable',
                                        where:{
                                            "cityId": cityId,
                                            "timestamp": new Date().getTime()
                                        },
                                        cols: [[
                                            // {type:'checkbox'},
                                            // {title:'序号',templet: '#index'}
                                            {field: "driverName",width:'75'}
                                            ,{title: weekList[0]+' 星期一', field: "monday",width:'140',toolbar : '#monday' }
                                            ,{title: weekList[1]+' 星期二', field: "tuesday" ,width:'140',toolbar : '#tuesday'}
                                            ,{title: weekList[2]+' 星期三', field: "wednesday",width:'140',toolbar : '#wednesday'}
                                            ,{title: weekList[3]+' 星期四', field: "thursday",width:'140',toolbar : '#thursday'}
                                            ,{title: weekList[4]+' 星期五', field: "friday",width:'140',toolbar : '#friday'}
                                            ,{title: weekList[5]+' 星期六', field: "saturday",width:'140',toolbar : '#saturday'}
                                            ,{title: weekList[6]+' 星期日', field: "sunday",width:'140',toolbar : '#sunday'}
                                        ]],
                                        page: false,
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
                                            console.log(res);
                                            return {
                                                "code":0,
                                                "data": res,
                                            };
                                        }
                                    });
                                }
                            })
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
            }
        });

        //根据条件查找
        $("#search").click(function () {
            var val = $("#chooseDate").val()
            var date = new Date(val);
            var timestamp = date.getTime();

            if (val != null && val != ""){
                $.ajax({
                    url: '${pageContext.request.contextPath}/driverWorkListController/getWeekDate'
                    ,method: 'post'
                    ,dataType: 'json'
                    ,data:{
                        'timestamp': timestamp
                    }
                    ,success:function (msg) {
                        weekList = msg;
                        console.log(weekList)

                        // tableRender(window.weekList);
                        table.render({
                            elem: '#table',
                            url:'${pageContext.request.contextPath}/driverWorkListController/renderDriverWorkTable',
                            where:{
                                "cityId": cityId,
                                "timestamp": timestamp
                            },
                            cols: [[
                                // {type:'checkbox'},
                                // {title:'序号',templet: '#index'}
                                {field: "driverName",width:'75'}
                                ,{title: weekList[0]+' 星期一', field: "monday",width:'140',toolbar : '#monday' }
                                ,{title: weekList[1]+' 星期二', field: "tuesday" ,width:'140',toolbar : '#tuesday'}
                                ,{title: weekList[2]+' 星期三', field: "wednesday",width:'140',toolbar : '#wednesday'}
                                ,{title: weekList[3]+' 星期四', field: "thursday",width:'140',toolbar : '#thursday'}
                                ,{title: weekList[4]+' 星期五', field: "friday",width:'140',toolbar : '#friday'}
                                ,{title: weekList[5]+' 星期六', field: "saturday",width:'140',toolbar : '#saturday'}
                                ,{title: weekList[6]+' 星期日', field: "sunday",width:'140',toolbar : '#sunday'}
                            ]],
                            page: false,
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
                                console.log(res);
                                return {
                                    "code":0,
                                    "data": res,
                                };
                            }
                        });

                    }
                })

            }
        })

        //监听修改和工作量查看
        table.on('tool(test)',function (obj) {
            var data = obj.data;
            var layEven = obj.event;
            var date;
            console.log(weekList[0])

            if (layEven == 'monday') {
                date = weekList[0]
            }
            if (layEven == 'tuesday') {
                date = weekList[1]
            }
            if (layEven == 'wednesday') {
                date = weekList[2]
            }
            if (layEven == 'thursday') {
                date = weekList[3]
            }
            if (layEven == 'friday') {
                date = weekList[4]
            }
            if (layEven == 'saturday') {
                date = weekList[5]
            }
            if (layEven == 'sunday') {
                date = weekList[6]
            }
            layer.open({
                type:1
                ,title:false
                ,resize: false
                ,btn:['排班','休假']
                ,btnAlign: 'c'
                ,yes:function (index) {
                    $.ajax({
                        url: '${pageContext.request.contextPath}/driverWorkListController/selectCityBus'
                        ,method: 'post'
                        ,dataType: 'json'
                        ,data: {
                            'cityId': cityId
                            ,'date': date
                        }
                        , success:function (msg) {
                            //这个清空需要放在前头，否则会取不到值(重置初始化一定要养成要使用前清空的习惯)
                            $("select[name='showBus']").empty();
                            console.log(msg)
                            $("select[name='showBus']").append("<option value='-1' disabled selected hidden>请选择车辆</option>");
                            $.each(msg,function (index,item) {
                                var id = msg[index].id;
                                var number = msg[index].number
                                $("select[name='showBus']").append('<option value="' + id + '">' + number + '</option>');
                                form.render('select');
                            })
                            layer.open({
                                type: 1
                                , title: '选择车辆'
                                , resize: false
                                , area: ['250px','300px']
                                , btn: ['确定', '取消']
                                , btnAlign: 'c'
                                , content: $("#addWork")
                                , yes: function () {
                                    form.render('select');
                                    if ($("select[name='showBus']").val() != null && $("select[name='showBus']").val() != "") {
                                        $.ajax({
                                            url: '${pageContext.request.contextPath}/driverWorkListController/setDriverWork'
                                            , method: 'post'
                                            , data: {
                                                'driverId': data.driverId
                                                , 'busId': $("select[name='showBus']").val()
                                                , 'date': date
                                            }
                                            , success: function (msg) {
                                                if (msg == 'success') {
                                                    layer.msg('提交成功', {time: 1500}, function () {
                                                        location.reload();
                                                    });
                                                } else {
                                                    layer.msg('出错啦，请联系管理员')
                                                }
                                            }
                                        });
                                    }
                                }
                            })

                        }
                    })
                }
                ,btn2:function () {
                    layer.confirm('是否确认休假',{icon:3,title:'提示'},function (index) {
                        $.ajax({
                            url: '${pageContext.request.contextPath}/driverWorkListController/setVacation'
                            ,type: 'post'
                            ,data:{
                                'driverId':data.driverId
                                ,'date': date
                            }
                            ,success:function (msg) {
                                if (msg == 'success') {
                                    layer.close(index);
                                    layer.msg('设置成功', {time: 1500}, function () {
                                        location.reload();
                                    });
                                } else {
                                    layer.msg('出错啦，请联系管理员')
                                }
                            }
                        })
                    })
                }
            })
        })
    });
</script>


<script>
layui.use(['laydate','form'],
    function () {
        var laydate = layui.laydate;
        var form = layui.form;
        laydate.render({
            elem: '#chooseDate',
            trigger: 'click'
        })
    })

</script>
</body>
<form class="layui-form" hidden id="addWork" >
    <div>
        <div style="width: 200px; height: 50px;padding-left: 25px;padding-top: 10px">
            <select name="showBus">
                <option value="1">123</option>
            </select>
        </div>

    </div>
</form>
</html>
