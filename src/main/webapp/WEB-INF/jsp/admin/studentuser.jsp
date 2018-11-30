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
    <link href="${basePath}/css/bootgrid/jquery.bootgrid.min.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>选课管理信息系统</title>
    <link href="${basePath}/css/nindex.css" rel="stylesheet">
</head>
<body>
<%@include file="nav.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h2><b>当前位置</b>：用户管理 > 所有学生</h2>
            <a class="btn btn-primary" href="/admin/exportStu">导出数据为excel</a>
            <button class="btn btn-info" onclick="window.location.href='${basePath}/admin/StudentInfo'">添加学生</button>
        </div>
    </div>
    <hr>
    <table id="grid-data" class="table table-condensed table-hover table-striped">
            <thead>
            <tr>
                <th data-column-id="sno" data-identifier="true">学号</th>
                <th data-column-id="sname">姓名</th>
                <th data-column-id="ssex">性别</th>
                <th data-column-id="sage">年龄</th>
                <th data-column-id="sdept">系别</th>
                <th data-column-id="commands"  data-formatter="commands" data-sortable="false">修改</th>
            </tr>
            </thead>
        <%--<tbody>--%>
            <%--<c:forEach items="${students.list}" var="student">--%>
                <%--<tr>--%>
                    <%--<td>${student.sno}</td>--%>
                    <%--<td>${student.sname}</td>--%>
                    <%--<td>${student.ssex}</td>--%>
                    <%--<td>${student.sage}</td>--%>
                    <%--<td>${student.sdept}</td>--%>
                    <%--<td>--%>
                        <%--<button class="btn btn-info" onclick="window.location.href='${basePath}/admin/studentupdate?sno=${student.sno}'">修改</button>--%>
                    <%--</td>--%>
                <%--</tr>--%>
            <%--</c:forEach>--%>
            <%--</tbody>--%>
        </table>
</div>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="${basePath}/js/jquery.min.js" type="text/javascript"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="${basePath}/js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
<%--分页--%>
<script src="${basePath}/js/bootgrid/jquery.bootgrid.js" type="text/javascript"></script>
<script typeof="text/javascript">
    $(document).ready(function () {
        $("#grid-data").bootgrid({
            ajax: true,
            post: function ()
            {
                /* To accumulate custom parameter with the request object */
                return {
                        // sdept:sdept_id
                        // id: "b0df282a-0d67-40e5-8558-c9e93b7befed"
                };
            },
            url: "/admin/AllStudentUser",
            formatters: {
                "commands": function(column, row)
                {
                    return "<button type=\"button\"  class=\"btn btn-info\" data-row-id=\"" + row.sno + "\" onclick=\"window.location.href='/admin/StudentInfo?sno=" + row.sno + "'\"><span class=\"fa fa-pencil\"></span>修改</button>";
                }
            }
        });
    });
</script>
</html>
