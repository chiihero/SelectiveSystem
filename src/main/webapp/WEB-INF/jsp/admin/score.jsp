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
    <div class="row">
        <div class="col-md-12">
            <h2><b>当前位置</b>：信息查询 > 成绩查询</h2>
            <%--<a class="btn btn-primary" href="/admin/exportStu">导出数据为excel</a>--%>
            <caption class="btn-toolbar tableexport-caption" style="caption-side: bottom;">
                <button type="button" id="xlsx" class="btn btn-default xlsx">Export to xlsx</button>
                <button type="button" id="xls" class="btn btn-default xls">Export to xls</button>
                <button type="button" id="csv" class="btn btn-default csv">Export to csv</button>
            </caption>
        </div>
    </div>
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
<button id="tableTitle" value="score" disabled="disabled"></button>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="${basePath}/js/jquery.min.js" type="text/javascript"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="${basePath}/js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
<%--分页--%>
<script src="${basePath}/js/bootgrid/jquery.bootgrid.fa.js" type="text/javascript"></script>
<script src="${basePath}/js/bootgrid/jquery.bootgrid.min.js" type="text/javascript"></script>
<script src="${basePath}/js/checkinfo.min.js" type="text/javascript"></script>
<%--报表--%>
<script src="${basePath}/js/tableexport/FileSaver.min.js"></script>
<script src="${basePath}/js/tableexport/tableExport.min.js"></script>
<script src="${basePath}/js/tableexport/xlsx.core.min.js"></script>
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
            url: "/admin/AllScore",
            formatters: {
                "commands": function (column, row) {
                    return "<input type=\"text\" class=\"col-xs-5\" id=\"" + row.sno + "_" + row.cno + "_" + row.tno + "\" value=\"\" style=\"padding: 6px 1px;\">" +
                        "<button class=\"btn btn-primary col-xs-7\" onclick=\"update_score(" + row.sno + "," + row.cno + "," + row.tno + ")\">评分";
                },
                "delete": function (column, row) {
                    return "<button class=\"btn btn-danger\" onclick=\"delete_sct(" + row.sno + "," + row.cno + "," + row.tno + ")\">删除\n";
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
        post("${basePath}/admin/scoreupdate", "get", body);
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
        post("${basePath}/admin/sctDelete", "get", body);
        location.reload();
    }

</script>
</body>
</html>
