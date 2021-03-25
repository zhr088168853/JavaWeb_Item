<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="com.DBCon" %>
<html>
<head>
    <title>
        修改宿舍房间信息
    </title>
</head>
<body bgcolor="#7fffd4">
<%!
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = null;
%>
<%
    request.setCharacterEncoding("UTF-8");
    String name = request.getParameter("name");

    sql = "select room_num,room_tel,room_people,room_man from room where room_num=?";
    try {
        Connection conn = DBCon.getCon(); // 加载驱动并建立数据库连接
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, name);
        rs = pstmt.executeQuery();
        if (rs.next()) {
            String room_num = rs.getString(1);
            String room_tel = rs.getString(2);
            String room_people = rs.getString(3);
            String room_man = rs.getString(4);
%>

<form action="updateRoom_do.jsp" method="post">
    <table align="center" width="100%" height="100%" background="../Images/zhang.jpg">
        <tr align="center">
            <td rowspan="4" colspan="2">
                <table align="center" cellspacing="20px">
                    <caption><strong>修改宿舍房间信息</strong></caption>
                    <tr align="center">
                        <td>房间号：</td>
                        <td><input type="text" name="room_num" size="20" value="<%=room_num%>"></td>
                    </tr>
                    <tr align="center">
                        <td>房间电话：</td>
                        <td><input type="text" name="room_tel" size="20" value="<%=room_tel%>"></td>
                    </tr>
                    <tr align="center">
                        <td>入住人数：</td>
                        <td><input type="text" name="room_people" size="20" value="<%=room_people%>"></td>
                    </tr>
                    <tr align="center">
                        <td>舍长：</td>
                        <td><input type="text" name="room_man" size="20" value="<%=room_man%>"></td>
                    </tr>
                    <tr align="center">
                        <input type="hidden" name="oldname" value="<%=name%>">
                        <td><input type="submit" value="修改"></td>
                        <td><input type="reset" value="清空"></td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>
<%
        }
        rs.close();
        pstmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</body>
</html>