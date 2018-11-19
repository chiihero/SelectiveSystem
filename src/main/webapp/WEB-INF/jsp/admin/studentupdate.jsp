<%--
  Created by IntelliJ IDEA.
  User: 85387
  Date: 2018/10/22
  Time: 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="adminIndex.jsp" %>
<html>

<body>
<div class="container">
    <h5><b>当前位置</b>：用户管理 > 修改学生</h5>
    <hr>
    <div class="userinfo col-12">
        <form id="userinfo" action="/student/update" method="post">
            <input type="hidden" name="type" value="1">
            <input type="hidden" name="change" value="1">
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">学号:</span>
                </div>
                <input type="text" class="form-control col-4" id="sno" name="sno" readonly="readonly"
                       value="${student.sno}">
                <a id="no_text" style="color: #c82333"></a>
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">姓名:</span>
                </div>
                <input type="text" class="form-control col-4" id="sname" name="sname" value="${student.sname}">
                <a id="name_text" style="color: #c82333"></a>
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">性别:</span>
                </div>
                <%--<input type="hidden" id="sex" name="sex" value="${student.ssex}">--%>
                <select name="ssex">
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select>
                <a id="sex_text" style="color: #c82333"></a>
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">年龄:</span>
                </div>
                <input type="text" class="form-control col-4" id="sage" name="sage" value="${student.sage}"
                       oninput="value=value.replace(/[^\d]/g,'')">
                <a id="age_text" style="color: #c82333"></a>
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">系别:</span>
                </div>
                <select name="sdept">
                    <c:forEach items="${departments}" var="department">
                        <option value="${department.dname}">${department.dname}</option>
                    </c:forEach>
                </select>
                <a id="sdept_text" style="color: #c82333"></a>
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">密码:</span>
                </div>
                <input type="text" class="form-control col-4" placeholder="密码" id="password" name="password">
            </div>
            <div style="padding-top: 15px">
                <button type="submit" class="btn btn-primary" onclick="return check_studentdata()">修改</button>
                <button type="reset" class="btn btn-warning">重置</button>
            </div>
        </form>
    </div>
</div>
<script>
    $(document).ready(function () {
        var sex = '${student.ssex}';
        var sdept = '${student.sdept}';
        $("select option[value='" + sex + "']").attr("selected", true);
        $("select option[value='" + sdept + "']").attr("selected", true);


    })
</script>
</body>
</html>
