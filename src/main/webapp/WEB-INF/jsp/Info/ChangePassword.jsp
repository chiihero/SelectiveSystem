<%--
  Created by IntelliJ IDEA.
  User: 85387
  Date: 2018/10/9
  Time: 22:07
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:if test="${role=='student'}">
    <c:set var="IndexUrl" value="../student/studentIndex.jsp"/>
</c:if>
<c:if test="${role=='teacher'}">
    <c:set var="IndexUrl" value="../teacher/teacherIndex.jsp"/>
</c:if>
<%--动态include--%>
<jsp:include page="${IndexUrl}" flush="true"/>
<html>
<div class="container">
    <h5><b>当前位置</b>：个人信息 > 密码修改</h5>
    <hr>
        <form action="${pageContext.request.contextPath}/login/PasswordUpdate" method="post">
        <input type="hidden" name="username" value=${sessionScope.username}>
        <input type="hidden" id="type" name="type" value="1">
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text">旧密码:</span>
            </div>
            <input type="password" class="form-control col-4" placeholder="旧密码" id="password"
                   name="password">
            <a id="old_password_text" style="color: #c82333"></a>
        </div>
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text">新密码:</span>
            </div>
            <input type="password" class="form-control col-4" placeholder="请输入8~24位新密码" id="newpassword"
                   name="newpassword">
            <a id="new_password_text" style="color: #c82333"></a>
        </div>
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text">确认新密码:</span>
            </div>
            <input type="password" class="form-control col-4" placeholder="请输入8~24位密码确认新密码" id="new_password_again"
                   name="new_password_again">
            <a id="new_passwords_text" style="color: #c82333"></a>
        </div>
        <div id="info">
            ${info}
        </div>
        <div style="padding-top: 15px">
            <button id="ChangePassword" type="submit" class="btn btn-primary" onclick="return changepassword()">修改</button>
            <button type="reset" class="btn btn-warning">重置</button>
        </div>
    </form>
</div>
<script>
    $(document).ready(function () {
        if(${role=='teacher'}){
            $("#type").val("2")
        }
        if(${role=='admin'}){
            $("#type").val("3")
        }
    });
</script>
</html>
