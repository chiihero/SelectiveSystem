<%--
  Created by IntelliJ IDEA.
  User: 85387
  Date: 2018/10/9
  Time: 22:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@include file="studentIndex.jsp" %>
<html>

<div class="container">
    <h5><b>当前位置</b>：个人信息 > 个人信息修改</h5>
    <hr>
    <div class="userinfo col-12">
        <form id="userinfo" action="/student/update" method="post">
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
                <select name="sdept" disabled>
                    <c:forEach items="${departments}" var="department">
                        <option value="${department.dname}">${department.dname}</option>
                    </c:forEach>
                </select>
                <a id="sdept_text" style="color: #c82333"></a>
            </div>
            <a style="color: #c82333">${msg}</a>

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
