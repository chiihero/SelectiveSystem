<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="adminIndex.jsp"%>
<html>
<div class="container">
    <h5><b>当前位置</b>：信息查询 > 成绩查询</h5>
    <hr>
    <table class="table">
        <thead>
        <tr>
            <th>学号</th>
            <th>姓名</th>
            <th>课程名</th>
            <th>教师工号</th>
            <th>教师</th>
            <th>分数</th>
            <%--<th>修改</th>--%>
            <th>删除</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${scts}" var="sct">
            <tr>
                <td>${sct.sno}</td>
                <td>${sct.sname}</td>
                <td>${sct.cname}</td>
                <td>${sct.tno}</td>
                <td>${sct.tname}</td>
                <td>${sct.grade}</td>
                <td>
                    <input type="text" class="layui-input" id="${sct.sno}_${sct.cno}_${sct.tno}" value="" style="width:50px; display: inline-block;">
                    <button class="btn" onclick="update_score(${sct.sno},${sct.cno},${sct.tno})">评分
                    </button>
                </td>
                <th>
                    <button type="button" class="btn btn-primary" onclick="delete_sct(${sct.sno},${sct.cno},${sct.tno})">删除</button>
                </th>

            </tr>
        </c:forEach>
        </tbody>
    </table>
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
        post("<%=basePath%>admin/scoreupdate", body)
    }
    function delete_sct(Sno, Cno, Tno) {
        var body = {
            "sno": Sno,
            "cno": Cno,
            "tno": Tno
        };
        post("<%=basePath%>admin/sctDelete", body)
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
