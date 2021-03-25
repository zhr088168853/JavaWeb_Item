<%--
  Created by IntelliJ IDEA.
  User: ZY
  Date: 2020/11/6
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>房间号重复</title>
</head>
<body>
<center>
    <%
        response.setHeader("refresh", "3;URL=Room/room_manage.jsp");
    %>
    房间号重复，3秒后跳转到宿舍房间信息管理页面！！！<br>
    如果没有跳转，请按<a href="room_manage.jsp">这里</a>！！！
</center>
</body>
</html>
