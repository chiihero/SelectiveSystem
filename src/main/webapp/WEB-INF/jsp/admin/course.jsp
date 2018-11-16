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
<body>
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
                    <td><a href="<%=basePath%>/admin/courseDelete?cno=${course.cno}" class="btn btn-danger">删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
