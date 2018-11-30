<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*" %>
<%@include file="studentIndex.jsp" %>
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
            <th>分数</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${scts}" var="score">
            <tr>
                <td>${score.sno}</td>
                <td>${score.sname}</td>
                <td>${score.cname}</td>
                <td>${score.grade}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</html>
