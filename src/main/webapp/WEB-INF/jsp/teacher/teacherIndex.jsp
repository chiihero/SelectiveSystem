<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page language="java" import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>选课管理信息系统</title>
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="<%=basePath%>/js/jquery.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>/js/popper.js" type="text/javascript"></script>
    <!-- 最新的 Bootstrap4 核心 JavaScript 文件 -->
    <script src="<%=basePath%>/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- 新 Bootstrap4 核心 CSS 文件 -->
    <link href="<%=basePath%>/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=basePath%>/css/nindex.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <div class="page-header">
        <h2>选课管理信息系统-${sessionScope.username}</h2>
    </div>
    <%--<%--%>
    <%--if (session.getAttribute("currentUser") == null) {--%>
    <%--response.sendRedirect("../adminIndex");--%>
    <%--}--%>
    <%--%>--%>
    <nav class="navbar navbar-expand-md bg-dark navbar-dark">
        <a class="navbar-brand" href="<%=basePath%>teacher/teacherIndex">首页</a>
        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#collapsedNav">
            <span class="fa fa-align-justify"></span><%--待修改--%>
        </button>
        <div class="collapse navbar-collapse" id="collapsedNav">
            <ul class="nav navbar-nav nav-pills">
                <li class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button"
                       aria-haspopup="true"
                       aria-expanded="false">个人信息 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class="dropdown-item"><a
                                href="<%=basePath%>teacher/changepasswd">密码修改</a></li>
                        <li class="dropdown-item"><a
                                href="<%=basePath%>teacher/changeinfo">个人信息修改</a></li>
                    </ul>
                </li>
                <%--<li class="nav-item dropdown">--%>
                    <%--<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button"--%>
                       <%--aria-haspopup="true" aria-expanded="false">课程管理 <span class="caret"></span></a>--%>
                    <%--<ul class="dropdown-menu">--%>
                        <%--<li class="dropdown-item"><a href="<%=basePath%>teacher/courceadd">添加课程</a></li>--%>
                        <%--<li class="dropdown-item"><a href="<%=basePath%>teacher/cource">课程管理</a></li>--%>
                    <%--</ul>--%>
                <%--</li>--%>
                <li class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button"
                       aria-haspopup="true" aria-expanded="false">学生信息管理 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class="dropdown-item"><a href="<%=basePath%>teacher/studentuser">学生与成绩管理</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
</div>
</body>
</html>
