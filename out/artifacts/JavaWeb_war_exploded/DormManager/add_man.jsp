<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
    <title>
        增加宿舍管理员信息
    </title>
</head>
<body bgcolor="#7fffd4">

<form action="../AddManServlet" method="post">
    <table align="center" width="100%" height="100%" background="../Images/zhang.jpg">
        <tr align="center">
            <td rowspan="4" colspan="2">
                <table align="center" cellspacing="20px">
                    <caption><strong>增加宿舍管理员信息</strong></caption>
                    <tr align="center">
                        <td>姓名：</td>
                        <td><input type="text" name="man_name" size="20"></td>
                    </tr>
                    <tr align="center">
                        <td>账号：</td>
                        <td><input type="text" name="man_username" size="20"></td>
                    </tr>
                    <tr align="center">
                        <td>密码：</td>
                        <td><input type="text" name="man_password" size="20"></td>
                    </tr>
                    <tr align="center">
                        <td>工龄：</td>
                        <td><input type="text" name="man_age" size="20"></td>
                    </tr>
                    <tr align="center">
                        <td><input type="submit" value="增加"></td>
                        <td><input type="reset" value="重置"></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>
</body>
</html>