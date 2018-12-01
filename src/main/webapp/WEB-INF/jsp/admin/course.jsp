<%--
  Created by IntelliJ IDEA.
  User: 85387
  Date: 2018/9/28
  Time: 12:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<!DOCTYPE html>
<html>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="${basePath}/css/bootstrap/bootstrap.min.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>选课管理信息系统</title>

<body>
<%@include file="nav.jsp" %>
<div class="container">
    <h5><b>当前位置</b>：课程管理 > 课程管理</h5>
    <hr>
    <div>
        <table class="table">
            <thead>
            <tr>
                <th>课程号</th>
                <th>课程号</th>
                <th>先行课编号</th>
                <th>最大人数</th>
                <th>学分</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${courses}" var="course">
                <tr>
                    <td>${course.cno}</td>
                    <td>${course.cname}</td>
                    <td>${course.cpno}</td>
                    <td>${course.cnum}</td>
                    <td>${course.ccredit}</td>
                    <td><a href="${basePath}/admin/courseDelete?cno=${course.cno}" class="btn btn-danger">删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="${basePath}/js/jquery.min.js" type="text/javascript"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="${basePath}/js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
</html>
