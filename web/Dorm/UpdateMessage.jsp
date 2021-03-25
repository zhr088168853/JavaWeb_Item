<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ page import="com.DBCon" %>
<html>
<head>
    <title>
        修改宿舍楼信息
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
    sql = "select dorm_num,dorm_tel,dorm_floor,dorm_address,dorm_word from dorm where dorm_num=?";
    try {
        Connection conn = DBCon.getCon(); // 加载驱动并建立数据库连接
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, name);
        rs = pstmt.executeQuery();
        if (rs.next()) {
            String dorm_num = rs.getString(1);
            String dorm_tel = rs.getString(2);
            String dorm_floor = rs.getString(3);
            String dorm_address = rs.getString(4);
            String dorm_word = rs.getString(5);
%>

<form action="update_do.jsp" method="post">
    <table align="center" width="100%" height="100%" background="../Images/zhang.jpg">
        <tr align="center">
            <td rowspan="4" colspan="2">
                <table align="center" cellspacing="20px">
                    <caption><strong>修改宿舍楼信息</strong></caption>
                    <tr align="center">
                        <td>宿舍楼号：</td>
                        <td><input type="text" name="dorm_num" size="20" value="<%=dorm_num%>"></td>
                    </tr>
                    <tr align="center">
                        <td>宿舍电话：</td>
                        <td><input type="text" name="dorm_tel" size="20" value="<%=dorm_tel%>"></td>
                    </tr>
                    <tr align="center">
                        <td>宿舍楼层数：</td>
                        <td><input type="text" name="dorm_floor" size="20" value="<%=dorm_floor%>"></td>
                    </tr>
                    <tr align="center">
                        <td>宿舍地址：</td>
                        <td><input type="text" name="dorm_address" size="20" value="<%=dorm_address%>"></td>
                    </tr>
                    <tr align="center">
                        <td>宿舍口号：</td>
                        <td><input type="text" name="dorm_word" size="20" value="<%=dorm_word%>"></td>
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