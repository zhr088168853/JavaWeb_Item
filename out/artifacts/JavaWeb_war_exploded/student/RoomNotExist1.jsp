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
    <title>宿舍房间号不存在</title>
</head>
<body>
<center>
    <h2>宿舍房间号不存在！</h2>
    <%
        response.setHeader("refresh", "3;URL=manager_stu.jsp");
    %>
    分配的宿舍房间号不存在！3秒后跳转到信息列表页！！！<br>
    如果没有跳转，请按<a href="manager_stu.jsp">这里</a>！！！
</center>
</body>
</html>
