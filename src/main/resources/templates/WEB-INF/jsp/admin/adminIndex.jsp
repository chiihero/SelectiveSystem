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
        <h2 class="text-center">课管理信息系统-${sessionScope.username}</h2>
    </div>
    <%--<%--%>
        <%--//session--%>
        <%--//获取session创建的时间--%>
        <%--Date createTime = new Date(session.getCreationTime());--%>
        <%--//获取最后访问页面的时间--%>
        <%--Date lastAccessTime = new Date(session.getLastAccessedTime());--%>
        <%--int maxAccessTime = session.getMaxInactiveInterval();--%>
    <%--%>--%>
    <%--<ul disabled="">--%>
        <%--<li>id</li>--%>
        <%--<li><% out.print(session.getId()); %></li>--%>
        <%--<li>创建时间</li>--%>
        <%--<li><% out.print(createTime); %></li>--%>
        <%--<li>最后访问时间</li>--%>
        <%--<li><% out.print(lastAccessTime); %></li>--%>
        <%--<li>最大访问间隔时间</li>--%>
        <%--<li><% out.print(maxAccessTime); %>秒</li>--%>
    <%--</ul>--%>
</div>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="${basePath}/js/jquery.min.js" type="text/javascript"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="${basePath}/js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>

