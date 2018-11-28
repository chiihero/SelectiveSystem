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
<head>
    <title></title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-10">
            <h5><b>当前位置</b>：用户管理 > 所有教师</h5>
        </div>
        <div class="col-md-2">
            <button class="btn btn-info" onclick="window.location.href='<%=basePath%>/admin/TeacherInfo'">添加教师</button>
        </div>
    </div>
    <hr>
    <%--<div>--%>
        <%--<table class="table">--%>
            <%--<thead>--%>
            <%--<tr>--%>
                <%--<th>教工号</th>--%>
                <%--<th>姓名</th>--%>
                <%--<th>性别</th>--%>
                <%--<th>年龄</th>--%>
                <%--<th>学历</th>--%>
                <%--<th>职称</th>--%>
                <%--<th>主讲课程一</th>--%>
                <%--<th>主讲课程二</th>--%>
                <%--<th>主讲课程三</th>--%>
                <%--<th>修改</th>--%>

            <%--</tr>--%>
            <%--</thead>--%>
            <%--<tbody>--%>
            <%--<c:forEach items="${teachers}" var="teacher">--%>
                <%--<tr>--%>
                    <%--<td>${teacher.tno}</td>--%>
                    <%--<td>${teacher.tname}</td>--%>
                    <%--<td>${teacher.tsex}</td>--%>
                    <%--<td>${teacher.tage}</td>--%>
                    <%--<td>${teacher.teb}</td>--%>
                    <%--<td>${teacher.tpt}</td>--%>
                    <%--<td>--%>
                        <%--<c:forEach items="${courses}" var="course">--%>
                            <%--<c:if test="${course.cno==teacher.cno1}">--%>
                                <%--${course.cname}--%>
                            <%--</c:if>--%>
                        <%--</c:forEach>--%>
                    <%--</td>--%>
                    <%--<td>--%>
                        <%--<c:forEach items="${courses}" var="course">--%>
                            <%--<c:if test="${course.cno==teacher.cno2}">--%>
                            <%--${course.cname}--%>
                            <%--</c:if>--%>
                        <%--</c:forEach>--%>
                    <%--</td>--%>
                    <%--<td>--%>
                        <%--<c:forEach items="${courses}" var="course">--%>
                            <%--<c:if test="${course.cno==teacher.cno3}">--%>
                                <%--${course.cname}--%>
                            <%--</c:if>--%>
                        <%--</c:forEach>--%>
                    <%--</td>--%>
                    <%--<td>--%>
                        <%--&lt;%&ndash;<a href="<%=basePath%>/admin/teacherupdate?tno=${teacher.tno}">修改</a>&ndash;%&gt;--%>
                        <%--<button class="btn btn-info" onclick="window.location.href='<%=basePath%>/admin/teacherupdate?tno=${teacher.tno}'">修改</button>--%>

                    <%--</td>--%>

                <%--</tr>--%>
            <%--</c:forEach>--%>
            <%--</tbody>--%>
        <%--</table>--%>
    <%--</div>--%>
    <table id="grid-data" class="table table-condensed table-hover table-striped">
        <thead>
        <tr>
            <th data-column-id="tno" data-identifier="true">教工号</th>
            <th data-column-id="tname">姓名</th>
            <th data-column-id="tsex">性别</th>
            <th data-column-id="tage">年龄</th>
            <th data-column-id="teb">学历</th>
            <th data-column-id="tpt">职称</th>
            <th data-column-id="cno1">主讲课程一</th>
            <th data-column-id="cno2">主讲课程二</th>
            <th data-column-id="cno3">主讲课程三</th>
            <th data-column-id="commands"  data-formatter="commands" data-sortable="false">修改</th>
        </tr>
        </thead>
    </table>

</div>
</body>
<script typeof="text/javascript">
    $(document).ready(function () {
        $("#grid-data").bootgrid({
            ajax: true,
            post: function ()
            {
                /* To accumulate custom parameter with the request object */
                return {
                    id: "b0df282a-0d67-40e5-8558-c9e93b7befed"
                };
            },
            url: "/admin/AllTeacherUser",
            formatters: {
                "commands": function(column, row)
                {
                    return "<button type=\"button\"  class=\"btn btn-info\" data-row-id=\"" + row.tno + "\" onclick=\"window.location.href='/admin/TeacherInfo?tno=" + row.tno + "'\"><span class=\"fa fa-pencil\"></span>修改</button>";
                }
            }
        });
    });

</script>
</html>
