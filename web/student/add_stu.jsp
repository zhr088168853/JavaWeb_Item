<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
    <title>
        安排学生入住
    </title>
</head>
<body bgcolor="#7fffd4">

<form action="../AddStuServlet" method="post">
    <table align="center" width="100%" height="100%" background="../Images/zhang.jpg">
        <tr align="center">
            <td rowspan="4" colspan="2">
                <table align="center" cellspacing="20px">
                    <caption><strong>增加入住学生信息</strong></caption>
                    <tr align="center">
                        <td>学号：</td>
                        <td><input type="text" name="sno" size="20"></td>
                    </tr>
                    <tr align="center">
                        <td>姓名：</td>
                        <td><input type="text" name="stu_name" size="20"></td>
                    </tr>
                    <tr align="center">
                        <td>班级：</td>
                        <td><input type="text" name="stu_class" size="20"></td>
                    </tr>
                    <tr align="center">
                        <td>宿舍房号：</td>
                        <td><input type="text" name="room_num" size="20"></td>
                    </tr>
                    <tr align="center">
                        <td>报修物品：</td>
                        <td><input type="text" name="maintain" size="20"></td>
                    </tr>
                    <tr align="center">
                        <td>请假时间：</td>
                        <td><input type="text" name="off_time" size="20"></td>
                    </tr>
                    <tr align="center">
                        <td>晚归时间：</td>
                        <td><input type="text" name="late_time" size="20"></td>
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