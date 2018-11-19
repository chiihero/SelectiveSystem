<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<!doctype html>
<html lang="en">
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<head>
    <title>登录</title>
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="<%=basePath%>/js/jquery.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>/js/popper.js" type="text/javascript"></script>
    <!-- 最新的 Bootstrap4 核心 JavaScript 文件 -->
    <script src="<%=basePath%>/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>/js/md5.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>/js/sha3.js" type="text/javascript"></script>
    <script src="<%=basePath%>/js/checkinfo.js" type="text/javascript"></script>

    <script src="<%=basePath%>/js/bootstrap-select.min.js" type="text/javascript"></script>
    <!-- 新 Bootstrap4 核心 CSS 文件 -->
    <link href="<%=basePath%>/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=basePath%>/css/bootstrap-select.min.css" rel="stylesheet">
    <link href="<%=basePath%>/css/index.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=basePath%>/css/font-awesome.min.css">
</head>
<body>
<!-- 两个输入框 -->
<div class="container">
    <div id="logo">
        <h1 class="textcolor text-center">选课系统</h1>
        <h4 class="textcolor text-center">第一次登陆后请尽快更改初始密码</h4>
    </div>
    <div id="loginbox">
        <form id="loginform" action="/login/signIn" method="post">
            <div class="form-group">
                <select name="type" class="selectpicker mb-3" title="选择用户类型">
                    <option value="1">学生登录</option>
                    <option value="2">教师登录</option>
                    <option value="3">管理人员登录</option>
                </select>

            </div>
            <div class="form-group mb-3">
                <!--账号:-->
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text">
                            <i class="fa fa-user"></i>
                        </span>
                    </div>
                    <input type="text" class="form-control" id="username" name="username" placeholder="请输入学号"
                           value="${sessionScope.username}">
                </div>
                <!-- 输入密码 -->
                <div class="edit input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text">
                            <i class="fa fa-lock"></i>
                        </span>
                    </div>
                    <input type="password" class="form-control" id="password" name="password" placeholder="请输入8~24位密码"/>
                </div>
            </div>
            <div class="form-check">
                <div class="float-left">
                    ${error}
                </div>
                <div class="float-left">
                    <label><input type="checkbox" value="remember-me"></label>
                    记住账号
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
                    <div class="input-group-prepend">
                        <span class="input-group-text">
                            <i class="fa fa-user"></i>
                        </span>
                    </div>
                    <input type="text" class="form-control" id="rusername" name="username" placeholder="请输入账号">
                </div>
                <!-- 输入id -->
                <div class="edit input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text">
                            <i class="fa fa-id-card"></i>
                        </span>
                    </div>
                    <input type="text" class="form-control" id="ridcard" name="idcard" placeholder="用户身份证">
                </div>
                <!-- 输入密码 -->
                <div class="edit input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text">
                            <i class="fa fa-lock"></i>
                        </span>
                    </div>
                    <input type="password" class="form-control" id="rpassword" name="password" placeholder="请输入密码"/>
                </div>
                <!-- 输入密码 -->
                <div class="edit input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text">
                            <i class="fa fa-lock"></i>
                        </span>
                    </div>
                    <input type="password" class="form-control" id="rrelpassword" name="relpassword"
                           placeholder="请确认密码"/>
                </div>
            </div>
            <div class="form-check">
                <div class="float-right">
                    <a href="#login" class="flip-link to-login grey">返回登录</a>
                </div>
                <button type="submit" class="btn btn-success btn-block" id="sub_register" value="修改密码">修改密码</button>
                <input type="reset" class="btn btn-primary btn-block" value="重置"/>
            </div>
        </form>
    </div>
</div>
<script src="<%=basePath%>/js/index.js" type="text/javascript" charset="uft-8">
</script>
</body>

</html>