<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
	<title>位置经纬度 + 骑行路线规划</title>
	<style type="text/css">
		html,
		body,
		#container {
			width: 100%;
			height: 100%;
		}
		#panel {
			position: fixed;
			background-color: white;
			max-height: 90%;
			overflow-y: auto;
			top: 10px;
			right: 10px;
			width: 280px;
		}
		#panel .amap-lib-driving {
			border-radius: 4px;
			overflow: hidden;
		}
	</style>
	<link rel="stylesheet" href="https://a.amap.com/jsapi_demos/static/demo-center/css/demo-center.css" />
	<script src="https://a.amap.com/jsapi_demos/static/demo-center/js/demoutils.js"></script>
	<script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.15&key=73c89fb1d43ddc8e155990099cecbc12&plugin=AMap.Driving"></script>
	<script type="text/javascript" src="https://cache.amap.com/lbs/static/addToolbar.js"></script>
</head>
<body>
<div id="container"></div>
<div id="panel"></div>
<script type="text/javascript">
	var map = new AMap.Map("container", {
		resizeEnable: true,
		center: [116.397428, 39.90923],//地图中心点
		zoom: 13 //地图显示的缩放级别
	});
	//构造路线导航类
	var driving = new AMap.Driving({
		map: map
	});
	// 根据起终点经纬度规划驾车导航路线
	driving.search(new AMap.LngLat(116.379028, 39.865042), new AMap.LngLat(116.427281, 39.903719),{
		waypoints:[new AMap.LngLat(116.379028, 39.885042)]
	}, function(status, result) {
		// result 即是对应的驾车导航信息，相关数据结构文档请参考  https://lbs.amap.com/api/javascript-api/reference/route-search#m_DrivingResult
		if (status === 'complete') {
			console.log('绘制驾车路线完成')
		} else {
			console.log('获取驾车数据失败：' + result)
		}
	});
</script>
</body>
</html>