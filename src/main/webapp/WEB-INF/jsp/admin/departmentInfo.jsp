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
    <link href="${basePath}/css/bootstrap/bootstrap-select.min.css" rel="stylesheet">

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>选课管理信息系统</title>
    <style>
        .input-group {
            margin-top: 12px;
        }
    </style>
</head>
<body>
<%@include file="nav.jsp" %>
<div class="container">
    <h2><b>当前位置</b>：院系管理 >
        <c:if test="${mode=='insert'}">添加院系</c:if>
        <c:if test="${mode=='update'}">修改院系</c:if>
    </h2>
    <hr>
    <div class="col-sm-5 col-sm-offset-4">
        <form id="addinfo" action="/admin/departmentInsert" method="post">
            <div class="input-group">
                <div class="input-group-addon">
                    <span class="glyphicon glyphicon-book"></span>
                </div>
                <input type="text" class="form-control" placeholder="系编号" id="dno" name="dno">
            </div>
            <div class="input-group">
                <div class="input-group-addon">
                    <span class="glyphicon glyphicon-book"></span>
                </div>
                <input type="text" class="form-control" placeholder="系名" id="dname" name="dname">
            </div>
            <%--<div class="input-group">--%>
            <%--<div class="input-group-addon">--%>
            <%--<span class="glyphicon glyphicon-user"></span>--%>
            <%--</div>--%>
            <%--<input type="text" class="form-control" placeholder="系主任" id="dmanager" name="dmanager">--%>
            <%--</div>--%>
            <div class="input-group">
                <div class="input-group-addon">
                    <span class="glyphicon glyphicon-book">系主任:</span>
                </div>
                <select class="selectpicker mb-4" id="dmanager" name="dmanager">
                    <c:forEach items="${teachers}" var="teacher">
                        <option value="${teacher.tname}">${teacher.tname}</option>
                    </c:forEach>
                </select>
            </div>
            <div style="padding-top: 15px">
                <button type="submit" class="btn btn-primary">添加</button>
                <button type="reset" class="btn btn-warning">重置</button>
            </div>
        </form>

    </div>

</div>
</body>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="${basePath}/js/jquery.min.js" type="text/javascript"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="${basePath}/js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
<script src="${basePath}/js/checkinfo.min.js" type="text/javascript"></script>
<script src="${basePath}/js/bootstrap/bootstrap-select.min.js" type="text/javascript"></script>

<script>
    $(document).ready(function () {

        if (${mode=='update'}) {
            $("form").attr("action", "/admin/departmentUpdate");//修改form表单地址
            $(":submit").text("修改");
            ////////////////////添加个人信息////////////////////
            var dno = $("#dno");
            var dname = $("#dname");
            var dmanager = $("#dmanager");
            dname.attr("readonly", "readonly");
            dno.val("${dep.dno}");
            dname.val("${dep.dname}");
            dmanager.val("${dep.dmanager}");
        }
    })

</script>
</html>
