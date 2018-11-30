<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>选课管理信息系统</title>
    <link href="${basePath}/css/nindex.css" rel="stylesheet">

</head>
<body>
<%@include file="nav.jsp" %>
<div class="container">
    <div class="page-header">
        <h2>选课管理信息系统-${sessionScope.username}</h2>
    </div>
    <nav class="navbar navbar-default navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse"
                        data-target="#example-navbar-collapse">
                    <span class="sr-only">切换导航</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${basePath}/admin/adminIndex">首页</a>
            </div>
        <div class="collapse navbar-collapse" id="collapsedNav">
            <ul class="nav navbar-nav nav-pills">
                <li class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button"
                       aria-haspopup="true"
                       aria-expanded="false">个人信息 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class="dropdown-item"><a
                                href="${basePath}/teacher/ChangePassword">密码修改</a></li>
                        <li class="dropdown-item"><a
                                href="${basePath}/teacher/TeacherInfo">个人信息修改</a></li>
                    </ul>
                </li>
                <%--<li class="nav-item dropdown">--%>
                    <%--<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button"--%>
                       <%--aria-haspopup="true" aria-expanded="false">课程管理 <span class="caret"></span></a>--%>
                    <%--<ul class="dropdown-menu">--%>
                        <%--<li class="dropdown-item"><a href="${basePath}/teacher/courceadd">添加课程</a></li>--%>
                        <%--<li class="dropdown-item"><a href="${basePath}/teacher/cource">课程管理</a></li>--%>
                    <%--</ul>--%>
                <%--</li>--%>
                <li class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button"
                       aria-haspopup="true" aria-expanded="false">学生信息管理 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class="dropdown-item"><a href="${basePath}/teacher/studentuser">学生与成绩管理</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a href="${basePath}/login/logout" class="nav-link" role="button">退出 </a>
                </li>
            </ul>
        </div>
        </div>
    </nav>
</div>
</body>
</html>
