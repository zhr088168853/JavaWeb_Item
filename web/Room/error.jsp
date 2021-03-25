<%--
    Document   : errorpage
    Created on : 2020-3-30, 20:42:03
    Author     : ZY
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>操作失败</title>
</head>
<body>
<center>
    <h2>操作失败！</h2>
    <%
        response.setHeader("refresh", "3;URL=Room/room_manage.jsp");
    %>
    操作失败，3秒后跳转到宿舍房间信息管理页面！！！<br>
    如果没有跳转，请按<a href="room_manage.jsp">这里</a>！！！
</center>
</body>
</html>
