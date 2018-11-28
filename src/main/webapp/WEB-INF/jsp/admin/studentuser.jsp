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
            <button class="btn btn-info" onclick="window.location.href='<%=basePath%>/admin/StudentInfo'">添加学生</button>
        </div>
    </div>
    <hr>
    <select id="sdept">
        <option id="AllDep" value="sdept" selected="selected">全部学生</option>
        <c:forEach items="${departments}" var="department">
            <option id="${department.dname}" value="sdept">${department.dname}</option>
        </c:forEach>
    </select>
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
                        <%--<button class="btn btn-info" onclick="window.location.href='<%=basePath%>/admin/studentupdate?sno=${student.sno}'">修改</button>--%>
                    <%--</td>--%>
                <%--</tr>--%>
            <%--</c:forEach>--%>
            <%--</tbody>--%>
        </table>
</div>

<script typeof="text/javascript">
    $(document).ready(function () {
        var sdept_id="AllDep";
        $("select option[value='sdept']").click(function () {
            sdept_id = $(this).attr('id');
        });
        //
        $("#grid-data").bootgrid({
            ajax: true,
            post: function ()
            {
                /* To accumulate custom parameter with the request object */
                return {
                        sdept:sdept_id
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
</body>
</html>
