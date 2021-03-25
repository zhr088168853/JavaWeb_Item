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
    <title>已有学号</title>
</head>
<body>
<center>
    <%
        response.setHeader("refresh", "3;URL=student/stu_manage.jsp");
    %>
    已有学号，3秒后跳转到入住学生信息管理页面！！！<br>
    如果没有跳转，请按<a href="stu_manage.jsp">这里</a>！！！
</center>
</body>
</html>
