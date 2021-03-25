<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
    <title>
        增加宿舍房间信息
    </title>
</head>
<body bgcolor="#7fffd4">

<form action="../AddRoomServlet1" method="post">
    <table align="center" width="100%" height="100%" background="../Images/zhang.jpg">
        <tr align="center">
            <td rowspan="4" colspan="2">
                <table align="center" cellspacing="20px">
                    <caption><strong> 增加宿舍房间信息</strong></caption>
                    <tr align="center">
                        <td>宿舍房号：</td>
                        <td><input type="text" name="room_num" size="20"></td>
                    </tr>
                    <tr align="center">
                        <td>宿舍电话：</td>
                        <td><input type="text" name="room_tel" size="20"></td>
                    </tr>
                    <tr align="center">
                        <td>入住人数：</td>
                        <td><input type="text" name="room_people" size="20"></td>
                    </tr>
                    <tr align="center">
                        <td>舍长：</td>
                        <td><input type="text" name="room_man" size="20"></td>
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