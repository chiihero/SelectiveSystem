<%--
  Created by IntelliJ IDEA.
  User: 85387
  Date: 2018/10/9
  Time: 22:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="studentIndex.jsp" %>
<html>
<script src="<%=basePath%>/js/md5.js" type="text/javascript"></script>
<script src="<%=basePath%>/js/sha512.js" type="text/javascript"></script>
<div class="container">
    <h5><b>当前位置</b>：个人信息 > 密码修改</h5>
    <hr>
    <div class="changepasswd">
        <form action="/passwdUpdate" method="post">
            <input type="hidden" name="id" value=${sessionScope.userid}>
            <input type="hidden" name="type" value="1">
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">旧密码:</span>
                </div>
                <input type="password" class="form-control col-4" placeholder="旧密码" id="old_password"
                       name="old_password">
                <a id="old_password_text" style="color: #c82333"></a>
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">新密码:</span>
                </div>
                <input type="password" class="form-control col-4" placeholder="请输入8~24位新密码" id="new_password"
                       name="new_password">
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
                <button id="submit" type="submit" class="btn btn-primary">修改</button>
                <button type="reset" class="btn btn-warning">重置</button>
            </div>
        </form>
    </div>
</div>
<script src="<%=basePath%>/js/changepasswd.js" type="text/javascript"></script>

</html>
