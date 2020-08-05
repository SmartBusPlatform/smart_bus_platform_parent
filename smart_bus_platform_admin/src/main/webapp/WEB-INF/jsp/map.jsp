<%--
  Created by IntelliJ IDEA.
  User: 12614
  Date: 2020/7/30
  Time: 14:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        #container {
            width: 800px;
            height: 600px;
        }
    </style>
</head>
<body>
    <div id="container"></div>
    <script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.15&key=73c89fb1d43ddc8e155990099cecbc12"></script>

    <script type="text/javascript">
        var map = new AMap.Map('container',{
            zoom: 11,    //级别
            viewMode:'2D',   //使用3D视图
        });

       /* //点击标记点打开窗口
        var infoWindow = new AMap.InfoWindow({ //创建信息窗体
            isCustom: true,  //使用自定义窗体
            content:'<div>信息窗体</div>', //信息窗体的内容可以是任意html片段
            // offset: new AMap.Pixel(16, -45)
        });

        var onMarkerClick  =  function(e) {
            infoWindow.open(map, e.target.getPosition());//打开信息窗体
            //e.target就是被点击的Marker
        }

        //新增标记点
        var marker = new AMap.Marker({
            position: [116.481181, 39.989792]   //经纬度
        })
        map.add(marker);
        marker.on('click',onMarkerClick);//绑定click事件*/

        //计算两点的实际距离，单位m
        var lnglat1 = new AMap.LngLat(116, 39);
        var lnglat2 = new AMap.LngLat(117, 39);
        var distance = lnglat1.distance(lnglat2);

    /*    //地图绑定点击事件
        map.on('click', function(ev) {
            // 触发事件的对象
            var target = ev.target;
            // 触发事件的地理坐标，AMap.LngLat 类型
            var lnglat = ev.lnglat;
            // 触发事件的像素坐标，AMap.Pixel 类型
            var pixel = ev.pixel;
            // 触发事件类型
            var type = ev.type;

            var lng = lnglat.lng;   //经度
            var lat = lnglat.lat;   //纬度

           alert(lng+","+lat);
        });*/

        //创建右键菜单
        var contextMenu = new AMap.ContextMenu();

        //右键放大
        contextMenu.addItem("放大一级", function () {
            map.zoomIn();
        }, 0);

        //右键缩小
        contextMenu.addItem("缩小一级", function () {
            map.zoomOut();
        }, 1);

        //右键添加Marker标记
        contextMenu.addItem("添加标记", function (e) {
            var marker = new AMap.Marker({
                map: map,
                position: contextMenuPositon //基点位置
            });
        }, 3);

        map.on('rightclick', function (e) {
            contextMenu.open(map, e.lnglat);
            contextMenuPositon = e.lnglat;
        });

        AMap.plugin([
            'AMap.ToolBar',
        ], function(){
            // 在图面添加工具条控件，工具条控件集成了缩放、平移、定位等功能按钮在内的组合控件
            map.addControl(new AMap.ToolBar({
                // 简易缩放模式，默认为 false
                liteStyle: false
            }));
        });
    </script>

</body>
</html>
