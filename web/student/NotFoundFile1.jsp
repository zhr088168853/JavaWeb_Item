<%--
  Created by IntelliJ IDEA.
  User: ZY
  Date: 2020/11/11
  Time: 17:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>导入到Excel文件有误</title>
</head>
<body>
<%
    response.setHeader("refresh", "3;URL=manager_stu.jsp");
%>
<center>
    FileNotFoundException:另一个程序正在使用此文件，进程无法访问。<br>
    请关闭student.xls文件再重试！3秒后跳转到入住学生信息管理页面！
    若页面无跳转，请点击<a href="manager_stu.jsp">这里</a>
</center>
</body>
</html>
