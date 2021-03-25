<%--
  Created by IntelliJ IDEA.
  User: ZY
  Date: 2020/10/31
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>超级管理员登陆成功</title>
    <style>
        .submit {
            width: 200px;
            height: 200px;
            border-radius: 50%;
        }
        .zhr {
            color: aliceblue;
        }
    </style>
</head>
<body background="Images/display.jpg">
<table align="center" width="80%" height="80%">
    <tr align="center">
        <td colspan="4">
            <font size="20px" color="orange"><strong>欢迎超级管理员</strong></font>
        </td>
    </tr>
    <tr align="center">
        <td>
            <input type="image" src="Images/zhr.gif" title="宿舍楼信息管理" class="submit"
                   onclick="window.location.href='Dorm/Display.jsp'" />
            <p class="zhr">宿舍楼信息管理</p>
        </td>
        <td>
            <input type="image" src="Images/zhr.gif" title="宿舍房间信息管理" class="submit"
                   onclick="window.location.href='Room/room_manage.jsp'" />
            <p class="zhr">宿舍房间信息管理</p>
        </td>
        <td>
            <input type="image" src="Images/zhr.gif" title="宿舍管理员信息管理" class="submit"
                   onclick="window.location.href='DormManager/man_manage.jsp'" />
            <p class="zhr">宿舍管理员信息管理</p>
        </td>
        <td>
            <input type="image" src="Images/zhr.gif" title="入住学生信息管理" class="submit"
                   onclick="window.location.href='student/stu_manage.jsp'" />
            <p class="zhr">入住学生信息管理</p>
        </td>
    </tr>
</table>
</body>
</html>

