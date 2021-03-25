<%--
    Document   : success
    Created on : 2020-4-13, 11:59:47
    Author     : ZY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>操作成功</title>
</head>
<body>
<center>
    <%
        response.setHeader("refresh", "3;URL=DormManager/man_manage.jsp");
    %>
    操作成功，3秒后跳转到信息列表页！！！<br>
    如果没有跳转，请按<a href="man_manage.jsp">这里</a>！！！
</center>
</body>
</html>
