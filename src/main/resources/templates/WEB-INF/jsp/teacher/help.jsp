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
    <h3>教师系统拥有两大功能</h3>
    <h4>1.个人信息</h4>
    <div class="jumbotron">
        本功能包含了修改密码和修改教师信息管理，点开之后可以修改
        <img src="${basePath}/img/help/teacher_11.png" alt="修改教师信息" class="img-responsive img-rounded"/>
        <br>
        <img src="${basePath}/img/help/teacher_12.png" alt="修改密码" class="img-responsive img-rounded"/>
    </div>
    <h4>2.学生信息管理</h4>
    <div class="jumbotron">
        包含学生评分和查看课程功能
        <img src="${basePath}/img/help/teacher_21.png" alt="评分" class="img-responsive img-rounded"/>
    </div>
    <h4>报表功能</h4>
    <div class="jumbotron">
        并且可以分页打印出需要的行数
        <img src="${basePath}/img/help/teacher_31.png" alt="报表功能" class="img-responsive img-rounded"/>
    </div>
</div>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="${basePath}/js/jquery.min.js" type="text/javascript"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="${basePath}/js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>
