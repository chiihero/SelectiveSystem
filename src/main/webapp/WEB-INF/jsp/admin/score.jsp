<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="${basePath}/css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>选课管理信息系统</title>
</head>
<body>
<%@include file="nav.jsp" %>
<div class="container">
    <h5><b>当前位置</b>：信息查询 > 成绩查询</h5>
    <hr>
    <table id="grid-data" class="table table-condensed table-hover table-striped">
        <thead>
        <tr>
            <th data-column-id="sno" data-identifier="true">学号</th>
            <th data-column-id="sname">姓名</th>
            <th data-column-id="sdept">学院</th>
            <th data-column-id="cname">课程名</th>
            <th data-column-id="tno">教师工号</th>
            <th data-column-id="tname">教师</th>
            <th data-column-id="grade">分数</th>
            <th data-column-id="commands" data-formatter="commands" data-sortable="false">修改</th>
            <th data-column-id="delete" data-formatter="delete" data-sortable="false">删除</th>
        </tr>
        </thead>
    </table>
</div>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="${basePath}/js/jquery.min.js" type="text/javascript"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="${basePath}/js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
<%--分页--%>
<script src="${basePath}/js/bootgrid/jquery.bootgrid.fa.js" type="text/javascript"></script>
<script src="${basePath}/js/bootgrid/jquery.bootgrid.min.js" type="text/javascript"></script>
<script src="${basePath}/js/checkinfo.js" type="text/javascript"></script>
<script typeof="text/javascript">
    $(document).ready(function () {
        $("#grid-data").bootgrid({
            ajax: true,
            post: function () {
                /* To accumulate custom parameter with the request object */
                return {
                    // id: "b0df282a-0d67-40e5-8558-c9e93b7befed"
                };
            },
            url: "/admin/AllScore",
            formatters: {
                "commands": function (column, row) {
                    return "<input type=\"text\" class=\"layui-input\" id=\"" + row.sno + "_" + row.cno + "_" + row.tno + "\" value=\"\" style=\"width:50px; display: inline-block;\">" +
                        "<button class=\"btn btn-primary\" onclick=\"update_score(" + row.sno + "," + row.cno + "," + row.tno + ")\">评分\n";
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
        post("${basePath}/admin/scoreupdate", body);
        var parent = score.parentNode; // 父节点
        var previous = parent.previousSibling; // 上一个兄弟节点
        previous.innerHTML = score.value;
    }

    function delete_sct(Sno, Cno, Tno) {
        var body = {
            "sno": Sno,
            "cno": Cno,
            "tno": Tno
        };
        post("${basePath}/admin/sctDelete", body)
    }

</script>
</body>
</html>
