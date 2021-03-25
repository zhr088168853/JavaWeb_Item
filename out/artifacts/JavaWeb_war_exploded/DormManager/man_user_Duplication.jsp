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
    <title>账号重复</title>
</head>
<body>
<center>
    <%
        response.setHeader("refresh", "3;URL=DormManager/man_manage.jsp");
    %>
    账号重复，3秒后跳转到信息列表页！！！<br>
    如果没有跳转，请按<a href="man_manage.jsp">这里</a>！！！
</center>
</body>
</html>
