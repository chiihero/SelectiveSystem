<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="adminIndex.jsp"%>
<html>
<div class="container">
    <h5><b>当前位置</b>：信息查询 > 成绩查询</h5>
    <hr>
    <%--<table class="table">--%>
        <%--<thead>--%>
        <%--<tr>--%>
            <%--<th>学号</th>--%>
            <%--<th>姓名</th>--%>
            <%--<th>课程名</th>--%>
            <%--<th>教师工号</th>--%>
            <%--<th>教师</th>--%>
            <%--<th>分数</th>--%>
            <%--<th>修改</th>--%>
            <%--<th>删除</th>--%>
        <%--</tr>--%>
        <%--</thead>--%>
        <%--<tbody>--%>
        <%--<c:forEach items="${scts}" var="sct">--%>
            <%--<tr>--%>
                <%--<td>${sct.sno}</td>--%>
                <%--<td>${sct.sname}</td>--%>
                <%--<td>${sct.cname}</td>--%>
                <%--<td>${sct.tno}</td>--%>
                <%--<td>${sct.tname}</td>--%>
                <%--<td>${sct.grade}</td>--%>
                <%--<td>--%>
                    <%--<input type="text" class="layui-input" id="${sct.sno}_${sct.cno}_${sct.tno}" value="" style="width:50px; display: inline-block;">--%>
                    <%--<button class="btn" onclick="update_score(${sct.sno},${sct.cno},${sct.tno})">评分--%>
                    <%--</button>--%>
                <%--</td>--%>
                <%--<th>--%>
                    <%--<button type="button" class="btn btn-primary" onclick="delete_sct(${sct.sno},${sct.cno},${sct.tno})">删除</button>--%>
                <%--</th>--%>

            <%--</tr>--%>
        <%--</c:forEach>--%>
        <%--</tbody>--%>
    <%--</table>--%>

    <table id="grid-data" class="table table-condensed table-hover table-striped">
        <thead>
        <tr>
            <th data-column-id="sno" data-identifier="true">学号</th>
            <th data-column-id="sname">姓名</th>
            <th data-column-id="cname">课程名</th>
            <th data-column-id="tno">教师工号</th>
            <th data-column-id="tname">教师</th>

            <th data-column-id="grade">分数</th>
            <th data-column-id="commands"  data-formatter="commands" data-sortable="false">修改</th>

            <th data-column-id="delete"  data-formatter="delete" data-sortable="false">删除</th>
        </tr>
        </thead>
    </table>
</div>
<script>
    $(document).ready(function () {

        $("#grid-data").bootgrid({
            ajax: true,
            post: function ()
            {
                /* To accumulate custom parameter with the request object */
                return {
                    // id: "b0df282a-0d67-40e5-8558-c9e93b7befed"
                };
            },
            url: "/admin/AllScore",
            formatters: {
                "commands": function(column, row)
                {
                    return "<input type=\"text\" class=\"layui-input\" id=\"" + row.sno + "_" + row.cno + "_" + row.tno +"\" value=\"\" style=\"width:50px; display: inline-block;\">"+
                        "<button class=\"btn\" onclick=\"update_score(" + row.sno + "," + row.cno + "," + row.tno + ")\">评分\n";
                }
            }
        });
    });

    function update_score(Sno, Cno, Tno) {
        var score = document.getElementById(Sno + "_" + Cno + "_" + Tno);
        var body = {
            "sno": Sno,
            "cno": Cno,
            "tno": Tno,
            "grade": score.value
        };
        //上传并且修改分数值不刷新页面
        post("<%=basePath%>/admin/scoreupdate", body);
        var parent = score.parentNode; // 父节点
        var previous = parent.previousSibling; // 上一个兄弟节点
        previous.innerHTML= score.value ;

    }
    function delete_sct(Sno, Cno, Tno) {
        var body = {
            "sno": Sno,
            "cno": Cno,
            "tno": Tno
        };
        post("<%=basePath%>/admin/sctDelete", body)
    }

    function post(URL, PARAMS) {
        $.ajax({
            url: URL,
            aysnc:false,
            type: "get",
            contentType: "application/json; charset=utf-8",
            data: PARAMS,
            success: function (data) {
                return data;
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                alert("请求失败，消息：" + textStatus + "  " + errorThrown);
                return false;
            }
        });

    }
</script>
</html>
