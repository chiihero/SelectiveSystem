<%--
  Created by IntelliJ IDEA.
  User: 85387
  Date: 2018/10/15
  Time: 12:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@ include file="studentIndex.jsp" %>
<html>
<div class="container">
    <h5><b>当前位置</b>：信息查询 > 选课查询</h5>
    <hr>
    <%--<table class="table">--%>
        <%--<thead>--%>
        <%--<tr>--%>
            <%--<th>课程名</th>--%>
            <%--<th>教师</th>--%>
            <%--<th>最大人数</th>--%>
            <%--<th>选择人数</th>--%>
            <%--<th>选课</th>--%>
        <%--</tr>--%>
        <%--</thead>--%>
        <%--<tbody>--%>
        <%--<c:forEach items="${courselist}" var="course">--%>
            <%--&lt;%&ndash;可以选课标记&ndash;%&gt;--%>
            <%--<c:set var="sctbool" value="true"/>--%>
            <%--&lt;%&ndash;无的课程不显示&ndash;%&gt;--%>
            <%--<c:if test="${course.cname !='无'}">--%>
                <%--<tr>--%>
                    <%--<td>${course.cname}</td>--%>
                    <%--<td>${course.tname}</td>--%>
                    <%--<td>${course.cnum}</td>--%>
                    <%--<td>${course.cnewnum}</td>--%>
                    <%--<td>--%>
                    <%--<c:forEach items="${scts}" var="score">--%>
                        <%--<c:if test="${score.cno == course.cno}">--%>
                            <%--<button class="btn btn-primary" disabled>已选</button>--%>
                            <%--<c:set var="sctbool" value="false"/>--%>
                        <%--</c:if>--%>
                    <%--</c:forEach>--%>
                    <%--<c:if test="${(course.cnum > course.cnewnum)&&sctbool=='true'}">--%>
                        <%--<button class="btn btn-primary" onclick="update_score(${course.cno},${course.tno})">选课</button>--%>
                    <%--</c:if>--%>
                    <%--<c:if test="${(course.cnum <= course.cnewnum)&&sctbool=='true'}">--%>
                        <%--<button class="btn btn-primary" disabled>选课人数已满</button>--%>
                    <%--</c:if>--%>
                    <%--</td>--%>
                <%--</tr>--%>
            <%--</c:if>--%>
        <%--</c:forEach>--%>
        <%--</tbody>--%>
    <%--</table>--%>
    <table id="grid-data" class="table table-condensed table-hover table-striped">
        <thead>
        <tr>
            <th data-column-id="cname" data-identifier="true">课程名</th>
            <th data-column-id="tname">教师</th>
            <th data-column-id="cnum">最大人数</th>
            <th data-column-id="cnewnum">选择人数</th>
            <th data-column-id="commands"  data-formatter="commands" data-sortable="false">选课</th>
        </tr>
        </thead>
    </table>
</div>
<script>
    $(document).ready(function () {
        var grid =$("#grid-data").bootgrid({
            ajax: true,
            post: function ()
            {
                /* To accumulate custom parameter with the request object */
                return {
                    // id: "b0df282a-0d67-40e5-8558-c9e93b7befed"
                };
            },
            url: "/student/AllCourse",
            formatters: {
                "commands": function(column, row)
                {
                    // 判断学生已经选课
                    <c:forEach items="${scts}" var="score">
                        <c:set var="sctcno" value="${score.cno}"/>
                        if(${sctcno} == row.cno){
                            return "<button type=\"button\" class=\"btn\" data-row-id=\"" + row.cno + "\" disabled=\"true\">已选</button>";
                        }
                    </c:forEach>
                    // 判断选课人数已满
                    if (row.cnewnum >= row.cnum) {
                        return "<button type=\"button\" class=\"btn\" data-row-id=\"" + row.cno + "\" disabled=\"true\">选课人数已满</button>";
                    }else {
                        return "<button type=\"button\" class=\"btn btn-info\" data-row-id=\"" + row.cno + "\" value=\"" + row.tno + "\">选课</button>";
                    }
                }
            }
        }).on("loaded.rs.jquery.bootgrid", function()
        {
            /* Executes after data is loaded and rendered */
            // alert("hhhhh")
            grid.find(".btn-info").on("click", function(e)
            {
                // alert("You pressed edit on row:" + $(this).data("row-id") +"  "+ $(this).val());
                update_score($(this).data("row-id"),$(this).val())
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
