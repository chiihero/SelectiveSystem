<%--
  Created by IntelliJ IDEA.
  User: chii
  Date: 2018/11/30
  Time: 13:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
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

        <div class="collapse navbar-collapse" id="example-navbar-collapse">
            <ul class="nav navbar-nav nav-pills navbar-left">
                <li class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button"
                       aria-haspopup="true" aria-expanded="false">用户管理 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <%--<li class="dropdown-item"><a href="${basePath}/admin/studentadd">添加学生</a></li>--%>
                        <%--<li class="dropdown-item"><a href="${basePath}/admin/teacheradd">添加教师</a></li>--%>
                        <li class="dropdown-item"><a href="${basePath}/admin/studentuser">所有学生</a></li>
                        <li class="dropdown-item"><a href="${basePath}/admin/teacheruser">所有教师</a></li>
                        <%--<li class="dropdown-item"><a href="${basePath}/admin/userimport">用户批量导入</a></li>--%>
                    </ul>
                </li>
                <%--<li class="nav-item dropdown">--%>
                <%--<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">公告管理 <span class="caret"></span></a>--%>
                <%--<ul class="dropdown-menu">--%>
                <%--<li class="dropdown-item"><a href="${basePath}Admin/notesadd">添加公告</a></li>--%>
                <%--<li class="dropdown-item"><a href="${basePath}Admin/notesmanage">公告管理</a></li>--%>
                <%--</ul>--%>
                <%--</li>--%>
                <li class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button"
                       aria-haspopup="true" aria-expanded="false">课程管理 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class="dropdown-item"><a href="${basePath}/admin/courseadd">添加课程</a></li>
                        <li class="dropdown-item"><a href="${basePath}/admin/course">课程管理</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button"
                       aria-haspopup="true" aria-expanded="false">学生信息管理 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class="dropdown-item"><a href="${basePath}/admin/score">学生选课与成绩管理</a></li>
                        <%--<li class="dropdown-item"><a href="${basePath}/admin/score">学生成绩管理</a></li>--%>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button"
                       aria-haspopup="true" aria-expanded="false">院系管理 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class="dropdown-item"><a href="${basePath}/admin/departmentadd">添加院系</a></li>
                        <li class="dropdown-item"><a href="${basePath}/admin/department">院系管理</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a href="${basePath}/admin/help" class="nav-link" role="button"
                       aria-haspopup="true" aria-expanded="false">帮助 </a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="nav-item dropdown">
                    <a class="nav-link">${sessionScope.username}</a>
                </li>
                <li class="nav-item dropdown">
                    <a href="${basePath}/login/logout" class="nav-link" role="button">退出 </a>
                </li>

            </ul>
        </div>
    </div>
</nav>