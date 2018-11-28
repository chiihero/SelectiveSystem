<%--
  Created by IntelliJ IDEA.
  User: 85387
  Date: 2018/9/28
  Time: 9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="adminIndex.jsp" %>
<html>
<head>
    <title></title>
    <script src="../js/addcheck.js"></script>
</head>
<body>
<div class="container">
    <h5><b>当前位置</b>：用户管理 > 添加学生</h5>
    <hr>
    <div class="useradd col-12">
        <form id="useradd" action="/student/insert" method="post">
            <input type="hidden" name="type" value="1">
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">学号:</span>
                </div>
                <input type="text" class="form-control col-4" placeholder="学号" id="sno" name="sno">
                <a id="no_text" style="color: #c82333"></a>
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">姓名:</span>
                </div>
                <input type="text" class="form-control col-4" placeholder="姓名" id="sname" name="sname">
                <a id="name_text" style="color: #c82333"></a>
            </div>

            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">性别:</span>
                </div>
                <%--<input type="text" class="form-control col-4" placeholder="性别" id="sex" name="sex">--%>
                <select name="ssex" title="性别">
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select>
                <a id="sex_text" style="color: #c82333"></a>

            </div>

            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">年龄:</span>
                </div>
                <input type="text" class="form-control col-4" placeholder="年龄" id="age" name="sage" oninput="value=value.replace(/[^\d]/g,'')">
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
            <%--<div>--%>
            <%--<label>密码</label>--%>
            <%--<input type="password" name="password"/>--%>
            <%--</div>--%>
            <div style="padding-top: 15px">
                <button type="submit" class="btn btn-primary" onclick="return check_studentdata()">添加</button>
                <button type="reset" class="btn btn-warning">重置</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
