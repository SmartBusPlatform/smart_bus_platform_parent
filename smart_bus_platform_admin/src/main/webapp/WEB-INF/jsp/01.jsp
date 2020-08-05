<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>发送AJAX请求</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/index.css">
	<script src="${pageContext.request.contextPath}/static/js/vue.js" type="text/javascript" charset="utf-8"></script>
</head>

<body>
	<div id="app">
		<div style="height: 450px; width: 340px;  float: left; border: solid 1px #ccc ;padding: 5px">
			<div class="el-steps el-steps--vertical">
				<div></div>
				<div class="el-step is-vertical" style="flex-basis: 50%;">
					<div class="el-step__head is-finish">
						<div class="el-step__line" style="margin-right: 0px;"><i class="el-step__line-inner" style="transition-delay: 0ms; border-width: 0px; height: 0%;"></i></div>
						<div class="el-step__icon is-text">
							<div class="el-step__icon-inner">1</div>
						</div>
					</div>
					<div class="el-step__main">
						<div class="el-step__title is-finish">步骤 1
							<button type="button" class="el-button el-button--default" style="margin-left: 50px;"><span>添加站点</span></button> 
							<button type="button" class="el-button el-button--default" style="margin-left: 10px;"><span>删除</span></button></div>
						<div class="el-step__description is-finish"></div>
					</div>
				</div>
				<div class="el-step is-vertical" style="flex-basis: 50%;">
					<div class="el-step__head is-process">
						<div class="el-step__line" style="margin-right: 0px;"><i class="el-step__line-inner"></i></div>
						<div class="el-step__icon is-text">
							<div class="el-step__icon-inner">2</div>
						</div>
					</div>
					<div class="el-step__main">
						<div class="el-step__title is-process">步骤 2</div>
						<div class="el-step__description is-process"></div>
					</div>
				</div>
				<div class="el-step is-vertical is-flex" style="flex-basis: 50%;">
					<div class="el-step__head is-wait">
						<div class="el-step__line"><i class="el-step__line-inner"></i></div>
						<div class="el-step__icon is-text">
							<div class="el-step__icon-inner">3</div>
						</div>
					</div>
					<div class="el-step__main">
						<div class="el-step__title is-wait">步骤 3</div>
						<div class="el-step__description is-wait">这是一段很长很长很长的描述性文字</div>
					</div>
				</div></div>
		</div>

		<button type="button" class="el-button el-button--default" style="margin: 220px 20px;float: left;"><span>生成反向>></span>
		</button> 
		<div style="max-height: 450px; width: 340px;  float: left; border: solid 1px #ccc ;padding: 5px;overflow-x: hidden">
			<div class="el-steps el-steps--vertical">
				<div></div>
				<div class="el-step is-vertical" style="flex-basis: 50%;">
					<div class="el-step__head is-finish">
						<div class="el-step__line" style="margin-right: 0px;"><i class="el-step__line-inner" style="transition-delay: 0ms; border-width: 0px; height: 0%;"></i></div>
						<div class="el-step__icon is-text">
							<div class="el-step__icon-inner">1</div>
						</div>
					</div>
					<div class="el-step__main">
						<div class="el-step__title is-finish">步骤 1
							<button type="button" class="el-button el-button--default" style="margin-left: 50px;"><span>添加站点</span></button> 
							<button type="button" class="el-button el-button--default" style="margin-left: 10px;"><span>删除</span></button></div>
						<div class="el-step__description is-finish"></div>
					</div>
				</div>
				<div class="el-step is-vertical" style="flex-basis: 50%;">
					<div class="el-step__head is-process">
						<div class="el-step__line" style="margin-right: 0px;"><i class="el-step__line-inner"></i></div>
						<div class="el-step__icon is-text">
							<div class="el-step__icon-inner">2</div>
						</div>
					</div>
					<div class="el-step__main">
						<div class="el-step__title is-process">步骤 2</div>
						<div class="el-step__description is-process"></div>
					</div>
				</div>
				<div class="el-step is-vertical is-flex" style="flex-basis: 50%;">
					<div class="el-step__head is-wait">
						<div class="el-step__line"><i class="el-step__line-inner"></i></div>
						<div class="el-step__icon is-text">
							<div class="el-step__icon-inner">3</div>
						</div>
					</div>
					<div class="el-step__main">
						<div class="el-step__title is-wait">步骤 3</div>
						<div class="el-step__description is-wait">这是一段很长很长很长的描述性文字</div>
					</div></div>
					<div class="el-step is-vertical is-flex" style="flex-basis: 50%;">
					<div class="el-step__head is-wait">
						<div class="el-step__line"><i class="el-step__line-inner"></i></div>
						<div class="el-step__icon is-text">
							<div class="el-step__icon-inner">3</div>
						</div>
					</div>
					<div class="el-step__main">
						<div class="el-step__title is-wait">步骤 3</div>
						<div class="el-step__description is-wait">这是一段很长很长很长的描述性文字</div>
					</div></div>
					<div class="el-step is-vertical is-flex" style="flex-basis: 50%;">
					<div class="el-step__head is-wait">
						<div class="el-step__line"><i class="el-step__line-inner"></i></div>
						<div class="el-step__icon is-text">
							<div class="el-step__icon-inner">3</div>
						</div>
					</div>
					<div class="el-step__main">
						<div class="el-step__title is-wait">步骤 3</div>
						<div class="el-step__description is-wait">这是一段很长很长很长的描述性文字</div>
					</div></div>
					<div class="el-step is-vertical is-flex" style="flex-basis: 50%;">
					<div class="el-step__head is-wait">
						<div class="el-step__line"><i class="el-step__line-inner"></i></div>
						<div class="el-step__icon is-text">
							<div class="el-step__icon-inner">3</div>
						</div>
					</div>
					<div class="el-step__main">
						<div class="el-step__title is-wait">步骤 3</div>
						<div class="el-step__description is-wait">这是一段很长很长很长的描述性文字</div>
					</div></div>
					<div class="el-step is-vertical is-flex" style="flex-basis: 50%;">
					<div class="el-step__head is-wait">
						<div class="el-step__line"><i class="el-step__line-inner"></i></div>
						<div class="el-step__icon is-text">
							<div class="el-step__icon-inner">3</div>
						</div>
					</div>
					<div class="el-step__main">
						<div class="el-step__title is-wait">步骤 3</div>
						<div class="el-step__description is-wait">这是一段很长很长很长的描述性文字</div>
					</div></div>
					<div class="el-step is-vertical is-flex" style="flex-basis: 50%;">
					<div class="el-step__head is-wait">
						<div class="el-step__line"><i class="el-step__line-inner"></i></div>
						<div class="el-step__icon is-text">
							<div class="el-step__icon-inner">3</div>
						</div>
					</div>
					<div class="el-step__main">
						<div class="el-step__title is-wait">步骤 3</div>
						<div class="el-step__description is-wait">这是一段很长很长很长的描述性文字</div>
					</div></div>
					<div class="el-step is-vertical is-flex" style="flex-basis: 50%;">
					<div class="el-step__head is-wait">
						<div class="el-step__line"><i class="el-step__line-inner"></i></div>
						<div class="el-step__icon is-text">
							<div class="el-step__icon-inner">3</div>
						</div>
					</div>
					<div class="el-step__main">
						<div class="el-step__title is-wait">步骤 3</div>
						<div class="el-step__description is-wait">这是一段很长很长很长的描述性文字</div>
					</div></div>
					<div class="el-step is-vertical is-flex" style="flex-basis: 50%;">
					<div class="el-step__head is-wait">
						<div class="el-step__line"><i class="el-step__line-inner"></i></div>
						<div class="el-step__icon is-text">
							<div class="el-step__icon-inner">3</div>
						</div>
					</div>
					<div class="el-step__main">
						<div class="el-step__title is-wait">步骤 3</div>
						<div class="el-step__description is-wait">这是一段很长很长很长的描述性文字</div>
					</div></div>
					<div class="el-step is-vertical is-flex" style="flex-basis: 50%;">
					<div class="el-step__head is-wait">
						<div class="el-step__line"><i class="el-step__line-inner"></i></div>
						<div class="el-step__icon is-text">
							<div class="el-step__icon-inner">3</div>
						</div>
					</div>
					<div class="el-step__main">
						<div class="el-step__title is-wait">步骤 3</div>
						<div class="el-step__description is-wait">这是一段很长很长很长的描述性文字</div>
					</div></div>
			</div>
		</div>

	</div>

	
</body>


<script>
	
    


  </script>
</html>

