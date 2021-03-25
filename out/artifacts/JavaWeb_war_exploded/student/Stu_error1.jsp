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
    <title>安排学生入住操作失败</title>
</head>
<body>
<center>
    <h2>安排学生入住操作失败！</h2>
    <%
        response.setHeader("refresh", "3;URL=manager_stu.jsp");
    %>
    安排学生入住操作失败，3秒后跳转到学生信息管理页面！！！<br>
    如果没有跳转，请按<a href="manager_stu.jsp">这里</a>！！！
</center>
</body>
</html>
