<%--
  Created by IntelliJ IDEA.
  User: chii
  Date: 2018/11/6
  Time: 15:55
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
    <style>
        .input-group {
            margin-top: 12px;
        }
    </style>
</head>
<body>
<%@include file="nav.jsp" %>
<div class="container">
    <h2><b>当前位置</b>：课程管理 > 添加课程</h2>
    <hr>
    <div class="col-sm-5 col-sm-offset-4">
        <form action="/admin/courseInsert" method="post">
            <div class="input-group">
                <div class="input-group-addon">
                    <span class="glyphicon glyphicon-book"></span>
                </div>
                <input type="text" class="form-control" placeholder="课程号" id="cno" name="cno">
            </div>
            <div class="input-group">
                <div class="input-group-addon">
                    <span class="glyphicon glyphicon-book"></span>
                </div>
                <input type="text" class="form-control" placeholder="课程名称" id="cname" name="cname">
            </div>
            <div class="input-group">
                <div class="input-group-addon">
                    <span class="glyphicon glyphicon-book"></span>
                </div>
                <input type="text" class="form-control" placeholder="先行课编号" id="cpno" name="cpno">
            </div>
            <div class="input-group">
                <div class="input-group-addon">
                    <span class="glyphicon glyphicon-stats"></span>
                </div>
                <input type="text" class="form-control" placeholder="最大人数" id="cnum" name="cnum">
            </div>
            <div class="input-group">
                <div class="input-group-addon">
                    <span class="glyphicon glyphicon-education"></span>
                </div>
                <input type="text" class="form-control" placeholder="学分" id="ccredit" name="ccredit">
            </div>
            <div style="padding-top: 15px">
                <button type="submit" class="btn btn-primary">添加</button>
                <button type="reset" class="btn btn-warning">重置</button>
            </div>
        </form>
    </div>
</div>
</body>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="${basePath}/js/jquery.min.js" type="text/javascript"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="${basePath}/js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
</html>
