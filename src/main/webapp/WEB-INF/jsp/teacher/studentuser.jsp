<%--
  Created by IntelliJ IDEA.
  User: 85387
  Date: 2018/9/28
  Time: 12:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="${basePath}/css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="${basePath}/css/bootgrid/jquery.bootgrid.min.css" rel="stylesheet">
    <link href="${basePath}/css/tableexport/tableexport.min.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>选课管理信息系统</title>
</head>
<body>
<%@include file="nav.jsp" %>
<div class="container">
    <h2><b>当前位置</b>：用户管理 > 学生与分数</h2>
    <hr>
    <caption class="btn-toolbar tableexport-caption" style="caption-side: bottom;">
        <button type="button" id="xlsx" class="btn btn-default xlsx">Export to xlsx</button>
        <button type="button" id="xls" class="btn btn-default xls">Export to xls</button>
        <button type="button" id="csv" class="btn btn-default csv">Export to csv</button>
    </caption>
    <div>
        <table id="grid-data" class="table table-condensed table-hover table-striped">
            <thead>
            <tr>
                <th data-column-id="sno" data-identifier="true">学号</th>
                <th data-column-id="sname">姓名</th>
                <th data-column-id="sdept">学院</th>
                <th data-column-id="cname">课程名</th>
                <th data-column-id="grade">分数</th>
                <th data-column-id="commands" data-formatter="commands" data-sortable="false">修改</th>
            </tr>
            </thead>
        </table>
    </div>
</div>
<button id="tableTitle" value="student" disabled="disabled"></button>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="${basePath}/js/jquery.min.js" type="text/javascript"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="${basePath}/js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
<%--分页--%>
<script src="${basePath}/js/bootgrid/jquery.bootgrid.min.js" type="text/javascript"></script>
<%--报表--%>
<script src="${basePath}/js/tableexport/FileSaver.min.js"></script>
<script src="${basePath}/js/tableexport/tableExport.min.js"></script>
<script src="${basePath}/js/tableexport/xlsx.core.min.js"></script>
<script src="${basePath}/js/checkinfo.js" type="text/javascript"></script>
<script typeof="text/javascript">
    $(document).ready(function () {
        $("#grid-data").bootgrid({
            ajax: true,
            sorting :false,
            post: function () {
                /* To accumulate custom parameter with the request object */
                return {
                    // id: "b0df282a-0d67-40e5-8558-c9e93b7befed"
                };
            },
            url: "/teacher/AllStudentUser",
            formatters: {
                "commands": function (column, row) {
                    var grade = row.grade;
                    if (row.grade == null) {
                        return "<input type=\"text\" class=\"col-xs-5\" id=\"" + row.sno + "_" + row.cno + "_" + row.tno + "\" value=\"\" style=\"padding: 6px 1px;\">" +
                            "<button class=\"btn btn-primary  col-xs-7\" onclick=\"update_score(" + row.sno + "," + row.cno + "," + row.tno + ")\">评分";
                    } else {
                        return "<button class=\"btn\" disabled>已经评分";
                    }
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
        post("${basePath}/teacher/scoreupdate", "get", body);
        var parent = score.parentNode; // 父节点
        var previous = parent.previousSibling; // 上一个兄弟节点
        previous.innerHTML = score.value;//修改分数的数字
        parent.innerHTML = "<button class=\"btn\" disabled>已经评分";

    }

</script>
</body>
</html>
