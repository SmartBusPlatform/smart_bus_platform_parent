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
    </style>
</head>

<body class="">
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">演示</a>
        <a>
          <cite>导航元素</cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <%--省市树状--%>
    <div style="float: left;width: 18%; height:600px;overflow: scroll;" >
        <ul id="citySite_tree" lay-filter="citySite_tree-filter" style=" "></ul>
    </div>
    <%--右侧列表--%>
    <div style="float: left;margin:  50px 3%;width: 70%">
        <h1>城市站点配置</h1>
        <div class="layui-row">
            <form class="layui-form layui-col-md12 x-so">

                站点名称:<input type="text" name="cityName"  placeholder="请输入站点名称" autocomplete="off" class="layui-input">

                <button class="layui-btn"  lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
                <a class="layui-btn layui-btn-normal layui-btn-xs" id="add">新增</a>
            </form>

        </div>
        <table id="citySite_table"  lay-filter="citySite-filter" ></table>
    </div>
</div>
<div class="site-text layui-row" hidden id="addForm"  >
    <form class="layui-form layui-col-sm-offset1 layui-col-sm9" style="margin-top: 100px"  method="post" lay-filter="example">
        <div class="layui-form-item">
            <label class="layui-form-label">省:</label>
            <div class="layui-input-block">
                <input type="text" id="add_provinceName" name="cityName" lay-verify="cityName" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">

            <label class="layui-form-label">城市名称:</label>
            <div class="layui-input-block">
                <input type="text" id="add_cityName" name="add_cityName" lay-verify="cityName" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">

            <label class="layui-form-label">站点名称:</label>
            <div class="layui-input-block">
                <input type="text" id="add_siteName" name="add_siteName" lay-verify="cityName" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">

            <label class="layui-form-label">x坐标:</label>
            <div class="layui-input-block">
                <input type="text" id="add_xPosition" name="add_xPosition" lay-verify="cityName" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">

            <label class="layui-form-label">y坐标:</label>
            <div class="layui-input-block">
                <input type="text" id="add_yPosition" name="add_yPosition" lay-verify="cityName" autocomplete="off" placeholder="" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" type="button">地图选点</button>
            </div>

        </div>

    </form>
</div>
<%--自增--%>
<script id="index" type="text/html">
{{d.LAY_TABLE_INDEX+1}}
</script>
<%--表格bar--%>
<script type="text/html" id="cityLine_tablebar">
    <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="edit">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="find">地图查看</a>
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
                        if(obj.data.children==undefined){
                            city=obj.data.title;
                            cityId=obj.data.id;
                            table.render({
                                elem: '#citySite_table',
                                url:'${pageContext.request.contextPath}/citySite/getCitySiteByCityId',
                                where:{
                                    "cityId":obj.data.id
                                },
                                cols: [[
                                    {type:'checkbox'},
                                    {field: 'sorId',title:'序号',templet: '#index'}
                                    ,{field: 'name', title: '站点名称',sort: true,  }
                                    ,{field: 'xPosition', title: 'x坐标' }
                                    ,{field: 'yPosition',title:'y坐标' }
                                    ,{field: 'throughLine',title:'经过线路'}
                                        ,{field: '',title:'操作' ,templet:'#cityLine_tablebar'}
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


        //



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
    });


    //新增站点
    $("#add").click(function () {
        layer.open({
            title: '新增站点',
            type: 1,
            area: ['35%', '80%'],
            offset: 'auto',
            maxmin: true,
            shadeClose: true,
            content: $('#addForm'),
            btn: ['确定', '取消'],
            shade: [0.8, '#393D49'],
            success: function (layero, index) {
                $("#add_cityName").val("");
                $("#add_provinceName").val("");
                $("#add_cityName").val(city);
                $("#add_cityName").attr("cityId",cityId);
                $("#add_provinceName").val(province);
                $("#add_provinceName").attr("provinceId",provinceId)
            },
            yes:function (num,layero) {
                layer.confirm('确认是否新增信息?', {icon: 3, title:'提示'}, function(index){
                    if($("#add_cityName").val().trim().length>0){
                        if($("#add_provinceName").val().trim().length>0){
                            if($("#add_siteName").val().trim().length>0){
                                if(checkLong($("#add_xPosition").val().trim())){
                                    if(checkLong($("#add_yPosition").val().trim())){
                                        <%--$.ajax({--%>
                                        <%--    type: "post",--%>
                                        <%--    url: "${pageContext.request.contextPath}/areas/addAreas",--%>
                                        <%--    data: {"cityName":$("#add_cityName").val(),"provinceId":$("#add_provinceName").val()},--%>
                                        <%--    dataType: "json",--%>
                                        <%--    success: function(data){--%>
                                        <%--        if(data.status==200){--%>
                                        <%--            layer.msg(data.msg,{--%>
                                        <%--                time:1000--%>
                                        <%--            },function () {--%>
                                        <%--                window.location.reload();--%>
                                        <%--            });--%>

                                        <%--        }else{--%>
                                        <%--            layer.msg(data.msg);--%>
                                        <%--        }--%>
                                        <%--    }--%>
                                        <%--});--%>
                                    }else{
                                        layer.msg('纬度整数部分为0-180,小数部分为0到6位!', {
                                            btn: ['明白了',]
                                        });
                                    }
                                }else{
                                    layer.msg('经度整数部分为0-180,小数部分为0到6位!', {
                                        btn: ['明白了',]
                                    });
                                }

                            }else{
                                layer.msg('站点的值不能为空', {
                                    btn: ['明白了',]
                                });
                            }

                        }else{
                            layer.msg('省份的值不能为空', {
                                btn: ['明白了',]
                            });
                        }
                    }else{
                        layer.msg('城市名称不能为空', {
                            btn: ['明白了']
                        });
                    }


                });
            }

        });
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
