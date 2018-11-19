<%--
  Created by IntelliJ IDEA.
  User: 85387
  Date: 2018/9/28
  Time: 12:04
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="adminIndex.jsp" %>
<html>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-10">
            <h5><b>当前位置</b>：用户管理 > 所有学生</h5>
        </div>
        <div class="col-md-2">
            <button class="btn btn-info" onclick="window.location.href='<%=basePath%>admin/studentadd'">添加学生</button>
        </div>
    </div>
    <hr>
    <div>
        <table class="table">
            <thead>
            <tr>
                <th>学号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>年龄</th>
                <th>系别</th>
                <th>修改</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${students}" var="student">
                <tr>
                    <td>${student.sno}</td>
                    <td>${student.sname}</td>
                    <td>${student.ssex}</td>
                    <td>${student.sage}</td>
                    <td>${student.sdept}</td>
                    <td>
                        <%--<a href="<%=basePath%>admin/studentupdate?sno=${student.sno}">修改</a>--%>
                        <button class="btn btn-info" onclick="window.location.href='<%=basePath%>admin/studentupdate?sno=${student.sno}'">修改</button>

                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script>


</script>
</body>
</html>
