<%--
  Created by IntelliJ IDEA.
  User: chii
  Date: 2018/11/16
  Time: 20:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="en">
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>找不到页面</title>
    <style>
        *{margin:0;padding:0;outline:none;font-family:\5FAE\8F6F\96C5\9ED1,宋体;-webkit-user-select:none;-moz-user-select:none;-ms-user-select:none;-khtml-user-select:none;user-select:none;cursor:default;font-weight:lighter;}
        .center{margin:0 auto;}
        .whole{width:100%;height:100%;line-height:100%;position:fixed;bottom:0;left:0;z-index:-1000;overflow:hidden;}
        .whole img{width:100%;height:100%;}
        .mask{width:100%;height:100%;position:absolute;top:0;left:0;opacity:0.6;filter:alpha(opacity=60);}
        .b{width:100%;text-align:center;height:400px;position:absolute;top:70%;margin-top:-230px}.a{width:150px;height:50px;margin-top:30px}.a a{display:block;float:left;width:150px;height:50px;background:#fff;text-align:center;line-height:50px;font-size:18px;border-radius:25px;color:#333}.a a:hover{color:#000;box-shadow:#fff 0 0 20px}
        p{color:#fff;margin-top:40px;font-size:24px;}
        #num{margin:0 5px;font-weight:bold;}
    </style>
    <script type="text/javascript">
        var num = 6;
        function redirect(){
            num--;
            document.getElementById("num").innerHTML = num;
            if(num<0){
                document.getElementById("num").innerHTML = 0;
                location.href='<%=basePath%>/login';
            }
        }
        setInterval("redirect()", 1000);
    </script>
    <style type="text/css">
        .tb960x90 {display:none!important;display:none}</style>
</head>

<body onLoad="redirect();">
<div class="whole">
    <img src="<%=basePath%>/img/404view.png"/>
    <div class="mask"></div>
</div>
<div class="b">
    <img src="<%=basePath%>/img/404.png" class="center"/>
    <p>
        抱歉，您访问的页面被外星人掳走了...<br>
        <span id="num"></span>秒后自动跳转到主页
    </p>
</div>

</body>
</html>