<%--
  Created by IntelliJ IDEA.
  User: 85387
  Date: 2018/9/28
  Time: 12:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="teacherIndex.jsp" %>

<html>
<head>
    <title></title>
</head>
<body>
<div class="container">
    <h5><b>当前位置</b>：用户管理 > 学生与分数</h5>
    <hr>
    <div>
        <table class="table">
            <thead>
            <tr>
                <th>学号</th>
                <th>姓名</th>
                <th>课程名</th>
                <th>分数</th>
                <th>修改</th>

            </tr>
            </thead>
            <tbody>
            <c:forEach items="${students}" var="student">
                <tr>
                    <td>${student.sno}</td>
                    <td>${student.sname}</td>
                    <td>${student.cname}</td>
                    <td>${student.grade}</td>
                    <td>
                        <input type="text" class="layui-input" id="${student.sno}_${student.cno}_${student.tno}"
                               value=""
                               style="width:50px; display: inline-block;">
                        <button class="btn" onclick="update_score(${student.sno},${student.cno},${student.tno})">评分
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script>
    function update_score(Sno, Cno, Tno) {
        var score = document.getElementById(Sno + "_" + Cno + "_" + Tno).value;
        var body = {
            "sno": Sno,
            "cno": Cno,
            "tno": Tno,
            "grade": score
        };
        post("<%=basePath%>teacher/scoreupdate", body)
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
</body>
</html>
