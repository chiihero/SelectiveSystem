<%--
  Created by IntelliJ IDEA.
  User: 85387
  Date: 2018/9/28
  Time: 10:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<html>
<head>
    <%--默认admin用户--%>
    <c:set var="IndexUrl" value="../admin/adminIndex.jsp"/>
    <c:if test="${role=='teacher'}">
        <c:set var="IndexUrl" value="../teacher/teacherIndex.jsp"/>
    </c:if>
    <%--动态include--%>
    <jsp:include page="${IndexUrl}" flush="true"/>
</head>
<body>
<div class="container">
    <h5><b>当前位置</b>：用户管理 >
    <c:if test="${mode=='insert'}">添加教师</c:if>
    <c:if test="${mode=='update'}">修改教师</c:if>
    </h5>
    <hr>
    <div class="useradd col-4">
        <form id="TeacherUseradd" action="/teacher/insert" method="post">
            <div class="input-group mb-3 ">
                <div class="input-group-prepend">
                    <span class="input-group-text">教工号:</span>
                </div>
                <input type="text" class="form-control" placeholder="教工号" id="tno" name="tno">
            </div>

            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">姓名:</span>
                </div>
                <input type="text" class="form-control" placeholder="姓名" id="tname" name="tname">
            </div>

            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">性别:</span>
                </div>
                <select name="tsex" title="性别">
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select>
            </div>

            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">年龄:</span>
                </div>
                <input type="text" class="form-control" placeholder="年龄" id="tage" name="tage"
                       oninput="value=value.replace(/[^\d]/g,'')">
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">学历:</span>
                </div>
                <select id="teb" name="teb" title="学历">
                    <option value="学士">学士</option>
                    <option value="硕士">硕士</option>
                    <option value="博士">博士</option>
                </select>
            </div>

            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">职称:</span>
                </div>
                <select id="tpt" name="tpt" title="职称">
                    <option value="助教">助教</option>
                    <option value="讲师">讲师</option>
                    <option value="副教授">副教授</option>
                    <option value="教授">教授</option>
                </select>
            </div>

            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">主讲课程一:</span>
                </div>
                <select id="cno1" name="cno1">
                    <c:forEach items="${courses}" var="course">
                        <option value="${course.cno}">${course.cname}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">主讲课程二:</span>
                </div>
                <select id="cno2" name="cno2">
                    <c:forEach items="${courses}" var="course">
                        <option value="${course.cno}">${course.cname}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">主讲课程三:</span>
                </div>
                <select id="cno3" name="cno3">
                    <c:forEach items="${courses}" var="course">
                        <option value="${course.cno}">${course.cname}</option>
                    </c:forEach>
                </select>
            </div>
            <c:if test="${mode=='update'&& role=='admin'}}">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text">密码:</span>
                    </div>
                    <input type="text" class="form-control col-4" placeholder="密码" id="password" name="password">
                </div>
            </c:if>
            <div style="padding-top: 15px">
                <button type="submit" class="btn btn-primary" onclick="return check_teacherdata()">添加</button>
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
<script type="text/javascript">
    $(document).ready(function () {
        if (${mode=='update'})
        {
            $("form").attr("action","/teacher/update");//修改form表单地址
            $(":submit").text("修改");
            ////////////////////添加个人信息////////////////////
            var tno = $("#tno");
            var tname = $("#tname");
            var tage = $("#tage");
            tno.attr("readonly","readonly");
            tno.val("${teacher.tno}");
            tname.val("${teacher.tname}");
            tage.val("${teacher.tage}");

            select_true('${teacher.tpt}');
            select_true('${teacher.teb}');
            select_true('${teacher.tsex}');
            //主讲课程
            var cno1 = '${teacher.cno1}';
            $("#cno1 option[value='" + cno1 + "']").attr("selected", true);//根据id更改select
            var cno2 = '${teacher.cno2}';
            $("#cno2 option[value='" + cno2 + "']").attr("selected", true);
            var cno3 = '${teacher.cno3}';
            $("#cno3 option[value='" + cno3 + "']").attr("selected", true);
            ////////////////////////////////////////////
            //权限
            if(${role=='teacher'}){
                $("#teb").attr("disabled",true);
                $("#tpt").attr("disabled",true);
            }
        }
    });
</script>
</body>
</html>
