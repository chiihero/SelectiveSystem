<%--
  Created by IntelliJ IDEA.
  User: 85387
  Date: 2018/10/15
  Time: 12:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="studentIndex.jsp" %>
<html>
<div class="container">
    <h5><b>当前位置</b>：信息查询 > 选课查询</h5>
    <hr>
    <table class="table">
        <thead>
        <tr>
            <th>课程名</th>
            <th>教师</th>
            <th>最大人数</th>
            <th>选择人数</th>
            <th>选课</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${courselist}" var="course">
            <tr>
                <td>${course.cname}</td>
                <td>${course.tname}</td>
                <td>${course.cnum}</td>
                <td>${course.cnewnum}</td>
                <td>
                    <button class="btn btn-primary" onclick="update_score(${sessionScope.userid},${course.cno},${course.tno})">选课</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</div>
<script>
    function update_score(Sno, Cno, Tno) {
        var body = {
            "sno": Sno,
            "cno": Cno,
            "tno": Tno
        };
        post("<%=basePath%>student/sctInsert", body)
    }

    function post(URL, PARAMS) {
        var temp = document.createElement("form");
        temp.action = URL;
        temp.method = "post";
        temp.style.display = "none";
        for (var x in PARAMS) {
            var opt = document.createElement("textarea");
            opt.name = x;
            opt.value = PARAMS[x];
            temp.appendChild(opt);
        }
        document.body.appendChild(temp);
        temp.submit();
    }
</script>
</html>
