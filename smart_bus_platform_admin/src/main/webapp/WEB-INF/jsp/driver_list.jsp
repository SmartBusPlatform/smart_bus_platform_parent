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
                                <table class="layui-table" id="table" lay-filter="citySite-filter">
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
    <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">修改</a>
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
                        citeId = bj.data.id;
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
                                    {type:'checkbox'},
                                    {title:'序号',templet: '#index'}
                                    ,{field: 'name', title: '姓名' }
                                    ,{field: 'phone', title: '电话' }
                                    ,{field: 'workSite',title:'上班站点' }
                                    // ,{field: 'throughLine',title:'经过线路'}
                                    ,{field: '',title:'操作' ,templet:'#tableBar'}
                                ]],
                                page:true,
                                limit:5,
                                limits:[5,10,15,20,25],
                                method:'post',
                                request:{
                                    pageName:'curPage',
                                    limitName:'pageSize',
                                },
                                response:{
                                    statusName:'status',
                                    statusCode:200,
                                },
                                parseData: function(res){ //res 即为原始返回的数据
                                    return {
                                        "status":res.status,
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

            if (name != null || name != null || site != null){
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

    });



    //新增站点
    $("#add").click(function () {
        <%--layer.open({--%>
        <%--    title: '新增站点',--%>
        <%--    type: 1,--%>
        <%--    area: ['35%', '80%'],--%>
        <%--    offset: 'auto',--%>
        <%--    maxmin: true,--%>
        <%--    shadeClose: true,--%>
        <%--    content: $('#addForm'),--%>
        <%--    btn: ['确定', '取消'],--%>
        <%--    shade: [0.8, '#393D49'],--%>
        <%--    success: function (layero, index) {--%>
        <%--        $("#add_cityName").val("");--%>
        <%--        $("#add_provinceName").val("");--%>
        <%--        $("#add_cityName").val(city);--%>
        <%--        $("#add_cityName").attr("cityId",cityId);--%>
        <%--        $("#add_provinceName").val(province);--%>
        <%--        $("#add_provinceName").attr("provinceId",provinceId)--%>
        <%--    },--%>
        <%--    yes:function (num,layero) {--%>
        <%--        layer.confirm('确认是否新增信息?', {icon: 3, title:'提示'}, function(index){--%>
        <%--            if($("#add_cityName").val().trim().length>0){--%>
        <%--                if($("#add_provinceName").val().trim().length>0){--%>
        <%--                    if($("#add_siteName").val().trim().length>0){--%>
        <%--                        if(checkLong($("#add_xPosition").val().trim())){--%>
        <%--                            if(checkLong($("#add_yPosition").val().trim())){--%>
        <%--                                &lt;%&ndash;$.ajax({&ndash;%&gt;--%>
        <%--                                &lt;%&ndash;    type: "post",&ndash;%&gt;--%>
        <%--                                &lt;%&ndash;    url: "${pageContext.request.contextPath}/areas/addAreas",&ndash;%&gt;--%>
        <%--                                &lt;%&ndash;    data: {"cityName":$("#add_cityName").val(),"provinceId":$("#add_provinceName").val()},&ndash;%&gt;--%>
        <%--                                &lt;%&ndash;    dataType: "json",&ndash;%&gt;--%>
        <%--                                &lt;%&ndash;    success: function(data){&ndash;%&gt;--%>
        <%--                                &lt;%&ndash;        if(data.status==200){&ndash;%&gt;--%>
        <%--                                &lt;%&ndash;            layer.msg(data.msg,{&ndash;%&gt;--%>
        <%--                                &lt;%&ndash;                time:1000&ndash;%&gt;--%>
        <%--                                &lt;%&ndash;            },function () {&ndash;%&gt;--%>
        <%--                                &lt;%&ndash;                window.location.reload();&ndash;%&gt;--%>
        <%--                                &lt;%&ndash;            });&ndash;%&gt;--%>

        <%--                                &lt;%&ndash;        }else{&ndash;%&gt;--%>
        <%--                                &lt;%&ndash;            layer.msg(data.msg);&ndash;%&gt;--%>
        <%--                                &lt;%&ndash;        }&ndash;%&gt;--%>
        <%--                                &lt;%&ndash;    }&ndash;%&gt;--%>
        <%--                                &lt;%&ndash;});&ndash;%&gt;--%>
        <%--                            }else{--%>
        <%--                                layer.msg('纬度整数部分为0-180,小数部分为0到6位!', {--%>
        <%--                                    btn: ['明白了',]--%>
        <%--                                });--%>
        <%--                            }--%>
        <%--                        }else{--%>
        <%--                            layer.msg('经度整数部分为0-180,小数部分为0到6位!', {--%>
        <%--                                btn: ['明白了',]--%>
        <%--                            });--%>
        <%--                        }--%>

        <%--                    }else{--%>
        <%--                        layer.msg('站点的值不能为空', {--%>
        <%--                            btn: ['明白了',]--%>
        <%--                        });--%>
        <%--                    }--%>

        <%--                }else{--%>
        <%--                    layer.msg('省份的值不能为空', {--%>
        <%--                        btn: ['明白了',]--%>
        <%--                    });--%>
        <%--                }--%>
        <%--            }else{--%>
        <%--                layer.msg('城市名称不能为空', {--%>
        <%--                    btn: ['明白了']--%>
        <%--                });--%>
        <%--            }--%>


        <%--        });--%>
        <%--    }--%>

        <%--});--%>
    })

    //校验经度是否符合规范
    //校验经度x
    function checkLong(longitude){
        var longrg = /^(\-|\+)?(((\d|[1-9]\d|1[0-7]\d|0{1,3})\.\d{0,6})|(\d|[1-9]\d|1[0-7]\d|0{1,3})|180\.0{0,6}|180)$/;
        if(!longrg.test(longitude)){
            return false;
        }
        return true;
    }

    //校验纬度是否符合规范
    //纬度y
    function checkLat(latitude){
        var latreg = /^(\-|\+)?([0-8]?\d{1}\.\d{0,6}|90\.0{0,6}|[0-8]?\d{1}|90)$/;
        if(!latreg.test(latitude)){
            return '纬度整数部分为0-90,小数部分为0到6位!';
        }
        return true;
    }
</script>


<script>




</script>

</body>

</html>
