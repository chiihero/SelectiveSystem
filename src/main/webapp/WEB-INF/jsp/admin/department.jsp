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
<head>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="${basePath}/css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>选课管理信息系统</title>
</head>
<body>
<%@include file="nav.jsp" %>
<div class="container">
    <h5><b>当前位置</b>：院系管理 > 院系管理</h5>
    <hr>
    <div>
        <table class="table">
            <thead>
            <tr>
                <th>系编号</th>
                <th>系名</th>
                <th>系主任</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${departments}" var="department">
                <tr>
                    <td>${department.dno}</td>
                    <td>${department.dname}</td>
                    <td>${department.dmanager}</td>
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
