<%--
  Created by IntelliJ IDEA.
  User: 85387
  Date: 2018/9/28
  Time: 10:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="adminIndex.jsp" %>

<html>
<head>
    <title></title>
</head>
<body>
<div class="container">
    <h5><b>当前位置</b>：用户管理 > 添加教师</h5>
    <hr>
    <div class="useradd col-4">
        <form id="TeacherUseradd" action="/teacher/insert" method="post" onchange="infocheck()">
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
                <%--<input type="text" class="form-control" placeholder="性别" id="sex" name="sex">--%>
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
                <%--<input type="text" class="form-control" placeholder="学历" id="teb" name="teb">--%>
                <select name="teb" title="学历">
                    <option value="学士">学士</option>
                    <option value="硕士">硕士</option>
                    <option value="博士">博士</option>
                </select>
            </div>

            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">职称:</span>
                </div>
                <%--<input type="text" class="form-control" placeholder="职称" id="tpt" name="tpt">--%>
                <select name="tpt" title="职称">
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
            <div style="padding-top: 15px">
                <button type="submit" class="btn btn-primary">添加</button>
                <button type="reset" class="btn btn-warning">重置</button>
            </div>
        </form>
    </div>
</div>
<script>
    $(document).ready(function () {
    });

    function infocheck() {
        var age = $('#tage').val();
        if ((age.toString() < "24" || age.toString() > "60") && age !== "") {
            alert("年龄必须在24岁到60岁之间");
            age.attr("value")
        }
    }
</script>
</body>
</html>
