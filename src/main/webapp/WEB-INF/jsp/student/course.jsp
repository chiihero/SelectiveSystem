<%--
  Created by IntelliJ IDEA.
  User: 85387
  Date: 2018/10/15
  Time: 12:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="${basePath}/css/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="${basePath}/css/bootgrid/jquery.bootgrid.min.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>选课管理信息系统</title>
</head>
<body>
<%@include file="nav.jsp" %>
<div class="container">
    <h2><b>当前位置</b>：信息查询 > 选课查询</h2>
    <hr>
    <table id="grid-data" class="table table-condensed table-hover table-striped">
        <thead>
        <tr>
            <th data-column-id="cname" data-identifier="true">课程名</th>
            <th data-column-id="tname">教师</th>
            <th data-column-id="cnum">最大人数</th>
            <th data-column-id="cnewnum">选择人数</th>
            <th data-column-id="commands" data-formatter="commands" data-sortable="false">选课</th>
        </tr>
        </thead>
    </table>
</div>
</body>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="${basePath}/js/jquery.min.js" type="text/javascript"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="${basePath}/js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
<%--分页--%>
<script src="${basePath}/js/bootgrid/jquery.bootgrid.min.js" type="text/javascript"></script>
<script>
    $(document).ready(function () {
        var grid = $("#grid-data").bootgrid({
            ajax: true,
            sorting :false,

            post: function () {
                /* To accumulate custom parameter with the request object */
                return {
                    // id: "b0df282a-0d67-40e5-8558-c9e93b7befed"
                };
            },
            url: "/student/AllCourse",
            formatters: {
                "commands": function (column, row) {
                    // 判断学生已经选课
                    <c:forEach items="${scts}" var="score">
                    <c:set var="sctcno" value="${score.cno}"/>
                    if (${sctcno} == row.cno)
                    {
                        return "<button type=\"button\" class=\"btn\" data-row-id=\"" + row.cno + "\" disabled=\"true\">已选</button>";
                    }
                    </c:forEach>
                    // 判断选课人数已满
                    if (row.cnewnum < row.cnum) {
                        return "<button type=\"button\" class=\"btn btn-info\" data-row-id=\"" + row.cno + "\" value=\"" + row.tno + "\">选课</button>";
                    } else {
                        return "<button type=\"button\" class=\"btn\" data-row-id=\"" + row.cno + "\" disabled=\"true\">选课人数已满</button>";
                    }
                }
            }
        }).on("loaded.rs.jquery.bootgrid", function () {
            /* Executes after data is loaded and rendered */
            // alert("hhhhh")
            grid.find(".btn-info").on("click", function (e) {
                // alert("You pressed edit on row:" + $(this).data("row-id") +"  "+ $(this).val());
                update_score($(this).data("row-id"), $(this).val())
            }).end()
        });
    });

    function update_score(Cno, Tno) {
        var body = {
            "sno": ${sessionScope.username},
            "cno": Cno,
            "tno": Tno
        };
        post("${basePath}/student/sctInsert", body)
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
