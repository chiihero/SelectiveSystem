<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@include file="/baseJs.jspf"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>选课管理信息系统</title>
    <link href="${basePath}/css/nindex.css" rel="stylesheet">
</head>
<body>

<div class="container">
    <div class="page-header">
        <h2>选课管理信息系统-${sessionScope.username}</h2>
    </div>
    <nav class="navbar navbar-expand-md bg-dark navbar-dark">
        <a class="navbar-brand" href="${basePath}/student/studentIndex">首页</a>
        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#collapsedNav">
            <span class="fa fa-align-justify"></span><%--待修改--%>
        </button>
        <div class="collapse navbar-collapse" id="collapsedNav">
            <ul class="nav navbar-nav nav-pills">
                <li class="nav-item dropdown">
                    <a href=">#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button"
                       aria-haspopup="true" aria-expanded="false">个人信息 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class="dropdown-item"><a
                                href="${basePath}/student/ChangePassword">密码修改</a>
                        </li>
                        <li class="dropdown-item"><a
                                href="${basePath}/student/StudentInfo">个人信息修改</a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button"
                       aria-haspopup="true" aria-expanded="false">信息查询 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class="dropdown-item"><a href="${basePath}/student/score">成绩查询</a>
                        </li>
                        <li class="dropdown-item"><a href="${basePath}/student/course">选课查询</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a href="${basePath}/login/logout" class="nav-link" role="button">退出 </a>
                </li>
            </ul>
        </div>
    </nav>
</div>
</body>
</html>
