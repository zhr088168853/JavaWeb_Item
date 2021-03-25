<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
    <title>
        增加宿舍楼信息
    </title>
</head>
<body bgcolor="#7fffd4">
<form action="Addmessage.jsp" method="post">
    <table align="center" width="100%" height="100%" background="../Images/zhang.jpg">
        <tr align="center">
            <td rowspan="4" colspan="2">
                <table align="center" cellspacing="20px">
                    <caption><strong>增加宿舍楼信息</strong></caption>
                    <tr align="center">
                        <td>宿舍楼号：</td>
                        <td><input type="text" name="dorm_num" size="20"></td>
                    </tr>
                    <tr align="center">
                        <td>宿舍电话：</td>
                        <td><input type="text" name="dorm_tel" size="20"></td>
                    </tr>
                    <tr align="center">
                        <td>宿舍楼层数：</td>
                        <td><input type="text" name="dorm_floor" size="20"></td>
                    </tr>
                    <tr align="center">
                        <td>宿舍地址：</td>
                        <td><input type="text" name="dorm_address" size="20"></td>
                    </tr>
                    <tr align="center">
                        <td>宿舍口号：</td>
                        <td><input type="text" name="dorm_word" size="20"></td>
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