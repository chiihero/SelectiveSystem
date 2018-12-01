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
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>选课管理信息系统</title>

</head>
<body>
<%@include file="nav.jsp" %>
<div class="container">
    <h5><b>当前位置</b>：用户管理 > 学生与分数</h5>
    <hr>
    <div>
            <table id="grid-data" class="table table-condensed table-hover table-striped">
                <thead>
                <tr>
                    <th data-column-id="sno" data-identifier="true">学号</th>
                    <th data-column-id="sname">姓名</th>
                    <th data-column-id="sdept">学院</th>

                    <th data-column-id="cname">课程名</th>
                    <th data-column-id="grade">分数</th>
                    <th data-column-id="commands"  data-formatter="commands" data-sortable="false">修改</th>
                </tr>
                </thead>
            </table>
    </div>
</div>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="${basePath}/js/jquery.min.js" type="text/javascript"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="${basePath}/js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
<%--分页--%>
<script src="${basePath}/js/bootgrid/jquery.bootgrid.js" type="text/javascript"></script>
<script typeof="text/javascript">
    $(document).ready(function () {
        $("#grid-data").bootgrid({
            ajax: true,
            post: function ()
            {
                /* To accumulate custom parameter with the request object */
                return {
                    // sdept:sdept_id
                    // id: "b0df282a-0d67-40e5-8558-c9e93b7befed"
                };
            },
            url: "/teacher/AllStudentUser",
            formatters: {
                "commands": function(column, row)
                {
                    var grade = row.grade;
                    if (row.grade==null){
                        return "<input type=\"text\" class=\"layui-input\" id=\"" + row.sno + "_" + row.cno + "_" + row.tno +"\" value=\"\" style=\"width:80px; display: inline-block;\">"+
                            "<button class=\"btn btn-primary\" onclick=\"update_score(" + row.sno + "," + row.cno + "," + row.tno + ")\">评分";
                    }else {
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
        post("${basePath}/admin/scoreupdate", body);
        var parent = score.parentNode; // 父节点
        var previous = parent.previousSibling; // 上一个兄弟节点
        previous.innerHTML= score.value ;
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
</body>
</html>
