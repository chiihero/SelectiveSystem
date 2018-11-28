<%--
  Created by IntelliJ IDEA.
  User: 85387
  Date: 2018/10/22
  Time: 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="adminIndex.jsp" %>
<html>
<body>
<div class="container">
    <h5><b>当前位置</b>：用户管理 > 修改教师</h5>
    <hr>
    <div class="userinfo col-12">
        <form id="userinfo" action="/teacher/update" method="post">
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">教工号:</span>
                </div>
                <input type="text" class="form-control col-4" id="tno" name="tno" readonly="readonly"
                       value="${teacher.tno}">
                <a id="no_text" style="color: #c82333"></a>
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">姓名:</span>
                </div>
                <input type="text" class="form-control col-4" id="tname" name="tname" value="${teacher.tname}">
                <a id="name_text" style="color: #c82333"></a>
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">性别:</span>
                </div>
                <%--<input type="hidden" id="sex" name="sex" value="${teacher.tsex}">--%>
                <select name="tsex" title="性别">
                    <option value="男" selected>男</option>
                    <option value="女">女</option>
                </select>
                <a id="sex_text" style="color: #c82333"></a>
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">年龄:</span>
                </div>
                <input type="text" class="form-control col-4" id="tage" name="tage" value="${teacher.tage}"
                       oninput="value=value.replace(/[^\d]/g,'')">
                <a id="age_text" style="color: #c82333"></a>
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">学历:</span>
                </div>
                <%--<input type="hidden" id="teb" name="teb" value="${teacher.teb}">--%>
                <select name="teb" title="学历">
                    <option value="学士" selected>学士</option>
                    <option value="硕士">硕士</option>
                    <option value="博士">博士</option>
                </select>
            </div>

            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">职称:</span>
                </div>
                <%--<input type="hidden" id="tpt" name="tpt" value="${teacher.tpt}">--%>
                <select name="tpt" title="职称">
                    <option value="助教" selected>助教</option>
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
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">密码:</span>
                </div>
                <input type="text" class="form-control col-4" placeholder="密码" id="password" name="password">
            </div>
            <div style="padding-top: 15px">
                <button type="submit" class="btn btn-primary"  onclick="return check_teacherdata()">修改</button>
                <button type="reset" class="btn btn-warning">重置</button>
            </div>
        </form>
    </div>
</div>
<script>
    $(document).ready(function () {
        select_true('${teacher.tpt}');
        select_true('${teacher.teb}');
        select_true('${teacher.tsex}');
        //    主讲课程
        var cno1 = '${teacher.cno1}';
        $("#cno1 option[value='" + cno1 + "']").attr("selected", true);//根据id更改select
        var cno2 = '${teacher.cno2}';
        $("#cno2 option[value='" + cno2 + "']").attr("selected", true);
        var cno3 = '${teacher.cno3}';
        $("#cno3 option[value='" + cno3 + "']").attr("selected", true);
    });

</script>
</body>
</html>
