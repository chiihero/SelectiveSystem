<%--
  Created by IntelliJ IDEA.
  User: 85387
  Date: 2018/9/28
  Time: 12:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="adminIndex.jsp" %>

<html>
<head>
    <title></title>
</head>
<body>
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
</html>
