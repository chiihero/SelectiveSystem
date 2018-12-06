<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="en">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<head>
    <title>登录</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="${basePath}/css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="${basePath}/css/bootstrap/bootstrap-select.min.css" rel="stylesheet">
    <link href="${basePath}/css/index.min.css" rel="stylesheet">
</head>
<body>
<!-- 两个输入框 -->
<div id="background" class="wall"></div>
<div id="midground" class="wall"></div>
<div id="foreground" class="wall"></div>
<div id="top" class="wall"></div>
<div class="container">
    <div id="logo">
        <h1 class="textcolor text-center">选课系统</h1>
        <h4 class="textcolor text-center">第一次登陆后请尽快更改初始密码</h4>
    </div>
    <div id="loginbox">
        <form id="loginform" action="/login/signIn" method="post">
            <div class="form-group">
                <select id="type" name="type" class="selectpicker mb-4" data-style="btn-default">
                    <option value="1" selected="selected">学生登录</option>
                    <option value="2">教师登录</option>
                    <option value="3">管理人员登录</option>
                </select>
            </div>
            <div class="form-group lg-3">
                <!--账号:-->
                <div class="input-group">
                    <span class="input-group-addon">
                        <i class="glyphicon glyphicon-user"></i>
                    </span>
                    <input type="text" class="form-control" id="username" name="username" placeholder="请输入学号"
                           <c:if test="${username!=null}">value="${username}"</c:if>>
                </div>
                <!-- 输入密码 -->
                <div class="edit input-group">
                        <span class="input-group-addon">
                            <i class="glyphicon glyphicon-lock"></i>
                        </span>
                    <input type="password" class="form-control" id="password" name="password" placeholder="请输入8~24位密码"/>
                </div>
            </div>
            <div class="form-check">
                <div class="float-left">
                    <c:if test="${not empty param.kickout}">您被踢出登录。</c:if>
                    ${message}
                </div>
                <div class="float-left">
                    <label><input type="checkbox" name="rememberMe" value="true"></label>自动登录
                </div>
                <div class="float-right">
                    <a href="#registerform" class="to-register grey">忘记密码?</a>
                </div>
                <button type="submit" class="btn btn-success btn-block" id="sub_login">登录</button>
            </div>
        </form>
        <form id="registerform" name="registerform" action="/exit" method="post">
            <div class="form-group">
                <!--账号:-->
                <div class="input-group">
                        <span class="input-group-addon">
                            <i class="glyphicon glyphicon-user"></i>
                        </span>
                    <input type="text" class="form-control" id="rusername" name="username" placeholder="请输入账号">
                </div>
                <!-- 输入id -->
                <div class="edit input-group">
                        <span class="input-group-addon">
                            <i class="glyphicon glyphicon-credit-card"></i>
                        </span>
                    <input type="text" class="form-control" id="ridcard" name="idcard" placeholder="用户身份证">
                </div>
                <!-- 输入密码 -->
                <div class="edit input-group">
                        <span class="input-group-addon">
                            <i class="glyphicon glyphicon-lock"></i>
                        </span>
                    <input type="password" class="form-control" id="rpassword" name="password" placeholder="请输入密码"/>
                </div>
                <!-- 输入密码 -->
                <div class="edit input-group">
                        <span class="input-group-addon">
                            <i class="glyphicon glyphicon-lock"></i>
                        </span>
                    <input type="password" class="form-control" id="rrelpassword" name="relpassword"
                           placeholder="请确认密码"/>
                </div>
            </div>
            <h4>暂未开放</h4>
            <div class="form-check">
                <div class="float-right">
                    <a href="#login" class="flip-link to-login grey">返回登录</a>
                </div>
                <button type="submit" class="btn btn-success btn-block" id="sub_register" value="修改密码" disabled>修改密码
                </button>
                <input type="reset" class="btn btn-primary btn-block" value="重置"/>
            </div>
        </form>
    </div>
</div>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="${basePath}/js/jquery.min.js" type="text/javascript"></script>
<script src="${basePath}/js/popper.js" type="text/javascript"></script>
<!-- 最新的 Bootstrap4 核心 JavaScript 文件 -->
<script src="${basePath}/js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
<script src="${basePath}/js/bootstrap/bootstrap-select.min.js" type="text/javascript"></script>
<script src="${basePath}/js/encrypt/md5.min.js" type="text/javascript"></script>
<script src="${basePath}/js/encrypt/sha3.js" type="text/javascript"></script>
<script src="${basePath}/js/checkinfo.min.js" type="text/javascript"></script>
<script src="${basePath}/js/index.js" type="text/javascript" charset="uft-8"></script>
</body>

</html>