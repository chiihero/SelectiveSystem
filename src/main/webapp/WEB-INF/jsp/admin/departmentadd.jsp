<%--
  Created by IntelliJ IDEA.
  User: 85387
  Date: 2018/9/28
  Time: 12:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="adminIndex.jsp" %>

<html>
<body>
<div class="container">
    <h5><b>当前位置</b>：院系管理 > 增加院系</h5>
    <hr>
    <div class="col-12">
        <form id="addinfo" action="/admin/departmentInsert" method="post">
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">系编号:</span>
                </div>
                <input type="text" class="form-control col-4" placeholder="系编号" id="dno" name="dno">
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">系名:</span>
                </div>
                <input type="text" class="form-control col-4" placeholder="系名" id="dname" name="dname">
            </div>
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <span class="input-group-text">系主任:</span>
                </div>
                <input type="text" class="form-control col-4" placeholder="系主任" id="dmanager" name="dmanager">
            </div>
            <%--<div class="input-group mb-3">--%>
            <%--<div class="input-group-prepend">--%>
            <%--<span class="input-group-text">系主任:</span>--%>
            <%--</div>--%>
            <%--<select id="dmanager" name="dmanager">--%>
            <%--<c:forEach items="${teachers}" var="teacher">--%>
            <%--<option value="${teacher.tname}">${teacher.tname}</option>--%>
            <%--</c:forEach>--%>
            <%--</select>--%>
            <%--</div>--%>

            <div style="padding-top: 15px">
                <button type="submit" class="btn btn-primary">添加</button>
                <button type="reset" class="btn btn-warning">重置</button>
            </div>
        </form>

    </div>

</div>
</body>
</html>
