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
    <title>导入有误</title>
</head>
<body>
<%
    response.setHeader("refresh", "3;URL=stu_manage.jsp");
%>
<center>
    不能从数据库导入数据到Excel文件,请检查文件名是否有误！<br>
    3秒后跳转到入住学生信息管理页面！<br>
    若页面无跳转，请点击<a href="stu_manage.jsp">这里</a>
</center>
</body>
</html>
