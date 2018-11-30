<%--
  Created by IntelliJ IDEA.
  User: 85387
  Date: 2018/9/28
  Time: 9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>

<html>
<%--默认admin用户--%>
<c:set var="IndexUrl" value="../admin/nav.jsp"/>
<c:if test="${role=='student'}">
    <c:set var="IndexUrl" value="../student/nav.jsp"/>
</c:if>
<%--动态include--%>
<jsp:include page="${IndexUrl}" flush="true"/>
<body>
<div class="container">
    <h5><b>当前位置</b>：用户管理 >
        <c:if test="${mode=='insert'}">添加学生</c:if>
        <c:if test="${mode=='update'}">修改学生</c:if>
    </h5>
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
                <select id="ssex" name="ssex" title="性别">
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select>
                <a id="sex_text" style="color: #c82333"></a>
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">年龄:</span>
                </div>
                <input type="text" class="form-control col-4" placeholder="年龄" id="sage" name="sage"
                       oninput="value=value.replace(/[^\d]/g,'')">
                <a id="age_text" style="color: #c82333"></a>

            </div>

            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">系别:</span>
                </div>
                <select id="sdept" name="sdept">
                    <c:forEach items="${departments}" var="department">
                        <option value="${department.dname}">${department.dname}</option>
                    </c:forEach>
                </select>
                <a id="sdept_text" style="color: #c82333"></a>
            </div>
            <c:if test="${mode=='update'&& role=='admin'}">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text">密码:</span>
                    </div>
                    <input type="text" class="form-control col-4" placeholder="密码" id="password" name="password">
                </div>
            </c:if>
            <div style="padding-top: 15px">
                <button type="submit" class="btn btn-primary" onclick="return check_studentdata()">添加</button>
                <button type="reset" class="btn btn-warning">重置</button>
                <a class="btn btn-primary" onclick="history.back();">返回到上一页</a>
            </div>
        </form>
    </div>
</div>
<%@include file="/baseJs.jspf" %>
<script src="${basePath}/js/encrypt/md5.min.js" type="text/javascript"></script>
<script src="${basePath}/js/encrypt/sha3.js" type="text/javascript"></script>
<script src="${basePath}/js/checkinfo.js" type="text/javascript"></script>
<script src="${basePath}/js/bootstrap/bootstrap-select.min.js" type="text/javascript"></script>
<script>
    $(document).ready(function () {
        if (${mode=='update'}) {
            $("form").attr("action", "/student/update");//修改form表单地址
            $(":submit").text("修改");
            ////////////////////添加个人信息////////////////////
            var sno = $("#sno");
            var sname = $("#sname");
            var sage = $("#sage");

            sno.attr("readonly", "readonly");
            sno.val("${student.sno}");
            sname.val("${student.sname}");
            select_true('${student.ssex}');
            sage.val("${student.sage}");
            select_true('${student.sdept}');
            ////////////////////////////////////////////
            //权限
            if (${role=='student'}) {
                $("#sdept").attr("disabled", true);
            }
        }
    })
</script>
</body>
</html>
