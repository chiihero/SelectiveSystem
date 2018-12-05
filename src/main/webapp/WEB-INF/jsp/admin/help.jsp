<%--
  Created by IntelliJ IDEA.
  User: chii
  Date: 2018/12/4
  Time: 15:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
		<!-- 新 Bootstrap 核心 CSS 文件 -->
		<link href="${basePath}/css/bootstrap/bootstrap.min.css" rel="stylesheet">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>选课管理信息系统</title>
	</head>
	<body>
		<%@include file="nav.jsp" %>
		<div class="jumbotron">
			<div class="container">
				<h2 class="text-center">用户帮助</h2>
			</div>
		</div>
		<div class="container">
			<h3>本管理员系统拥有四大功能</h3>
			<h4>1.用户管理</h4>
			<div class="jumbotron">
				本功能包含了学生的管理和教师管理，点开之后可以添加和修改学生教师
				<img src="${basePath}/img/help/admin_11.png" alt="用户管理" class="img-responsive img-rounded" />
			</div>
			<h4>2.课程管理</h4>
			<div class="jumbotron">
				包含添加和课程和查看课程功能
				<img src="${basePath}/img/help/admin_21.png" alt="用户管理" class="img-responsive img-rounded" />
				<img src="${basePath}/img/help/admin_22.png" alt="用户管理" class="img-responsive img-rounded" />
			</div>
			<h4>3.学生信息管理</h4>
			<div class="jumbotron">
				包含了选课和成绩的管理
				<img src="https://upload-images.jianshu.io/upload_images/11626635-6a50f505bddb45a5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"
				 alt="用户管理" class="img-responsive img-rounded" />
			</div>
			<h4>4.院系管理</h4>
			<div class="jumbotron">
				包含了添加和删除院系
				<img src="https://upload-images.jianshu.io/upload_images/11626635-9d62088225a675bb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"
				 alt="用户管理" class="img-responsive img-rounded" />
				<img src="https://upload-images.jianshu.io/upload_images/11626635-8f4aa89823f1cb9f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"
				 alt="用户管理" class="img-responsive img-rounded" />

			</div>
			<h4>报表功能</h4>
			<div class="jumbotron">
				并且可以分页打印出需要的行数
				<img src="https://upload-images.jianshu.io/upload_images/11626635-b6e486516fb76732.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"
				 alt="用户管理" class="img-responsive img-rounded" />
				<img src="https://upload-images.jianshu.io/upload_images/11626635-629daf3dbbd9f78b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"
				 alt="用户管理" class="img-responsive img-rounded" />
			</div>
		</div>

		<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
		<script src="${basePath}/js/jquery.min.js" type="text/javascript"></script>
		<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
		<script src="${basePath}/js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
	</body>
</html>
