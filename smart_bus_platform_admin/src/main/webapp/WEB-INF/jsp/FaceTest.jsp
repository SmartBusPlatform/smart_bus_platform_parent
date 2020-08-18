<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>摄像头拍照</title>
    <script src="${pageContext.request.contextPath}/static/js/jquery.min.js" charset="utf-8"></script>

</head>
<body>
<video id="video" width="480" height="320" controls>
</video>
<div>
    <button id="capture">拍照</button>
</div>
<canvas id="canvas" width="480" height="320"></canvas>
<script>
    //访问用户媒体设备的兼容方法
    function getUserMedia(constraints, success, error) {
        if (navigator.mediaDevices.getUserMedia) {
            //最新的标准API
            navigator.mediaDevices.getUserMedia(constraints).then(success).catch(error);
        } else if (navigator.webkitGetUserMedia) {
            //webkit核心浏览器
            navigator.webkitGetUserMedia(constraints,success, error)
        } else if (navigator.mozGetUserMedia) {
            //firfox浏览器
            navigator.mozGetUserMedia(constraints, success, error);
        } else if (navigator.getUserMedia) {
            //旧版API
            navigator.getUserMedia(constraints, success, error);
        }
    }

    let video = document.getElementById('video');
    let canvas = document.getElementById('canvas');
    let context = canvas.getContext('2d');

    function success(stream) {
        //兼容webkit核心浏览器
        let CompatibleURL = window.URL || window.webkitURL;
        //将视频流设置为video元素的源
        console.log(stream);

        //video.src = CompatibleURL.createObjectURL(stream);
        video.srcObject = stream;
        video.play();
    }

    function error(error) {
        console.log(`访问用户媒体设备失败${error.name}, ${error.message}`);
    }
    if(navigator.mediaDevices===undefined){
        navigator.mediaDevices={}
    }

    if (navigator.mediaDevices.getUserMedia || navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia) {
        //调用用户媒体设备, 访问摄像头
        getUserMedia({video : {width: 480, height: 320}}, success, error);
    } else {
        alert('不支持访问用户媒体');
    }

    // function submitFace() {
        setInterval(function () {
            // alert(1111)
            context.drawImage(video, 0, 0, 480, 320);

            var dataURL = document.getElementById("canvas").toDataURL("image/png");
            var imgData = dataURL.substring(22);

            $.ajax({
                type: "post",
                url:"${pageContext.request.contextPath}/faceController/faceDetect",
                data: {imgData : imgData},
                dataType: 'json',
                async: true,
                success: function (msg) {
                    if (msg != "error") {
                        alert("工号：" + msg.user_id + " 打卡成功！");
                    }
                },

            });
        },10000)

</script>
</body>
</html>

