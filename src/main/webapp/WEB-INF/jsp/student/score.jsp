<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="${basePath}/css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="${basePath}/css/tableexport/tableexport.min.css" rel="stylesheet">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>选课管理信息系统</title>
</head>
<body>
<%@include file="nav.jsp" %>
<div class="container">
    <h2><b>当前位置</b>：信息查询 > 成绩查询</h2>
    <hr>
    <caption class="btn-toolbar tableexport-caption" style="caption-side: bottom;">
        <button type="button" id="xlsx" class="btn btn-default xlsx">Export to xlsx</button>
        <button type="button" id="xls" class="btn btn-default xls">Export to xls</button>
        <button type="button" id="csv" class="btn btn-default csv">Export to csv</button>
    </caption>
    <table class="table">
        <thead>
        <tr>
            <th>学号</th>
            <th>姓名</th>
            <th>课程名</th>
            <th>分数</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${scts}" var="score">
            <tr>
                <td>${score.sno}</td>
                <td>${score.sname}</td>
                <td>${score.cname}</td>
                <td>${score.grade}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="${basePath}/js/jquery.min.js" type="text/javascript"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="${basePath}/js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
<%--报表--%>
<script src="${basePath}/js/tableexport/FileSaver.min.js"></script>
<script src="${basePath}/js/tableexport/tableExport.min.js"></script>
<script src="${basePath}/js/tableexport/xlsx.core.min.js"></script>
<script src="${basePath}/js/checkinfo.js" type="text/javascript"></script>

</html>
